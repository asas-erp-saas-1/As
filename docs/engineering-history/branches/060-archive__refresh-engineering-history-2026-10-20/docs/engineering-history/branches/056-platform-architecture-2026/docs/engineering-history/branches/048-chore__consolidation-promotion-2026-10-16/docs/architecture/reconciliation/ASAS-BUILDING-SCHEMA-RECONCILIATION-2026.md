# ASAS — Building Schema Reconciliation 2026

**Artifact ID:** ASAS-RECON-BUILDING-SCHEMA-2026-001  
**Status:** OPEN / IMPLEMENTATION BLOCKED  
**Version:** 1.1.0  
**Effective date:** 2026-09-24  
**Owner:** Lead Architecture / Domain Engineering  
**Branch:** `platform-architecture-2026`  
**Authority:** Reconciliation evidence only. This artifact does not authorize schema, migration, API, permission, event, or production changes.

## 1. Purpose

Reconcile the `Building` concept across the current ASAS control plane, the supplied ASAS Blueprint v1.6.1 source package, the repository schema contract index, and the current aggregate/invariant register without promoting historical source material into implementation authority.

The governing rule is:

`source package → research/provenance → current repository evidence → reconciliation → canonical contract → explicit implementation authorization`

## 2. Current repository authority

The current Building contract states:

`BUILDING = REAL-ESTATE STRUCTURAL DOMAIN CONCEPT`

and intentionally leaves persistence representation open. It explicitly prohibits inferring a Prisma model/table/migration from the domain concept alone.

The current Aggregate & Invariant Boundary Register classifies `Building` as:

`AGG-004 | Inventory / ownership TBD | Building metadata | OPEN`

Therefore the current repository does **not** establish Building as a closed aggregate, table, or executable schema object.

## 3. Source-package evidence — provenance only

The supplied Blueprint v1.6.1 / Master Spec contains an explicit real-estate hierarchy:

`Developer → Project → Building → Floor → FloorPlan → Apartment`

It also describes Building with structural fields such as a code, floor count, elevator information, construction status, estimated delivery date, and construction milestones.

The same source package also contains a material schema inconsistency: its version-neutral `asas-contracts.prisma` does not contain `Developer`, `Project`, `Building`, or `Floor` models, while the Master Spec's diagrams and Phase 2 tasks describe those concepts and T-2.1 calls for their models against the 15-table brownfield baseline.

The source package itself records this inconsistency in its audit material and instructs future schema work to re-measure the contract rather than trusting the headline model count.

**Classification:** HISTORICAL / RESEARCH / PROVENANCE. Not implementation authority.

## 4. Reconciliation result

| Question | Finding | Status |
|---|---|---|
| Is Building a real product/domain concept? | Yes; supported by current Product Truth / execution path and source-package hierarchy. | SUPPORTED |
| Is Building represented as a current canonical Prisma model? | Not established by the current repository control plane. | OPEN |
| Is Building represented in the supplied v1.6.1 contract schema? | No standalone `model Building` is present in that source-package contract. | SOURCE-VERIFIED |
| Does absence from that contract prove Building is not a domain concept? | No. The same package contains Building in domain diagrams and tasks. | SOURCE-VERIFIED |
| Is Building an aggregate root? | Current evidence does not establish this. | OPEN |
| Is Building an entity/reference object? | Possible, but not authoritative. | OPEN |
| Is Project → Building mandatory? | Not closed by the current contract. | OPEN |
| Is Building → Floor → Unit mandatory? | Historical source supports the hierarchy, but current canonical semantics are not closed. | SUPPORTED / OPEN |
| Is Building identity `project_id + code`? | Candidate only; no implementation authorization. | OPEN |
| Does Building own tenant scope directly? | Not established. | OPEN |
| Does Building have its own state machine? | No. The registered construction state machine is currently on Apartment. | VERIFIED TARGET RULE |
| Does Building need independent persistence? | Not yet established. | BLOCKED |
| Is live DB representation known? | No verified live DB evidence is currently available in this branch. | BLOCKED |

## 5. Important distinction: structural hierarchy vs aggregate boundary

The following may all be simultaneously true without contradiction:

