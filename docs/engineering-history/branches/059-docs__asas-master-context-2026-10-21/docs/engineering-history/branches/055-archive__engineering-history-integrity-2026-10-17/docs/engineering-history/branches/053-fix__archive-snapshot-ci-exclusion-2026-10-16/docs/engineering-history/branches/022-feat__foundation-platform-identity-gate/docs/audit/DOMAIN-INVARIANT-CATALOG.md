# ASAS — Domain Invariant Catalog

**Status:** OPEN — normative source-derived invariants are separated from implementation-hardening invariants; undefined business policy is not invented.
**Branch:** `feat/foundation-closure-pass-2`
**Purpose:** define the invariants that must hold across commands, transactions, state machines, events and projections before implementation can be considered trustworthy.

## 1. Invariant classes

Each invariant is classified as:

- **NORMATIVE:** directly supported by the v1.6.1 contracts/registers or existing hard engineering rules.
- **CROSS-CONTEXT:** follows necessarily from an explicit source workflow or safety contract without defining new business policy.
- **OPEN:** requires a founder/business/legal/accounting decision before implementation.

No OPEN item may be converted into a guessed default merely to unblock coding.

## 2. Identity / tenant / authorization

| ID | Invariant | Class | Required evidence |
|---|---|---|---|
| INV-001 | Every protected mutation resolves an authenticated actor. | NORMATIVE | negative unauthenticated command tests |
| INV-002 | Every tenant-scoped operation resolves and enforces tenant/workspace context. | NORMATIVE | cross-tenant read/write denial matrix |
| INV-003 | Permission evaluation is not sufficient by itself where scope, ABAC, property restriction or approval is required. | NORMATIVE | object/property/threshold authorization tests |
| INV-004 | `copilot.use` never implies authority to execute an underlying business mutation. | NORMATIVE | AI-to-command authorization parity tests |
| INV-005 | Public access uses an explicit public projection and never relies on internal authorization being absent. | CROSS-CONTEXT | public/private field exposure tests |

## 3. Lifecycle / state machines

| ID | Invariant | Class | Required evidence |
|---|---|---|---|
| INV-010 | A lifecycle state can change only through a legal registered transition. | NORMATIVE | illegal-transition typed-error tests |
| INV-011 | No generic setter may bypass transition validation. | NORMATIVE | static/code-path audit + mutation tests |
| INV-012 | Every legal transition persists the new state and appends the required audit record atomically with the business mutation. | NORMATIVE | transaction rollback tests |
| INV-013 | Every transition that has a registered event trigger emits the canonical dotted event ID. | NORMATIVE | event/state trace tests |
| INV-014 | Descriptive prose never creates an alternate event vocabulary. | NORMATIVE | event registry validation |
| INV-015 | B.10 rollback publishes a prior version as a new version; it is not an in-place status rollback. | NORMATIVE | version lineage tests |
| INV-016 | B.11 reschedule closes the current appointment as `RESCHEDULED` and creates a linked successor. | NORMATIVE | successor-link and duplicate-reschedule tests |
| INV-017 | B.5 `OFFER_SENT → NEGOTIATION/QUALIFIED` is the sanctioned regression associated with offer expiry; other regressions are not implied. | NORMATIVE | transition allowlist tests |
| INV-018 | B.2 construction-status regressions are forbidden except through a director-approved change order. | NORMATIVE | unauthorized regression denial + approval-path tests |

## 4. Inventory / reservation concurrency

