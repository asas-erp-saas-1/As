# ASAS — UNIT / RESERVATION CONSISTENCY CONTRACT 2026

**Artifact ID:** ASAS-ARCH-CONSISTENCY-UNIT-RESERVATION-2026-001  
**Status:** ARCHITECTURAL CONTRACT — PARTIALLY CLOSED / IMPLEMENTATION UNVERIFIED  
**Version:** 1.0.1  
**Effective date:** 2026-09-20  
**Owner:** Domain Architecture / Inventory & Reservation Engineering  
**Authority:** Derived from the current 2026 Blueprint, Enterprise Domain Model, accepted ADR-0017, aggregate/invariant register and command/action register. It does not override an approved ADR, founder decision, canonical register, live runtime or live database.

## 1. Purpose

This contract closes the first critical consistency question identified during H1.3/H1.4: how ASAS prevents two concurrent actors from becoming the active winner for the same Unit.

It defines the business invariant and reconciles the accepted source architecture's concrete reservation protocol without claiming that the current repository/live database implements it.

## 2. Authority reconciliation

The v1.6.1 source package contains **ADR-0017 — Single-winner reservations: protocol + DB constraints**, status `Accepted`.

That ADR specifies:

1. a transactional reservation protocol using `SELECT … FOR UPDATE` with in-lock re-verification;
2. a partial unique constraint for active reservations on the unit/apartment identifier;
3. a partial unique constraint for unreleased holds on the same unit/apartment identifier;
4. a concurrent race test proving one winner and a typed loss for the loser;
5. a load/burst profile that re-proves the invariant.

Because this is an accepted architecture decision in the source baseline and no current 2026 ADR has explicitly superseded it, the mechanism is **APPROVED ARCHITECTURAL BASELINE / IMPLEMENTATION UNVERIFIED**.

The implementation must still verify that the current repository schema, database version and ORM can realize the decision safely. If they cannot, an ADR is required before changing the mechanism.

## 3. Source-supported invariant

**INV-UR-001 — Single active reservation winner**

For a Unit, at most one Reservation may be active as the authoritative winner at any instant under concurrent commands.

Status: **SUPPORTED REQUIREMENT / RUNTIME ENFORCEMENT UNVERIFIED**.

## 4. Ownership model

- `Unit` remains an Inventory aggregate candidate and owns authoritative availability facts.
- `Reservation` remains a Reservation & Contract aggregate candidate.
- The reservation protocol is the consistency boundary that coordinates the Unit availability invariant and Reservation creation.
- This does **not** require merging Unit and Reservation into one aggregate.

## 5. Required command semantics

The following source-derived actions participate in this boundary:

- `place_hold`
- `create_reservation`
- `release_reservation`

Their exact command payloads, API paths and permission keys are not defined here.

### Required outcome for creation

A successful reservation creation must establish a single authoritative winner for the Unit and leave the Unit/Reservation state mutually consistent.

A failed concurrent attempt must produce no second authoritative winner and must not leave an ambiguous partial business state.

A retry of the same logical request must not create a second business effect where idempotency is required.

## 6. Required processing sequence

The architecture-approved logical sequence is:

```text
Authenticate actor
  ↓
Authorize reservation action
  ↓
Resolve tenant/scope
  ↓
Validate command
  ↓
Begin reservation transaction
  ↓
Lock/check Unit according to ADR-0017 protocol
  ↓
Re-verify authoritative availability inside the transaction
  ↓
Create/transition Reservation and required Unit/hold state
  ↓
Enforce partial uniqueness constraints
  ↓
Record required audit/event/outbox data
  ↓
Commit
```

The exact SQL/ORM expression and current schema realization still require repository/database verification.

## 7. Failure semantics

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

## 8. Required race tests

Before implementation authorization, evidence must cover:

- two agents concurrently reserving the same Unit;
- hold creation racing with another reservation;
- hold expiry racing with conversion to reservation;
- duplicate reservation command/retry;
- release racing with conversion or competing acquisition;
- transaction retry after timeout;
- durable event publication failure/retry after the business transaction.

The accepted ADR additionally requires a 50-concurrent-attempt race test and load/burst re-verification. Those requirements remain source evidence unless a later approved decision supersedes them.

## 9. Idempotency

Reservation creation must have a defined idempotency strategy before implementation authorization.

The exact idempotency key shape and storage mechanism remain OPEN.

The contract must prevent a client retry from creating a second authoritative reservation for the same logical request.

## 10. Audit and event requirements

A successful authoritative state change must produce the required audit evidence and durable domain event according to the canonical event register and outbox contract.

This document does not invent a new event name. Event identity must be reconciled against the canonical event register before implementation.

## 11. Persistence verification

The architecture baseline specifies the reservation protocol and partial uniqueness pattern, but this contract does not authorize a production migration.

Verification must establish:

- the current repository schema contains or can safely express the required constraints;
- the current database supports the required semantics;
- the migration can be rehearsed locally;
- concurrent behavior is tested;
- no destructive production operation is required.

## 12. Non-negotiable prohibition

No implementation may model reservation creation as independent, eventually reconciled writes if that design permits two concurrent actors to become authoritative winners.

## 13. Closure criteria

This contract becomes **VERIFIED** only when all of the following exist:

- aggregate ownership recorded;
- command/permission mapping recorded;
- tenant-scope enforcement evidenced;
- ADR-0017 protocol implemented or formally superseded;
- required partial uniqueness constraints verified in executable schema/runtime;
- transaction/concurrency behavior tested;
- duplicate/retry behavior tested;
- event/outbox behavior tested;
- audit evidence tested;
- no conflicting canonical artifact remains;
- verification evidence is recorded in the checkpoint.

Until then: **PARTIALLY CLOSED / IMPLEMENTATION UNVERIFIED**.

## 14. Next dependency

After this boundary, continue H1.4 with:

1. Offer command/state/permission/event contract;
2. Building ownership/invariants;
3. receipt/allocation/ledger semantics;
4. Scheduling ADR reconciliation;
5. query/read-model contracts.
