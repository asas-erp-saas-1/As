# ASAS C02 Inventory / Reservation Concurrency Research — 2026-09-25

**Status:** RESEARCH RECORD — implementation blocked
**Scope:** C02 → C03/C05 bridge

## 1. Research question

How should ASAS preserve the single-winner Unit reservation invariant when multiple internal/external sales actors can operate against the same authoritative inventory?

## 2. ASAS source evidence

The canonical V3 baseline states that Inventory owns real-estate inventory hierarchy and commercial/construction state, Sales owns reservation/contract commercial lifecycle, and reservation is the critical single-winner consistency boundary for a Unit. The state-machine register separately defines apartment commercial status and reservation lifecycle and prohibits arbitrary status setters.

The Project Inventory Collaboration Contract defines one authoritative Unit record, scoped partner access, optional commercial allocation, and reservation/hold controlled by the canonical lifecycle.

## 3. Important semantic distinction

```text
Inventory ownership
≠ visibility
≠ allocation
≠ hold
≠ reservation
≠ sale attribution
```

A partner request or allocation must never be treated as proof that the Unit became reserved. The committed authoritative state transition is the source of truth.

## 4. External technical evidence

PostgreSQL 18 documents unique constraints, partial unique indexes, exclusion constraints, and temporal/range constraints as database-enforceable integrity mechanisms. Exclusion constraints can enforce non-overlap relationships beyond ordinary equality uniqueness. PostgreSQL also documents Serializable isolation as a mechanism that can reject conflicting concurrent transactions with serialization failures. These are implementation options, not a decision that ASAS must use one specific mechanism.

Sources:
- PostgreSQL 18 constraints: https://www.postgresql.org/docs/18/ddl-constraints.html
- PostgreSQL 18 CREATE TABLE / EXCLUDE / temporal constraints: https://www.postgresql.org/docs/18/sql-createtable.html
- PostgreSQL 18 release notes / temporal constraints: https://www.postgresql.org/docs/18/release-18.html

## 5. Engineering conclusion

The invariant must be enforced at a transactional authority boundary and must not rely only on UI checks or application-side read-then-write logic.

The final implementation may use one or a combination of:

- transaction locking;
- unique/partial uniqueness;
- exclusion/temporal constraints where the model requires interval semantics;
- transaction isolation and retry;
- explicit aggregate serialization;
- idempotency keys.

The correct combination must be selected only after the final reservation/hold semantics and persistence model are closed.

## 6. Required adversarial tests

1. Two agencies request the same Unit concurrently.
2. Internal Developer sales and an Agency request the same Unit concurrently.
3. Two authorized users from the same Agency request the same Unit concurrently.
4. A hold expires while another actor requests reservation.
5. A retry repeats a successful reservation command.
6. An authorization change occurs while a reservation command is in flight.
7. An allocation expires while a reservation command is in flight.
8. A reservation is cancelled and the Unit becomes eligible again according to policy.
9. A stale client submits a command after the Unit state changed.
10. Event publication fails after the domain transaction commits.

## 7. Status

**ENGINEERING-DERIVATION:** the reservation invariant must be protected by authoritative transactional/database guarantees in addition to application authorization.

**NOT DECIDED:** exact PostgreSQL mechanism, transaction isolation, schema representation, or lock strategy.

**FOUNDER-DECISION-REQUIRED:** exact business policy when multiple eligible channels compete for a Unit and no exclusive allocation resolves priority.
