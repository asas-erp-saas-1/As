# ASAS — B.6 Command / Event / Transaction Closure Matrix

**Status:** OPEN / P0 / implementation-gated  
**Branch:** `feat/foundation-command-registry`  
**Purpose:** close the B.6 reservation/hold/deposit command surface without inventing canonical command IDs. This is a contract artifact only; it does not authorize application code, schema changes, migrations, provider onboarding, or production changes.

## 1. Authority

This matrix is subordinate to the Blueprint v1.6.1 and the canonical machine-readable state/event/permission registers. It uses `OPEN_COMMAND:*` labels where the authoritative command vocabulary is not yet closed.

Canonical ownership:

- **Inventory:** apartment commercial state (B.1).
- **Sales:** reservation business state and reservation commands (B.6).
- **Finance:** payment, receipt allocation, refund and ledger truth.
- **Integrations:** provider connection, external object mapping and webhook transport.
- **Audit/Outbox:** durable evidence and asynchronous propagation.

Provider state is an external assertion/evidence source, never canonical reservation or ledger truth.

## 2. B.6 command surface

| Semantic command obligation | Owner | Required permission | Canonical B.6 edge | Required B.1 edge / effect | Canonical event obligation | Idempotency | Concurrency | Transaction requirement |
|---|---|---|---|---|---|---|---|---|
| `OPEN_COMMAND:create_reservation` | Sales | `reservation.create` | `DRAFT → PENDING_DEPOSIT` | apartment must enter/hold `HELD` through legal inventory path | `reservation.created` plus any registered inventory event required by the authoritative mapping | required | single-winner apartment boundary | domain state + audit + outbox atomic; exact cross-aggregate composition OPEN |
| `OPEN_COMMAND:record_deposit` | Finance/Sales boundary | `receipt.record` where applicable | `PENDING_DEPOSIT → ACTIVE` | `HELD → RESERVED` | `deposit.recorded` | required | reservation + apartment + financial identity | financial effect and required lifecycle mutation must satisfy one proven atomic boundary, or a durable intermediate contract must be explicitly closed |
| `OPEN_COMMAND:cancel_reservation` | Sales | `reservation.cancel` | `ACTIVE → CANCELLED` or governed cancellation path from applicable B.6 state | release only through the legal inventory edge when permitted | `reservation.cancelled` | required | reservation vs contract/payment/refund races | cancellation state + audit + outbox atomic; refund is a separate governed effect |
| `OPEN_COMMAND:expire_pending_deposit` | Sales/Workflow | governed system authority; no public/user privilege implied | `PENDING_DEPOSIT → CANCELLED` through expiry policy | stale hold may release only if hold identity/version still matches | `reservation.cancelled` and/or registered expiry event mapping only if authoritative | required | stale-hold identity + apartment boundary | expiry decision and resulting domain evidence atomic |
| `OPEN_COMMAND:request_refund` | Finance | `refund.request` | no direct B.6 lifecycle edge unless policy requires refund-processing state | no inventory mutation merely because refund is requested | `refund.requested` | required | refund vs duplicate request/cancellation | refund request + audit + outbox atomic |
| `OPEN_COMMAND:approve_refund` | Finance | `refund.approve` | no direct B.6 lifecycle edge | none | `refund.approved` | required | approval/retry race | approval evidence atomic |
| `OPEN_COMMAND:execute_refund` | Finance/Integrations boundary | governed financial authority; exact permission mapping OPEN | `CANCELLED → REFUND_PROCESSING → CLOSED` only according to resolved policy | no stale inventory regression | `refund.paid` when actually completed | required | provider refund retry + financial identity | provider side effect isolated behind durable intent/outbox; reconciliation required |
| `OPEN_COMMAND:process_payment_webhook` | Integrations → governed domain command | `webhook.manage` is transport administration, not business mutation authority | never directly changes state; converts verified external evidence into a governed command | never directly changes inventory | provider event maps to registered domain event only after domain mutation succeeds | required | inbox dedup + reservation/payment identity | verified input durable first; domain mutation follows canonical command path |
| `OPEN_COMMAND:reconcile_external_payment` | Finance/Integrations | exact permission/role policy OPEN | no arbitrary state setter | no arbitrary inventory mutation | registered finance/domain event only when reconciliation causes a legal mutation | required | external identity + financial allocation | reconciliation result must be auditable and idempotent |

**Important:** the event column records obligations from the canonical event register. It does not authorize emitting an event for a transition whose exact cross-context mapping remains OPEN.

## 3. Required payment callback path

The callback path is explicitly split into transport verification and domain authority:

`provider callback → connection resolution → signature/authenticity verification → timestamp/replay validation → schema validation → tenant/connection resolution → durable inbox deduplication → external payment mapping → governed domain command → authorization → current-state validation → financial invariant validation → concurrency boundary → domain transaction → audit + outbox → commit`

Rules:

1. A valid provider signature is necessary but never sufficient for business mutation.
2. An unknown reservation/payment mapping is a durable reconciliation case, not a privileged mutation case.
3. A duplicate callback must produce one semantic financial effect.
4. A callback after cancellation must evaluate current canonical state; it must never force `ACTIVE`.
5. Provider transaction IDs remain external identities.
6. Provider timeout/ambiguity must resolve through provider reconciliation rather than unsafe non-idempotent retry.

## 4. Cross-aggregate transaction decision gate

The minimum correctness requirement is:

`reservation outcome + apartment commercial outcome + required financial outcome + audit + outbox`

must never commit a contradictory combination.

Two implementation patterns are admissible only after evidence:

### Pattern A — one ASAS database transaction

Use when live DB reality and ownership boundaries permit all required state changes to be committed atomically.

`lock/validate → finance mutation → reservation transition → inventory transition → audit/outbox → commit`

