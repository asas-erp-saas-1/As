# ASAS — Schema Contract Promotion Protocol 2026

**Artifact ID:** ASAS-RECON-SCHEMA-PROMOTION-2026-001  
**Status:** CANONICAL PROCEDURE / ACTIVE  
**Version:** 1.0.2  
**Effective date:** 2026-09-24  
**Owner:** Lead Architecture / Database Engineering  
**Branch:** `platform-architecture-2026`  
**Authority:** Engineering procedure. This artifact does not authorize production changes or migrations by itself.

## 1. Purpose

Define the controlled process by which ASAS can move from source-package schema observations and brownfield database evidence to an executable target schema contract.

The protocol exists because the repository currently contains a schema-contract index but does not yet contain an executable target Prisma contract. The repository records a historical declaration of 59 models / 16 enums / 15 indexes and a source observation of 59 models / 17 enums / 56 indexes. The complete v1.6.1 source has now been extracted and measured independently; those values are retained as separate evidence until reconciled with repository implementation and live runtime reality.

## 2. Core principle

`DATABASE REALITY ≠ MIGRATION HISTORY ≠ EXECUTABLE SCHEMA CONTRACT ≠ TARGET DOMAIN MODEL ≠ HISTORICAL BLUEPRINT`

No one representation may silently overwrite another.

## 3. Authority sequence

### Existing brownfield reality

`VERIFIED LIVE DATABASE → VERIFIED REPOSITORY IMPLEMENTATION → APPROVED CONTRACT/REGISTER → APPROVED ARCHITECTURE → HISTORICAL SOURCE → INFERENCE`

### Desired target

`FOUNDER/PRODUCT DECISION → APPROVED ARCHITECTURE → APPROVED ADR → CANONICAL CONTRACT/REGISTER → AUTHORIZED IMPLEMENTATION`

### External engineering facts

`OFFICIAL DOCUMENTATION/STANDARD → PRIMARY ENGINEERING SOURCE → REPUTABLE TECHNICAL RESEARCH → SECONDARY SOURCE`

## 4. Required phases

### S0 — Identity

Verify repository, branch, commit, environment and database identity before interpreting persistence evidence.

**Output:** identity evidence.

### S1 — Source extraction

Extract the complete candidate schema source from its actual provenance. Do not reconstruct a schema from headline counts, diagrams, snippets, or search results.

**Current evidence:** the supplied ASAS v1.6.1 package contains a complete `blueprint/schema/asas-contracts.prisma` source and it has been independently structurally parsed. See `ASAS-SCHEMA-STRUCTURAL-INVENTORY-2026.md`.

**Required evidence:** complete source artifact, immutable hash when available, provenance path/ref.

### S2 — Structural parse

Parse and inventory:

- models;
- enums;
- fields;
- scalar types;
- nullability;
- defaults;
- relations;
- relation names;
- foreign keys where represented;
- indexes;
- unique constraints;
- mapped database names;
- unsupported/native database constructs where discoverable.

Do not infer absent database constraints from ORM syntax alone.

### S3 — Reconciliation

Compare:

`historical declaration ↔ extracted source ↔ repository implementation ↔ migration history ↔ live database`

Classify each difference as:

`INTENTIONAL | LEGACY | MISSING | DANGEROUS | UNDOCUMENTED | CONFLICT | UNKNOWN`

No discrepancy may be normalized silently.

### S4 — Domain alignment

For every persisted concept, map:

`bounded context → module → aggregate/entity/reference → invariant → ownership → tenant scope → lifecycle → persistence representation`

Do not derive DDD boundaries from table shape.

### S5 — Security alignment

Verify, where applicable:

- tenant ownership;
- authorization scope;
- RLS expectations;
- service-role boundaries;
- auditability;
- sensitive-data classification;
- financial immutability;
- idempotency/concurrency requirements.

### S6 — Target contract draft

Only after S1–S5 produce a proposed executable schema contract.

Every model must have provenance and domain ownership. Every relationship must have an identified semantic reason. Every uniqueness constraint must map to a business or technical invariant.

### S7 — Static verification

Run only commands that actually exist in the repository. At minimum, where the repository tooling supports them:

- schema parse/format validation;
- generated-client/type validation;
- migration consistency checks;
- architecture/register consistency checks.

