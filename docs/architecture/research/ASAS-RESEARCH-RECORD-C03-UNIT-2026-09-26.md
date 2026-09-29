# ASAS Research Record — C03.6 Unit

**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Status:** ACCEPTED RESEARCH BASIS
**Slice:** C03.6 — Unit Domain Semantics

## 1. Research question

What is the canonical meaning of a Unit in ASAS, what identity and lifecycle must it own, what must remain outside it, and where is its transactional consistency boundary?

## 2. ASAS source evidence

V3 defines the development hierarchy as Organization → Project → Building → Floor → Unit and separately defines commercial and construction states. It explicitly states that reservation is a critical consistency boundary requiring one active winner per unit under concurrency.

V3 also distinguishes the brokerage path Owner → Mandate → Listing → Property. Therefore Unit is the canonical development-inventory resource; Listing is not a synonym for Unit.

The earlier Master AI Agent Operating System lists apartment-facing fields such as reference, type, surface, floor, building, orientation, bedrooms, bathrooms, balconies, parking, price, payment plan, status and media. These are treated as product requirements/evidence for representations, not as proof that all fields belong to one persistence aggregate.

The older implementation specification contains a `Unit` persistence model with `projectId`, `unitNumber`, optional `floor`, `sizeSqm`, price/currency, construction phase, availability and links to reservation/buyer/payment schedule. This is historical implementation evidence only; it is not allowed to override the current domain semantics.

## 3. External engineering validation

Current Microsoft DDD guidance states that entities are defined by stable identity and continuity, aggregates are transactional consistency boundaries, and aggregates should be kept small around invariants rather than mirroring every real-world relationship. This supports treating Unit as a first-class entity while not automatically placing Reservation, Payment, Listing, Media or Construction objects inside the same aggregate.

PostgreSQL documentation confirms that database uniqueness constraints/unique indexes are appropriate enforcement mechanisms for uniqueness, including partial unique indexes when uniqueness applies only to a subset of rows. The exact ASAS reservation mechanism remains an implementation choice until the live schema and concurrency workload are verified.

## 4. Decision basis

Unit must remain stable across changes to human reference, display name, price, publication, assignment, availability representation and downstream transactions.

The Unit is the authoritative development-inventory object to which commercial state, construction state and physical characteristics refer. It is not itself a Listing, Reservation, Contract, Payment, Commission, Lead or MediaAsset.

A Unit may reference other aggregate roots by stable identity. Their lifecycle and consistency rules remain owned by their respective contexts.

## 5. Adversarial scenarios tested conceptually

- Project without Building: Unit can belong directly to Project.
- Building without Floor semantics: Unit can belong to Building without a Floor entity.
- Building with Floor: Unit can reference a Floor entity.
- Floor display number changes: Unit identity must not change.
- Unit reference changes: Unit identity must not change.
- Price changes: Unit identity remains; price is versioned commercial data.
- Unit is published: publication does not change ownership.
- Multiple agencies see the Unit: visibility does not imply ownership.
- Allocation changes: allocation does not transfer inventory ownership.
- Offer accepted: does not by itself create Reservation.
- Hold expires: Unit can return to the eligible commercial state according to policy.
- Reservation races: exactly one valid transaction may become the active winner.
- Contract/payment changes: Unit remains the underlying inventory resource; Finance and Documents own their facts.
- Media replacement: Unit identity remains unchanged.
- Construction progress changes: construction state changes without changing commercial state automatically.

## 6. Non-decisions deliberately preserved

- exact Unit database schema;
- whether Unit is a standalone aggregate root in every command path;
- exact reservation locking/isolation/index strategy;
- exact price/version table structure;
- exact inventory-batch persistence;
- exact Project Inventory permission IDs;
- live database mapping;
- legal contract semantics.

These require later contracts/evidence and are not invented here.

## 7. Conclusion

Unit is a first-class canonical development inventory entity with stable technical identity and independently modeled commercial and construction dimensions. It is the inventory resource at the center of reservation consistency, but Reservation is a separate transactional domain fact and does not become a child record whose entire lifecycle is controlled by Unit.
