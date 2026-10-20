# ASAS — Concurrency & Race Safety Catalog

**Status:** PARTIAL / P0 CONTRACT
**Branch:** `feat/foundation-command-registry`
**Authority:** Blueprint v1.6.1, state-machine/register contracts, domain invariants, and existing implementation specification where consistent. Undefined business policy remains OPEN.

## 1. Purpose

Application-level checks are insufficient when two valid actors/jobs can compete for the same scarce or stateful resource. Every competing mutation must have a database-enforced or transactionally serialized correctness boundary.

Concurrency protection must preserve the canonical mutation path:

`authorize → idempotency → validate → acquire concurrency boundary → invariant → state transition → audit/outbox → commit`

Idempotency prevents duplicate execution of one logical request; concurrency control prevents two different logical requests from both becoming valid winners.

## 2. P0 race catalog

| ID | Race | Required invariant | Minimum protection | Status |
|---|---|---|---|---|
| RACE-001 | Two users reserve same apartment | one legal reservation winner | serialize unit/reservation decision inside DB transaction + authoritative uniqueness/locking boundary | REQUIRED |
| RACE-002 | Reservation vs hold expiry | stale expiry cannot release newer winner | lock/check current unit + hold version/identity before release | REQUIRED |
| RACE-003 | Two hold requests for same apartment | at most one active hold | DB uniqueness/locking on active commercial state | REQUIRED |
| RACE-004 | Duplicate same-key reservation requests | one semantic effect | idempotency record + transaction | REQUIRED |
| RACE-005 | Different-key duplicate reservation requests | one winner | domain concurrency boundary; idempotency alone is insufficient | REQUIRED |
| RACE-006 | Reservation cancellation vs contract signing | no contradictory terminal outcomes | serialize reservation/unit transition and validate current version/state | REQUIRED |
| RACE-007 | Contract signing vs cancellation | one legal contract outcome | transactionally serialized state edge | REQUIRED |
| RACE-008 | Payment/receipt duplicate submission | one financial effect | idempotency + financial uniqueness/invariant | REQUIRED |
| RACE-009 | Payment allocation vs competing allocation | allocation cannot exceed authorized/unallocated amount | transactional balance check/locking | REQUIRED |
| RACE-010 | Period close vs posting | closed period cannot receive unauthorized posting | lock/period state validation in same transaction | REQUIRED |
| RACE-011 | Installment due/overdue worker vs manual update | worker cannot overwrite newer legal state | compare current state/version under transaction | REQUIRED |
| RACE-012 | Appointment auto-confirm vs agent cancellation | one legal outcome | current-state/version check in transaction | REQUIRED |
| RACE-013 | Appointment reschedule vs cancellation | no two successor/terminal stories from one source | serialize source appointment transition | REQUIRED |
| RACE-014 | Workflow retry vs original execution | one authoritative workflow effect | durable work identity + transaction/inbox | REQUIRED |
| RACE-015 | Webhook replay vs original callback | one domain mutation | durable delivery identity + transaction | REQUIRED |
| RACE-016 | Event consumer retry vs prior success | one consumer effect | inbox `(eventId, handler)` uniqueness/claim boundary | REQUIRED |
| RACE-017 | Hold/release worker vs manual apartment state change | stale worker cannot reverse newer state | current-state/version/identity predicate | REQUIRED |
| RACE-018 | Concurrent price override | no lost update or threshold bypass | optimistic/pessimistic concurrency + approval evaluation against current price | REQUIRED |
| RACE-019 | Concurrent approval decisions | one authoritative decision | append-only decision + single unresolved-request winner | REQUIRED |
| RACE-020 | Commission payout approval vs payout execution | no duplicate payout | financial operation identity + state/uniqueness boundary | REQUIRED |

## 3. Reservation single-winner protocol

The reservation invariant is stronger than `SELECT apartment WHERE status = AVAILABLE` followed by an application update. That pattern is unsafe under concurrent requests.

The authoritative transaction must:

1. resolve tenant/workspace and actor authorization;
2. establish idempotency identity for the command;
3. lock or otherwise atomically claim the reservable unit's current commercial state;
4. re-read the authoritative current state after acquiring the concurrency boundary;
5. verify the unit is still legally reservable;
6. validate hold/reservation preconditions;
7. create/update the reservation and unit state through legal state edges;
8. write audit and required outbox records in the same transaction;
9. commit exactly one winner;
10. make every loser receive a typed conflict/retry outcome without corrupting the winner.

