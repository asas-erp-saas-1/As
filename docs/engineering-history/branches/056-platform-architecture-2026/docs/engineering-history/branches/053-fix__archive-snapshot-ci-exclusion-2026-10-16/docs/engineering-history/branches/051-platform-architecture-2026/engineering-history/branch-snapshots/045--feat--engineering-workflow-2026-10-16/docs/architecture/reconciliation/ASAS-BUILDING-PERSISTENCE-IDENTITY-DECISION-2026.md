# ASAS — Building Persistence Identity Decision Record 2026

**Decision ID:** ADR-CANDIDATE-BLD-001  
**Status:** PROPOSED / IMPLEMENTATION BLOCKED  
**Date:** 2026-09-24  
**Owner:** Principal Architecture / Founder authority where required  
**Scope:** Real Estate / Inventory — Project → Building → Floor → Unit  
**Authority:** Engineering derivation grounded in current repository evidence; not yet an executable schema authorization

## 1. Decision purpose

Resolve the architectural question created by the candidate schema's use of `building_id` without a first-class `Building` model, without prematurely creating a table or migration.

This record is deliberately a **decision candidate**, not a schema implementation instruction.

## 2. Evidence

### Repository/source-verified

- The repository schema index records a measured source observation of 59 models, 17 enums and 56 indexes, while retaining the historical declaration of 59 models, 16 enums and 15 indexes. The observation is explicitly not promoted as an executable contract.
- The source observation manifest records the same 59/17/56 discrepancy and states that observation/derivation authorizes neither application code nor database migration.
- The current session checkpoint records that the independently extracted v1.6.1 schema source contains no standalone models named `Developer`, `Project`, `Building`, or `Floor`.
- The checkpoint records persisted semantic references including `FloorPlan.project_id`, `Apartment.project_id`, optional `Apartment.floor_number`, `Apartment.floor_plan_id`, `ProjectMilestone.building_id`, and `LedgerEntry.building_id`.
- The checkpoint records a uniqueness constraint on `ProjectMilestone` involving `(project_id, building_id, code)`.
- Product/architecture evidence supports the conceptual portfolio hierarchy `Project → Building → Unit`, while the repository does not yet authorize an executable persistence mapping.

### Externally verified engineering evidence

- Prisma documents that introspection reflects the existing database into a Prisma data model and that database-level relations require foreign keys to be represented as relations.
- Prisma documents schema-source comparison and brownfield baselining as separate activities; an existing database must be captured and reconciled before migration history is established.
- PostgreSQL documents RLS as a data-access control layer and notes that policies operate on rows; this does not create domain identity or replace application authorization.

## 3. Problem statement

The candidate source contains durable references to `building_id` but no promoted first-class `Building` persistence contract. Treating the identifier as an arbitrary scalar would create a referential-integrity and ownership ambiguity once Building participates in construction milestones, reporting, inventory hierarchy, permissions, audit and tenant isolation.

Creating a `Building` table immediately would be equally unsafe because the repository has not yet closed:

- Project → Building cardinality;
- Building → Floor cardinality;
- tenant ownership inheritance;
- natural identity and uniqueness;
- rename semantics;
- move/re-parent semantics;
- archive semantics;
- legal/commercial versus structural meaning;
- live brownfield representation.

## 4. Engineering derivation

**Derived conclusion:** if `Building` remains a durable domain concept and any authoritative persisted object references it as an identity-bearing relationship, the target architecture should prefer a first-class Building identity with explicit ownership and referential integrity rather than an unconstrained scalar `building_id`.

This is an **ENGINEERING-DERIVATION**, not a claim that the current database already has such a table.

The preferred target shape is conceptually:

```text
Organization / Workspace / Branch
            │
          Project
            │
         Building
            │
          Floor
            │
           Unit
```

with the following separation:

```text
Building identity
≠ Building aggregate root
≠ construction state-machine owner
≠ inventory availability owner
```

A first-class identity does not automatically promote Building to an Aggregate Root.

## 5. Proposed invariants

The following are proposed for contract review:

