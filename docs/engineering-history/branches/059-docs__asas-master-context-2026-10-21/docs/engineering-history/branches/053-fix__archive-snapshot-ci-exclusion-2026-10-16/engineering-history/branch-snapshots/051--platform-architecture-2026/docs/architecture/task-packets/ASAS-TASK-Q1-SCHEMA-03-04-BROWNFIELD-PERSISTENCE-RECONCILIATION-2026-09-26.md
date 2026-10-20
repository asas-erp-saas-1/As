# ASAS Task Packet — Q1-SCHEMA-03/04 Brownfield Persistence Reconciliation

**Track:** Platform Engineering  
**Conference dependency:** C03.13  
**Branch:** `platform-architecture-2026`  
**Status:** OPEN / EVIDENCE-GATED  
**Authorization:** read-only forensic inspection; no production mutation.

## Objective

Determine the actual persistence reality behind the closed semantic decisions for Project, Building, Floor, Unit, Listing, Offer, Hold, Reservation, Pricing, Inventory Batch, Outbox, audit and tenant isolation.

The task must distinguish four layers:

1. target architecture;
2. repository implementation;
3. migration/source declarations;
4. live database reality.

## Required procedure

### L0 — Reality lock

Record repository, branch, commit, package manager, lockfile and target environment/database identity. If the database identity cannot be established independently, STOP.

### L1 — Locate

Locate all repository references to:

`projects`, `buildings`, `floors`, `apartments`, `units`, `properties`, `listings`, `mandates`, `offers`, `holds`, `reservations`, `prices`, `inventory`, `outbox`, `audit`, `organization_id`, `workspace_id`, `RLS`.

### L2 — Load

Load the applicable Blueprint/V3 chapters, canonical contracts, state/permission/event registers and current schema index before interpreting findings.

### L3 — Plan

Produce a read-only evidence plan and a deterministic export format. Do not overwrite the canonical target contract with introspection output.

### L4 — Verify

For every relevant live table capture:

- schema/table name;
- columns and data types;
- nullable/default behavior;
- primary keys;
- foreign keys;
- unique constraints;
- indexes, including partial indexes where applicable;
- checks;
- triggers/functions;
- RLS enablement and policies;
- approximate/exact row counts as safely available;
- orphan/nullability/data-quality observations;
- application consumers.

### L5 — Implement

No production implementation in this task. Only non-destructive forensic tooling or documentation may be added if required to collect evidence.

### L6 — Prove

The evidence packet must be reproducible and must support a drift matrix:

`TARGET | REPOSITORY | MIGRATION | RUNTIME | CONFLICT | REQUIRED ACTION`

### L6.5 — Converge

Every unresolved divergence gets a task ID. No silent reconciliation.

### L7 — Report

Produce the final evidence report, blockers, candidate schema changes, required ADRs, test implications and next gate.

## Explicit prohibitions

- no `DROP`;
- no `TRUNCATE`;
- no destructive `ALTER`;
- no production data correction;
- no blind `prisma db pull` against an unverified database;
- no creation of target tables solely because the architecture names them;
- no promotion of `schema/asas-contracts.prisma`;
- no RLS rollout;
- no reservation locking implementation;
- no claim of live verification without reproducible evidence.

## Acceptance evidence

The task is complete only when all are available:

- environment/database identity proof;
- repository persistence inventory;
- live schema inventory or explicit blocker proving why it cannot yet be obtained;
- constraint/index/RLS inventory;
- Unit/Apartment mapping;
- Reservation mapping;
- Outbox mapping;
- 59/17/56 reconciliation result;
- drift matrix;
- implementation recommendations with confidence classification;
- updated canonical checkpoint.

## External technical basis

Prisma documents `db pull` as database introspection that populates a Prisma schema from the current relational schema; it warns that introspection can overwrite the schema and recommends preserving the existing schema before doing so. PostgreSQL's Information Schema exposes table constraints, while PostgreSQL-specific catalogs are required for PostgreSQL-specific features. These facts support the read-only introspection plan but do not replace ASAS governance.

## Completion rule

`Semantic decision` does not equal `schema authorization`.

The task may recommend implementation, but implementation authorization remains gated by the foundation gates and evidence chain.
