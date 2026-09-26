# ASAS C03 — Real Estate Resource Model Contract — 2026

**Status:** PROPOSED — SEMANTIC DIRECTION CLOSED / IMPLEMENTATION BLOCKED
**Date:** 2026-09-25
**Depends on:** C01/C02 organization, collaboration, attribution, multi-actor inventory and competition decisions

## 1. Objective

Define the canonical real-estate resource semantics before target schema design.

The model must support Developer-led, Agency-led, mixed-channel and future multi-actor operating models without duplicating authoritative inventory.

## 2. Canonical resource model

The preferred hierarchy is:

```text
Portfolio / Collection (optional)
    ↓
Project
    ↓
Building / Block (optional)
    ↓
Floor / Level (optional)
    ↓
Unit / Inventory Item
```

Not every project requires every structural level.

A Project may contain Units directly where Building/Floor is not meaningful, including some villas, land parcels, parking, storage or other standalone assets.

## 3. Unit semantics

`Unit` is the canonical saleable/managed real-estate inventory resource.

`Apartment` is a Unit type, not the universal root of the real-estate model.

Supported types must be extensible to include, where applicable:

- apartment;
- villa;
- land parcel;
- retail/commercial unit;
- office;
- parking;
- storage;
- mixed-use or other governed asset types.

The Unit owns the authoritative commercial lifecycle reference used by Sales/Inventory. It is not duplicated when distributed through another organization or channel.

## 4. Canonical identity

Project and Unit receive stable system identities independent of display names, marketing codes or organizational relationships.

Human reference codes are scoped business identifiers, not universal system identity.

Renaming, reassignment, listing changes or relationship changes must not mutate historical identity.

Referenced resources are not hard-deleted by default.

## 5. Multi-actor authority

The desired model must not encode:

`Developer = owner = seller = reservation authority`

Those dimensions may coincide but are independent.

A Project/Unit may have authorized actors with different authorities, including:

- ownership/control;
- development responsibility;
- listing authority;
- marketing authority;
- sales authority;
- allocation authority;
- hold authority;
- reservation authority;
- contract authority;
- collection/settlement responsibility;
- reporting visibility.

Organization type does not automatically grant any of these authorities.

An Agency may own/control its own inventory and may also represent inventory controlled by another organization.

## 6. Listing separation

`Unit ≠ Listing`

A Listing is an authorized commercial representation of a canonical Unit for a channel, surface, market or audience.

One Unit may have multiple Listings.

Listing-specific content, publication state, media and marketing metadata do not create a second Unit.

A Listing cannot bypass Unit authorization, commercial state, pricing policy, allocation, reservation rules or tenant scope.

## 7. Inventory and state axes

Construction/physical state and commercial state are separate dimensions.

The conference must not introduce a second incompatible status vocabulary. Existing registered state machines remain the baseline until explicitly superseded.

Commercial availability, Hold, Reservation, Contracted/Sold and Blocked/Off-market semantics remain governed by the registered state machines rather than arbitrary setters.

## 8. Allocation

Allocation is a separate commercial control object.

`Ownership/Control ≠ Visibility ≠ Allocation ≠ Reservation`

Allocation can define eligible organization/team/channel, scope, quantity/capacity, effective period, priority tier and release/expiry policy.

Allocation does not transfer ownership and does not itself create a reservation, attribution or commission entitlement.

C02 competition policy applies:

`Project/Inventory Policy + Explicit Allocation + Deterministic Fallback`

## 9. Pricing

Price is a governed, time/version-sensitive commercial fact.

The model must support effective periods, currency, price components where applicable, authorized overrides, approval thresholds and historical preservation.

Historical reservation/contract facts must not be rewritten merely because the current Unit price changes.

A Listing may present an authorized price representation but must remain traceable to authoritative pricing facts.

## 10. Structural semantics

Building and Floor are structural/domain concepts, not automatic ownership, tenancy or authorization boundaries.

Building is optional at the Project level.

Floor is optional and exists only where the physical model requires it.

This avoids forcing land, villa, parking, storage and other non-building-centric assets into an artificial hierarchy.

## 11. Required C03 scenarios

The model must remain coherent for:

1. Developer project + internal sales.
2. Developer project + Agency A + Agency B.
3. Agency-owned inventory.
4. Agency representing Developer inventory.
5. Brokerage participating alongside Developer internal sales.
6. Mixed-use project.
7. Project without Buildings.
8. Project with Buildings but no Floors.
9. Multiple Listings for one Unit.
10. Authority change over time without historical rewrite.
11. Unit reassignment without identity mutation.
12. Price version change without rewriting historical reservation/contract facts.
13. Concurrent reservation attempts.
14. Cross-organization access denial.

## 12. Schema non-assumptions

C03 does not yet authorize a particular:

- `Project.developer_id` ownership shortcut;
- Building table shape;
- Floor table shape;
- Unit natural key;
- Listing foreign-key strategy;
- price table/version strategy;
- allocation persistence shape;
- reservation locking mechanism.

These are downstream of semantic closure and repository/runtime reconciliation.

## 13. Exit criteria

C03 becomes implementation-ready only after:

- resource identity is closed;
- hierarchy semantics are closed;
- multi-actor authority is closed;
- inventory/listing distinction is closed;
- registered state machines are reconciled;
- price/version semantics are closed;
- non-apartment asset strategy is closed;
- cross-organization access scenarios are specified;
- reservation/sale immutability boundaries are specified;
- target schema can be derived without inventing product meaning;
- adversarial tests are defined.
