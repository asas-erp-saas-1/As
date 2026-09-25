# ASAS Engineering Conference Path — Amendment 002

**Date:** 2026-09-25
**Supersedes for routing:** conference-path sections describing the prior C02 next checkpoint
**Status:** ACTIVE AMENDMENT

## 1. Closed C02 decision

The Founder Decision Gate C02-03 is closed.

Selected policy:

`Project/Inventory Policy + Explicit Allocation + Deterministic Fallback`

This is the Hybrid E competition model.

## 2. Rules now canonical for conference routing

- Developer internal sales is a valid channel.
- Agency is a valid channel.
- Brokerage is a valid channel.
- An Agency may own/control its own inventory.
- An Agency may represent another organization's inventory.
- Organization type does not automatically create reservation priority.
- Hard allocation can restrict eligibility during its effective period.
- Priority allocation can establish a valid priority tier.
- Shared/no-allocation inventory uses deterministic fallback.
- Same-tier competition is resolved by the first valid reservation transaction to commit successfully.
- Client timestamps never determine the winner.
- Hold is distinct from Reservation.
- Attribution dispute adjudication and audited overrides remain available.

## 3. C03 entry

The conference now moves to:

`C03 REAL ESTATE DOMAIN`

Sequence:

`Resource Identity → Asset Taxonomy → Hierarchy → Multi-Actor Authority → Listing Representation → Construction/Commercial State Separation → Pricing/Versioning → Inventory Lifecycle → Reservation Boundary → Schema Contract`

## 4. C03 adversarial model

The model must work for:

- Developer + internal sales;
- Developer + Agency A + Agency B;
- Agency-owned Project/Inventory;
- Agency representing Developer inventory;
- Brokerage + Developer internal sales;
- mixed-use assets;
- projects without conventional buildings;
- multiple listings for one authoritative Unit;
- reassignment without historical mutation;
- changing commercial authority over time.

## 5. Implementation boundary

C03 semantic closure does not authorize schema implementation.

Implementation remains blocked until applicable architecture gates, domain contracts, authorization, state-machine, concurrency, schema, test and runtime-reconciliation requirements are satisfied.
