# ASAS Listing Domain Contract — 2026

**Status:** PROPOSED / SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED  
**ADR:** `ADR-0029-LISTING-DOMAIN-SEMANTICS-2026-09-26.md`

## 1. Canonical meaning

`Listing` is a brokerage-domain representation of an underlying property interest under an Owner/Mandate relationship.

## 2. Distinct concepts

```text
Owner
  ↓
Mandate
  ↓
Listing
  ↓
Property
```

and separately:

```text
Organization
  ↓
Project
  ↓
[Building]
  ↓
[Floor]
  ↓
Unit
```

`Unit ≠ Listing ≠ Property ≠ Mandate`.

## 3. Required identity semantics

- Listing has stable technical identity.
- Owner/Mandate/Property references are explicit relationships.
- Human-facing listing reference/slug/title are mutable presentation identifiers.
- Publication/channel identifiers do not become Listing identity.

## 4. Authority

Listing mutations require authorization derived from organization relationship, team/role/project/resource scope and applicable mandate rules. A Listing record itself does not grant authority.

## 5. Source-of-truth boundaries

Listing is authoritative for its own brokerage representation facts.

The following remain outside Listing authority:

- legal ownership/title;
- mandate validity;
- reservation winner;
- contract legal state;
- payment/ledger state;
- commission entitlement;
- public channel cache.

## 6. Public representation

Website Studio, partner portals, search, campaign creatives and external channel integrations consume projections/publication records. They must not create independent inventory truth.

A development Unit can be publicly published without being converted into a Listing.

## 7. Commercial facts

Listing may carry:

- asking price;
- commercial availability representation;
- publication status;
- channel-specific representation metadata;
- mandate/reference metadata;
- property-facing descriptive data within authorized scope.

Price and other commercial terms are versionable facts. Historical Offer/Reservation/Contract milestones snapshot their governing terms.

## 8. Reservation boundary

Listing cannot independently reserve inventory. Reservation actions target the appropriate underlying commercial resource and obey the canonical reservation consistency boundary.

## 9. Lifecycle principles

Listing supports explicit creation, publication/activation, revision, withdrawal and expiry semantics. Historical records remain auditable. Exact state enumeration must reconcile with the canonical state-machine register before schema implementation.

## 10. Events

Potential domain events require registration before implementation. Candidate examples include:

- ListingCreated
- ListingUpdated
- ListingPublished
- ListingUnpublished
- ListingWithdrawn
- ListingExpired
- ListingPriceChanged

Events are facts, not commands, and must be emitted transactionally through the platform event/outbox doctrine once registered.

## 11. Invariants

1. A Listing cannot imply legal ownership transfer.
2. A Listing cannot bypass mandate/authorization scope.
3. A public channel cannot become inventory authority by publishing a Listing.
4. A stale channel projection cannot override authoritative availability.
5. Historical transactions must survive Listing withdrawal/expiry.
6. A development Unit remains a Unit even when published publicly.
7. Reservation winner logic remains outside Listing publication logic.

## 12. Implementation gate

Implementation remains blocked until brownfield persistence, permissions, Mandate/Owner semantics, lifecycle/state register, event register, publication contract and runtime tenant isolation are reconciled and verified.
