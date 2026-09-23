# ASAS — Building Schema Reconciliation 2026

**Artifact ID:** ASAS-RECON-BUILDING-SCHEMA-2026-001  
**Status:** OPEN / IMPLEMENTATION BLOCKED  
**Version:** 1.0.0  
**Effective date:** 2026-09-23  
**Owner:** Lead Architecture / Domain Engineering  
**Branch:** `platform-architecture-2026`  
**Authority:** Reconciliation evidence only. This artifact does not authorize schema, migration, API, permission, event, or production changes.

## 1. Purpose

Reconcile the `Building` concept across the current ASAS control plane, the supplied ASAS Blueprint v1.6.1 source package, and the current aggregate/invariant register without promoting historical source material into implementation authority.

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

## 7. Persistence reconciliation protocol

Before any Building persistence change is authorized:

1. identify the actual repository schema used by the current application;
2. inspect migration history;
3. identify any existing `building_id` references and their semantics;
4. identify current Project/Apartment/Floor/FloorPlan representation;
5. verify whether the current repository is brownfield against a live database;
6. obtain verified live database identity when access is authorized;
7. introspect live schema without destructive operations;
8. classify drift as intentional, legacy, missing, dangerous, or undocumented;
9. make the DDD/persistence decision through the canonical contract/ADR path;
10. only then prepare an expand/contract migration if persistence is required.

## 8. Current decision

**No Building table/model/migration is authorized by this artifact.**

The correct current engineering state is:

`DOMAIN CONCEPT = SUPPORTED`

`PERSISTENCE REPRESENTATION = OPEN`

`AGGREGATE CLASSIFICATION = OPEN`

`LIVE DATABASE = BLOCKED / UNVERIFIED`

## 9. Closure requirements

This artifact can move from `OPEN` only when the Building contract closes the DDD boundary questions and the repository/runtime schema is reconciled. Closure requires objective evidence and must be reflected in the canonical checkpoint.

### Non-negotiable prohibition

Do not create a `Building` table, Prisma model, migration, endpoint, event, permission, or state machine merely because the historical Blueprint contains a Building node.
