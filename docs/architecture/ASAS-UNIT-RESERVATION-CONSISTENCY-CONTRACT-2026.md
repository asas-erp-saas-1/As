# ASAS — UNIT / RESERVATION CONSISTENCY CONTRACT 2026

**Artifact ID:** ASAS-ARCH-CONSISTENCY-UNIT-RESERVATION-2026-001  
**Status:** ARCHITECTURAL CONTRACT — OPEN / IMPLEMENTATION BLOCKED  
**Version:** 1.0.0  
**Effective date:** 2026-09-20  
**Owner:** Domain Architecture / Inventory & Reservation Engineering  
**Authority:** Derived from the current 2026 Blueprint, Enterprise Domain Model, aggregate/invariant register and command/action register. It does not override an approved ADR, founder decision, canonical register, live runtime or live database.

## 1. Purpose

This contract closes the first critical consistency question identified during H1.3/H1.4: how ASAS prevents two concurrent actors from becoming the active winner for the same Unit.

It defines the business invariant and the required consistency outcome without prematurely choosing a PostgreSQL locking primitive, ORM implementation, table layout or API shape.

## 2. Source-supported invariant

**INV-UR-001 — Single active reservation winner**

For a Unit, at most one Reservation may be active as the authoritative winner at any instant under concurrent commands.

The source architecture requires this outcome and identifies database constraint/conditional write, transaction/concurrency policy, idempotency, expiry handling, audit, outbox and race testing as required control categories.

Status: **SUPPORTED REQUIREMENT / RUNTIME ENFORCEMENT UNVERIFIED**.

## 3. Ownership model

- `Unit` remains an Inventory aggregate candidate and owns authoritative availability facts.
- `Reservation` remains a Reservation & Contract aggregate candidate.
- Neither aggregate may be treated as a reason to perform two independent writes that can temporarily or permanently violate the single-winner invariant.
- The exact cross-aggregate application boundary remains an engineering contract, not a reason to merge the aggregates automatically.

## 4. Required command semantics

The following source-derived actions participate in this boundary:

- `place_hold`
- `create_reservation`
- `release_reservation`

Their exact command payloads, API paths and permission keys are not defined here.

### Required outcome for creation

A successful reservation creation must establish a single authoritative winner for the Unit and leave the Unit/Reservation state mutually consistent.

A failed concurrent attempt must produce no second authoritative winner and must not leave an ambiguous partial business state.

A retry of the same logical request must not create a second business effect where idempotency is required.

## 5. Required processing sequence

The implementation must be able to demonstrate the following logical sequence:

```text
Authenticate actor
  ↓
Authorize reservation action
  ↓
Resolve tenant/scope
  ↓
Validate command
  ↓
Load/check Unit availability under the chosen consistency mechanism
  ↓
Evaluate Reservation preconditions
  ↓
Perform the authoritative Unit/Reservation mutation within the required consistency boundary
  ↓
Record audit evidence
  ↓
Record required durable domain event through the transactionally reliable publication mechanism
  ↓
Commit
```

The exact database isolation/locking mechanism is intentionally OPEN until schema and workload evidence are available.

## 6. Failure semantics

The implementation contract must explicitly distinguish:

1. invalid command;
2. unauthorized command;
3. wrong tenant/scope;
4. Unit no longer eligible;
5. concurrent winner already established;
6. expired hold;
7. duplicate/retried logical request;
8. transaction failure before commit;
9. transaction failure after an external side effect attempt.

No failure mode may silently create a second winner or an unreconciled authoritative state.

## 7. Required race tests

Before implementation authorization, evidence must cover at minimum:

- two agents concurrently reserving the same Unit;
- hold creation racing with another reservation;
- hold expiry racing with conversion to reservation;
- duplicate reservation command/retry;
- release racing with conversion or competing acquisition;
- transaction retry after timeout;
- durable event publication failure/retry after the business transaction.

The tests must demonstrate business invariants, not merely HTTP responses.

## 8. Idempotency

Reservation creation must have a defined idempotency strategy before implementation authorization.

The exact idempotency key shape and storage mechanism remain OPEN.

The contract must prevent a client retry from creating a second authoritative reservation for the same logical request.

## 9. Audit and event requirements

A successful authoritative state change must produce the required audit evidence and durable domain event according to the canonical event register and outbox contract.

This document does not invent a new event name. Event identity must be reconciled against the canonical event register before implementation.

## 10. Persistence constraints

This contract does **not** authorize:

- a new database table;
- a Prisma model;
- a unique index definition;
- a particular isolation level;
- `SELECT FOR UPDATE`;
- advisory locks;
- serializable transactions;
- a stored procedure;
- a specific API endpoint.

Those are implementation decisions to be selected after schema, workload and repository evidence are reconciled.

## 11. Non-negotiable prohibition

No implementation may model reservation creation as independent, eventually reconciled writes if that design permits two concurrent actors to become authoritative winners.

## 12. Closure criteria

This contract becomes **VERIFIED** only when all of the following exist:

- aggregate ownership recorded;
- command/permission mapping recorded;
- tenant-scope enforcement evidenced;
- concrete persistence mechanism selected and justified;
- transaction/concurrency behavior tested;
- duplicate/retry behavior tested;
- event/outbox behavior tested;
- audit evidence tested;
- no conflicting canonical artifact remains;
- verification evidence is recorded in the checkpoint.

Until then: **OPEN / IMPLEMENTATION BLOCKED**.

## 13. Next dependency

After this boundary is stable, continue H1.4 with:

1. Offer ownership/invariants;
2. Payment vs PaymentSchedule vs Receipt semantics;
3. Building ownership/invariants;
4. command → permission → state → event mapping.
