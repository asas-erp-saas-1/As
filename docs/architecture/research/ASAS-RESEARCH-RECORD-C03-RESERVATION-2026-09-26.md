# ASAS Research Record — C03.12 Reservation Boundary

**Date:** 2026-09-26  
**Status:** Accepted research basis  
**Branch:** `platform-architecture-2026`

## Research question

How should ASAS implement a real-estate Unit reservation so that concurrent actors cannot create two winners, retries cannot duplicate reservations, stale jobs cannot release a newer reservation, and historical commercial terms remain reconstructable?

## ASAS source validation

The current architecture doctrine separates Unit commercial state from Reservation lifecycle and requires one active winner per Unit under concurrency. Reservation is therefore a consistency boundary, not a boolean Unit field.

The current session state also records that the exact DB mechanism remains implementation-gated until brownfield schema/runtime identity is established and race tests prove the result.

## External engineering basis

### PostgreSQL uniqueness

PostgreSQL unique constraints/indexes provide database-level uniqueness enforcement. Partial unique indexes can express conditional uniqueness where the business predicate is represented by the indexed rows. This is a candidate primitive for an `active reservation per unit` invariant, subject to the actual schema and lifecycle representation.

Source: PostgreSQL 18 documentation — Constraints  
https://www.postgresql.org/docs/18/ddl-constraints.html

### PostgreSQL transaction isolation

PostgreSQL provides Read Committed, Repeatable Read and Serializable isolation. Serializable can reject transactions that cannot be serialized, requiring retry logic. The chosen level must be based on the actual reservation write path and proven under contention rather than selected by convention.

Source: PostgreSQL 18 documentation — Transaction Isolation  
https://www.postgresql.org/docs/18/transaction-iso.html

### Transactional messaging

A transactional outbox is appropriate when domain state and an integration event must be made durable together without publishing an external side effect before the transaction commits. This is a reliability pattern, not a substitute for the reservation database invariant.

## Alternatives considered

### A. UI availability check + ordinary UPDATE

Rejected. It is race-prone and cannot guarantee a single winner under concurrent requests.

### B. Application mutex only

Rejected as sole authority. Process-local locks do not cover multiple workers, instances, jobs or independent writers.

### C. Database constraint + conditional transactional write

Preferred direction. It places the invariant at the authoritative persistence layer and can be combined with deterministic command handling and idempotency. Exact constraint shape depends on brownfield schema.

### D. Serializable for every reservation transaction

Not selected yet. It can provide strong serialization but may introduce retries/contention and must be validated against the real workload.

### E. Row locking for the Unit

Not selected yet. It may be useful, but locking alone is not a complete idempotency or stale-expiration strategy and must be combined with durable invariants.

## Derived protocol

```text
authenticate
→ authorize
→ validate command
→ resolve idempotency identity
→ enter Unit reservation consistency boundary
→ verify eligibility
→ attempt authoritative reservation write
→ persist required snapshot
→ persist outbox event
→ commit
→ return committed result
```

Any failed transaction must leave no authoritative reservation winner.

## Required proof

The final implementation must demonstrate at minimum:

- 100+ concurrent attempts against the same Unit with exactly one winner;
- retries of a successful command return the same result;
- conflicting reuse of an idempotency key is rejected;
- stale expiration cannot release a replacement reservation;
- cross-tenant attempts cannot reserve;
- stale cache/search/public state cannot influence the winner;
- duplicate outbox delivery is safe for consumers.

The exact load number can be increased during performance testing; the invariant is qualitative and must hold regardless of concurrency level.

## Conclusion

The architecture decision is to make Reservation a first-class consistency boundary with database-enforced single-winner semantics, idempotent command handling, conditional expiration, immutable commercial snapshotting and transactional event publication. Concrete database mechanics remain gated by live-schema reconciliation.