- Building is a first-class domain concept.
- Project → Building → Floor → Unit is a valid conceptual hierarchy.
- Building is not an aggregate root.
- Building is persisted as part of another model or through a brownfield representation.
- Building may later become an independently persisted aggregate if business invariants require it.

Therefore the architecture must not derive DDD aggregate boundaries from the ER diagram alone.

## 6. Construction semantics

The current state-machine register identifies:

`apartment.construction_status`

as the governed construction state-machine target. Building may be a construction aggregation scope, but this does not make Building a construction state-machine aggregate.

No Building construction state machine is authorized by this reconciliation.

## 7. Repository schema evidence

The current branch contains `schema/asas-contracts.index.json` but does **not** contain an executable `schema/asas-contracts.prisma` file at the indexed repository path.

The schema index explicitly classifies itself as:

`DERIVATION-CONTROLLED / RECONCILIATION REQUIRED`

and records:

- historical declaration: 59 models / 16 enums / 15 indexes;
- verified source observation: 59 models / 17 enums / 56 indexes;
- status: `OBSERVED / NOT YET PROMOTED AS EXECUTABLE CONTRACT`;
- role: version-neutral target contract index, not live database schema and not a migration;
- promotion gate: do not create `schema/asas-contracts.prisma` until source text is completely extracted, validated for internal consistency, and the 59/17/56 observation is reconciled with the historical 59/16/15 declaration.

This is direct repository evidence that the current engineering process intentionally has **not** promoted the schema source into an executable Prisma contract.

It also means that the absence of a `Building` model from an executable Prisma schema cannot currently be interpreted as proof that a final target schema has deliberately rejected Building. The executable target schema itself is not yet promoted.

**Classification:** CURRENT REPOSITORY CONTROL-PLANE EVIDENCE.

## 8. Persistence reconciliation protocol

Before any Building persistence change is authorized:

1. identify the actual repository schema used by the current application;
2. inspect migration history;
3. identify any existing `building_id` references and their semantics;
4. identify current Project/Apartment/Floor/FloorPlan representation;
5. verify whether the current repository is brownfield against a live database;
6. obtain verified live database identity when access is authorized;
7. introspect live schema without destructive operations;
8. classify drift as intentional, legacy, missing, dangerous, or undocumented;
9. fully reconcile the 59/17/56 schema observation against the historical 59/16/15 declaration;
10. extract and validate the complete target schema source before promoting any executable Prisma contract;
11. make the DDD/persistence decision through the canonical contract/ADR path;
12. only then prepare an expand/contract migration if persistence is required.

## 9. Current decision

**No Building table/model/migration is authorized by this artifact.**

The correct current engineering state is:

`DOMAIN CONCEPT = SUPPORTED`

`PERSISTENCE REPRESENTATION = OPEN`

`AGGREGATE CLASSIFICATION = OPEN`

`EXECUTABLE TARGET SCHEMA = NOT PROMOTED`

`LIVE DATABASE = BLOCKED / UNVERIFIED`

## 10. Newly confirmed engineering finding

The persistence problem is broader than `Building` alone.

The repository deliberately has a **schema-contract promotion gate** before an executable Prisma contract may exist. Therefore the next engineering dependency is not "create Building model". It is:

`schema source extraction → 59/17/56 reconciliation → relation/ownership/invariant validation → target-schema promotion decision`

Building must be reconciled inside that process, not independently inserted into a schema.

This prevents a local Building decision from silently creating a target schema that conflicts with the broader ASAS domain model.

## 11. Closure requirements

This artifact can move from `OPEN` only when:

1. the Building contract closes the DDD boundary questions;
2. Project → Building → Floor → Unit semantics and cardinalities are explicitly reconciled;
3. durable identity/uniqueness is established;
4. tenant ownership/inheritance is established;
5. repository persistence representation is fully inspected;
6. the target schema promotion gate is satisfied;
7. live database identity/schema is verified when runtime access is authorized;
8. any required ADR and implementation authorization exist;
9. objective verification evidence is captured; and
10. the canonical checkpoint is updated.

### Non-negotiable prohibition

Do not create a `Building` table, Prisma model, migration, endpoint, event, permission, or state machine merely because the historical Blueprint contains a Building node.
