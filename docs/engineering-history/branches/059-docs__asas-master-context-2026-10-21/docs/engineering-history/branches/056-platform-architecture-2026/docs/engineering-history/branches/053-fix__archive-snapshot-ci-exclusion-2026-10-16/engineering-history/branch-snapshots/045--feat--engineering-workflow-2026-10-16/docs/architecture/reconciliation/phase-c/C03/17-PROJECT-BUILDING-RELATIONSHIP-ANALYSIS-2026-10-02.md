# C03 — Project ↔ Building Relationship Analysis

**Date:** 2026-10-02
**Status:** RECONCILIATION — OPEN
**Scope:** Project-to-Building relationship only. No implementation authorization.

## 1. Source facts

V3 defines the real-estate hierarchy as:

```text
Organization
  ↓
Project
  ↓
Building
  ↓
Floor
  ↓
Unit
```

V3 also explicitly represents the ontology relationship as:

```text
Project → contains → Building
Building → contains → Floor
Floor → contains → Unit
```

Project and Building are both classified as master data. The ontology is a governed representation over authoritative domain records, not a second database.

## 2. What the hierarchy proves

The source establishes a canonical domain relationship:

**A Building belongs under a Project in the real-estate model.**

It does NOT, by itself, establish:

- that Building is an entity physically contained inside a Project aggregate;
- that Project and Building must mutate in one database transaction;
- that deleting/archiving a Project must cascade to Buildings;
- that Building cannot ever be moved between Projects;
- that Building lifecycle is controlled by Project lifecycle;
- that Project is the sole owner of every Building mutation.

Those are separate architectural questions.

## 3. Historical implementation evidence

Historical ASAS material contains a Project/Apartment relationship and a nullable Building reference on the apartment model. It also contains cascade behavior on the historical Project relationship. This is implementation evidence only and is NOT treated as V3 architecture authority.

Therefore historical `onDelete: Cascade`, nullable `buildingId`, or similar ORM behavior must not be promoted into a V3 domain invariant without an explicit reconciliation decision.

## 4. Building as master data

V3 classifies both Project and Building as master data. This supports treating Building as a durable domain object rather than as a UI grouping or a disposable child record.

The current source set does not provide a canonical Building lifecycle or a Project→Building transactional command contract.

## 5. Relationship semantics

Current canonical semantic relationship:

```text
Project --contains--> Building
```

Interpretation:

- Project is the contextual parent in the real-estate ontology.
- Building has an authoritative identity of its own.
- The relationship is tenant/organization scoped.
- Unit/Floor transactional boundaries remain downstream and must not be inferred from this relationship alone.

## 6. Add Building

`Add Building to Project` is a candidate application/domain operation.

Current evidence proves the relationship but does not prove a Project aggregate transaction.

Candidate checks before authorization:

1. caller has permission to create/associate Building;
2. target Project exists and is within the same authorized tenant boundary;
3. Building identity is valid;
4. Building is not already associated incompatibly;
5. no protected downstream relationship is silently broken;
6. mutation is audited;
7. resulting relationship is reflected in required read models/events.

These checks are not yet a finalized command contract.

## 7. Remove Building

`Remove Building from Project` is materially more dangerous than Add.

The source does not define whether removal means:

- delete Building;
- archive Building;
- detach Building;
- transfer Building;
- mark relationship invalid.

Therefore **no destructive meaning is authorized**.

If a Building has Floors/Units or downstream transactions, removal must not silently destroy or invalidate those records.

## 8. Move Building

A Project-to-Project move is **not currently established as a supported capability**.

Do not implement a generic `UPDATE building.project_id` transfer workflow merely because the schema can technically represent it.

If future requirements require movement, it must be a separately governed operation with explicit ownership, authorization, dependent-data, audit, event, and read-model semantics.

## 9. Aggregate boundary analysis

Current evidence does not prove:

```text
Project Aggregate
  └── Building child entity
```

The safer architectural statement is:

```text
Project        = canonical master-data object
Building       = canonical master-data object
Project→Building = governed domain relationship
```

Whether Project and Building share an aggregate boundary remains OPEN until a concrete invariant requires atomic mutation of both.

## 10. Cross-domain test

The relationship must not absorb unrelated consistency boundaries:

```text
Building
  ↓
Floor
  ↓
Unit
  ↓
Reservation / Contract / Payment
```

V3 separately establishes Reservation as a critical consistency boundary and Finance as a separate integrity domain. Therefore Project→Building containment cannot be used to collapse those boundaries.

## 11. Current decision

**LOCKED:**

- Project→Building is a canonical semantic relationship.
- Project and Building are both master-data objects.
- Building has independent identity.
- Ontology containment does not imply aggregate containment.
- Historical ORM cascade behavior is not V3 authority.
- Remove/Move semantics are not authorized without explicit contracts.

**OPEN:**

- Project aggregate root status.
- Building aggregate root/boundary status.
- Add Building command contract.
- Remove/Detach semantics.
- Move/Transfer capability.
- Building lifecycle.
- Project/Building event contracts.
- Exact persistence constraints.

## 12. Closure gate

C03 Project cannot close solely from the hierarchy.

Before closure, the project/building relationship must be reconciled with:

- Building domain model;
- Floor/Unit ownership;
- Inventory availability;
- Studio publication;
- Documents/media;
- Construction tracking;
- tenant/RLS policy;
- audit/outbox/event contracts;
- archive/restore policy.

No schema, ORM mapping, API contract, migration, or destructive cascade may be inferred from this document alone.
