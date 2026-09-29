# ASAS Inventory Lifecycle Contract — 2026

**Status:** SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED  
**ADR:** ADR-0033  
**Conference:** C03.11

## Canonical Unit commercial states

`AVAILABLE | HELD | RESERVED | CONTRACTED | SOLD | OFF_MARKET`

## State ownership

Inventory/Sales domain owns the commercial availability truth. Reservation owns reservation transaction facts. Contract owns contract lifecycle. Finance owns payment/ledger truth. Studio/Marketing/Search own projections and downstream representations.

## Allowed semantic transitions

The exact machine representation is register-gated, but the domain must support these meanings:

- AVAILABLE → HELD
- HELD → AVAILABLE (release/expiration)
- HELD → RESERVED
- RESERVED → AVAILABLE (authorized release/cancellation/expiration where policy permits)
- RESERVED → CONTRACTED
- CONTRACTED → SOLD
- controlled transitions to/from OFF_MARKET according to inventory policy

The implementation must reject transitions that violate the governing state machine, authorization, transaction facts or legal/business guards.

## Construction independence

Construction state is independent:

`NOT_STARTED | FOUNDATION | STRUCTURE | MASONRY | MEP | FINISHING | READY | DELIVERED`

A construction transition cannot silently change commercial availability. A commercial transition cannot silently change construction progress.

## Price independence

Price versions are independent commercial facts. A price update does not implicitly reserve, release, contract or sell a Unit.

## Projection doctrine

Search index, cache, public website, partner portal, analytics and AI read models consume inventory events/facts. They never become inventory authority.

## Required command behavior

Lifecycle commands must:
- establish caller/tenant/resource authority;
- validate current state and guards;
- execute atomically at the applicable consistency boundary;
- be idempotent where retried;
- write audit evidence;
- publish the canonical domain event through the transactional outbox after commit.

## Acceptance tests

1. Available Unit can enter a valid Hold.
2. Expired Hold cannot remain the active commercial control indefinitely.
3. Two concurrent reservation attempts produce exactly one winner.
4. Failed loser transaction does not emit a false ReservationCreated event.
5. Reservation release restores availability only when the governing policy/state permits it.
6. Contracted/Sold Unit cannot be reserved through a stale read model.
7. Construction advancement does not alter commercial state.
8. Price update does not alter commercial state.
9. OFF_MARKET cannot be bypassed by publication or search.
10. Tenant A cannot mutate Tenant B inventory.
11. Replayed lifecycle command is idempotent.
12. Audit/outbox evidence exists for every material transition.
