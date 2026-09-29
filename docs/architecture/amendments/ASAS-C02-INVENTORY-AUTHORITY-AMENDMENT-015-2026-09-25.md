# ASAS C02 Inventory Authority Amendment 015 — 2026-09-25

**Status:** ACTIVE ARCHITECTURAL AMENDMENT / IMPLEMENTATION BLOCKED

## Decision

ASAS shall support multiple inventory operating models without making Developer the universal inventory owner or final commercial authority.

Supported first-class patterns include:

1. Developer-owned/controlled inventory with internal sales.
2. Developer-owned/controlled inventory with external Agency allocations.
3. Mixed internal + external sales channels on one Project.
4. Agency-owned/controlled inventory with its own projects and sales team.
5. Future multi-party resource authority where ownership, control, selling, reservation, contract, settlement and reporting responsibilities may be distributed.

## Domain rule

Organization type is not the ownership model.

The effective authority of an actor is contextual and must be evaluated against organization membership, relationship, resource scope, authority/permission, resource state and command preconditions.

## Consequence

The domain must not encode Developer-centric ownership as an unconditional invariant such as `Project.developer_id` or `Unit.developer_id` unless those fields are explicitly modeled as one relationship among potentially several authority relationships.

## Reservation consequence

Internal and external sales channels may compete for the same Unit. Reservation remains the single-winner consistency boundary and cannot be granted by visibility or allocation alone.

## Source reconciliation

The v1.6.1 state-machine register defines the normative apartment commercial lifecycle and reservation lifecycle; this amendment does not replace those states. It expands the authority model around them. Any proposed new reservation states must therefore be treated as a conflict/proposal until explicitly reconciled with the register.

## Implementation gate

No schema/RLS implementation is authorized from this amendment alone. C03 must close the canonical Project/Building/Floor/Unit/Listing/resource model and C05 must close the final reservation semantics.
