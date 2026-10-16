# ASAS Reservation State Machine Contract — 2026

**Status:** PROPOSED — implementation blocked
**Conference:** C02 → C05

## 1. Ownership

Reservation is owned by the Sales domain. Inventory remains authoritative for Unit availability. Finance consumes approved commercial/financial facts according to its own contract.

## 2. Proposed lifecycle

```text
REQUESTED
   ↓
PENDING_APPROVAL ─────→ REJECTED
   ↓
CONFIRMED
   ↓
ACTIVE
   ├────────────→ CANCELLED
   ├────────────→ EXPIRED
   └────────────→ CONVERTED
                         ↓
                    CONTRACTED / SALE
```

The exact states and whether `REQUESTED`, `PENDING_APPROVAL`, or `ACTIVE` are necessary remain subject to commercial-rule closure. They must not be implemented as arbitrary status strings.

## 3. Unit invariant

For an exclusively reservable Unit, at most one active reservation may hold the unit at a time according to the authoritative inventory policy.

A reservation command must validate the current Unit state and relevant allocation/eligibility rules within the same consistency boundary used to commit the reservation.

## 4. Commands

Candidate commands:

- request reservation;
- approve reservation;
- reject reservation;
- confirm reservation;
- cancel reservation;
- expire reservation;
- convert reservation.

No direct `UPDATE reservation.status` path is permitted for governed transitions.

## 5. Attribution snapshot

The reservation stores/snapshots the applicable commercial attribution facts at the milestone that creates the entitlement/credit. Later lead reassignment, team movement or relationship changes do not rewrite historical facts.

## 6. Idempotency

Commands that may be retried must carry a stable idempotency key scoped to the actor/operation boundary. Duplicate requests must not create duplicate reservations, duplicate attribution records or duplicate downstream financial effects.

## 7. Failure semantics

If authorization, scope, eligibility, inventory state, approval or concurrency validation fails, the command must fail without a partial committed reservation state.

## 8. Audit and events

Every accepted state transition records actor, timestamp, reason/context and correlation/causation identifiers. Durable downstream events are published through the approved transactional event mechanism.

## 9. Required tests

- invalid transition rejection;
- unauthorized reservation rejection;
- cross-organization rejection;
- out-of-scope project/unit rejection;
- allocation violation;
- duplicate/idempotent request;
- two concurrent reservation attempts for one Unit;
- cancellation and release;
- expiry and release;
- reassignment after reservation does not alter historical attribution;
- event/outbox atomicity;
- audit completeness.

## 10. Closure blockers

Before implementation-ready, decide:

- exact states;
- approval authority;
- hold vs reservation distinction;
- expiry policy;
- deposit/payment relationship;
- whether multiple reservation types exist;
- allocation priority rules;
- legal/commercial implications in target markets;
- exact transaction/isolation strategy.
