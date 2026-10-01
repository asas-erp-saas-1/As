# C03 — Project Aggregate Boundary & Invariants Reconciliation

**Status:** OPEN — boundary not yet implementation-authorized  
**Date:** 2026-10-01  
**Track:** Engineering Conference / Phase C / C03  

## 1. Purpose

Determine whether `Project` is an aggregate root, what consistency rules belong inside its boundary, and which relationships must remain references to independent aggregates.

This document is an architecture reconciliation artifact. It does **not** authorize schema, ORM, migration, API, or runtime implementation.

## 2. Source authority

### Current V3 authority

V3 models `Project` as a core ontology object and master-data object in the real-estate hierarchy:

`Organization → Project → Building → Floor → Unit`

V3 also explicitly separates domain contexts from platform capabilities and treats the ontology as a governed representation over authoritative domain records.

### Historical domain-model evidence

The Enterprise Domain Model identifies `Project` as a Track A aggregate and explicitly recommends that `Unit` remain a separate aggregate referencing `ProjectId`, because multiple agents may update units concurrently. This is historical evidence and is retained; it is not silently promoted above V3.

### External engineering evidence

DDD guidance treats an aggregate as a consistency boundary whose root protects invariants; aggregate boundaries should be derived from transactional consistency needs rather than from database hierarchy alone. External references should normally point to aggregate roots, and transactions should not casually cross aggregate boundaries.

## 3. Decision record

### Decision A — Project is a domain entity / master-data object

**LOCKED.** Project is a first-class Real Estate Core object. It is not merely a UI grouping, listing, or inventory projection.

### Decision B — Unit remains independent from Project

**LOCKED at semantic level.** Unit is not to be modeled as a child collection whose every mutation requires loading/updating the entire Project. The historical ASAS domain model gives a concrete concurrency rationale for the separation.

### Decision C — Project Aggregate Root status

**OPEN.** We do not yet have enough ASAS-specific evidence to declare `Project` an aggregate root merely because it is above Building/Unit in the hierarchy.

The decisive test is whether Project owns transactional invariants that must be enforced atomically with other entities inside its boundary.

### Decision D — Building membership

**OPEN.** `Project → contains → Building` is a canonical semantic relationship, but containment alone does not prove that Building is an entity inside the same aggregate. We must establish the consistency rules governing creation, reassignment, archival, and structural changes.

### Decision E — Unit membership

**LOCKED as reference relationship.** A Unit references its Project; Project must not own Unit state transactionally. Unit commercial and construction state remain independent concerns.

## 4. Candidate Project invariants

The following are **candidates only** until business evidence proves they require Project-level transactional enforcement:

1. A Project belongs to exactly one canonical tenant/organization scope.
2. A Project has one canonical system identity.
3. A Project cannot reference an invalid tenant/organization.
4. A Project cannot be silently moved between tenants.
5. A Project's identity is not changed as a side effect of a display-name or slug change.
6. A Project cannot be hard-deleted merely because it is no longer commercially active.
7. A Project-to-Building relationship cannot create a cross-tenant link.

These are not yet sufficient to make Project an aggregate root; most can be enforced as entity/authorization/data invariants without requiring a large Project aggregate.

## 5. Rules that must NOT be placed inside Project

The following are explicitly outside the Project boundary unless later evidence proves otherwise:

- Unit availability
- Unit holds/reservations
- Unit commercial state
- Unit construction state
- Reservation race resolution
- Contract approval
- Payment collection
- Commission calculation
- Lead pipeline transitions
- Campaign attribution

Those concerns belong to their respective domain objects/contexts and should not require a Project-wide transaction.

## 6. Aggregate decision test

Before declaring Project an aggregate root, answer:

| Question | Current status |
|---|---|
| What Project-owned invariant requires atomic multi-entity transaction? | OPEN |
| Which child entities cannot be valid independently? | OPEN |
| Which command must enter through Project root? | OPEN |
| Can Building be independently modified without Project transaction? | OPEN |
| Can Project survive while Buildings/Units change independently? | Evidence strongly suggests YES |
| Does Project need optimistic concurrency independent of Unit? | OPEN |
| What events originate from Project itself? | OPEN |
| What business operation would be invalid if split across aggregates? | OPEN |

## 7. Provisional architecture

Until the above questions are closed, the safest model is:

```text
Project
  ├── canonical identity
  ├── master-data properties
  └── semantic references
        ├── Building (independent boundary — pending final proof)
        └── Unit (independent aggregate)
```

This deliberately avoids turning the hierarchy into a transactional object graph.

## 8. Required next evidence

The next C03 work item must inspect actual Project/Building operations and source decisions for:

- create project
- amend project identity
- publish project
- archive project
- add building
- remove/archive building
- transfer project responsibility
- attach/detach developer relationship
- import project from an external source
- merge/split project records
- cross-tenant access attempts

For each operation we need: actor, command, invariant, transaction boundary, event, audit requirement, and failure behavior.

## 9. Closure condition

C03 Project aggregate boundary may only be closed when:

1. the source corpus contains no unresolved conflicting Project aggregate decision;
2. the command/invariant matrix identifies the actual consistency boundary;
3. Project-vs-Building-vs-Unit ownership is explicit;
4. cross-context dependencies are reconciled;
5. no persistence design is being used as a substitute for domain reasoning;
6. an independent red-team review finds no unresolved contradiction.

**Current closure:** NOT READY.

## 10. Research note

External DDD guidance supports deriving aggregates from transactional consistency and invariants, not hierarchy alone. Martin Fowler describes the aggregate root as the integrity guardian and notes that transactions should not cross aggregate boundaries. Microsoft guidance similarly describes aggregates as consistency boundaries and recommends defining them from the transactions that must remain consistent.

These sources support the method; they do not decide ASAS's Project boundary for us.
