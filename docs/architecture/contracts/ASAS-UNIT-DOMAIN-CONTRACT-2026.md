# ASAS Unit Domain Contract — 2026

**Status:** PROPOSED / SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED
**Owner:** Inventory domain
**Decision:** ADR-0028

## 1. Canonical definition

A Unit is a stable, identifiable development-inventory resource within an ASAS Project, optionally located through Building and Floor.

Valid topology:

`Project → Unit`

`Project → Building → Unit`

`Project → Building → Floor → Unit`

## 2. Identity

Required conceptual identity:

- `unit_id` — stable technical identity;
- `project_id` — owning development context;
- optional `building_id`;
- optional `floor_id`.

Human-facing `reference`, `unit_number`, `slug`, name and labels are mutable business/display identifiers and must not be used as the technical identity.

## 3. Core characteristics

Depending on the asset taxonomy and project configuration, a Unit may carry or reference:

- unit type;
- area measurements;
- orientation;
- room/bedroom/bathroom characteristics;
- balcony/terrace characteristics;
- parking/storage references;
- floor/level representation;
- building placement;
- descriptive content;
- inventory ownership reference.

The contract does not require every Unit type to expose every characteristic.

## 4. Commercial state

Canonical values:

`AVAILABLE | HELD | RESERVED | CONTRACTED | SOLD | OFF_MARKET`

State changes occur through authorized domain/application actions, not arbitrary CRUD status mutation.

## 5. Construction state

Canonical values:

`NOT_STARTED | FOUNDATION | STRUCTURE | MASONRY | MEP | FINISHING | READY | DELIVERED`

Construction state is independent from commercial state.

## 6. Ownership / visibility / allocation

The contract explicitly separates:

- inventory ownership;
- inventory visibility;
- commercial allocation;
- reservation control.

A relationship, project assignment or partner visibility grant does not transfer ownership.

## 7. Related objects

Unit may be referenced by:

- Lead / Opportunity;
- Visit;
- Offer;
- Hold;
- Reservation;
- Contract;
- PaymentPlan / Installment;
- Commission facts;
- Campaign attribution;
- MediaAsset;
- Listing/publication projection;
- Analytics/read models.

Reference does not transfer ownership of those objects to Unit.

## 8. Pricing

Current price is a versioned commercial fact, not part of technical Unit identity. The price-version contract is a separate C03.10 slice.

Historical commercial transactions must preserve the applicable price snapshot.

## 9. Reservation invariant

The system must guarantee:

`At most one active winning reservation per Unit`

under concurrent requests.

The exact database mechanism is not specified by this contract. Implementation must use database-enforced protection, transactional semantics, idempotency, expiration handling, audit and race/concurrency tests.

## 10. Listing distinction

Development Unit and brokerage Listing are distinct domain concepts.

A public listing/publication must reference the authoritative inventory resource rather than create a second authoritative Unit.

## 11. Security

Unit access is evaluated through the platform authorization model:

`Organization Relationship + Project Context + Resource Scope + Permission + Action`

Unit existence does not itself grant access.

## 12. Events

Potential Unit-significant events include:

- `unit.created`
- `unit.updated`
- `unit.published`
- `unit.unpublished`
- `unit.commercial_state_changed`
- `unit.construction_state_changed`
- `unit.archived`

Reservation/Offer/Payment/Contract events remain owned by their respective contexts.

Event registration is required before implementation.

## 13. Invariants

At minimum:

1. Unit identity is stable.
2. Unit belongs to exactly one development Project.
3. Building/Floor relationships, when present, must be topology-valid for the Project.
4. Commercial and construction states remain independent.
5. A Unit cannot be silently duplicated as another authoritative development inventory record.
6. A visibility grant does not transfer ownership.
7. Allocation does not automatically create a reservation.
8. Accepted Offer does not automatically equal Reservation.
9. Reservation concurrency has one active winner boundary per Unit.
10. Historical transactions cannot be silently rewritten because Unit display data changes.

## 14. Explicit non-goals

This contract does not define:

- full construction management;
- legal sale contract semantics;
- accounting ledger;
- commission payout;
- CRM ownership;
- scheduling;
- external calendar synchronization;
- final physical database schema;
- final reservation locking strategy.

## 15. Implementation gate

Implementation is blocked until:

- brownfield Unit/Apartments schema is reconciled;
- canonical runtime/database is verified;
- permissions/events/states are registered;
- C03.10 pricing/versioning is closed;
- C03.11 inventory lifecycle is closed;
- C03.12 reservation boundary is reconciled;
- schema contract is approved;
- race tests and tenant-isolation tests are defined.
