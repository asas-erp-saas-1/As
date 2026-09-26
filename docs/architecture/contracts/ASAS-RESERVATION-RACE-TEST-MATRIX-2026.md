# ASAS Reservation Race-Test Matrix — 2026

**Status:** Required implementation evidence  
**Workstream:** C03.12  
**Branch:** `platform-architecture-2026`

## Pass criteria

Every test must prove the invariant from authoritative persistence, not from UI state or response ordering.

| ID | Scenario | Expected invariant |
|---|---|---|
| RACE-01 | 2 concurrent callers, same Unit | exactly 1 reservation commits |
| RACE-02 | 100 concurrent callers, same Unit | exactly 1 reservation commits |
| RACE-03 | 2 agencies, same Unit | exactly 1 winner |
| RACE-04 | same command retried after timeout | no duplicate reservation |
| RACE-05 | same idempotency key, different payload | deterministic conflict |
| RACE-06 | expiration races with replacement reservation | old expiry cannot release new reservation |
| RACE-07 | release races with new reservation | no double winner |
| RACE-08 | stale client submits AVAILABLE | server authoritative state wins |
| RACE-09 | cache says AVAILABLE, DB says RESERVED | reservation rejected |
| RACE-10 | Unit CONTRACTED/SOLD | reservation rejected |
| RACE-11 | cross-tenant caller | authorization denied |
| RACE-12 | commit succeeds, response lost | retry returns committed result |
| RACE-13 | duplicate outbox delivery | consumer remains idempotent |
| RACE-14 | transaction failure before commit | no active reservation |
| RACE-15 | concurrent reservation + OFF_MARKET | deterministic policy result |
| RACE-16 | concurrent reservation + Hold conversion | deterministic single winner |

## Evidence requirements

For each test capture:

- test input and actor/tenant context;
- transaction/request correlation ID;
- idempotency key where applicable;
- authoritative database result;
- resulting Unit commercial state;
- reservation record count and active winner;
- emitted outbox records;
- rejected/conflicting attempts;
- elapsed time and retry behavior;
- residual locks/contention if measurable.

## Closure rule

C03.12 cannot be marked implementation-closed until the selected mechanism passes the applicable race tests and evidence is attached to the engineering checkpoint. A green unit-test suite without concurrent integration evidence is insufficient.
