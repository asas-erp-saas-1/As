# ADR-0030 — Multi-Actor Authority Semantics

**Date:** 2026-09-26  
**Status:** Accepted — semantic slice closed / implementation gated  
**Branch:** `platform-architecture-2026`

## Decision
ASAS authorization is not derived from organization type or role alone. Authority is evaluated as a scoped decision over:

`Identity → Tenant/Organization → Relationship → Role/Team → Scope → Attribute → Purpose → Resource → Action → Policy → Audit`

A commercial actor may possess authority through different mechanisms:

- organization membership;
- organization relationship;
- team/role assignment;
- project assignment;
- explicit resource scope;
- Owner/Mandate authority for brokerage listings;
- Project/Inventory Batch allocation policy for development inventory;
- individual exception where explicitly granted and auditable.

## Domain rules
1. Organization type never automatically grants commercial priority or resource control.
2. Visibility, edit authority, allocation authority, reservation authority, publication authority, contract authority, finance authority and commission entitlement are distinct capabilities.
3. `Listing` does not grant the authority represented by its underlying Owner/Mandate relationship.
4. A public publication projection does not grant operational access to the underlying Unit or Listing.
5. Revoking an actor's operational access does not silently delete historical facts or invalidate already-public projections; projection lifecycle must be handled by its publication contract.
6. Project is the primary development collaboration context; resource scope can narrow authority below Project level.
7. Inventory ownership ≠ visibility ≠ allocation ≠ reservation control.
8. AI inherits the caller's effective authority and cannot escalate it.
9. Tenant isolation is enforced across database, cache, search, storage, events, jobs, analytics, AI memory, logs and integrations.
10. Configuration may refine policy but may never weaken security or core domain invariants.

## Authority examples

### Developer internal sales
Organization relationship + project/team assignment may authorize sales operations over allocated development Units.

### Agency representing developer inventory
Relationship + mandate/project scope may authorize defined commercial actions without transferring legal ownership.

### Agency-owned inventory
Ownership/control facts may authorize defined brokerage actions, subject to tenant and role scope.

### Multiple agencies
Each agency receives only its configured Project/Inventory Batch/resource scope. Same-tier competition remains governed by the reservation single-winner protocol, not by UI visibility or role precedence.

### Public visitor
Publication projection permits public read access only to published fields. It grants no operational authority.

## Security consequence
The permission model must express actions and scopes rather than encode broad role shortcuts. This follows the V3 security doctrine that security attaches to object, property, relationship, action, workflow, integration, AI tool, document, tenant and purpose.

## Implementation gate
This ADR does **not** authorize schema/RLS implementation. Required evidence remains:

- exact Project Inventory Access permission mapping;
- Owner/Mandate domain contract;
- Listing lifecycle/state-machine registration;
- resource-scope model in the brownfield repository;
- live database identity and RLS evidence;
- authorization integration tests, including cross-tenant and cross-organization denial cases.

## Alternatives rejected
- role-only authorization;
- organization-type-based priority;
- Listing-as-authority;
- Workspace-as-security-boundary;
- UI-only permission enforcement;
- tenant_id-only application checks;
- AI-mediated privilege escalation.

## Consequence
This decision provides the semantic authority model required before C03.9 and before executable permission/schema work. It deliberately leaves persistence and exact permission keys gated until brownfield/runtime evidence is reconciled.
