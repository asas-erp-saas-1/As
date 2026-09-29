# ADR-0029 — Listing Domain Semantics

**Status:** ACCEPTED / C03.7 SEMANTICALLY CLOSED  
**Date:** 2026-09-26  
**Branch:** `platform-architecture-2026`

## Decision

A **Listing** is the commercial brokerage representation of an underlying property interest under an Owner/Mandate relationship.

It is distinct from the development `Unit` and distinct from the underlying brokerage `Property`.

Canonical brokerage path:

`Owner → Mandate → Listing → Property`

Canonical development path:

`Organization → Project → [Building] → [Floor] → Unit`

The two tracks may converge at shared commercial workflows, but their inventory authority and ownership semantics remain distinct.

## Ownership and authority

Creating a Listing does not transfer legal ownership of the underlying Property. Listing authority derives from the applicable Owner/Mandate relationship plus ASAS authorization/resource scope.

Organization relationships, team/project assignment and resource scope govern which actors may view or mutate a Listing. Listing existence does not grant authority to an actor.

## Source of truth

A Listing is authoritative for its own brokerage representation data within its domain. It is not authoritative for:

- legal title;
- Owner identity outside its relationship reference;
- Mandate validity itself;
- reservation consistency;
- contract state;
- payment/ledger state;
- commission entitlement;
- public-channel cache/publication state.

Public websites, partner portals, search indexes, campaigns and external channel connectors consume projections/publication representations. They do not become inventory authorities.

## Unit distinction

A development Unit remains the canonical development-inventory resource. A Unit may be published through Studio or other channels without becoming a Listing.

A brokerage Listing must not be implemented as a disguised Unit because that would erase the Owner/Mandate authority model.

## Availability

Listing availability is a commercial representation of the underlying property's current state. It must not create a second reservation truth. Reservation remains governed by its own consistency boundary.

## Pricing

Listing asking price is a versioned commercial fact appropriate to the mandate. It must not silently mutate unrelated authoritative pricing facts. Offers/reservations/contracts snapshot their governing commercial terms at their own milestones.

## Lifecycle

At minimum, Listing must support explicit active/withdrawn/expired semantics without physical deletion of historical commercial facts. Exact lifecycle states and transition matrix remain a later register slice if not already established by the canonical state-machine register.

## Historical integrity

Withdrawal, mandate expiry, price changes and publication changes must preserve historical transactions and audit facts.

## Alternatives rejected

1. `Listing = Unit` — rejected; different authority and ownership semantics.
2. `Listing = Property` — rejected; Listing is a representation/mandated commercial record, not the underlying asset identity.
3. `Listing = public webpage` — rejected; publication is a projection.
4. Per-channel inventory records — rejected; duplicate source-of-truth problem.
5. Listing-owned reservation — rejected; reservation is a separate consistency boundary.

## Implementation gate

No Listing schema or migration is authorized by this ADR alone. Implementation requires:

- brownfield persistence reconciliation;
- permission mapping;
- Mandate/Owner contract reconciliation;
- Listing lifecycle/state register reconciliation;
- publication/channel contract;
- event contract;
- tenant isolation evidence;
- tests for withdrawal, expiry, concurrent commercial actions and stale channel projections.
