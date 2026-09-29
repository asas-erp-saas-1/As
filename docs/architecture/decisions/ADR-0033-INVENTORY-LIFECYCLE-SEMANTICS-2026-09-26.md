# ADR-0033 — Inventory Lifecycle Semantics

**Date:** 2026-09-26  
**Status:** ACCEPTED — semantic slice closed; implementation gated  
**Conference:** C03 Real Estate Domain

## Decision

ASAS inventory availability is the controlled commercial lifecycle of a canonical development Unit. It is not a mutable convenience flag and it is not derived from UI state, listings, search indexes or client assumptions.

The Unit has an independent commercial lifecycle:

`AVAILABLE → HELD → RESERVED → CONTRACTED → SOLD`

with controlled release/exit paths and `OFF_MARKET` as a policy-controlled commercial state.

## Lifecycle semantics

### AVAILABLE
Unit may be commercially offered subject to project/allocation/policy rules.

### HELD
Temporary commercial control exists for a bounded hold period. A hold is not a reservation and does not create a contract.

### RESERVED
A valid reservation has won the Unit's single-winner commercial boundary. Reservation terms are separate transactional facts.

### CONTRACTED
A governing contract has reached the required contractual state. Contract is a separate aggregate/lifecycle.

### SOLD
The commercial transaction has reached the platform's final sold milestone for the applicable track. Exact legal meaning is country/contract-policy controlled.

### OFF_MARKET
Unit is intentionally unavailable for ordinary commercial allocation/publication. It may be used for reasons such as withdrawal, correction, legal/operational restriction or inventory policy.

## Release/expiration doctrine

- An unexpired Hold may be released according to hold policy.
- An expired Hold returns the Unit to the applicable available state only after deterministic expiration processing succeeds.
- A Reservation may return inventory to availability only through an authorized reservation release/cancellation/expiration action consistent with its transaction state and policy.
- Contracted/Sold inventory must never be released merely because a public listing or cache says it is available.
- OFF_MARKET is not a synonym for deleted, archived, or sold.

## Invariants

1. At most one active winning reservation/hold control path may govern a Unit at the applicable consistency boundary.
2. State changes are domain actions, not raw status-column mutations.
3. Every material transition is auditable and emits the canonical registered event after successful transaction commit via the outbox pattern.
4. Search, cache, public website and partner projections are downstream representations; they cannot create commercial availability.
5. Construction state never directly performs a commercial transition.
6. Price changes never directly perform a commercial transition.
7. Public publication never implies operational availability.
8. Tenant/organization/resource authorization is evaluated before mutation.
9. Idempotency is required for externally retried lifecycle commands.
10. Historical states and transitions remain reconstructable for audit and analytics.

## Concurrency

Reservation is a critical consistency boundary. Application pre-checks are insufficient. The implementation must prove one winner under concurrent attempts using database-backed constraints/transaction semantics, idempotency and race tests.

## Relationship to other lifecycles

```text
Lead → Offer → Hold → Reservation → Contract → Payment/Sale
                         │
                         └── Unit commercial state projection

Unit construction state ── independent
Price versions ─────────── independent
Listing/publication ────── downstream commercial representation
```

## Implementation boundary

This ADR closes semantic lifecycle ownership only. It does not authorize:
- schema migration;
- RLS changes;
- state-machine register edits;
- permission-key creation;
- reservation locking implementation;
- production data changes.

Those require reconciliation against canonical registers and verified runtime reality.
