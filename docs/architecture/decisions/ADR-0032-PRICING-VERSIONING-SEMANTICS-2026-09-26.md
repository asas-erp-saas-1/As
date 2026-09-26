# ADR-0032 — Pricing & Versioning Semantics

**Date:** 2026-09-26  
**Status:** ACCEPTED — semantic slice closed; implementation gated  
**Conference:** C03 Real Estate Domain  
**Owner:** Architecture Engineering Conference

## Decision

ASAS treats price as a versioned commercial fact, not a mutable scalar truth on Unit/Listing.

The current commercial price is a projection of the active applicable price version. Historical versions remain immutable evidence.

A price version has, conceptually:
- stable identity;
- subject/resource (Unit or Listing, as applicable);
- amount in integer minor units (`AmountCentimes` for DZD at launch) plus currency;
- effective-from timestamp/date;
- optional effective-to timestamp/date;
- policy/source/reason metadata;
- created-at/created-by audit facts;
- version number or monotonic revision.

## Rules

1. Money is never represented as floating point. V3 defines `AmountCentimes + Currency` and prohibits floating point for monetary values.
2. A price change creates a new commercial fact/version; it does not rewrite historical transaction facts.
3. The price applicable to a new Offer/Hold/Reservation is resolved at the governing transaction time and then snapshotted into that transaction's terms.
4. An accepted Offer does not automatically become a Reservation. Reservation is its own consistency boundary.
5. A Reservation/Contract/Payment history remains tied to its captured commercial terms even if the Unit's current price changes later.
6. Discounts, overrides and negotiated deviations are separate commercial terms and require the applicable approval policy; they must not mutate the base price history.
7. A future effective price is allowed as a scheduled version, but the system must not expose it as the current price before its effective time.
8. Retroactive correction is an explicit correction workflow with audit evidence; it must not silently rewrite prior transaction snapshots.
9. Public/search/analytics projections consume authoritative pricing facts and cannot become pricing authority.
10. Tenant/project/resource authorization is evaluated before a price mutation. Public visibility does not grant pricing authority.

## Why

The ASAS V3 architecture explicitly classifies Unit price as a domain fact, requires `PriceUpdated`, separates transactional data from master data, and requires data lineage/version/effective-date semantics for important derived values. The Enterprise Domain Model also treats Unit and Listing as separate aggregates with `PriceUpdated` as a domain event.

Temporal/effectivity modeling is an established pattern for facts whose validity changes over time. PostgreSQL supports unique constraints and exclusion/range constraints that can later help enforce non-overlapping effective periods, but the exact database mechanism is intentionally deferred until live-schema reconciliation.

## Rejected alternatives

### A. Mutable `unit.price` as sole authority
Rejected: destroys historical commercial truth and makes audit/transaction reconstruction unreliable.

### B. Copy the price into every downstream object without a source version
Rejected: creates unexplained divergence and weakens lineage.

### C. Event-sourcing the entire Unit aggregate now
Rejected: unnecessary architectural commitment; ASAS can preserve immutable price facts and domain events while retaining the modular-monolith relational model.

### D. Database-only temporal enforcement before runtime inspection
Rejected: implementation choice must follow brownfield schema reality and the verified target database.

## Consequences

Positive:
- historical price reconstruction;
- reliable Offer/Reservation/Contract snapshots;
- explainable analytics;
- safe scheduled price changes;
- auditability.

Costs:
- more than one price record exists over time;
- read paths must resolve the applicable version;
- tests must cover effective-time boundaries and concurrent updates.

## Required evidence before implementation

- verified live DB identity;
- current Unit/Listing persistence mapping;
- target schema reconciliation;
- permission mapping for price mutation/approval;
- state/offer/reservation contract alignment;
- tests for effective-time selection, historical reconstruction, concurrent price update, and transaction snapshotting.
