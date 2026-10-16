# ASAS — B.6 Reservation / Hold / Deposit Atomicity Contract

**Status:** OPEN / P0 / implementation-gated  
**Branch:** `feat/foundation-command-registry`  
**Authority:** Blueprint v1.6.1, canonical state-machine/event/permission registers, domain invariant catalog, command closure, idempotency catalog, concurrency race catalog, outbox/inbox contract, finance correctness contract, and external integration strategy.

## 1. Purpose

B.6 is the first cross-domain transaction where inventory scarcity, reservation lifecycle, payment/deposit evidence, finance truth, external provider callbacks, audit, and asynchronous integration effects meet.

The objective is to prove one legal reservation outcome under concurrency and retries without allowing an external payment provider to become the source of truth for ASAS reservation or accounting state.

This document is a contract/closure artifact. It does **not** authorize schema changes, migrations, application implementation, provider onboarding, or production changes.

## 2. Canonical reservation lifecycle

The authoritative B.6 states are:

`DRAFT → PENDING_DEPOSIT → ACTIVE → CONVERTED | CANCELLED → REFUND_PROCESSING → CLOSED`

Authoritative semantics already established:

- `DRAFT → PENDING_DEPOSIT`: unit is `HELD`.
- `PENDING_DEPOSIT → ACTIVE`: deposit is recorded; unit becomes `RESERVED`.
- `ACTIVE → CONVERTED` or `ACTIVE → CANCELLED`.
- `CANCELLED → REFUND_PROCESSING → CLOSED` where refund processing is applicable.
- Expiry of `PENDING_DEPOSIT` triggers the cancellation/approval flow.
- The unit returns to `AVAILABLE` through the canonical inventory release path after the defined cooling period.

The exact cross-aggregate command/event mapping remains OPEN and must not be invented during implementation.

## 3. Cross-domain authority

Canonical ownership:

- Inventory owns apartment commercial state.
- Sales owns reservation business state and reservation commands.
- Finance owns payment, allocation, refund and ledger truth.
- Integrations own provider connectivity, external object mapping and webhook transport state.
- Audit/outbox provide durable evidence and asynchronous propagation.

A payment provider may assert that an external transaction exists, but it cannot directly set a reservation to `ACTIVE`, mark an apartment `RESERVED`, or post arbitrary accounting entries.

## 4. Required atomic boundary

For a deposit-driven activation, the authoritative path is:

`verified provider callback → inbox/idempotency → reservation/deposit command → authorization → current-state validation → concurrency boundary → financial validation/posting → reservation state transition → inventory state transition → audit + outbox → commit`

The exact transaction composition must be validated against live database reality before implementation.

Where a provider callback cannot safely participate in the same database transaction as ASAS, the callback must first become a durable, verified input and the subsequent ASAS command must provide the atomic domain transaction. No distributed transaction assumption is permitted.

## 5. Single-winner reservation invariant

For one tenant and reservable apartment:

> At most one legally active reservation may win the apartment's scarce commercial state at a time.

Two concurrent requests with different idempotency keys must not both succeed because both observed `AVAILABLE` before either committed.

Required sequence:

1. resolve identity and tenant;
2. authorize the command;
3. establish idempotency identity;
4. acquire the authoritative apartment/reservation concurrency boundary;
5. re-read current state;
6. validate hold/reservation preconditions;
7. execute the legal B.6 and B.1 state edges;
8. perform required financial operation within its defined transaction boundary;
9. write audit and outbox atomically with the committed domain truth;
10. commit exactly one winner;
11. return a typed conflict to losers.

The implementation must not rely on a UI lock, JavaScript mutex, preflight query, or eventual uniqueness discovered after the fact.

## 6. Hold expiry race

A hold-expiry worker is not authoritative merely because its scheduled time has arrived.

Before releasing a hold, the worker must prove that the hold it is expiring is still the current hold for the unit and has not been superseded by a newer reservation/hold/state transition.

Minimum logical identity:

`tenant + apartment/unit + hold identity/version + expected current state`

If the predicate is no longer true, the worker must become a safe no-op or typed conflict. It must never revert a newer winner.

## 7. Deposit/payment callback contract

Every external callback must pass:

1. authenticity/signature verification;
2. provider/connection resolution;
3. payload/schema validation;
4. replay/timestamp policy;
5. durable inbox deduplication;
6. mapping to an ASAS reservation/payment intent where one exists;
7. authorization and tenant boundary checks;
8. domain command execution;
9. financial invariants;
10. audit/outbox where state changes;
11. retry/DLQ handling;
12. reconciliation capability.

A callback that cannot be safely correlated to one tenant, one connection, and one intended ASAS operation must not mutate business state.

## 8. Idempotency requirements

At minimum, the following logical operations require durable idempotency:

- create reservation request;
- record deposit/payment;
- payment/receipt allocation;
- refund request/approval/execution;
- provider webhook delivery;
- webhook-to-command conversion;
- expiry job execution;
- event consumer execution.

Same-key duplicate:

`same logical command + same tenant + same idempotency key → one semantic effect + stable replayable result`

Different-key duplicate:

`same apartment + competing valid requests → concurrency conflict; exactly one legal winner`

Idempotency must not be implemented as a replacement for concurrency control.

## 9. Financial correctness boundary

Money remains integer DZD centimes unless a formal contract expands currency support.

Required invariants:

- payment amount is valid and non-negative according to operation semantics;
- allocation cannot exceed available/unallocated amount;
- duplicate provider transaction/payment identity cannot create a second financial effect;
- posted ledger entries remain immutable;
- accounting corrections use compensating/reversal transactions;
- `Σ debit = Σ credit` for every balanced posted journal;
- closed periods cannot receive unauthorized posting.

