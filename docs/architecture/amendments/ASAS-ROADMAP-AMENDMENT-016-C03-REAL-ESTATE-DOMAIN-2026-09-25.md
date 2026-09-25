# ASAS Roadmap Amendment 016 — C03 Real Estate Domain

**Date:** 2026-09-25
**Status:** ACTIVE

## Closed dependency

C02 inventory competition is closed through the Founder Decision and contract:

`Project/Inventory Policy + Explicit Allocation + Deterministic Fallback`

## Current workstream

`C03 — Real Estate Domain`

## Work packages

### C03.1 Resource identity

Define the identity and canonicality of Project, Building, Floor, Unit, Listing and related real-estate resources.

### C03.2 Asset taxonomy

Support apartments, villas, land, retail, office, parking, storage and mixed-use without making a Developer-only assumption.

### C03.3 Hierarchy

Validate:

`Portfolio → Project → Building → Floor → Unit`

while allowing valid project structures that do not require every level.

### C03.4 Multi-actor authority

Model ownership/control and commercial authorities separately so Developer, Agency, Brokerage and future actors can legitimately participate without duplicating canonical resources.

### C03.5 Listing representation

Separate the authoritative Unit/resource from one or more authorized commercial representations/listings.

### C03.6 State axes

Keep construction/physical state separate from commercial availability, allocation, hold, reservation and sale state.

### C03.7 Pricing/versioning

Define price facts, effective periods, overrides, approvals and historical preservation.

### C03.8 Inventory lifecycle

Reconcile existing state-machine definitions before introducing new states.

### C03.9 Reservation boundary

Carry forward the single-winner invariant and C02 competition policy into C05 Sales without duplicating Unit truth.

### C03.10 Schema contract

Only after semantic closure, reconcile target schema, Prisma contract, migrations and live database.

## Adversarial acceptance set

The C03 model must survive:

- Developer internal sales;
- multiple Agencies on one Project;
- Agency-owned inventory;
- Agency representation of Developer inventory;
- Brokerage participation;
- multiple listings for one Unit;
- mixed-use projects;
- projects without conventional buildings;
- historical authority changes;
- concurrent reservation attempts.

## Gate

`C03 = ACTIVE / IMPLEMENTATION BLOCKED`
