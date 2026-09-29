# ASAS Pricing & Versioning Contract — 2026

**Status:** SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED  
**ADR:** ADR-0032  
**Conference:** C03.10

## 1. Authority

Pricing is an Inventory/Sales commercial fact governed by authorization and policy. Finance consumes committed commercial terms; it does not retroactively redefine the Unit's commercial price.

## 2. Core concepts

- `PriceVersion`: immutable version of an applicable commercial base price.
- `CurrentPrice`: read projection of the currently effective version.
- `PriceSnapshot`: immutable commercial terms captured by Offer/Hold/Reservation/Contract where required.
- `Discount/Override`: explicit commercial adjustment, distinct from base price history.
- `PricePolicy`: rules governing who may create, approve, schedule or override prices.

## 3. Required semantics

### PriceVersion

Must support:
- stable ID;
- subject ID/type;
- amount in integer minor units;
- currency;
- effective-from;
- effective-to when applicable;
- revision/version;
- created-by/created-at;
- source/reason metadata;
- audit linkage.

### Current price

`CurrentPrice(subject, at_time)` resolves exactly one applicable version or returns no price. The resolver must be deterministic.

### Historical price

Historical queries must be able to answer: "what price was effective for this resource at time T?" without rewriting prior records.

### Transaction snapshot

When a commercial transaction crosses its governing milestone, the applicable commercial terms are captured. Later price changes do not mutate the captured terms.

## 4. Unit and Listing

Development:
`Unit → PriceVersion[]`

Brokerage:
`Listing → PriceVersion[]`

Unit and Listing remain separate domain objects. The pricing contract is shared semantically but not an instruction to create a universal Property table.

## 5. State interaction

Price is independent of Unit commercial state and construction state.

Examples:
- `AVAILABLE + STRUCTURE + current price`
- `RESERVED + STRUCTURE + historical reservation price`
- `SOLD + DELIVERED + current public price = none/off-market`

Price changes must not directly perform state transitions.

## 6. Offer / Hold / Reservation

`Offer` may reference the price version used to calculate its base terms.

`Hold` may reference a price/terms snapshot if the commercial policy requires price protection during the hold window.

`Reservation` must persist the governing commercial terms needed to preserve the contractual/commercial fact; it cannot re-read Unit.current_price later and silently change the reservation economics.

## 7. Approval

The following are policy-controlled actions:
- create price;
- schedule price;
- replace/cancel a future price;
- discount;
- price override;
- retroactive correction.

The exact permission keys remain register-gated.

## 8. Events

The domain event vocabulary must include the canonical registered equivalent of:
- `PriceUpdated`;
- future-effective price scheduled/activated if required by the final state/event registry;
- price correction/override events where the final event contract requires them.

No event name is promoted to canonical registry solely by this contract; the event register remains authoritative for implementation.

## 9. Analytics lineage

A metric using price must be able to identify:
- resource;
- price version/revision;
- effective time;
- transaction snapshot when applicable;
- source event(s).

No dashboard may use an unexplained mutable price value for historical reporting.

## 10. Database implementation gate

Do not add migrations or alter the live schema from this contract alone.

Before implementation:
1. verify canonical runtime/database identity;
2. introspect live schema;
3. reconcile existing `projects/buildings/apartments` and related price fields;
4. map brownfield fields to the target semantic model;
5. choose uniqueness/effective-period constraints;
6. write migration plan with rollback/restore evidence;
7. add contract and concurrency tests.

## 11. Acceptance tests

Minimum semantic tests:

1. Create v1 price → current price resolves v1.
2. Create v2 effective later → current price remains v1 until v2 effective time.
3. Query historical time between v1/v2 → v1.
4. Query after v2 → v2.
5. Reservation snapshot remains unchanged after v3 price creation.
6. Unauthorized actor cannot mutate pricing.
7. Approved discount is visible as an adjustment, not as a rewrite of base-price history.
8. Two overlapping active versions are rejected by the final persistence design.
9. Tenant A cannot read or mutate Tenant B pricing.
10. Public projection cannot mutate authoritative pricing.
