# ASAS Inventory Actor & Multi-Owner Domain Contract — 2026-09-25

**Status:** PROPOSED — founder decisions recorded; implementation blocked pending domain reconciliation

## 1. New founder clarification

ASAS must not assume that a Developer is the only organization capable of owning, controlling, listing, allocating, or selling real-estate inventory.

Any eligible Organization may participate in inventory operations according to its legal/business authority and contractual scope.

Examples:

- Developer with an internal sales team
- Developer working with one or more Agencies
- Agency selling its own inventory
- Agency representing external Developer inventory
- Brokerage holding/listing inventory under an authorized arrangement
- Future property manager, investor, construction company, or other supported organization type

## 2. Separate the concepts

```text
Inventory Ownership / Control
        ≠
Inventory Listing Authority
        ≠
Commercial Selling Authority
        ≠
Allocation Authority
        ≠
Reservation Approval Authority
        ≠
Financial Settlement Authority
```

These capabilities may belong to different organizations or actors and must be explicitly scoped.

## 3. Organization-neutral inventory model

The platform must model inventory around the organization/entity that is authoritative for that inventory, rather than hard-coding `Developer` as the owner.

A Developer is one valid inventory actor, not the universal inventory owner.

## 4. Internal sales teams

A Developer may sell directly through its own employees without an Agency relationship.

Example:

```text
Developer X
  ├── Internal Sales Team
  │     ├── Agent A
  │     └── Agent B
  └── External Agency A
```

Both channels can transact against the same authoritative inventory subject to policy, allocation, concurrency, and attribution rules.

## 5. Agency-owned inventory

An Agency may have inventory that it is itself authorized to list and sell.

Example:

```text
Agency A
  ├── Owned/Controlled Project X
  │      └── Inventory
  └── Represented Developer Y
         └── Inventory
```

The product must distinguish these cases rather than treating every Agency inventory item as an external Developer allocation.

## 6. Product consequence

The UI, permissions, analytics, and workflows must not contain assumptions such as:

`if organization.type == developer then inventory owner`.

Instead, authorization and inventory workflows should evaluate explicit domain authority and scope.

## 7. Required authority dimensions

The future domain model must be capable of representing, independently where necessary:

- inventory ownership/control
- listing rights
- marketing rights
- sales rights
- allocation rights
- reservation creation rights
- reservation approval rights
- contract authority
- financial settlement responsibility
- reporting visibility

## 8. Attribution consequence

Attribution must support multiple legitimate actors/channels:

```text
Developer internal sales
Agency A
Agency B
Direct / owned channel
Other authorized channel
```

A single universal `seller_id` is insufficient as the only commercial truth.

## 9. Performance consequence

Developer-side reporting must include internal sales performance alongside external agency performance where applicable.

Agency-side reporting must distinguish:

- owned inventory performance
- represented inventory performance
- partner/developer inventory performance

## 10. Security invariant

Possessing a commercial relationship with an inventory-owning organization does not grant ownership, reservation approval, financial authority, or unrestricted visibility.

Likewise, owning/controlling inventory does not automatically grant access to another organization's private CRM or internal performance data.

## 11. Open founder/business decisions

The following remain decision gates where business/legal policy is required:

- what evidence qualifies an organization as inventory owner/controller
- whether ownership and control can be simultaneously held by different organizations
- which authority is required for final reservation approval
- settlement responsibility when commercial and inventory actors differ
- dispute adjudication when multiple authorized sellers claim attribution

## 12. Engineering rule

Do not implement inventory around a `Developer` foreign key as the universal owner abstraction. First reconcile this contract with the existing real-estate domain model and source-of-truth files.
