# ASAS — INVENTORY CHANNEL PRIORITY & RESERVATION COMPETITION CONTRACT 2026

**Status:** PROPOSED / SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED
**Date:** 2026-09-25
**Branch:** `platform-architecture-2026`
**Decision class:** Founder-approved product/business policy + engineering derivation

## 1. Purpose

Define deterministic commercial competition when more than one authorized sales channel can act on the same Unit, without making Developer internal sales automatically superior and without allowing frontend timing to decide inventory ownership.

## 2. Core decision

ASAS uses a **Hybrid E competition policy**:

`Project policy + explicit allocation + deterministic fallback`

The policy is configurable per Project or Inventory Batch, within platform invariants.

## 3. Channel neutrality

A sales channel may be:

- Developer internal sales team;
- Agency;
- Brokerage;
- another authorized commercial organization/team.

Organization type does not itself create reservation priority.

Authority and priority come from the effective commercial policy, allocation scope, and current eligibility.

## 4. Allocation semantics

Allocation is a commercial control object. It may define:

- exclusive/hard allocation;
- priority allocation;
- shared allocation;
- quantity/capacity limits;
- effective start/end;
- eligible organization/team/channel;
- project/building/unit scope;
- priority tier;
- release/expiry policy;
- reservation eligibility.

Allocation does **not** transfer legal ownership of the Unit.

Allocation does **not** by itself create a reservation, sale, attribution, or commission entitlement.

## 5. Competition resolution

When multiple eligible channels compete for the same Unit:

1. Determine the Unit's effective Project/Inventory policy.
2. Determine active allocations applicable at the transaction timestamp.
3. Exclude channels that fail authorization, relationship, assignment, allocation, or business preconditions.
4. Apply the highest valid priority tier when the policy defines priority tiers.
5. Within the same effective priority tier, the winner is the **first valid reservation transaction to commit successfully against the Unit's single-winner consistency boundary**.
6. Frontend request time, browser time, client timestamps, or UI ordering are never the authority.
7. A failed/rolled-back transaction never creates a commercial winner.
8. A losing concurrent request receives a deterministic conflict outcome and does not mutate the Unit.

If no priority/allocation rule applies, the default fallback is first valid committed reservation.

## 6. Hard allocation

An exclusive/hard allocation can restrict eligibility to its authorized channel during its effective period.

Hard allocation is not permanent ownership. It expires, is released, or is changed only through the governed allocation policy and audited action.

## 7. Holds

A Hold is a separate commercial state/object from Reservation.

A Hold may temporarily block competing reservations when the applicable project policy says so.

Hold expiry must be deterministic, auditable, and enforced server-side. Expiry does not depend on a client opening or refreshing the application.

## 8. Reservation boundary

Reservation remains the critical single-winner consistency boundary for a Unit.

The implementation must guarantee:

`at most one active winning reservation for a Unit under concurrency`

The exact database mechanism is implementation-level and remains subject to concurrency testing. Candidate controls may include transaction locking, uniqueness/exclusion constraints, isolation strategy, or a combination.

No candidate mechanism is authoritative until tested against concurrent requests, retries, stale clients, expiration races, and failure recovery.

## 9. Attribution

Inventory competition and commercial attribution are separate concerns.

Winning a reservation establishes the inventory outcome. It does not by itself erase previously recorded source/operational facts.

Attribution is snapshotted at the governing commercial milestone according to the approved attribution contract.

Manual adjudication remains available for attribution disputes and must be reason-coded and audited.

## 10. Override

Inventory priority or allocation may not be silently overridden.

Overrides require:

- authorized actor;
- reason code;
- explicit before/after outcome;
- audit evidence;
- applicable approval policy;
- preservation of prior facts.

An override does not rewrite historical events.

## 11. Non-negotiable invariants

- Organization type does not imply reservation priority.
- Allocation does not equal ownership.
- Allocation does not equal reservation.
- Hold does not equal Reservation.
- Reservation is the single-winner inventory boundary.
- Client/UI timestamps do not decide competition.
- Failed transactions do not create winners.
- Historical attribution is not rewritten by reassignment.
- Authorization is evaluated before the governed mutation.
- Tenant/resource scope is established before sensitive access.
- Configuration cannot weaken platform/domain/security invariants.

## 12. Required adversarial tests

At minimum:

- Developer internal team vs Agency A;
- Agency A vs Agency B;
- Agency vs Brokerage;
- two agents in the same Agency;
- hard allocation vs unauthorized channel;
- allocation expiry during reservation attempt;
- Hold expiry vs reservation attempt;
- simultaneous valid reservations at the same priority;
- duplicate request/retry;
- stale client after Unit state change;
- failed transaction after authorization;
- timeout after database commit;
- event publication failure after successful reservation;
- manual override during competing requests.

## 13. Implementation boundary

This contract authorizes semantic modeling and test design only.

It does not authorize:

- production schema changes;
- RLS changes;
- reservation service implementation;
- destructive migrations;
- financial posting;
- autonomous AI actions.

Those require their applicable implementation gates to be green.