| ID | Invariant | Class | Required evidence |
|---|---|---|---|
| INV-020 | A reservable unit cannot have two simultaneous legal reservation winners. | NORMATIVE | concurrent transaction race test |
| INV-021 | Unit commercial state and reservation state cannot commit contradictory outcomes. | CROSS-CONTEXT | atomic transaction / rollback tests |
| INV-022 | A hold expiry/release cannot overwrite a newer valid reservation outcome. | CROSS-CONTEXT | stale-worker race test |
| INV-023 | Duplicate reservation requests cannot create duplicate non-idempotent reservations. | NORMATIVE | repeated-request/idempotency tests |
| INV-024 | `PENDING_DEPOSIT` expiry follows the approval flow specified by the reservation contract; it is not an arbitrary direct delete. | NORMATIVE | expiry workflow tests |
| INV-025 | The apartment returns to `AVAILABLE` only through the registered lifecycle path after the specified cooling period. | NORMATIVE | timer/cooling-period integration test |

## 5. CRM / lead integrity

| ID | Invariant | Class | Required evidence |
|---|---|---|---|
| INV-030 | Lead lifecycle and lead working status are distinct state dimensions and must not be collapsed. | NORMATIVE | schema/domain separation tests |
| INV-031 | `lead.pii.read` remains a distinct authorization/data boundary from ordinary lead access. | NORMATIVE | field-level negative tests |
| INV-032 | Lead merge preserves an auditable relationship and does not silently destroy business history. | CROSS-CONTEXT | merge lineage/history tests |
| INV-033 | Public lead ingestion is idempotent against its canonical deduplication boundary. | NORMATIVE | duplicate webhook/form submission tests |
| INV-034 | Exact lead working-status transition graph is not assumed until B.4 is explicitly closed. | OPEN | founder/contract decision required |

## 6. Sales / approvals

| ID | Invariant | Class | Required evidence |
|---|---|---|---|
| INV-040 | Stage changes validate the exit criteria of the previous opportunity stage. | NORMATIVE | stage-entry negative tests |
| INV-041 | LOST/WITHDRAWN requires a reason. | NORMATIVE | missing-reason denial test |
| INV-042 | Discount/price/refund authority is threshold-sensitive and cannot be implemented as role-only boolean access. | NORMATIVE | boundary-value authorization tests |
| INV-043 | Approval decisions are append-only and resume the requesting flow only through the governed path. | NORMATIVE | approval immutability/replay tests |
| INV-044 | `approval.delegated` does not imply a new lifecycle state because no `DELEGATED` state is registered. | NORMATIVE | state enum validation |
| INV-045 | Exact approval thresholds, delegation chain, SLA and expiry policy remain explicit inputs to implementation. | OPEN | policy closure required |

## 7. Finance / accounting

| ID | Invariant | Class | Required evidence |
|---|---|---|---|
| INV-050 | Money is represented as integer DZD centimes where the contract specifies DZD monetary storage. | NORMATIVE | serialization/rounding tests |
| INV-051 | Posted financial records are immutable; corrections use the approved reversal/adjustment mechanism rather than mutation. | NORMATIVE | mutation denial tests |
| INV-052 | Double-entry ledger postings must balance. | NORMATIVE | debit=credit property tests |
| INV-053 | Duplicate payment/receipt processing cannot create duplicate financial effect. | CROSS-CONTEXT | idempotency/replay tests |
| INV-054 | Closed accounting periods cannot accept unauthorized posting changes. | NORMATIVE | period-close negative tests |
| INV-055 | Exact chart of accounts, accounting equation implementation, reversal rules and period policy remain OPEN where not specified by authoritative source. | OPEN | accounting-policy closure required |

## 8. Data governance / privacy

| ID | Invariant | Class | Required evidence |
|---|---|---|---|
| INV-060 | Tenant data cannot be read or mutated across tenant boundaries. | NORMATIVE | systematic tenant-negative test suite |
| INV-061 | Public projections cannot expose internal CRM, financial, HR, credential or other restricted fields. | CROSS-CONTEXT | schema allowlist + endpoint tests |
| INV-062 | Secrets/credentials are never exposed through ordinary domain payloads or public projections. | NORMATIVE | serialization and API tests |
| INV-063 | Physical deletion of protected business history is not introduced merely because a UI requests deletion. | CROSS-CONTEXT | retention/deletion policy tests |
| INV-064 | Exact PII classifications, retention periods and anonymization rules are not invented where the source is silent. | OPEN | data-governance decision required |

