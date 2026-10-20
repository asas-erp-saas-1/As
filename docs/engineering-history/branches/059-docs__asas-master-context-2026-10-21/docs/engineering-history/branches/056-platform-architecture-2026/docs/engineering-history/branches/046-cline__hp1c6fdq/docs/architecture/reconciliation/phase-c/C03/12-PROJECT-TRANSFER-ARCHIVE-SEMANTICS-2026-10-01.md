# C03 — Project Transfer & Archive Semantics

**Date:** 2026-10-01
**Status:** RECONCILIATION — OPEN
**Scope:** Project transfer and archive only

## Evidence hierarchy used

Current V3 is the architectural authority. Historical implementation material is evidence, not an override. Production/runtime reality remains authoritative once implementation begins. No implementation decision is authorized by this document alone.

## 1. Archive

### Source-supported facts

The historical implementation specification uses `archivedAt` on the Project record and states a cross-cutting soft-delete rule: no hard DELETE in application code; archival is represented by nullable `archivedAt`. Erasure is treated separately as anonymization with transactional history retained. fileciteturn310file1L144-L146

The historical Project schema also contains `archivedAt`, while Units and Listings independently contain their own `archivedAt`. fileciteturn310file8L688-L706 fileciteturn310file9L710-L739

### Decision

**Project archival is a governed Project mutation candidate, not a cascade-delete operation.**

Archiving Project must not silently archive or delete Buildings, Units, Reservations, Contracts, Payments, Documents, or historical evidence merely because they reference the Project.

A future Archive Project command must therefore distinguish:

1. Project operational availability;
2. public publication/projection state;
3. dependent inventory state;
4. transactional/history retention;
5. document retention;
6. audit/evidence retention.

These are different concerns.

### Still OPEN

The exact preconditions for archival are not sufficiently specified in the current sources. In particular, the sources do not prove whether a Project with active Units, Reservations, Contracts, or financial obligations may be archived, nor whether archival should be blocked, allowed with restrictions, or require approval.

Therefore no Project archive state machine is declared here.

## 2. Transfer

### Source-supported facts

V3 defines the tenant hierarchy as Platform → Organization → Company → Branch → Team → User and requires tenant isolation across database, cache, search, storage, events, jobs, analytics, AI memory, logs and integrations. fileciteturn309file6L903-L936

Historical implementation material instead uses `Agency` as the tenant and places `agencyId` on Project, Unit and other records. fileciteturn310file0L15-L27 fileciteturn310file8L688-L706

### Decision

**Project transfer is NOT an ordinary Project field update.**

Changing the tenant/organization ownership boundary of a Project would potentially affect every tenant-scoped dependent record and every derived subsystem. Therefore a future transfer operation must be treated as a governed cross-boundary workflow, not as `UPDATE project SET organization_id = ...`.

At minimum, a transfer design must account for:

- authorization of source and target organizations;
- tenant boundary enforcement;
- dependent Buildings/Units;
- active Inventory and Sales records;
- Reservations and Contracts;
- Finance and Commission references;
- Documents/Media/Knowledge;
- Events and outbox records;
- audit lineage;
- search/read models;
- analytics and attribution;
- integrations and external references;
- rollback/failure handling.

### Critical distinction

**Project transfer is not proven to be supported by the current ASAS domain model.**

We therefore do not invent a `TransferProject` command or transfer event yet.

The correct current state is:

`SUPPORTED? = OPEN`

`SEMANTICS = GOVERNED CROSS-BOUNDARY OPERATION IF SUPPORTED`

## 3. Red-team findings

### Finding A — archive cascade ambiguity

The historical schema's independent `archivedAt` fields mean a Project archive cannot be assumed to cascade to Units. Doing so would create an undocumented domain rule.

### Finding B — tenant terminology drift

Historical `Agency/agencyId` is materially different from current V3 `Organization` terminology. The historical schema cannot be copied into the V3 target as authority. The V3 architecture explicitly requires tenant isolation beyond the database. fileciteturn309file6L903-L936

### Finding C — publication is separate

V3's ontology contains `publish_project`, but the ontology is explicitly not a second database and publication is a projection concern. Therefore `published` cannot be used as evidence for a Project aggregate lifecycle. fileciteturn309file5L672-L678 fileciteturn309file5L749-L777

### Finding D — history must survive

V3 requires evidence, auditability and traceability; the historical implementation explicitly uses archival rather than routine physical deletion. A Project archival operation must preserve the historical trail.

## 4. Current decisions

| Question | Status | Decision |
|---|---|---|
| Is Project hard-deleted? | LOCKED | No ordinary hard delete |
| Is archive the same as public unpublish? | LOCKED | No |
| Does archive automatically archive Units? | OPEN | Not proven |
| Does archive automatically archive Buildings? | OPEN | Not proven |
| Can active transactions survive Project archive? | OPEN | Business/legal policy required |
| Is Project transfer supported? | OPEN | Not established |
| Is transfer a simple FK update? | LOCKED | No |
| Must transfer preserve audit/evidence? | LOCKED | Yes |
| Must transfer preserve tenant isolation? | LOCKED | Yes |
| Is transfer an ordinary Project command? | LOCKED | No; if supported, it is a governed cross-boundary operation |

## 5. Impact on Aggregate Boundary

These findings do **not** prove that Project + Building form one aggregate.

They strengthen a different conclusion: Project lifecycle/ownership operations may require **domain/application workflows spanning multiple aggregates and contexts** without requiring those objects to share one aggregate boundary.

Therefore:

**Project Aggregate Root remains OPEN.**

## 6. Required next step

Run the C03 red-team cross-domain test against:

`Core → Inventory → Sales → CRM → Finance → Studio → Documents`

with special attention to:

- active transactions during archive;
- tenant/organization transfer;
- external references;
- publication/read-model consistency;
- audit/outbox ordering;
- rollback and partial failure.

Only after that review may the Project aggregate boundary be closed or explicitly rejected.
