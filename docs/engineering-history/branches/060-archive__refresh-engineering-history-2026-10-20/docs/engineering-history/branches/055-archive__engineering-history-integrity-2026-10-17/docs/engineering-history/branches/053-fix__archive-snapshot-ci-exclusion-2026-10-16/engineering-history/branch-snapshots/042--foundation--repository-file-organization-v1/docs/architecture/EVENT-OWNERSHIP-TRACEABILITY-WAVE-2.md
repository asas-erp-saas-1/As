# ASAS — Event Ownership Traceability Wave 2

**Status:** FOUNDATION WORKING ARTIFACT — WAVE 2 CONTRACT
**Repository:** `asas-erp-saas-1/As`
**Date:** 2026-09-20
**Authority:** Derived from current repository registers and approved/working architecture contracts. This artifact does not redefine the event register.

## 1. Objective

Wave 2 converts the 103-event catalog into an ownership graph without inventing producers or consumers.

Required chain:

```text
Event
  ↓
Producer context
  ↓
Producer module
  ↓
Aggregate / invariant owner
  ↓
Transaction boundary
  ↓
Outbox record
  ↓
Consumers
  ↓
Idempotency key
  ↓
Task / verification
```

## 2. Authority rules

1. `registers/events.json` is authoritative for event identity, envelope requirements, and registered emission module.
2. Architecture contracts are authoritative for context ownership only where accepted or explicitly marked as a working foundation contract.
3. An emission module is not automatically a bounded context.
4. A consumer inferred only from a noun in an event name is `UNRESOLVED`.
5. Aggregate ownership must follow the domain ownership contract, not table names.
6. An event is emitted only after the owning state transition/business mutation succeeds.
7. The event and outbox record are committed atomically with the source mutation.
8. Consumers must deduplicate by `(eventId, handler)` or an equivalent explicitly documented idempotency contract.
9. Read-model consumers never become owners of source business facts.
10. Missing evidence stays `OPEN` / `UNRESOLVED`.

## 3. Wave-2 classification states

Each event mapping must use exactly one evidence state:

- `VERIFIED` — producer and ownership are directly supported by canonical/accepted evidence.
- `DERIVED` — ownership is mechanically derived from compatible authoritative registers and working contracts.
- `OPEN` — evidence exists but an architectural dependency remains unresolved.
- `UNRESOLVED` — insufficient evidence to assign ownership safely.
- `BLOCKED` — required source/runtime evidence cannot currently be obtained.

## 4. First-pass ownership rules

### Inventory

Apartment lifecycle events belong to Inventory when they represent commercial availability state transitions. Sales/Finance may trigger preceding business actions, but they do not silently acquire ownership of the inventory aggregate.

### CRM

Lead and appointment lifecycle events belong to CRM. Scheduling is treated as a CRM capability unless authoritative architecture evidence promotes it.

### Sales

Opportunity, reservation and contract lifecycle events belong to Sales. Reservation/contract events must not be reclassified as Finance merely because payment milestones depend on them.

### Finance

Payment-plan, installment, receipt, refund and ledger events belong to Finance. Financial posting is never inferred from a UI action or client-side calculation.

### Core / approvals

Approval events describe an authorization/control mechanism. They do not transfer the underlying resource invariant to the approval subsystem.

### Read-model / worker lanes

Activity, audit, search, notification, reporting, workflow and similar event consumers are not promoted to business ownership merely because they emit or consume events.

### Studio / Marketing

`Studio / Marketing` is an event-emission lane in the current event register. It is not sufficient evidence for either a dedicated Website Studio module or a dedicated Marketing bounded context. Those implementation boundaries remain explicit architecture gaps.

## 5. Event graph record contract

The canonical derived representation for each event should eventually contain:

```text
id
name
producer_context
producer_module
aggregate
invariant
transaction_boundary
outbox_required
consumer_modules
consumer_purpose
idempotency_contract
permission_key
canonical_task_ids
verification_evidence
status
source_refs
```

Do not create the full machine-readable register from this document until the source and repository reconciliation gate authorizes it.

## 6. Critical correctness classes

### A. Inventory correctness
Events such as hold/reserve/contract/sold must preserve the no-double-sale invariant and legal state transitions.

### B. Financial correctness
Posted money events must correspond to Finance-owned transitions and immutable ledger semantics.

### C. Contract correctness
Contract lifecycle events must remain inside Sales ownership even when downstream Finance actions consume them.

### D. Auditability
Every material mutation must have an auditable transition and event path.

### E. Cross-context integration
Consumers receive facts; they do not rewrite the producer's aggregate state.

## 7. Wave-2 execution order

1. Extract all 103 registered event IDs/names.
2. Group by registered emission module.
3. Map registered emission module to working context ownership.
4. Identify explicit aggregate/invariant evidence.
5. Identify explicit state-machine transition evidence.
6. Map known consumers from architecture/event documentation.
7. Mark unsupported consumer assumptions `UNRESOLVED`.
8. Link canonical task IDs only after task reconciliation.
9. Attach verification evidence only when executable/inspection evidence exists.
10. Publish the resulting matrix as a derived artifact; never modify the source registers to force consistency.

## 8. Current closure condition

Wave 2 is not closed until all 103 events have a status and no `VERIFIED` row depends solely on inference. The existence of an event in `events.json` proves registration; it does not by itself prove runtime producer behavior, aggregate ownership, consumer correctness, or database enforcement.

## 9. Explicit blockers

- Nine-context ADR acceptance remains open.
- Website Studio and Marketing implementation boundaries remain open.
- Communication and Collaboration ownership remain open.
- Task register reconciliation remains open.
- Live database/runtime enforcement remains unverified.
- CI execution evidence remains pending.
