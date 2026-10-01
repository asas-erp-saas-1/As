# C03 — Project Invariant Discovery

**Status:** OPEN — evidence strengthened; aggregate decision not yet closed  
**Date:** 2026-10-01  
**Scope:** Project only. This document does not authorize implementation or close Building.

## Authority rule

This is a reconciliation artifact. It distinguishes source-derived requirements from engineering inference. It does not invent schema, status enums, API contracts, RLS predicates, or aggregate boundaries.

## Source-derived baseline

V3 defines Project as a Real Estate Core object in the hierarchy `Organization → Project → Building → Floor → Unit` and classifies Project as master data. V3 also defines controlled actions including `publish_project` and `assign_unit`, but does not define a complete Project lifecycle or Project aggregate contract.

The historical Enterprise Domain Model explicitly describes Project and Unit as separate aggregates and gives concurrency as the reason Units must not be nested inside Project. The historical BRD distinguishes Track A (own-project inventory) from Track B (resale listings), with Track A following `Project → Building → Unit`.

V3 establishes that reservation is a critical consistency boundary at Unit level, and that finance is a separate integrity domain. Configuration cannot weaken code invariants/domain rules. Security applies to objects, properties, relationships, actions, workflows, documents and tenants.

## Candidate invariant inventory

| Candidate invariant | Evidence | Boundary classification | Decision |
|---|---|---|---|
| Project belongs to one tenant/organization boundary | V3 tenancy + Core hierarchy | Tenant/domain invariant | LOCKED semantic |
| Project canonical identity must remain stable | Identity reconciliation already established | Project identity rule | LOCKED semantic; exact fields OPEN |
| Project amendment cannot cross tenant boundary | V3 tenant/security model | Authorization/domain policy | LOCKED semantic |
| Unit commercial state must remain independent from Project lifecycle | V3 explicitly separates Unit states | Unit consistency boundary | LOCKED |
| Unit construction state must remain independent from Project lifecycle | V3 explicitly separates states | Unit/domain rule | LOCKED |
| Reservation has one active winner per Unit | V3 Reservation Safety | Reservation/Unit consistency boundary | LOCKED |
| Finance ledger must balance | V3 Finance | Finance aggregate/domain invariant | OUTSIDE Project boundary |
| Project publication may expose only permitted/published data | V3 publish action + public/admin requirements | Publication/security policy | OPEN exact policy |
| Project archive/delete must preserve authoritative history | Operating requirements say archive/delete safely; V3 audit/data governance | Lifecycle/data policy | OPEN exact semantics |
| Project → Building relationship must remain tenant-safe | Core hierarchy + tenancy | Relationship/authorization rule | LOCKED semantic |
| Adding/removing a Building requires Project-wide atomic transaction | No source establishes this | Aggregate boundary question | NOT PROVEN |
| Changing Project data requires atomic updates to all Units | No source establishes this; Unit is independent aggregate | Aggregate boundary question | NOT PROVEN |
| Project starting price must equal a specific Unit price | Operating material exposes both concepts but no authoritative equality rule | Derived/business rule | NOT PROVEN |
| Project availability is identical to Unit availability | V3 separates Unit commercial state; Project availability appears as product representation | Projection/product rule | NOT PROVEN |
| Project delivery date must equal all Unit delivery states | No source establishes equality | Cross-domain/derived rule | NOT PROVEN |
| Project publication must atomically publish every Unit | No source establishes this | Publication workflow question | NOT PROVEN |
| Developer relationship is Project ownership | Sources explicitly distinguish Developer from Organization/Tenant semantics | Ownership relationship | REJECTED as equivalence |

## Cross-domain boundary findings

### Inventory

Project is master data and provides the structural parent for Building/Unit. Unit remains the commercial/construction consistency boundary. No evidence requires every Unit mutation to pass through Project.

### Sales

The commercial journey ends in Reservation → Contract → Payment. These are transactional records associated with Unit and customer/deal semantics. They should not be made Project-wide transactions merely because the Project is the parent in the ontology.

### CRM

CRM uses inventory references to match leads/interests. This is a consumer relationship, not evidence that CRM state belongs inside Project consistency.

### Finance

Finance is explicitly a separate integrity domain. Ledger balancing, payment posting, and receipt integrity are not Project invariants.

### Construction

V3 currently limits construction tracking and separates Unit construction state from commercial state. Future construction capabilities are an evolution path; they do not justify a Project aggregate boundary today.

### Documents / Media / Website

Project media, SEO, publication and public representation are product/content capabilities. The operating material requires one authoritative record to drive representations, but this does not prove a single transactional Project aggregate containing all media, SEO, inventory and publication records.

### Permissions / Tenancy

Tenant and authorization rules constrain Project operations but should not automatically be modeled as Project aggregate invariants. V3 attaches security to object, property, relationship and action.

## Important negative finding

The current evidence does **not** establish a Project-wide invariant of the form:

> “A change to Project must atomically mutate Project + all Buildings + all Units + public representation.”

Therefore there is no sufficient evidence to close `Project = Aggregate Root` on hierarchy alone.

## Boundary candidates

The evidence currently supports the following conceptual split:

```text
Core / Master Data
Organization
  └── Project
       └── Building
            └── Floor
                 └── Unit  ← independent operational consistency boundary

Transactional domains
Lead / Visit / Offer / Reservation / Contract / Payment / Commission

Platform capabilities
Publication / Search / Media / Workflow / Notifications / AI / Audit
```

This is a semantic map, not a persistence schema.

## Decision

**Project Aggregate Root remains OPEN.**

The stronger conclusion is now:

1. Project is a canonical master-data entity.
2. Project is tenant-scoped.
3. Unit is independently consistent for its own commercial/construction behavior.
4. Project-wide transactional coupling is not demonstrated by the current sources.
5. Therefore Project should **not** be declared an aggregate root merely because it is the parent in the ontology.
6. A final aggregate decision requires a bounded set of Project-owned commands with demonstrated invariants and transaction requirements.

## Closure blockers

- Canonical immutable Project fields are not fully specified.
- Exact Project lifecycle/state model is not established.
- Exact Project ↔ Developer relationship is not established.
- Project transfer semantics are not established.
- Project archive/delete semantics are not established.
- Project publication semantics are not established as a domain state machine.
- Project-specific atomic invariants remain insufficiently enumerated.
- Runtime/persistence reality still requires reconciliation before implementation contracts can become canonical.

## Next step

Run **Project-owned command boundary analysis** for only the commands that genuinely mutate Project state: create, amend, publish/unpublish if confirmed, archive, and tenant/ownership transfer if confirmed. For each, identify the minimum state that must change atomically. Do not infer aggregate containment from read-side relationships, projections, SEO, media, or public pages.
