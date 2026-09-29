# ASAS Research Record — C03.13 Reservation / Persistence Data Safety

**Status:** ACTIVE DECISION SUPPORT  
**Date:** 2026-09-26  
**Branch:** `platform-architecture-2026`

## Question

How should ASAS enforce the semantic requirement that at most one active Reservation wins a development Unit, while preserving retry safety, expiry safety, auditability and durable event publication?

## ASAS source evidence

The current ASAS checkpoint and aggregate/invariant register require:

- one active reservation winner per Unit;
- authoritative winner = successful transaction commit;
- database-enforced integrity;
- idempotent reservation commands;
- conditional expiration/release;
- commercial milestone snapshot;
- auditability;
- transactional outbox;
- adversarial race tests.

These are semantic requirements. They do not by themselves select a PostgreSQL implementation mechanism.

## External engineering evidence

### PostgreSQL constraints

PostgreSQL 18 documents unique constraints as database-enforced uniqueness. It also documents partial unique indexes as the mechanism for uniqueness over a subset of rows. This is directly relevant to an "active reservation only" invariant, subject to the actual ASAS schema and state representation. citeturn0search1turn0search2

### PostgreSQL concurrency

PostgreSQL exposes transaction isolation levels including Read Committed, Repeatable Read and Serializable. The correct level and locking strategy must be selected against the actual command/query shape and workload rather than assumed globally. citeturn0search12

### PostgreSQL 18 temporal constraints

PostgreSQL 18 adds temporal constraint capabilities including non-overlapping unique/primary-key constraints. This is potentially relevant to future time-bounded inventory/reservation semantics, but it is not automatically the correct ASAS mechanism because the reservation invariant concerns active lifecycle ownership and requires compatibility with existing schema and operational tooling. citeturn0search5turn0search7

### Transactional outbox

The transactional outbox pattern stores the outbound event in the same database transaction as the business state change, then relays it separately. It prevents the failure window where the database commits but event publication is lost. Relays may publish duplicates, so consumers must be idempotent. citeturn0search0

## Engineering derivation

The smallest defensible ASAS implementation will need two independent guarantees:

1. **State invariant:** the database cannot commit two simultaneous active winners for the same Unit.
2. **Publication reliability:** a committed reservation cannot lose its required durable lifecycle event because the publisher crashed after commit.

The first is a database/transaction consistency problem. The second is an integration durability problem. An outbox does not solve the first; a unique constraint does not solve the second.

## Candidate implementation families

### A — Active-row unique constraint/index

Model active reservations so a unique database constraint/index can enforce one active row per Unit.

**Strength:** simple invariant; database-enforced.  
**Risk:** depends on actual lifecycle representation and whether "active" can be expressed safely in the index predicate.

### B — Conditional Unit update plus reservation insert

Atomically claim the Unit only if its expected state permits reservation, then create the Reservation in the same transaction.

**Strength:** explicit state transition.  
**Risk:** must still prevent duplicate Reservation rows and handle retries/partial failures correctly.

### C — Serializable transaction

Use serializable isolation around the reservation operation.

**Strength:** strong transaction-level correctness.  
**Risk:** serialization failures become normal retry cases; it does not remove the need for idempotency or a durable data invariant.

### D — Explicit row locking

Lock the authoritative Unit row before checking and creating the reservation.

**Strength:** straightforward mental model.  
**Risk:** lock scope/contention and stale application assumptions; still requires database constraints for defense-in-depth.

### Current disposition

**Not selected yet.** The brownfield schema must be inspected first. The likely production design may combine a database uniqueness invariant with a transaction/conditional state transition and idempotency, but that combination remains an engineering hypothesis until validated.

## Required adversarial tests

- two agents reserve the same Unit simultaneously;
- ten or more concurrent reservation attempts;
- retry after client timeout;
- same idempotency key repeated after success;
- same idempotency key reused with conflicting command;
- expiry job races with a new reservation;
- stale expiry worker attempts to release a newer reservation;
- transaction fails before commit;
- transaction commits but application response is lost;
- outbox relay crashes after publish;
- consumer receives duplicate event;
- price changes after reservation;
- authorization changes between request creation and commit;
- cross-tenant reservation attempt;
- Unit commercial state changes concurrently with reservation.

## Decision

**Semantic requirement: CLOSED.**  
**Concrete persistence/concurrency mechanism: OPEN / IMPLEMENTATION BLOCKED pending brownfield reconciliation.**

## Sources

- PostgreSQL 18 Constraints: https://www.postgresql.org/docs/18/ddl-constraints.html
- PostgreSQL 18 CREATE INDEX: https://www.postgresql.org/docs/18/sql-createindex.html
- PostgreSQL 18 transaction configuration/isolation: https://www.postgresql.org/docs/18/runtime-config-client.html
- PostgreSQL 18 Release 18 constraints: https://www.postgresql.org/docs/18/release-18.html
- Transactional Outbox pattern: https://microservices.io/patterns/data/transactional-outbox
