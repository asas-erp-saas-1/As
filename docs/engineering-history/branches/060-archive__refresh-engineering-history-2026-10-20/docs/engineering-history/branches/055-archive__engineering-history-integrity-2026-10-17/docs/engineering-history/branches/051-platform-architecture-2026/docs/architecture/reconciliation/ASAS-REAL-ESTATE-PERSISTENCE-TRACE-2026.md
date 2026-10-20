# ASAS — Real Estate Persistence Trace 2026

**Artifact ID:** ASAS-REAL-ESTATE-PERSISTENCE-TRACE-2026  
**Status:** VERIFIED REPOSITORY OBSERVATION / BROWNFIELD INCOMPLETE  
**Authority:** Reconciliation artifact; does not authorize schema or production changes.  
**Branch:** `platform-architecture-2026`  
**Date:** 2026-09-24

## 1. Purpose

Trace the repository evidence for the canonical real-estate hierarchy and commercial lifecycle before any executable schema or migration is promoted.

This artifact deliberately separates:

`Product Truth ≠ Domain Contract ≠ Source Package Schema ≠ Repository Persistence ≠ Live Database`

## 2. Evidence-backed business hierarchy

The current product truth explicitly describes promoter portfolios as:

`projects → buildings → units`

and identifies buildings and units/apartments as first-class product capabilities. This establishes business meaning, not executable persistence.

The current core lifecycle map assigns:

`Project / building / unit inventory → Real Estate / Inventory`

and identifies Unit inventory as a cross-context dependency for Website, CRM, Sales and Finance.

**Classification:** `SOURCE-VERIFIED / SUPPORTED DOMAIN FACT`

## 3. Candidate persistence observations

The v1.6.1 source-package schema extraction recorded:

- 59 models;
- 17 enums;
- 56 indexes;
- 22 unique constraints;
- 19 relation annotations.

The extracted source does not contain standalone models named `Developer`, `Project`, `Building`, or `Floor`.

However, the source contains the following Building-adjacent references:

| Source object | Field / constraint | Evidence meaning | Status |
|---|---|---|---|
| `FloorPlan` | `project_id` | Floor-plan data is associated with Project | SOURCE-VERIFIED |
| `Apartment` | `project_id` | Apartment belongs to Project in source contract | SOURCE-VERIFIED |
| `Apartment` | `floor_number` optional | Floor-level information exists as an apartment attribute, not proof of Floor entity | SOURCE-VERIFIED |
| `Apartment` | `floor_plan_id` | Apartment can reference FloorPlan | SOURCE-VERIFIED |
| `Apartment` | `construction_status` | Construction lifecycle exists on Apartment | SOURCE-VERIFIED |
| `ProjectMilestone` | optional `building_id` | Building identity is referenced by milestone source contract | SOURCE-VERIFIED |
| `ProjectMilestone` | unique `(project_id, building_id, code)` | Building participates in milestone uniqueness when present | SOURCE-VERIFIED |
| `LedgerEntry` | optional `project_id`, `building_id` | Building/Project may be reporting dimensions in financial source contract | SOURCE-VERIFIED |

These observations prove semantic references in the candidate source. They do **not** prove a first-class Building table/model, current production schema, or required aggregate boundary.

## 4. Building identity finding

A durable Building concept is supported by product truth and the lifecycle architecture. A durable executable Building identity is **not yet proven** by the current repository persistence surface.

Therefore:

- Building as domain concept: `SUPPORTED`;
- Building as first-class aggregate root: `OPEN`;
- Building as entity with durable identity: `PROPOSED / DERIVED`;
- Building table/model: `UNVERIFIED / DO NOT INVENT`;
- Building natural key: `OPEN`;
- Project → Building cardinality: `OPEN`;
- Building → Unit cardinality: `OPEN`;
- tenant ownership representation: `OPEN`;
- rename/move/archive semantics: `OPEN`.

## 5. State-machine interaction

The state-machine register makes `apartment.construction_status` the lifecycle owner while describing construction milestones as occurring per building. This indicates a potentially intentional distinction between:

`Building = structural / milestone scope`

and

`Apartment = construction lifecycle state owner`

but the relationship cannot be promoted into a schema design until Building identity and milestone ownership are explicitly reconciled.

No Building-specific state machine is authorized by this artifact.

## 6. Commercial interaction

The product and lifecycle sources support the business chain:

`Project → Unit → Lead → Opportunity → Offer → Reservation → Contract → Payment/Collection`

Reservation is the commercial consistency boundary for the Unit. Building is upstream structural context and must not be allowed to become an alternative inventory ownership mechanism without an approved contract.

## 7. Repository search result boundary

Repository search on the active architecture branch did not return direct executable matches for `building_id`, `floor_plan`, or a standalone Building aggregate implementation.

This is **not proof of absence**. The current connector/search surface does not establish a complete byte-level repository search across all historical objects. Therefore the result is classified as:

`SEARCH-OBSERVATION / INCOMPLETE BROWNFIELD EVIDENCE`

The next exhaustive pass must inspect historical migrations, SQL, seeds, fixtures, adapters, generated artifacts and alternate persistence paths.

## 8. Authority conclusion

The current evidence is sufficient to retain Building as a real-estate domain concept and insufficient to authorize an executable persistence model.

The safe canonical rule is:

> **Do not create or promote Building persistence until Project → Building → Unit cardinality, durable identity, tenant ownership, lifecycle operations, migration strategy, and live brownfield reality are reconciled.**

## 9. Required next evidence

1. Locate all historical schema/migration SQL paths.
2. Locate all historical Prisma/schema artifacts.
3. Inspect seeds, fixtures and tests for real-estate persistence assumptions.
4. Inspect API contracts and repository adapters for Project/Building/Floor/Unit identifiers.
5. Reconcile `building_id` references and alternate naming.
6. Determine whether Building exists under a legacy or embedded representation.
7. Verify live database identity and schema only when authorized runtime access exists.
8. Produce the final Project → Building → Unit cardinality decision.
9. Produce the durable Building identity/uniqueness contract.
10. Only then decide whether an executable Building model is required.

## 10. Non-authorizations

This artifact does not authorize:

- Prisma model creation;
- table creation;
- migrations;
- destructive schema changes;
- Building-specific permissions;
- Building-specific events;
- production changes;
- live database mutation.