The exact chart of accounts, tax/VAT policy, rounding, fiscal calendar, posting-date policy, refund policy and commission policy remain OPEN in the finance contract.

## 10. Reservation cancellation and refund

Cancellation must be a legal B.6 transition and must not be implemented as a generic status setter.

If money has already been recorded, cancellation must determine whether a refund obligation exists. Refund execution is a finance-controlled operation with its own idempotency and approval requirements.

Required separation:

`reservation cancellation ≠ refund paid`

A reservation may be cancelled while the refund is pending, rejected, partially processed, or completed. The exact business policy and transition/event mapping remain OPEN.

## 11. Inventory coupling

The reservation transaction must preserve the canonical B.1 apartment lifecycle.

Critical invariant:

> No B.6 operation may produce a reservation state that contradicts the apartment commercial state.

Examples that must be impossible:

- reservation `ACTIVE` while apartment remains `AVAILABLE`;
- two active reservations for one apartment;
- stale hold expiry returning an already reserved apartment to `AVAILABLE`;
- cancellation releasing an apartment already legally contracted by another operation;
- deposit callback activating a reservation whose hold/reservation identity is no longer current.

Exact aggregate-lock ordering must be chosen and documented to avoid deadlocks.

## 12. External payment provider boundary

Provider-neutral conceptual model:

`PaymentConnection`

- provider
- tenant
- connection owner
- capability/version
- credential reference
- status
- health
- webhook verification state
- reconciliation state

`ExternalPayment`

- connection
- provider transaction identifier
- ASAS reservation/payment reference
- amount
- currency
- provider status
- received timestamps
- raw-event reference according to retention/classification policy
- reconciliation status

Provider IDs must not become canonical reservation or ledger IDs.

Provider state is reconciled into ASAS financial truth.

## 13. Failure matrix

| Failure | Required behavior |
|---|---|
| Duplicate reservation request | return idempotent result; no second reservation |
| Competing reservation request | one winner; loser receives typed conflict |
| Stale hold expiry | no state regression |
| Duplicate payment webhook | one financial effect |
| Payment callback before reservation mapping exists | durable verified input; no arbitrary mutation; reconciliation/retry path |
| Payment callback after cancellation | evaluate current legal state; never force activation |
| Provider reports success but ASAS transaction fails | callback remains replayable/reconcilable; no assumption of committed ASAS truth |
| ASAS commits but worker crashes before provider side effect | outbox retry; no duplicate domain mutation |
| Provider timeout/ambiguous response | do not blindly retry non-idempotent operation; reconcile by provider transaction identity |
| Refund duplicate | one refund semantic effect |
| Finance period closes during posting | posting loses safely; no unauthorized closed-period mutation |
| Database deadlock/concurrency conflict | typed retry only when command is safe to retry; otherwise surface conflict |

## 14. Required concurrency evidence

Minimum tests before B.6 can be GREEN:

1. two different-key reservations against one apartment → exactly one winner;
2. two holds → exactly one active hold;
3. reservation vs hold-expiry worker → newer valid winner survives;
4. stale expiry after reservation → no regression;
5. duplicate reservation request → one semantic effect;
6. duplicate payment webhook → one deposit/payment effect;
7. concurrent payment allocation → no over-allocation;
8. cancellation vs contract signing → one legal outcome;
9. refund retry → one financial effect;
10. callback replay after successful processing → no duplicate effect;
11. callback for unknown/stale reservation → no privileged mutation;
12. cross-tenant callback cannot resolve or mutate another tenant's reservation;
13. worker crash/retry after commit → outbox/inbox evidence remains consistent;
14. ambiguous provider response → reconciliation resolves final state without duplicate accounting;
15. audit and outbox records exactly describe the committed winner.

## 15. Required implementation evidence

B.6 is GREEN only when each mutation has evidence for:

`command → permission → state edge → preconditions → idempotency key → concurrency boundary → transaction boundary → finance invariant → inventory invariant → audit → outbox → failure behavior → concurrent test`

No production-grade claim may be made from unit tests alone. Race tests must exercise actual database transaction behavior.

## 16. Explicit OPEN decisions

The following are intentionally unresolved and require contract/implementation evidence or founder-level policy where applicable:

- exact reservation command catalog and command names;
- exact B.6-to-B.1 cross-aggregate transaction design;
- exact database locking/index strategy;
- exact hold identity/version representation;
- exact deposit/payment event-to-command mapping;
- whether deposit recording and reservation activation are always one DB transaction or can be separated by a durable state;
- payment provider(s) available for Algeria and their production merchant/API capabilities;
- exact payment confirmation/reconciliation policy;
- exact refund eligibility and approval policy;
- exact cooling-period semantics after cancellation;
- exact finance posting and receipt allocation policy;
- exact provider webhook signature/replay rules per provider;
- exact retry/backoff/DLQ policy;
- exact deadlock retry policy;
- exact accounting treatment for provider fees/chargebacks/partial refunds;
- legal treatment of reservation deposits and electronic evidence in each target jurisdiction.

These must be resolved from authoritative product/legal/provider evidence rather than guessed.

## 17. Implementation gate

**BLOCKED for application/schema implementation until:**

- live DB reality is inspected;
- B.6 command/state/event mapping is closed enough to authorize mutations;
- finance open policies that affect this flow are resolved;
- Algeria payment-provider feasibility is verified;
- concurrency mechanism is selected and tested;
- webhook/inbox contract is concretized for the selected provider;
- cross-aggregate transaction boundary is proven;
- adversarial concurrent evidence is available.

Until then, the correct action is further contract closure and evidence gathering — not speculative code.
