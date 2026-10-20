# C03 — Project Ownership & Tenancy Reconciliation

**Date:** 2026-10-01  
**Status:** OPEN — semantic decisions locked, executable ownership model not yet authorized  
**Track:** Phase C / Real Estate Core / Project  
**Authority:** ASAS Architecture V3 + C03 source corpus + historical Enterprise Domain Model + external real-estate interoperability research

## 1. Purpose

Resolve the semantic ownership and tenancy meaning of `Project` without prematurely designing SQL, ORM, RLS policies, API routes, or migrations.

## 2. Canonical current model

Architecture V3 establishes:

`Platform → Organization → Company → Branch → Team → User`

and states that every tenant-owned SaaS record carries a tenant boundary across database, cache, search, storage, events, jobs, analytics, AI memory, logs and integrations.

V3 also places `Project` in the real-estate hierarchy:

`Organization → Project → Building → Floor → Unit`

and classifies Project as master data.

Therefore the current semantic decision is:

> Project is owned/scoped within the ASAS Organization/Tenant model; Project is not a global unscoped object merely because it represents real estate.

## 3. Historical terminology reconciliation

The historical Enterprise Domain Model uses `Agency` as the tenant root and places `AgencyId` on aggregates. That terminology is retained as historical evidence only.

It must not silently override V3's current canonical `Organization` hierarchy.

### Decision

`Organization` is the current canonical tenancy/ownership concept for Project.

`Agency` / `AgencyId` is legacy terminology requiring migration mapping if encountered in historical or future brownfield material.

No persistence column name is selected yet.

## 4. Ownership is not the same as developer/promoter identity

V3 separately recognizes `Developer` as master data and the real-estate core has commercial relationships involving projects and units.

Therefore:

- `Organization` answers: which tenant owns/governs the Project record in ASAS?
- `Developer/Promoter` answers: which real-estate business entity is associated with the Project?
- `Project` answers: which real-estate development/master-data object is being represented?

These must not be collapsed into one field or one concept.

## 5. Track A / Track B implication

Track A (own/developer project) may naturally associate a Project with the relevant developer/promoter and commercial inventory.

Track B (brokerage/resale) must not be forced into the same ownership semantics merely because it can reference real estate. V3 explicitly models brokerage separately as:

`Owner → Mandate → Listing → Property`

and both tracks feed the commercial model.

Therefore a brokerage Listing/Property may reference a Project when the business relationship establishes that relationship, but a Project must not become the owner of every brokerage record by default.

## 6. External research finding

RESO's current interoperability work distinguishes system identifiers from organization/source identifiers and emphasizes provenance because identifiers that are unique only inside one system can collide when records cross organizations. RESO also distinguishes organization identifiers from property identifiers.

ASAS should therefore preserve the conceptual distinction between:

- ASAS canonical Project identity;
- ASAS Organization/Tenant identity;
- external developer/promoter identity;
- external source-system identity;
- human business reference.

RESO is an interoperability reference, not ASAS's domain model and not an authority for ASAS tenancy.

## 7. Decisions locked

### O1 — Project is tenant-scoped

LOCKED at semantic level.

### O2 — Organization is the current canonical tenant/ownership root

LOCKED at architecture level.

### O3 — Developer/Promoter is a separate domain relationship

LOCKED.

### O4 — Agency terminology is historical/legacy

LOCKED as reconciliation treatment; it is not the current canonical term.

### O5 — Track A and Track B ownership semantics remain distinct

LOCKED at conceptual level.

### O6 — External provenance must not be collapsed into Project identity

LOCKED as an interoperability principle.

## 8. Still OPEN

1. Whether a Project can be jointly owned/managed by multiple Organizations.
2. Whether an Organization may transfer Project stewardship to another Organization.
3. Whether Project ownership and operational responsibility can differ.
4. Exact relationship between Project and Developer/Promoter.
5. Whether Developer is always external to the tenant or may itself be the tenant Organization.
6. Exact permission model for create/publish/archive/transfer.
7. Whether Project creation requires approval.
8. Exact tenant inheritance rules for Building/Floor/Unit.
9. Exact treatment of imported projects from external systems.
10. Merge/split and duplicate reconciliation rules for Projects.
11. Whether Project-level data can ever be platform-global reference data.
12. Legal/regulatory ownership attributes required in Algeria.

## 9. Explicit non-decisions

No decision is made here about:

- `organization_id`, `tenant_id`, `agency_id` or any database column;
- primary-key technology;
- RLS SQL;
- API shape;
- event names;
- ORM model;
- foreign-key implementation;
- cross-tenant sharing implementation.

## 10. Closure condition

Project ownership/tenancy cannot close until the remaining questions are reconciled against the canonical identity model, authorization architecture, Organization/Company/Branch model, Developer model, Track A/B contracts, and any authoritative Algerian legal requirements that materially affect ownership representation.

**Current status: OPEN.**