### Pattern B — durable intermediate state

Use only if a single database transaction cannot legitimately span the required contexts. The intermediate state must be explicitly modeled as a governed business state with deterministic retry/reconciliation and must prevent contradictory externally visible outcomes.

A distributed transaction with the payment provider is not assumed.

**Decision status: OPEN.** Live DB inspection is mandatory before selecting A or B.

## 5. Concurrency ordering requirement

The implementation must establish one documented lock/serialization order for every B.6 race involving the same apartment.

At minimum, the following races must be resolved:

- reservation vs reservation;
- hold vs hold;
- reservation/deposit vs hold expiry;
- cancellation vs contract signing;
- payment recording vs payment allocation;
- duplicate webhook vs original webhook;
- refund retry vs refund completion;
- reconciliation vs live payment processing.

The application must not use a UI lock, process-local mutex, preflight `AVAILABLE` check, or eventual uniqueness as the correctness mechanism.

Exact PostgreSQL lock/index strategy remains OPEN pending live DB reality.

## 6. Idempotency boundary

For each retryable operation, the durable identity must distinguish:

`tenant + operation semantic identity + client/provider idempotency identity`

At minimum:

- reservation creation: caller-supplied/request identity plus tenant;
- deposit/payment: payment intent/operation identity plus tenant;
- provider webhook: provider + connection + provider event identity;
- webhook-to-command: source inbox identity + command semantic identity;
- expiry: tenant + apartment + hold identity/version + expected state;
- refund: refund operation identity + tenant;
- event consumer: event identity/version + consumer + tenant.

Exact storage, retention and replay-result representation remain OPEN.

## 7. Financial boundary

B.6 must not invent finance semantics. It consumes the finance contract.

Mandatory correctness properties:

- integer DZD centimes under the current canonical money contract;
- no negative amount unless an explicitly authorized compensating operation requires it;
- no allocation beyond available/unallocated funds;
- no duplicate financial effect from duplicate provider identity;
- balanced posted journal (`Σ debit = Σ credit`);
- posted records immutable;
- closed accounting periods protected;
- refund and commission consequences governed separately.

Open accounting policies remain those identified by `FINANCE-CORRECTNESS-CONTRACT.md`.

## 8. Inventory boundary

B.6 may cause inventory state changes only through legal B.1 edges.

Required invariant examples:

- `ACTIVE` reservation cannot coexist with apartment `AVAILABLE`;
- two active reservations cannot own one apartment;
- stale expiry cannot release a current reservation;
- cancellation cannot release an apartment that has already legally progressed to `CONTRACTED`;
- a late payment callback cannot override current canonical state.

The exact event pairing for each cross-aggregate edge remains source-open until the state/trigger closure is complete.

## 9. Negative test matrix

Before B.6 can become GREEN, evidence must cover at least:

| Test | Expected result |
|---|---|
| two valid reservation requests, different keys, same apartment | exactly one winner |
| same reservation request retried | stable idempotent result; no second effect |
| two holds against one apartment | exactly one legal hold |
| expiry worker races current reservation | current winner survives |
| stale expiry executes after a new hold | no regression |
| duplicate payment webhook | one financial effect |
| webhook replay after success | no duplicate domain effect |
| webhook with invalid signature | no business mutation |
| webhook for unknown tenant/connection | no cross-tenant mutation |
| payment callback after cancellation | no forced activation |
| provider success but ASAS transaction fails | durable replay/reconciliation path; no false ASAS activation |
| concurrent allocation | no over-allocation |
| cancellation races contract signing | one legal outcome, never contradictory state |
| refund retry | one financial refund effect |
| deadlock/concurrency failure | only safe retry; no duplicate business effect |
| worker crash after commit | outbox/inbox evidence supports safe retry |
| provider ambiguous timeout | reconciliation, not blind duplicate execution |
| closed period during posting | no unauthorized posting |
| audit/outbox mismatch | transaction must fail or evidence must prove invariant violation before release |

## 10. Evidence required for GREEN

For every implemented B.6 mutation, the evidence packet must demonstrate:

`command → permission → tenant → ABAC → preconditions → idempotency → concurrency → transaction → invariant → state edge → event → audit → outbox → failure behavior → database race test`

B.6 cannot be declared GREEN from unit tests alone. The single-winner, stale-expiry, duplicate webhook and financial-allocation tests must exercise real database transaction behavior.

## 11. Explicit unresolved decisions

The following remain intentionally OPEN:

1. canonical B.6 command IDs/names;
2. exact `create_reservation` to B.1 hold semantics;
3. exact deposit-recording command and whether it is Finance-owned or a cross-context application service invoking Finance;
4. exact event pairing for reservation creation/activation/cancellation;
5. exact hold identity/version representation;
6. exact PostgreSQL lock/constraint/index strategy after live DB inspection;
7. one-transaction vs durable-intermediate cross-aggregate model;
8. exact payment intent/entity semantics;
9. exact provider webhook signature/replay contract per selected provider;
10. exact provider production selection and commercial onboarding;
11. refund eligibility, partial-refund and approval policy;
12. cancellation cooling-period policy;
13. accounting treatment of provider fees, chargebacks and partial refunds;
14. exact reconciliation cadence and operator workflow;
15. jurisdiction-specific legal treatment of electronic deposit/payment evidence.

No item above should be silently guessed during implementation.

## 12. Implementation gate

**BLOCKED:** no executable B.6 command, schema, migration or provider integration implementation until the OPEN decisions that affect authorization, legal state, money, concurrency or cross-aggregate consistency are closed by authoritative evidence.

The next required foundation action is **live DB reality inspection and reconciliation against this B.6 contract**, followed by closure of the exact command/event/transaction boundaries.
