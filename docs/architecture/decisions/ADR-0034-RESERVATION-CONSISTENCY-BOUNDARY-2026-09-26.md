# ADR-0034 — Reservation Consistency Boundary

**Date:** 2026-09-26  
**Status:** Accepted — semantic/architecture contract; implementation gated  
**Workstream:** C03.12 Reservation Boundary  
**Branch:** `platform-architecture-2026`

## Decision

ASAS treats Reservation as a first-class transactional domain object whose consistency boundary is the development Unit being reserved. A Unit may have at most one active winning reservation at a time under the canonical reservation policy.

Reservation is not a mutable flag on Unit. `unit.commercial_state = RESERVED` is a projection/consequence of a successful reservation transition, not the write authority.

The reservation protocol must provide all of the following:

1. **Single winner:** concurrent valid attempts for the same Unit produce exactly one successful active reservation.
2. **Database-enforced invariant:** application/UI checks are insufficient; the persistence layer must enforce the active-reservation uniqueness invariant.
3. **Conditional state transition:** a reservation may commit only while the Unit is in an eligible commercial state and the caller is authorized for the Unit/project scope.
4. **Idempotency:** a retried request with the same idempotency key and command identity returns the original semantic result and does not create a second reservation.
5. **Expiration safety:** expiration/release is a domain action; stale timers/jobs cannot release a newer reservation.
6. **Auditability:** reservation creation, rejection, expiration, release, and cancellation carry actor, organization, resource, policy, correlation/idempotency and timestamps.
7. **Snapshot integrity:** the reservation records the applicable commercial terms required at reservation time; later base-price versions do not rewrite the reservation economics.
8. **Atomic domain transition:** reservation success and the Unit commercial-state consequence must be committed atomically within the selected transaction boundary.
9. **Outbox boundary:** externally observed lifecycle events are emitted from committed state through the transactional outbox pattern rather than pre-commit side effects.
10. **No cache authority:** cache, search, website or analytics projections can never win a reservation race or determine the authoritative winner.

## Explicit non-decisions

The conference does **not** yet select one concrete PostgreSQL mechanism among row locking, conditional writes, Serializable isolation, or a combination. Selection requires brownfield schema reconciliation and an executable race-test proof.

The conference does not authorize Prisma/Drizzle schema changes, RLS changes, API implementation, or production migrations from this ADR alone.

## Required transaction properties

The final implementation must prove:

```text
request
  -> authenticate caller
  -> authorize Unit/project action
  -> validate command/idempotency key
  -> establish reservation consistency boundary
  -> verify eligible Unit state
  -> persist reservation + required snapshot
  -> atomically establish Unit commercial consequence
  -> persist outbox event
  -> commit
  -> return committed result
```

No externally visible side effect may be treated as authoritative before commit.

## Concurrency scenarios that must pass

- two users reserve the same Unit simultaneously;
- two agencies reserve the same Unit simultaneously;
- same caller retries after timeout;
- same idempotency key arrives concurrently;
- expiration races with a new reservation;
- release races with a new reservation;
- stale client submits an old Unit state;
- reservation races with a valid Hold conversion;
- reservation races with OFF_MARKET transition;
- reservation is attempted after Unit is CONTRACTED/SOLD;
- transaction commits but response is lost and client retries;
- duplicate/out-of-order delivery of reservation events;
- cross-tenant caller attempts to reserve an otherwise valid Unit.

## Failure semantics

A failed reservation must not leave a partial active reservation, a false RESERVED projection, an orphaned external side effect, or an ambiguous winner.

A successful reservation must remain reconstructable from authoritative records and audit/outbox evidence even if all read projections are stale or unavailable.

## Source hierarchy

1. Founder/product constitution and accepted architecture decisions.
2. Current repository governance and canonical contracts.
3. Brownfield repository/runtime facts once independently verified.
4. PostgreSQL/database guarantees used as implementation evidence.
5. UI/search/cache behavior is non-authoritative.

## External research basis

PostgreSQL documents unique constraints/indexes and transaction isolation as database mechanisms that can support integrity and concurrency controls. These are candidate primitives; ASAS must prove the selected combination with adversarial tests before implementation closure.

- PostgreSQL constraints: https://www.postgresql.org/docs/18/ddl-constraints.html
- PostgreSQL transaction isolation: https://www.postgresql.org/docs/18/transaction-iso.html

## Consequences

Positive:
- reservation races become explicit engineering requirements;
- stale projections cannot create false winners;
- retries are safe;
- transaction economics remain reconstructable;
- the eventual API can be idempotent by contract.

Costs:
- reservation implementation is more complex than a status update;
- database constraints and transaction behavior must be tested under contention;
- outbox processing and idempotency records become part of the reliability surface.

## Gate

**Semantic decision accepted. Implementation remains BLOCKED until:** live DB identity is established; existing reservation/unit persistence is mapped; canonical permission/event/state registers are reconciled; concurrency mechanism is selected; race tests are implemented and pass; RLS/tenant isolation evidence is available.