1. Every persisted Building belongs to exactly one Project unless an approved cross-project ownership model is explicitly introduced.
2. A Building identity is tenant-scoped and cannot be referenced across tenant boundaries.
3. A persisted `building_id` must resolve to the authoritative Building identity; no free-floating business foreign key should remain after schema promotion.
4. Building identity must be immutable; human-readable name/code may be changed only through an auditable command.
5. Re-parenting a Building between Projects is not an ordinary update. It requires an explicit domain command and policy because it changes ownership, reporting, permissions and downstream references.
6. Archiving a Building must not invalidate historical sales, finance, audit or reporting references.
7. Building does not own Unit availability merely because Units are physically contained by it; inventory concurrency remains a Unit-level concern unless a separate invariant proves otherwise.
8. Construction milestones may use Building as an aggregation/reporting scope without making Building the owner of `Apartment.construction_status`.
9. Any future Building-level invariant that requires atomic consistency across multiple Units must explicitly justify promoting Building to an Aggregate Root.

## 6. Identity recommendation

**PROPOSED:** use an immutable surrogate identifier for Building as the persistence identity. Human-facing building number/code/name should be modeled as mutable business attributes with an explicit uniqueness policy.

A natural key such as `(project_id, building_code)` may be useful for business lookup, but should not be treated as the immutable primary identity without a separate decision proving that code stability is a domain invariant.

## 7. What remains unresolved

The following are intentionally OPEN:

- exact Project → Building cardinality;
- exact Building → Floor model;
- whether Floor is persisted or derived from Unit/floor-plan data;
- branch/workspace ownership inheritance;
- building code uniqueness scope;
- legal versus structural Building meaning;
- move/re-parent authorization;
- live database representation;
- migration/brownfield strategy;
- whether any existing `building_id` values are already in production data.

## 8. Required verification before promotion

1. Reconcile all repository references to `building_id`, `project_id`, `floor_number` and related foreign keys.
2. Inspect all historical migrations and SQL for Building-like tables or columns.
3. Identify alternate names and legacy representations.
4. Verify the live Supabase project identity before any live introspection.
5. Introspect live schema read-only if access is available and authorized.
6. Compare live schema to candidate source and classify every difference.
7. Reconcile tenant ownership and RLS implications.
8. Reconcile events, permissions and state-machine references.
9. Decide Project → Building → Floor cardinalities.
10. Obtain founder approval if commercial/legal semantics or destructive brownfield remediation is implicated.
11. Only after the above, promote the persistence contract and authorize implementation.

## 9. Explicit non-decisions

This record does **not** authorize:

- creation of a `Building` Prisma model;
- creation of a `buildings` table;
- adding foreign keys;
- migration generation;
- migration execution;
- live database modification;
- Building-specific events;
- Building-specific permissions;
- Building-specific state machine;
- data backfill;
- deletion or renaming of existing brownfield structures.

## 10. Gate status

| Gate | Status |
|---|---|
| Domain concept | SUPPORTED |
| Durable identity requirement | PROPOSED / DERIVED |
| Aggregate-root promotion | OPEN |
| Persistence representation | OPEN |
| Tenant ownership | OPEN |
| Natural uniqueness | OPEN |
| Brownfield representation | OPEN |
| Live database evidence | NOT_EXECUTED |
| Schema promotion | BLOCKED |
| Implementation authorization | BLOCKED |

## 11. Next action

Continue with **Q1-SCHEMA-02 / Q1-BLD-PERSISTENCE-TRACE**: trace every repository and migration occurrence of `building_id`, `project_id`, `floor_number`, Building-like names and related foreign keys before changing the schema contract.

## 12. Provenance

Primary repository evidence:

- `schema/asas-contracts.index.json`
- `registers/BLUEPRINT-SOURCE-OBSERVATIONS.json`
- `docs/governance/SOURCE-REGISTER-RECONCILIATION-REPORT.md`
- `docs/handoff/CURRENT-SESSION-STATE.md`
- `docs/architecture/reconciliation/ASAS-SCHEMA-CONTRACT-PROMOTION-PROTOCOL-2026.md`
- `docs/architecture/reconciliation/ASAS-SCHEMA-STRUCTURAL-INVENTORY-2026.md`

External engineering references:

- Prisma ORM documentation: introspection, migration diff and baselining
- PostgreSQL documentation: Row-Level Security

**Classification:** `ENGINEERING-DERIVATION / PROPOSED / IMPLEMENTATION BLOCKED`