The implementation may choose the exact PostgreSQL/Prisma mechanism, but it must prove the invariant at database/transaction level. Do not rely on a UI disable button, JavaScript mutex, or preflight read.

## 4. Stale expiry protocol

An expiry job is never authoritative merely because its timer fired.

Before releasing a hold, the job must establish that the hold it is processing is still the current hold for that unit and has not been superseded by a newer legal state. A stale worker must become a no-op/conflict, not revert the apartment.

Minimum identity predicate:

`tenant + unit + hold identity/version + expected current state`

The exact schema/version mechanism is implementation-open.

## 5. Optimistic vs pessimistic concurrency

The architecture does not mandate one universal strategy.

Use pessimistic/transactional serialization where a scarce resource has a strict single-winner invariant, especially apartment reservation/hold.

Optimistic version checks are appropriate where conflicts are less frequent and retrying the command is safe, provided the database update condition proves that the expected version/state is still current.

Do not claim `updatedAt` alone is a correctness version unless the implementation proves it cannot permit lost updates.

## 6. Database constraints

Database constraints should encode invariants that can be expressed structurally, such as:

- tenant ownership consistency;
- unique active operation identities;
- uniqueness of durable delivery identities;
- valid positive/nonnull identifiers;
- accounting balance/structural constraints where representable;
- one active reservation/hold relationship where the final schema supports it.

Constraints do not replace state-machine validation, authorization, approval, or business preconditions.

## 7. Isolation and lock scope

Lock only the smallest authoritative aggregate/resource boundary necessary to prove the invariant. Avoid broad tenant-wide locks.

The chosen isolation/locking mechanism must be documented for each P0 race and verified with concurrent tests. A successful single-threaded unit test is not evidence of race safety.

## 8. Retry semantics

A concurrency conflict is not automatically a safe transparent retry.

- Safe retry requires the command to be idempotent and its preconditions to remain valid.
- If the resource was legitimately won by another actor, return a typed domain conflict.
- Never replay a financial or reservation command blindly after an ambiguous commit outcome without checking durable idempotency/domain state.

## 9. Required adversarial tests

Minimum executable evidence:

1. two concurrent reservation commands with different keys → exactly one winner;
2. two concurrent hold commands → exactly one active hold;
3. reservation arrives while expiry worker runs → newer valid reservation survives;
4. stale expiry worker after reservation → no state regression;
5. cancellation vs contract signing → exactly one legal outcome;
6. duplicate payment request under concurrent transport retries → one financial effect;
7. allocation race cannot over-allocate a receipt/payment;
8. period-close race cannot post into a closed period;
9. duplicate webhook deliveries → one domain effect;
10. duplicate event delivery → one consumer effect;
11. concurrent approval decisions → one authoritative decision;
12. concurrent price changes do not silently lose a legitimate update or bypass threshold approval;
13. every failed race leaves audit/outbox/idempotency records consistent with the committed truth;
14. cross-tenant concurrent operations cannot contend across tenant boundaries except where explicitly global by contract.

## 10. Evidence requirement

A race-control item is GREEN only with:

`threat → invariant → transaction boundary → lock/constraint/version mechanism → conflict behavior → retry policy → concurrent test → observed result`

Schema-level claims must be verified against live reality before migration work. No production schema change is authorized by this document.

## 11. OPEN items

The following remain implementation/policy-open until the canonical schema and command registry close them:

- exact reservation locking primitive and unique-index shape;
- exact version columns/strategy for aggregates that need optimistic concurrency;
- exact transaction isolation per command;
- financial allocation locking model;
- approval unresolved-request uniqueness shape;
- provider-specific webhook delivery identity;
- event ordering implementation beyond the source requirement for same-aggregate sequencing;
- retry/backoff limits and dead-letter policy.

These are intentionally not guessed here.

## 12. Closure gate

The concurrency gate is closed only when all P0 races have executable evidence and the command registry links each competing mutation to its concurrency strategy.

Until then, no claim of production-grade reservation, finance, workflow, webhook, or event processing is valid.
