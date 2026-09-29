# ASAS Research Record — C03.7 Listing

**Date:** 2026-09-26  
**Status:** ACCEPTED RESEARCH BASIS  
**Branch:** `platform-architecture-2026`

## Research question

What is a Listing in ASAS, how does it relate to Unit/Property/Owner/Mandate, and how can the public/commercial representation of inventory remain separate from authoritative inventory truth?

## Source hierarchy

1. ASAS Architecture V3 — current target architecture.
2. ASAS Enterprise Domain Model — historical DDD evidence.
3. ASAS Phase 1 BRD — business-origin evidence.
4. Current conference decisions and contracts — governing semantic decisions.

## Verified source facts

V3 defines development inventory as:

`Organization → Project → Building → Floor → Unit`

and brokerage as:

`Owner → Mandate → Listing → Property`.

V3 also lists Listing as an ontology object and separates ontology from authoritative domain persistence.

The historical Enterprise Domain Model defines Listing as a Track B aggregate with owner/mandate details, price and availability, and defines Unit as Track A inventory. The older BRD proposed one shared Property concept with a discriminator between Own-Project Unit and Resale Listing. The current V3 model supersedes that implementation-oriented simplification by keeping Unit and Listing as distinct domain concepts while allowing them to feed the same commercial model.

## Derived semantic conclusion

A Listing is a **commercial brokerage representation of an underlying property interest under an owner/mandate relationship**. It is not a synonym for a development Unit and it is not the canonical development-inventory resource.

For development inventory:

`Project → Unit → commercial/public representations`

For brokerage inventory:

`Owner → Mandate → Listing → Property`

The two tracks may converge at the commercial workflow layer (Lead, Visit, Offer, Hold, Reservation where legally/policy appropriate), but convergence does not erase their different ownership/authority models.

## Listing ownership rule

The Listing record does not itself transfer ownership of the underlying Property. Authority derives from the Owner/Mandate relationship and applicable Organization Relationship/Resource Scope rules.

## Publication rule

A public listing/publication is a representation/projection. It is not a second source of truth for inventory, pricing, reservation or ownership. Public channels must resolve authoritative current facts from their owning domain or an explicitly versioned publication projection.

## Pricing rule

A Listing may carry a commercial asking price/version appropriate to the brokerage mandate. This must not silently overwrite the underlying property's owner-controlled facts or development Unit pricing. Historical offers/reservations/contracts must retain their governing commercial snapshot.

## Availability rule

Listing availability is a representation of the underlying commercial state. It must not independently create a second reservation truth. Reservation authority remains in the reservation/inventory consistency boundary.

## Channel rule

Website Studio, partner portals, campaigns, search indexes and external channel connectors consume Listing/publication projections. They do not become inventory authorities merely because they publish or cache a Listing.

## Boundary rules

Listing does not own:

- Organization tenancy;
- Owner legal title;
- Mandate authority itself;
- Lead ownership;
- Reservation consistency;
- Contract legal state;
- Payment/ledger state;
- Commission entitlement;
- canonical media storage lifecycle.

Listing may reference those facts through explicit contracts/projections.

## Adversarial scenarios

The model must support:

1. one Owner with multiple Listings;
2. one Property represented by different channels without duplicate property identity;
3. mandate expiry while a listing/publication remains cached;
4. price revision after an offer;
5. listing withdrawal without deleting historical transactions;
6. agency representing another organization's property;
7. two agencies receiving scoped visibility without merging private CRM data;
8. development Unit published publicly without becoming a brokerage Listing;
9. brokerage Listing published on ASAS Website Studio and external channels without those channels owning the inventory;
10. reservation attempt after listing becomes unavailable;
11. audit of who created/changed/withdrew a listing and under which mandate/scope.

## Rejected interpretations

### Listing = Unit
Rejected. It collapses development inventory and brokerage representation and loses distinct ownership/mandate semantics.

### Listing = Property
Rejected. Listing is a commercial representation under a mandate; Property is the underlying brokerage asset concept.

### Listing = public webpage
Rejected. Publication is a projection of a Listing, not its identity.

### Listing owns reservation state
Rejected. Reservation is a separate consistency boundary.

### Each channel gets its own inventory record
Rejected. It creates duplicate truths and reconciliation failures.

## Decision readiness

The semantic slice is sufficiently supported to close C03.7 at domain level. Implementation remains blocked pending permission mapping, brownfield persistence reconciliation, and publication/channel contract details.
