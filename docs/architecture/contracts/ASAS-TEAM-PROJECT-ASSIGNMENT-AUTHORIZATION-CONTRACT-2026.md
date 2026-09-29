# ASAS Team & Project Assignment Authorization Contract

**Status:** PROPOSED — architecture contract, implementation blocked
**Date:** 2026-09-24
**Decision:** Hybrid organization-level authorization + team/role scope + project assignment + explicit individual exception.

## 1. Purpose

Define how an organization relationship becomes usable by individual employees without exposing unrelated developer, agency, project, inventory, CRM, or financial data.

## 2. Core rule

**Visibility follows responsibility.** A user's access is derived from the intersection of identity, organization membership, role/capability, relationship, organizational scope, resource assignment, and explicit exceptions.

## 3. Model

```text
User
  -> Membership
  -> Organization
  -> Role / Capability
  -> Team / Branch scope
  -> Organization Relationship
  -> Project / Building / Inventory assignment
  -> Individual exception (optional)
  -> Resource authorization
  -> Authorized view / command
```

## 4. Organization-level relationship

An Agency may have an active commercial relationship with a Developer. The relationship does **not** automatically expose every resource to every employee.

The relationship establishes an eligible collaboration boundary; downstream assignment and policy determine actual employee access.

## 5. Team and role scope

An organization may authorize access through teams, branches, roles, or capability groups. Example:

- Agency A works with Developer X.
- Sales Team 1 is assigned to Project X.
- Sales Team 2 is assigned to Project Y.
- A Sales Agent receives only the projects assigned to their team unless an explicit exception exists.
- An Agency Director may receive broader performance visibility according to policy.

## 6. Individual exception

The model must support explicit user-level grants or restrictions without requiring a new role. Exceptions must be auditable, scoped, time-aware where necessary, and deny-by-default when ambiguous.

## 7. Developer visibility

Developer users may receive project-level or portfolio-level performance visibility according to their own organization policies. The platform should support configurable defaults plus controlled overrides.

Example metrics may include leads, visits, offers, reservations, sales, conversion, attribution, and inventory velocity. Sensitive Agency-internal information remains outside the Developer's scope unless explicitly shared.

## 8. Non-goals

This contract does not authorize a database schema, RLS policy syntax, API implementation, or UI implementation. Those require persistence and security design gates.

## 9. Required invariants

1. Membership does not imply access to all related organizations.
2. Organization relationship does not imply access to all employees or all resources.
3. Access must be scoped to the resource and action.
4. UI visibility must never be the only security control.
5. Cross-organization access must be auditable.
6. An employee cannot infer or access another Agency's private data merely because both agencies collaborate with the same Developer.
7. Project assignment must be compatible with the organization's commercial relationship scope.
8. Individual exceptions cannot silently broaden access beyond the governing organization/resource boundary.
9. Ambiguous authorization fails closed.

## 10. Example

```text
Agency A
  relationship -> Developer X

Team 1 -> Project X
Team 2 -> Project Y

Ahmed -> Team 1
Karim -> Team 2

Ahmed:
  Project X -> allowed
  Project Y -> denied

Director:
  Project X performance -> allowed
  Project Y performance -> allowed if policy permits

Developer X:
  Project X inventory/performance -> allowed according to Developer policy
  Agency A internal CRM -> denied by default
```

## 11. Architectural consequence

The ASAS authorization model must not reduce to `role -> visible screens`. It requires resource-aware authorization and a distinct tenant/data-isolation layer.

## 12. Next gate

Before implementation, reconcile this contract against:

- current repository identity/membership implementation
- historical Context Map v2
- current schema/migrations
- existing authorization/RLS evidence
- PRD v0.3.x
- live runtime only if runtime identity is proven
