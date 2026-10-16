# ASAS Multi-Actor Inventory Authority Contract — 2026

**Status:** PROPOSED — architecture contract, implementation blocked
**Date:** 2026-09-25
**Scope:** C02 → C03 transition

## 1. Decision

ASAS must not assume that a Developer is the universal inventory owner or final decision-maker.

A real-estate resource may participate in multiple commercial relationships and operating models. Organization type is not the ownership model.

## 2. Core separation

The platform must distinguish, where applicable:

- legal/economic ownership;
- development/control responsibility;
- inventory control;
- listing authority;
- marketing authority;
- sales authority;
- allocation authority;
- hold authority;
- reservation authority;
- contract authority;
- collection/settlement responsibility;
- commission entitlement;
- reporting visibility.

One organization may hold several authorities in a simple case. In a complex case, authorities may be distributed across organizations.

## 3. Supported operating models

### Developer-led

```text
Developer
  -> Project
  -> Inventory
  -> Internal Sales
  -> External Agencies
```

### Agency-led inventory

```text
Agency
  -> Own/Control Inventory
  -> Projects
  -> Internal Sales
  -> External/Partner Sales
```

### Mixed-channel project

```text
Project
  -> Developer Internal Sales
  -> Agency A allocation
  -> Agency B allocation
  -> Direct channel
```

### Future multi-party model

```text
Project / Resource
  -> multiple organizations
  -> different authorities
  -> different commercial relationships
```

## 4. Canonical truth

There must be one authoritative resource identity for a Project, Building, Unit and inventory state. Partner organizations receive scoped views and rights; ASAS must not duplicate authoritative inventory merely to represent a commercial relationship.

## 5. Authority is contextual

Effective authority is evaluated from:

`Identity → Membership → Organization Context → Relationship → Resource Scope → Authority/Permission → Resource State → Command Preconditions`

An organization relationship alone does not grant every authority.

## 6. Inventory allocation

Allocation is a commercial control over availability/channel access. It is not automatically legal ownership.

Allocation may be:

- hard;
- soft/priority;
- time-bounded;
- quantity/unit specific;
- project-configured;
- relationship-configured.

The exact allocation policy is part of the project/relationship contract.

## 7. Internal and external sales

A project may simultaneously have an internal sales team and external agencies. The model must support both without duplicating units or forcing a single selling organization.

## 8. Agency-owned inventory

An Agency may manage/list/sell inventory for projects it owns or controls. The platform must therefore avoid domain rules that assume `Project.developer_id` or `Unit.developer_id` is the universal authority model.

A Developer-centric implementation may exist as a configured common case, but it cannot be the domain invariant.

## 9. Reservation authority

Reservation creation/approval is configurable by relationship/project policy. A user may only execute a reservation command if their effective authority covers the resource and the current state transition.

Reservation is a state transition against canonical inventory and must remain subject to single-winner concurrency controls.

## 10. Commercial attribution

The system may attribute different dimensions of a transaction to different actors. Attribution is not ownership and is not automatically commission entitlement.

Attributable dimensions may include source, referring organization, selling organization, sales contributor, visit contributor, reservation contributor, or other contract-defined roles.

## 11. Historical immutability

At contractual/commercial milestones, applicable attribution and authority context must be snapshotted so that later relationship, assignment, or team changes do not rewrite historical facts.

## 12. Security invariants

- Cross-organization access is explicit and auditable.
- No actor receives authority merely from organization type.
- No UI-only restriction is considered security.
- Ambiguous authority fails closed.
- An Agency cannot access another Agency's private CRM data merely because both sell the same Project.
- Developer internal sales data remains scoped independently from external partner data.

## 13. Implementation gate

This contract does not authorize schema or RLS implementation. C03 must define the canonical real-estate aggregate/resource model before persistence is designed.
