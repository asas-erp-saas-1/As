# ASAS — Brownfield Persistence Trace 2026

**Artifact ID:** ASAS-BROWNFIELD-PERSISTENCE-TRACE-2026  
**Status:** VERIFIED REPOSITORY OBSERVATION / BROWNFIELD RECONCILIATION INCOMPLETE  
**Version:** 1.0.0  
**Date:** 2026-09-24  
**Branch:** `platform-architecture-2026`  
**Repository:** `asas-erp-saas-1/As`

## 1. Purpose

Establish the repository-side evidence boundary for Project → Building → Floor → Unit persistence before any target schema or migration is authorized.

This artifact records what is observable in the current architecture repository. It does not infer live database state and does not authorize schema implementation.

## 2. Verified repository facts

### 2.1 Current schema directory

The current `schema/` directory contains exactly one file:

`schema/asas-contracts.index.json`

No executable Prisma schema is present under the current branch's `schema/` directory.

### 2.2 Current root structure

The repository root exposes architecture, design, docs, registers and schema control-plane areas. A dedicated root `migrations/` directory is not present in the current repository root listing.

This is an observation about repository structure, **not proof that no migration SQL exists anywhere in history or under another path**.

### 2.3 Domain references

Current canonical lifecycle material identifies `Project / building / unit inventory` as owned by `Real Estate / Inventory`. Product truth also treats projects → buildings → units as the portfolio hierarchy while explicitly requiring the validated domain model and contracts before UI or persistence semantics are invented.

### 2.4 Candidate schema observations

The independently extracted v1.6.1 candidate source records:

- 59 models;
- 17 enums;
- 56 indexes;
- 22 unique constraints;
- 19 relation annotations.

It does not contain standalone models named `Developer`, `Project`, `Building`, or `Floor`, while containing semantic references including `Apartment.project_id`, `Apartment.floor_number`, `FloorPlan.project_id`, `ProjectMilestone.building_id`, and `LedgerEntry.building_id`.

These are source observations, not current live-schema facts.

## 3. Evidence boundary

| Question | Current answer | Evidence state |
|---|---|---|
| Is Project a current executable model in this repository? | Not established | OPEN |
| Is Building a current executable model in this repository? | Not established | OPEN |
| Is Floor a current executable model in this repository? | Not established | OPEN |
| Is Apartment represented in the candidate source? | Yes | SOURCE-VERIFIED |
| Does candidate source contain `building_id` semantics? | Yes | SOURCE-VERIFIED |
| Does current `schema/` contain executable Prisma contract? | No | REPOSITORY-VERIFIED |
| Does current root contain a `migrations/` directory? | No | REPOSITORY-VERIFIED |
| Does absence of root `migrations/` prove no historical migrations exist? | No | NOT PROVEN |
| Does repository evidence prove live DB representation? | No | NOT_EXECUTED |
| Is Building persistence implementation authorized? | No | BLOCKED |

## 4. Required next trace

The next forensic pass must search repository history and all repository paths for:

- `building_id`
- `project_id`
- `floor_number`
- `buildingId`
- `projectId`
- `floorNumber`
- `Building`
- `Project`
- `Floor`
- `buildings`
- `projects`
- `floors`
- foreign-key declarations involving these concepts
- SQL migration files
- Prisma migration directories
- seed/fixture representations
- repository adapters and query builders
- API contracts and payloads
- tests and snapshots

The search must distinguish current-branch evidence from historical-branch evidence.

## 5. Decision boundary

Do not infer any of the following from the absence of a current executable schema:

- that the live database lacks these structures;
- that historical migrations never existed;
- that Building must be a new table;
- that Floor must be a persisted entity;
- that `building_id` is invalid;
- that Project is an aggregate root;
- that Building is an aggregate root.

Those decisions require brownfield and domain reconciliation.

## 6. Architecture implication

The repository has sufficient evidence to treat Project → Building → Unit as a required domain hierarchy, but not sufficient evidence to promote a concrete persistence shape.

Therefore the current architecture should preserve:

```text
Project
  └── Building
        └── Floor / structural level (persistence OPEN)
              └── Unit / Apartment
```

while keeping persistence representation explicitly unresolved until brownfield evidence is collected.

## 7. Safety rules

No task derived from this artifact may:

- create or alter a Prisma model;
- create a table;
- create or execute a migration;
- backfill production data;
- rename or delete brownfield structures;
- alter RLS;
- introduce Building-specific events or permissions;
- modify live Supabase state.

## 8. Promotion gate

This artifact becomes a supporting input to schema promotion only after:

1. historical repository trace is complete;
2. current implementation trace is complete;
3. live database identity is verified;
4. live schema is captured read-only where authorized;
5. differences are classified;
6. Project → Building → Floor → Unit semantics are closed;
7. tenant ownership and uniqueness are closed;
8. migration strategy is explicitly approved;
9. the executable target schema is independently verified.

**Current gate:** `BLOCKED`

## 9. Provenance

Primary repository evidence:

- `schema/asas-contracts.index.json`
- `docs/governance/CORE-LIFECYCLE-CANONICAL-MAP.md`
- `docs/product/PRODUCT_TRUTH.md`
- `docs/handoff/CURRENT-SESSION-STATE.md`
- `docs/architecture/reconciliation/ASAS-SCHEMA-STRUCTURAL-INVENTORY-2026.md`
- `docs/architecture/reconciliation/ASAS-SCHEMA-CONTRACT-PROMOTION-PROTOCOL-2026.md`
- `docs/architecture/reconciliation/ASAS-BUILDING-PERSISTENCE-IDENTITY-DECISION-2026.md`

**Classification:** `SOURCE-VERIFIED / REPOSITORY-VERIFIED / OPEN / BLOCKED`