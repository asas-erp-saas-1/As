# ASAS — Domain Ownership & Traceability Contract

**Status:** FOUNDATION WORKING CONTRACT — pending ADR-0021 acceptance
**Repository:** `asas-erp-saas-1/As`
**Date:** 2026-09-19

## 1. Purpose

This contract defines how ASAS moves from bounded-context architecture to implementation without allowing module names, database tables, or existing code to invent domain ownership.

It is a traceability contract, not an implementation specification. It intentionally records unresolved areas instead of filling them with assumptions.

## 2. Authority chain

```text
Approved architecture decision
        ↓
Bounded context
        ↓
Context responsibility
        ↓
Aggregate / domain invariant owner
        ↓
Command / state transition
        ↓
Domain event producer
        ↓
Read-model / consumer
        ↓
Permission authority
        ↓
Persistence contract
        ↓
Canonical task
        ↓
Verification evidence
```

A lower layer cannot silently redefine ownership established by a higher layer.

## 3. Working context baseline

Subject to ADR-0021 acceptance, the working baseline contains:

1. Core / Platform
2. CRM
3. Sales
4. Inventory
5. Finance
6. Website Studio
7. Marketing
8. Analytics
9. Documents

This is a working baseline, not an authorization to implement the whole platform.

## 4. Ownership rules

### 4.1 Aggregate ownership

Every aggregate must have exactly one business-rule owner. A module may contain application services or adapters for another context, but it must not become the authoritative owner of that context's invariants.

### 4.2 Command ownership

A command belongs to the context that owns the invariant it changes. Cross-context commands must identify the authoritative owner and the boundary mechanism used to invoke it.

### 4.3 Event ownership

The context that changes a business fact owns the event producer. Consumers do not become owners of the originating business rule.

### 4.4 Read-model ownership

A projection may combine facts from several contexts. Projection ownership does not transfer source-of-truth ownership from the producing contexts.

### 4.5 Permission ownership

Permissions must resolve to an authoritative resource/context and tenant scope. UI visibility is not an authorization mechanism.

### 4.6 Persistence ownership

A PostgreSQL schema/table/model is not authoritative merely because it exists. Persistence ownership must trace back to a context/aggregate contract and ultimately to an approved task.

## 5. Initial evidence-backed ownership map

| Capability / module | Context direction | Aggregate owner | Event producer | Permission owner | State |
|---|---|---|---|---|---|
| Lead & CRM | CRM | CRM | CRM | CRM + Core tenant policy | PROPOSED |
| Visit Management | CRM | CRM | CRM | CRM | PROPOSED |
| Calendar / Scheduling | CRM | CRM | CRM | CRM | PROPOSED |
| Property & Inventory | Inventory | Inventory | Inventory | Inventory + Core tenant policy | PROPOSED |
| Reservation & Contract | Sales | Sales | Sales | Sales + Core tenant policy | PROPOSED |
| Payment & Finance | Finance | Finance | Finance | Finance + Core tenant policy | PROPOSED |
| Commission & Payout | Finance | Finance | Finance | Finance | PROPOSED |
| Identity / Access / Workspace | Core / Platform | Core | Core | Core | PROPOSED |
| Activity / Audit | Cross-cutting / Core | Source context for business fact | Source context | Core audit policy | DERIVED |
| Reporting | Analytics | Source contexts | Source contexts | Analytics + source-context policy | DERIVED |
| Search | Read model | Source contexts | Source contexts | Core + source resource policy | UNRESOLVED |
| Communication | Cross-context | UNRESOLVED | UNRESOLVED | Core + originating context | OPEN |
| Notification | Worker / cross-context | UNRESOLVED | Consumes source events | Core + originating context | OPEN |
| Collaboration | Cross-context | UNRESOLVED | UNRESOLVED | Core | OPEN |
| Workflow Engine | Cross-context | Core orchestration only; business invariants remain source-owned | Consumes/dispatches source events | Core + originating context | PROPOSED |

The map is deliberately conservative. `PROPOSED`, `DERIVED`, and `UNRESOLVED` are not interchangeable with `VERIFIED`.

## 6. Mandatory business ownership tests

Before a row becomes VERIFIED, answer all of the following:

1. What business invariant does this capability own?
2. Which aggregate enforces that invariant?
3. Which commands can change it?
4. Which state transitions are legal?
5. Which events prove the change occurred?
6. Which context produces those events?
7. Which other contexts consume them?
8. Which permission resource protects the operation?
9. Which tenant boundary applies?
10. Which persistence contract stores the authoritative state?
11. Which canonical task authorizes implementation?
12. What verification evidence proves the contract?

If any answer is unsupported, the row remains OPEN/UNRESOLVED.

## 7. Correctness-critical boundaries

The following require explicit concurrency/idempotency evidence before closure:

- inventory availability and reservation;
- reservation expiry/release;
- contract state transitions;
- financial posting and correction;
- payment idempotency;
- commission calculation/posting;
- tenant authorization;
- outbox publication and consumer deduplication.

## 8. Cross-context rule

Cross-context collaboration must use an explicit boundary:

- synchronous application/service contract when immediate consistency is required;
- domain/integration event when asynchronous propagation is sufficient;
- read-model projection for derived queries;
- workflow orchestration for process coordination.

A cross-context call must not directly mutate another context's owned persistence without an approved exception.

## 9. Database rule

This contract does not authorize Prisma, migration, or live-database changes.

Before database implementation:

```text
Environment identity
→ live introspection
→ recovery evidence
→ drift inventory
→ target comparison
→ approved decision
→ smallest forward-only migration
→ verification
```

## 10. Task traceability rule

No ownership row is implementation-ready until it maps to a canonical task ID. The task must have scope, authority, dependencies, definition of done, verification, evidence requirements, and rollback/stop conditions where applicable.

The unresolved `114 vs 119` task discrepancy must be closed before declaring the task layer canonical.

## 11. Closure states

Allowed states are:

- `VERIFIED`
- `PARTIAL`
- `BLOCKED`
- `NOT_EXECUTED`
- `OPEN`
- `UNRESOLVED`

Do not use informal closure states such as `ready`, `probably done`, `looks good`, or `should work`.

## 12. Required next work

1. Obtain/verify founder acceptance of ADR-0021.
2. Reconcile the complete 15-module source decomposition against this map.
3. Identify aggregate boundaries from authoritative source material.
4. Reconcile the 114-vs-119 task register.
5. Reconcile the 59/16/15-vs-59/17/56 schema observations.
6. Add event and permission traceability.
7. Verify repository references to historical architecture claims.
8. Capture Foundation CI evidence.
9. Only then authorize the first bounded implementation slice.

## 13. Non-negotiable rule

If evidence cannot establish ownership, ASAS does not guess. The row remains unresolved and becomes a dependency/blocker for implementation of the affected slice.
