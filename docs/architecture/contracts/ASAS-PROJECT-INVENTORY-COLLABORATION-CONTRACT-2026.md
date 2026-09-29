# ASAS Project Inventory Collaboration Contract — 2026

**Status:** PROPOSED — C02/C03 BRIDGE CONTRACT / IMPLEMENTATION BLOCKED
**Date:** 2026-09-25

## 1. Decision

The Developer (or other authoritative inventory-owning organization) remains the authoritative owner/controller of Project inventory. An Agency receives scoped commercial access through an Organization Relationship.

Inventory access is not inventory ownership.

## 2. Separate four concepts

`Inventory Ownership ≠ Inventory Visibility ≠ Commercial Allocation ≠ Reservation Control`

### Ownership

The authoritative organization controls the inventory record and canonical commercial state.

### Visibility

A partner may see only inventory within its authorized Project/Building/Unit scope and according to its role and relationship policy.

### Commercial allocation

A Developer may optionally allocate a subset of inventory to an Agency for commercial purposes. Allocation is a policy/control object and does not transfer ownership.

Examples:
- Agency A may market Units 101–110.
- Agency B may market Units 111–120.
- Both may see selected shared inventory.
- Developer retains authoritative control over all units.

### Reservation control

Reservation/hold actions are governed by the Inventory/Sales state machine and explicit permissions. A partner cannot create ownership merely by having visibility or allocation.

## 3. Access levels

The platform should support distinct capabilities, for example:

```text
VIEW_PROJECT
VIEW_BUILDING
VIEW_UNIT
VIEW_PRICE
VIEW_AVAILABILITY
VIEW_COMMERCIAL_TERMS
CREATE_HOLD
REQUEST_RESERVATION
CREATE_OFFER
VIEW_RESERVATION_STATUS
```

Exact permission keys must be reconciled against the canonical permission register before implementation.

## 4. Shared inventory

The default commercial model should allow multiple authorized Agencies to work against the same authoritative inventory without duplicating it.

The Developer can configure whether a given Agency receives:

- view-only access;
- marketing access;
- lead/visit access;
- offer access;
- reservation request access;
- direct reservation capability where policy permits.

## 5. Exclusive allocation

An exclusive Agency allocation is a commercial policy, not a different inventory ownership model.

If exclusivity is introduced, the system must encode:
- scope;
- effective period;
- authorized Agency;
- affected inventory;
- allowed actions;
- override authority;
- audit trail;
- conflict behavior.

## 6. Concurrency

Inventory state remains authoritative in the Inventory/Sales domain. Partner access must never bypass the single-winner reservation/hold consistency boundary.

A successful Agency request does not itself prove that the Unit became reserved. The authoritative state transition and committed event are the proof.

## 7. Developer visibility

Developer users with appropriate permissions can view project-level inventory truth and partner performance. They can distinguish:

- available;
- allocated;
- held;
- reserved;
- contracted;
- sold;
- blocked/off-market;

according to the canonical state machine and product policy.

## 8. Agency visibility

Agency users see only the inventory authorized for their relationship/team/project assignment. They must not infer access to another Agency's allocations or private commercial notes.

## 9. Attribution

Inventory visibility/allocation does not determine lead ownership, sales attribution, or commission entitlement. Those remain governed by the separate attribution and Finance contracts.

## 10. Audit

Changes to partner inventory access, allocation, exclusivity, override authority, holds, reservations and releases are auditable.

## 11. Invariants

1. There is one authoritative inventory record per Unit.
2. Partner access never creates a duplicate authoritative Unit.
3. Visibility never implies ownership.
4. Allocation never implies ownership.
5. Allocation never bypasses reservation concurrency.
6. Reservation state changes occur only through the canonical state machine.
7. Historical allocation/access changes remain auditable.
8. Cross-agency private data remains isolated.
9. Developer overrides must be explicitly authorized and audited.
10. Ambiguous inventory authorization fails closed.

## 12. Implementation gate

Reconcile this contract against the Building/Unit contract, inventory state machine, permission register, Sales reservation contract, live schema and existing implementation before schema or RLS changes.
