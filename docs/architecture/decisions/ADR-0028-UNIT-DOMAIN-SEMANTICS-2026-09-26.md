# ADR-0028 — Unit Domain Semantics

**Status:** ACCEPTED
**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Decision:** C03.6 Unit semantic slice closed

## Context

ASAS needs one canonical development-inventory resource that can survive changes to display references, pricing, publication, commercial actors, construction progress and downstream transactions. Historical artifacts use `Apartment`, `Property`, `Unit`, `Listing` and sometimes a single persistence record for many concerns. V3 resolves the target domain vocabulary by defining Unit in the development hierarchy and Listing in the brokerage hierarchy.

## Decision

`Unit` is the canonical development-inventory domain entity.

A Unit belongs to a Project directly or through an optional Building and optional Floor topology:

- Project → Unit
- Project → Building → Unit
- Project → Building → Floor → Unit

Unit has a stable technical identity that does not depend on its human-facing unit number, reference, slug or display label.

Unit owns/represents the stable identity and physical/inventory characteristics necessary to identify the development resource. It exposes commercial and construction state as separate dimensions, but it does not own the transactional lifecycles of Reservation, Contract, Payment, Commission, Lead, Listing or MediaAsset.

## Unit boundary

### Unit-level concepts

- stable identity;
- project/building/floor placement reference;
- human reference/number as mutable business identifier;
- unit type/category;
- physical characteristics such as area and orientation where applicable;
- room/amenity characteristics where applicable;
- parking/storage references where they are part of the development inventory model;
- commercial state;
- construction state;
- inventory ownership reference;
- controlled publication eligibility/reference.

### Explicitly outside Unit ownership

- Lead ownership/assignment;
- Offer lifecycle;
- Hold lifecycle;
- Reservation lifecycle and winner adjudication;
- Contract lifecycle;
- payment plans and receipts;
- ledger entries;
- commission accrual/payout;
- campaign attribution;
- canonical media storage lifecycle;
- scheduling;
- legal interpretation of sale contracts;
- external calendar/provider synchronization.

Those concerns reference Unit by stable identity through their own contracts.

## State doctrine

Commercial state and construction state are independent:

Commercial:
`AVAILABLE | HELD | RESERVED | CONTRACTED | SOLD | OFF_MARKET`

Construction:
`NOT_STARTED | FOUNDATION | STRUCTURE | MASONRY | MEP | FINISHING | READY | DELIVERED`

No single `status` field may collapse these dimensions.

## Identity doctrine

A Unit reference such as `F3-102` is a business/display identifier, not the technical identity. If a promoter renumbers units, changes a slug, republishes a unit or changes descriptive metadata, the Unit identity remains stable.

If a physical real-world Unit must be replaced because the development topology itself changes, the change must be represented through an audited domain operation rather than silently mutating historical transaction meaning.

## Ownership and collaboration

Unit ownership, visibility, allocation and reservation control remain distinct:

`Ownership ≠ Visibility ≠ Allocation ≠ Reservation Control`

A partner seeing a Unit does not gain ownership. An allocation does not transfer ownership. Reservation authority comes from the applicable Project/Inventory policy and resource authorization contract.

## Aggregate / consistency rule

This ADR deliberately does **not** declare that the entire Project → Building → Floor → Unit hierarchy is one aggregate. Aggregate boundaries follow transactional invariants. Unit is a first-class entity and may be the root of a Unit-specific aggregate where Unit-local invariants require it, but Reservation is a separate critical consistency boundary.

In particular, reservation concurrency must guarantee one active winner per Unit. Application checks alone are insufficient; database-level constraints/transactional protection and adversarial race tests are required before implementation authorization.

## Pricing rule

Price is not an immutable scalar truth embedded forever in Unit identity. Current commercial price is a versioned commercial fact. Historical offers, reservations and contracts must retain the applicable commercial snapshot according to their governing contracts.

The exact price-version persistence model is deferred to C03.10.

## Listing rule

A development Unit is not a Listing. A public or partner listing is a representation/publication of inventory or, in the brokerage path, a distinct brokerage object under Owner/Mandate semantics.

The public website must not create a competing Unit record merely to publish it.

## Media rule

Media assets reference Unit/Project through explicit relationships. Replacing a render, plan or gallery item does not change Unit identity.

## AI rule

AI may query or propose Unit actions only through authorized tools and domain/application commands. AI cannot bypass Unit authorization, allocation policy, reservation invariants or audit requirements.

## Implementation gates

No schema implementation follows automatically from this ADR. Before implementation authorization:

1. reconcile existing Unit/Apartments persistence;
2. identify the canonical runtime/database;
3. map Unit permissions and scopes;
4. register Unit state transitions/events;
5. define price-version contract;
6. define inventory-batch relationship;
7. define reservation concurrency mechanism;
8. write unit invariant tests and race tests;
9. verify tenant isolation and audit behavior;
10. update schema contract and migration plan.

## Consequence

ASAS obtains a stable development-inventory identity that can support the website, CRM, Sales, Inventory, Finance, analytics and future AI without duplicating the underlying resource. Historical implementation artifacts that collapse these concerns into one row must be treated as brownfield evidence to reconcile, not as the target domain model.
