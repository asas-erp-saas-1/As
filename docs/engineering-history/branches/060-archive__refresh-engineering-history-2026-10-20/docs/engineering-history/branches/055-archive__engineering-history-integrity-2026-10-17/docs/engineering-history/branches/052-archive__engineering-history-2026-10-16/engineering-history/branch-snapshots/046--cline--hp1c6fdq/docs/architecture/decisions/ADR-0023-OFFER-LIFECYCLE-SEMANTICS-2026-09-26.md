# ADR-0023 — Offer Lifecycle Semantics

**Status:** ACCEPTED / SEMANTICALLY CLOSED
**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Decision owner:** Founder, delegated through Engineering Conference
**Scope:** Sales Offer object, lifecycle, relationship to Hold and Reservation

## Context

V3's ontology includes Offer and exposes `submit_offer` and `approve_discount` actions. The golden commercial journey is `Lead → Contact → Visit → Offer → Reservation`, while Unit lifecycle distinguishes `HELD` and `RESERVED`. The architecture therefore requires an explicit Offer boundary so that negotiation is not confused with inventory control or contractual reservation.

## Decision

Offer is a **Sales-owned commercial proposal**. It represents proposed commercial terms between the seller-side organization/actor and the customer for one or more identified commercial resources.

Offer does not itself transfer inventory control and does not make a Unit reserved.

### Canonical lifecycle

`DRAFT → SUBMITTED → UNDER_REVIEW → ACCEPTED | REJECTED | WITHDRAWN | EXPIRED`

`ACCEPTED` means the proposed commercial terms were accepted as an offer decision. It does not by itself mean the Unit is RESERVED or SOLD.

### Offer and Unit state

- Creating or submitting an Offer does not change Unit commercial state.
- An accepted Offer may be used as an input to `place_hold` or `create_reservation` subject to the applicable project, inventory and authorization rules.
- A Hold remains temporary inventory control.
- A Reservation remains the authoritative inventory/commercial commitment boundary.
- An Offer may exist without a Hold or Reservation.
- A Reservation may reference the accepted Offer that materially led to it, but the Reservation must remain independently valid under inventory concurrency and authorization rules.

### Commercial terms

An Offer may contain versioned/snapshot terms such as price, discount, payment-plan proposal, validity period, included/excluded items and conditions. Once submitted, material commercial terms are immutable for that version; a changed proposal is a new Offer version or a new Offer according to the application contract.

### Approval

Discounts or other sensitive commercial overrides use the Approval Engine. AI, workflow and UI cannot bypass the applicable approval policy.

### Expiration

Offer expiration is deterministic from its effective/expiry window. Expiration changes the Offer lifecycle only; it does not release a Unit unless a separate Hold/Reservation lifecycle rule requires that release.

## Invariants

- Offer is owned by Sales semantics, not Inventory ownership.
- Offer acceptance does not bypass reservation concurrency.
- Offer does not create inventory ownership or allocation.
- Material commercial changes after submission are versioned/audited.
- Approval decisions are auditable and cannot be silently replaced.
- An Offer can be rejected/withdrawn/expired without mutating historical submitted versions.
- Reservation attribution remains governed by the reservation milestone, not by the existence of an Offer.

## Alternatives rejected

### Offer = Reservation
Rejected because negotiation and inventory commitment have different semantics and consistency requirements.

### Offer automatically reserves Unit
Rejected because a commercial proposal must not accidentally consume inventory.

### Offer is only a UI object
Rejected because commercial terms require auditability, lineage and historical reconstruction.

## Verification before implementation

- reconcile existing offer-related tables/fields/migrations;
- reconcile `registers/state-machines.json` for any existing Offer machine;
- register missing Offer events if needed;
- map discount approval thresholds to the permission register;
- define versioning strategy;
- define exact relation to Hold and Reservation contracts;
- test expiration, concurrent reservation and changed-offer scenarios.
