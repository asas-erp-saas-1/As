# ASAS — Building Domain Contract 2026

**Artifact ID:** ASAS-CONTRACT-BUILDING-2026-001  
**Status:** PROPOSED / OPEN / IMPLEMENTATION BLOCKED  
**Authority:** Architecture contract; does not authorize persistence by itself.  
**Branch:** `platform-architecture-2026`  
**Scope:** Q1 Building Contract Closure  
**Supersedes:** None  
**Provenance:** Product Truth, Master Execution Path, Canonical Architecture Baseline V3, and `ASAS-BUILDING-SCHEMA-RECONCILIATION-2026.md`.  

## 1. Purpose

Establish a single engineering contract for the `Building` concept without prematurely deciding its database representation.

This artifact is a closure vehicle, not an implementation authorization. It deliberately separates domain semantics from persistence.

## 2. Source-supported facts

### 2.1 Product truth

The founder-confirmed product direction describes the real-estate hierarchy as:

`Promoter / Organization → Project → Building → Unit`

The public/internal platform is expected to manage developers/promoters, projects, buildings and units as one coherent operating model.

**Evidence class:** `SOURCE-VERIFIED` from `docs/product/PRODUCT_TRUTH.md`.

### 2.2 Master execution path

The Real Estate Core is explicitly described as covering:

`developers/promoters, projects, buildings, units, inventory, pricing, availability`.

This is a sequencing statement, not permission to implement every object immediately.

**Evidence class:** `SOURCE-VERIFIED` from `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`.

### 2.3 Existing reconciliation finding

The existing Building reconciliation artifact establishes that:

- the target architecture treats Building as a first-class real-estate hierarchy concept;
- the consolidated v1.6.1 Prisma contract did not contain a `model Building`;
- other documented concepts reference `building_id`;
- the absence of the model is insufficient evidence that Building is absent from the architecture;
- the correct current state is `HOME-CHAPTER SPECIFIED → CONSOLIDATED SCHEMA REPRESENTATION OPEN → LIVE DATABASE UNKNOWN`.

**Evidence class:** `SOURCE-VERIFIED` from `ASAS-BUILDING-SCHEMA-RECONCILIATION-2026.md`.

## 3. Domain classification

### 3.1 Current classification

`Building = REAL-ESTATE STRUCTURAL DOMAIN CONCEPT`

It is part of the Inventory / Real Estate Core semantic model.

### 3.2 Aggregate status

**OPEN / UNVERIFIED.**

The available evidence does not establish whether Building is:

- an aggregate root;
- an entity inside a Project aggregate;
- a structural reference entity whose lifecycle is governed elsewhere.

No implementation may infer aggregate status from the existence of a prospective database table.

### 3.3 State-machine status

**NO BUILDING STATE MACHINE AUTHORIZED.**

Construction progress may be aggregated at Building scope, while the registered construction lifecycle currently identifies `apartment.construction_status` as the state-machine target. Building scope and Apartment aggregate/state-machine scope must not be conflated.

## 4. Provisional relationship model

The only currently supported structural statement is:

`Project → Building → Unit`

with Floor potentially mediating the physical hierarchy:

`Project → Building → Floor → Unit`

The following remain unresolved:

- whether Project → Building is mandatory;
- whether Unit must belong to a Building directly or only through Floor;
- whether a Building may span multiple phases;
- whether Building identity is immutable after units exist;
- whether Units may move between Buildings;
- whether Building can be archived after commercial/financial records exist.

These are `OPEN`, not inferred defaults.

## 5. Identity and uniqueness

### Current status: OPEN

The natural identity/uniqueness key for Building has not been established by an authoritative current contract.

Candidate keys such as `project_id + code` or `project_id + name` are **PROPOSED only** and must not be implemented until validated against the actual business model and historical/runtime evidence.

Display name is not assumed to be a durable identity.

## 6. Ownership and tenancy

### Current status: OPEN

Building is expected to inherit commercial ownership through the real-estate hierarchy, but the exact tenant boundary is not yet verified.

Required decision:

