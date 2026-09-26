# Canonical Architecture Amendment 013 — Organization Collaboration

**Date:** 2026-09-25
**Status:** PROPOSED / ARCHITECTURAL DIRECTION
**Parent:** `docs/architecture/ASAS-CANONICAL-ARCHITECTURE-BASELINE-V3.md`
**Conference:** `docs/architecture/ASAS-ENGINEERING-CONFERENCE-PATH-2026.md`

## Refinement

The V3 target hierarchy is refined as follows for collaboration semantics:

```text
Platform
  → Organization
      → Membership
      → Branch / Team scope
      → Workspace (operational UX container)
      → Organization Relationships
          → Project context
              → Resource Scope
                  → Permission / Action
```

This does not redefine Workspace or Branch as mandatory security boundaries.

## Ownership

The authoritative organization controls authoritative Project/Inventory resources. Partner organizations receive scoped access through an explicit relationship rather than copied records.

## Authorization

The target authorization model is:

`Identity → Membership → Organization Context → Relationship → Team/Role Scope → Project Assignment → Individual Exception → Permission → Resource → Action`

Authorization is deny-by-default, server-side, auditable, and independent from UI visibility.

## Collaboration

The primary collaboration context is Project. Resource Scope supplies finer-grained control. A standalone Collaboration Space remains an architectural reservation and is not required by the current model.

## Performance

Developer partner-performance views are configurable and may include leads, visits, offers, reservations, sales, attribution, conversion and inventory velocity when authorized. Agency-private CRM and internal financial information remains private unless explicitly shared.

## Status

This amendment refines desired architecture. It does not prove repository implementation, live RLS, schema, or runtime behavior. Those remain verification gates.