## 9. Events / outbox / integration

| ID | Invariant | Class | Required evidence |
|---|---|---|---|
| INV-070 | Business mutation and required domain event are committed atomically through the transactional outbox boundary. | NORMATIVE | crash/rollback/outbox tests |
| INV-071 | Event consumers are idempotent and deduplicated by `(eventId, handler)` per source contract. | NORMATIVE | replay tests |
| INV-072 | No unregistered event ID may be emitted. | NORMATIVE | registry-to-code validation |
| INV-073 | Webhook processing verifies authenticity and rejects replayed/noncanonical deliveries. | CROSS-CONTEXT | signature/replay tests |
| INV-074 | External provider failure cannot partially rewrite authoritative domain truth. | CROSS-CONTEXT | adapter failure injection tests |
| INV-075 | Exact retry/backoff/DLQ/replay windows remain OPEN until the outbox/inbox contract is closed. | OPEN | infrastructure policy closure required |

## 10. AI / governed mutation

| ID | Invariant | Class | Required evidence |
|---|---|---|---|
| INV-080 | AI tool execution resolves the same tenant, identity, scope, authorization, ABAC and approval requirements as a human command. | NORMATIVE | AI-vs-human authorization parity tests |
| INV-081 | AI read access is limited to the data actually required by the tool/task. | CROSS-CONTEXT | tool-level data-allowlist tests |
| INV-082 | AI cannot directly mutate authoritative storage outside the canonical command/service path. | NORMATIVE | architecture/static checks + runtime denial |
| INV-083 | Sensitive data egress to external AI/provider systems requires an explicit governed policy. | CROSS-CONTEXT | egress policy tests |
| INV-084 | Exact AI tool registry, external-provider data classes and privileged mutation allowlist remain OPEN until explicitly closed. | OPEN | AI governance decision required |

## 11. Audit / evidence / observability

| ID | Invariant | Class | Required evidence |
|---|---|---|---|
| INV-090 | Material state/business mutations generate immutable audit evidence. | NORMATIVE | mutation/audit correlation tests |
| INV-091 | Audit history cannot be silently rewritten through ordinary application paths. | NORMATIVE | direct-write denial + tamper tests |
| INV-092 | Correlation and causation identifiers survive command → transaction → event → workflow chains where applicable. | CROSS-CONTEXT | trace propagation tests |
| INV-093 | Operational dashboards/analytics cannot silently become an alternate write authority for operational truth. | NORMATIVE | architecture/data-flow tests |

## 12. Global property-test families

The following test families should be implemented once the command kernel exists:

1. **Transition legality:** every allowed edge succeeds; every unspecified edge fails with a typed domain error.
2. **Authorization monotonicity:** removing a grant cannot increase access.
3. **Tenant isolation:** every object query/mutation is denied for a foreign tenant.
4. **Idempotency:** replaying an accepted mutation yields one business effect.
5. **Concurrency:** racing valid commands cannot produce an impossible combined state.
6. **Financial balance:** every posted ledger transaction satisfies debit = credit.
7. **Audit completeness:** every material mutation has the required audit relation.
8. **Event registration:** every emitted event resolves to one registered dotted ID/version.
9. **Outbox atomicity:** a committed business mutation has its required outbox record; a rolled-back mutation does not.
10. **Public projection safety:** internal-only fields never appear in public DTO/projection schemas.
11. **AI parity:** an AI-issued command cannot succeed where the same human-originated command would be denied.
12. **Recovery:** replay/retry does not create duplicate business effects.

## 13. Closure rule

The catalog is implementation-ready only when every invariant required by a command has:

`owner → precondition → enforcement point → failure behavior → transaction boundary → audit relation → event behavior → executable test → evidence artifact`

OPEN business/policy items remain explicitly blocked. Claude may continue unrelated READY work under the autonomous build contract.