- direct tenant ownership on Building, or
- tenant ownership inherited through Project / Organization.

Until resolved, no new Building-specific authorization model is created.

## 7. Lifecycle semantics

Building lifecycle is currently structural rather than a newly authorized business state machine.

If Building rename, move, archive or merge operations are eventually supported, each operation must define:

`command → authorization → preconditions → invariant checks → mutation → audit → event → transaction`

No direct administrative field mutation is permitted for a governed lifecycle operation.

## 8. Construction relationship

The existing reconciliation indicates that construction milestones can operate at Building scope while `apartment.construction_status` remains the registered state-machine aggregate.

Therefore:

`Building = construction aggregation scope`

may be true without implying:

`Building = construction state-machine aggregate`.

This distinction must be preserved in future schema and event design.

## 9. Event implications

No new Building-specific domain event is authorized by this contract.

If future implementation requires Building events, each event must first obtain:

- producer context;
- aggregate/consistency boundary;
- trigger;
- version;
- tenant scope;
- authorization requirements;
- consumers;
- idempotency behavior;
- test evidence.

Existing milestone-related events must not be renamed or reassigned merely to make Building appear complete.

## 10. Permission implications

No Building-specific permission is authorized yet.

Existing inventory permissions may govern Building operations only if the canonical permission register explicitly maps the relevant resource/action/scope.

Client-side visibility is not authorization.

## 11. Persistence boundary

This contract does **not** authorize:

- a `Building` Prisma model;
- a `buildings` table;
- a migration;
- indexes or constraints;
- API endpoints;
- RLS policies;
- Building-specific permissions;
- Building-specific events.

Persistence can only be promoted after target semantics are reconciled with current repository schema and, when access is authorized, live database reality.

## 12. Required evidence to close Q1

| ID | Question | Required evidence | Status |
|---|---|---|---|
| BLD-01 | Authoritative Building definition | Home chapter / approved contract | OPEN |
| BLD-02 | Aggregate/entity/reference classification | DDD analysis + source evidence | OPEN |
| BLD-03 | Project → Building cardinality | Contract/domain evidence | OPEN |
| BLD-04 | Building → Floor → Unit semantics | Contract/domain evidence | OPEN |
| BLD-05 | Natural identity/uniqueness | Source + historical/runtime evidence | OPEN |
| BLD-06 | Rename semantics | Product/domain decision | OPEN |
| BLD-07 | Unit move semantics | Product/domain decision | OPEN |
| BLD-08 | Archive semantics | Product/domain decision | OPEN |
| BLD-09 | Tenant ownership | tenancy contract + runtime model | OPEN |
| BLD-10 | Current repository representation | repository inspection | OPEN |
| BLD-11 | Live DB representation | verified runtime identity + introspection | BLOCKED |
| BLD-12 | Permission mapping | canonical permission register | OPEN |
| BLD-13 | Event implications | event register + state machines | OPEN |
| BLD-14 | Test strategy | invariant/concurrency/security test plan | OPEN |

## 13. Closure criteria

Q1 is CLOSED only when:

1. the authoritative definition is identified;
2. Building's DDD classification is established;
3. relationship/cardinality semantics are explicit;
4. identity/uniqueness semantics are explicit;
5. lifecycle/rename/move/archive rules are explicit where applicable;
6. tenant ownership is explicit;
7. current repository persistence is reconciled;
8. live persistence is reconciled when applicable and authorized;
9. permission/event/state implications are mapped;
10. invariant and verification requirements are recorded;
11. no conflicting current artifact remains;
12. the resulting canonical contract is linked from the artifact register/roadmap where required.

## 14. Current conclusion

**BUILDING IS REAL IN THE PRODUCT/DOMAIN MODEL. ITS CURRENT PERSISTENCE REPRESENTATION IS NOT YET VERIFIED.**

The professional implementation decision at this stage is therefore:

`RECOGNIZE THE DOMAIN CONCEPT → CLOSE ITS CONTRACT → RECONCILE PERSISTENCE → ONLY THEN IMPLEMENT`

No code or database change is authorized by this document alone.