Do not invent green commands.

### S8 — Brownfield verification

If a live database is authorized and accessible:

`identify → introspect → capture → diff → classify → approve`

Introspection is evidence capture, not authorization to mutate the database.

### S9 — Promotion decision

The executable schema contract may be promoted only when:

- source provenance is complete;
- all headline-count discrepancies are reconciled;
- domain mappings are reviewed;
- tenant/security requirements are explicit;
- migration strategy is known;
- unresolved founder decisions are isolated;
- verification evidence exists;
- the responsible architecture authority approves promotion.

## 5. Current measured source evidence

The complete v1.6.1 source currently measures:

- 59 models;
- 17 enums;
- 56 `@@index` declarations;
- 22 `@@unique` declarations;
- 19 `@relation` annotations.

The 59-model source does **not** contain standalone Prisma models named `Developer`, `Project`, `Building`, or `Floor`.

However, `ProjectMilestone` contains an optional `building_id`, `LedgerEntry` contains an optional `building_id` reporting dimension, and `Apartment` owns `construction_status`. This creates a real architectural question: a building identity is referenced by the candidate schema without a first-class Building model in that source.

The state-machine register independently describes `apartment.construction_status` as the state owner while saying milestone certification is driven per building. This may be valid as a scope distinction, but the identity/ownership of `building_id` is unresolved.

The Master Spec also contains a staged task for Developer/Project/Building/Floor models while separately describing those entities as absent from the 59-model contract. This is classified as `CONFLICT / INTENTIONAL-STAGING-CANDIDATE — NOT RESOLVED` until repository and runtime evidence determine the intended brownfield mapping.

These observations strengthen the case for reconciliation; they do not authorize adding Building, Project, Floor, or Developer tables.

## 6. Migration safety doctrine

No schema contract promotion automatically authorizes a migration.

Migration work requires a separate authorized task and must use an expand/contract or equivalent safe strategy where compatibility and existing data require it.

Production must never be reset, dropped, truncated, blindly recreated, or destructively renamed as part of reconciliation.

**External engineering evidence:** Prisma's official documentation describes introspection as a mechanism for reflecting an existing relational database into a Prisma data model, and documents baselining when adopting migration history around an existing database whose data must be preserved. Prisma also documents `migrate diff` for comparing schema sources and emphasizes reconciliation between migration history and actual database state. These sources inform this procedure but do not override ASAS authority.

## 7. ASAS-specific promotion gate

Current gate:

`BLOCKED`

Reason:

- executable target Prisma contract is not promoted;
- complete v1.6.1 source is available as historical/reference provenance, but is not repository implementation authority;
- 59/17/56 source observation versus 59/16/15 historical declaration remains unresolved;
- Project/Building/Floor identity and ownership are not reconciled against repository/runtime persistence;
- live database identity/schema is not verified;
- Building persistence therefore cannot be decided from the historical candidate source alone.

## 8. Required reconciliation matrix

Before promotion, produce a machine-readable or tabular matrix containing at least:

| Concept | Source provenance | Target model | Existing model | Live object | Tenant scope | PK | Unique constraints | FK/relations | Invariants | Status |
|---|---|---|---|---|---|---|---|---|---|---|

No row may use an invented model or constraint merely to make the matrix complete.

## 9. Forbidden shortcuts

- Creating a Prisma model solely because a domain diagram contains a node.
- Creating a table solely because a task mentions a noun.
- Treating model counts as proof of correctness.
- Treating an ORM relation as proof of a database foreign key without verification.
- Treating RLS documentation as proof that policies exist.
- Treating migration files as proof that the live database matches them.
- Treating introspection output as target architecture without domain reconciliation.
- Using destructive reset/recreate operations to make environments look consistent.

## 10. Exit statuses

`VERIFIED | PARTIAL | BLOCKED | NOT_EXECUTED | OPEN | CONFLICT`

Never use `READY`, `FINAL`, or `COMPLETE` as evidence status.

## 11. Next authorized dependency for Q1

The next work item is:

**Q1-SCHEMA-03/04 — Reconcile the measured 59/17/56 source against the repository's historical declaration, then align Project/Building/Floor/Unit identity with domain invariants and brownfield persistence evidence.**

This precedes any Building persistence decision and any executable Prisma contract promotion.
