# C03 — Building ↔ Floor ↔ Unit Ownership Semantics

**Date:** 2026-10-02  
**Status:** RECONCILIATION — OPEN / NO IMPLEMENTATION AUTHORIZATION  
**Depends on:** `17-PROJECT-BUILDING-RELATIONSHIP-ANALYSIS-2026-10-02.md` and `18-BUILDING-LIFECYCLE-INDEPENDENCE-AND-COMMAND-BOUNDARY-2026-10-02.md`  
**Scope:** Structural relationship semantics from Building through Floor to Unit, with explicit separation from commercial, reservation, finance, construction and publication consistency boundaries.

## 1. Evidence classification

- **SOURCE-LOCKED:** directly supported by the current ASAS V3 architecture/register evidence.
- **ENGINEERING CONSEQUENCE:** follows from source-locked facts and explicit consistency-boundary reasoning.
- **OPEN:** current source corpus does not define the behavior sufficiently to authorize a contract.
- **HISTORICAL:** prior implementation evidence retained for provenance only.
- **NOT AUTHORIZED:** behavior must not be implemented merely because it is technically representable.

## 2. Source-locked structural ontology

The canonical real-estate hierarchy is:

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

The canonical semantic relationships are:

```text
Project  --contains--> Building
Building --contains--> Floor
Floor    --contains--> Unit
```

The C03 source register explicitly identifies Project / Building / Floor / Unit research and contracts as a material source class and requires reconciliation of identity, ownership, tenancy, lifecycle, invariants, actions, events and permissions before C03 can close.

The hierarchy establishes domain topology. It does not, by itself, establish aggregate containment, destructive cascade, lifecycle inheritance or a shared transaction boundary.

## 3. Building → Floor

### 3.1 What is established

The ontology establishes that a Floor is structurally represented under a Building.

### 3.2 What is not established

Current evidence does not yet lock:

- whether Floor has an independent domain identity;
- whether Floor is master data or a subordinate structural record;
- whether Floor has its own lifecycle;
- whether Floor can exist without a Building;
- whether Building must contain at least one Floor;
- whether a Floor can be moved between Buildings;
- whether archiving a Building archives Floors;
- whether Floor mutations must be atomic with Building mutations.

### 3.3 Current architectural position

Do not model `Building → Floor` as a DDD aggregate boundary solely because the ontology uses `contains`.

Do not implement `MoveFloor`, `ArchiveFloor`, `DeleteFloor` or equivalent destructive operations until the corresponding domain semantics are explicitly closed.

## 4. Floor → Unit

### 4.1 What is established

The ontology establishes that a Unit is structurally represented under a Floor.

The broader ASAS product truth also treats apartment/unit records as independently addressable commercial/publication objects, including unit landing pages, property details, floor plans/renders and contextual conversion actions.

### 4.2 Critical distinction

Structural containment is not equivalent to commercial ownership.

A Unit participates in downstream consistency domains including, at minimum:

```text
Unit
 ├── construction state
 ├── inventory / availability
 ├── pricing
 ├── listing / publication
 ├── reservation
 ├── contract
 └── payment / finance
```

Those concerns must not be collapsed into Floor or Building merely because Unit appears below them in the real-estate hierarchy.

### 4.3 Current architectural position

`Floor → Unit` is a canonical semantic relationship, but the aggregate boundary around Unit remains OPEN.

In particular, the existence of `Building → Floor → Unit` does not authorize:

- deleting Units when a Floor is removed;
- changing Unit commercial state when a Floor changes;
- cancelling reservations when a Floor or Building changes;
- changing Unit price because Building metadata changes;
- archiving public Unit publication because structural metadata is archived;
- treating Unit as a Project child entity inside a Project aggregate.

## 5. Structural identity versus operational state

The following distinctions are required to prevent accidental coupling:

| Concept | Current position |
|---|---|
| Building identity | LOCKED independent identity |
| Floor identity | OPEN — source insufficient |
| Unit identity | Domain-significant; exact identity contract OPEN in this stage |
| Building lifecycle | OPEN |
| Floor lifecycle | OPEN |
| Unit commercial lifecycle | Exists as a downstream concern; exact lifecycle contract is outside this closure step |
| Unit construction state | Separate construction concern; must not be inferred as Building/Floor lifecycle |
| Unit inventory state | Separate consistency concern |
| Reservation state | Separate critical consistency boundary |
| Finance state | Separate integrity domain |
| Public publication | Separate read/publication concern |

## 6. Ownership tests

### 6.1 Does Building own Floor?

**Semantic answer:** Building is the structural parent in the canonical ontology.

**Aggregate answer:** OPEN.

The relationship does not prove that Floor must be physically contained inside the Building aggregate.

### 6.2 Does Floor own Unit?

**Semantic answer:** Floor is the structural parent in the canonical ontology.

**Aggregate answer:** OPEN.

Unit's commercial and operational behavior is sufficiently significant that aggregate ownership must be established through explicit invariants, not inferred from hierarchy.

### 6.3 Does Building own Unit directly?

**Ontology:** Unit is reached through `Building → Floor → Unit`.

**Aggregate:** not established.

A query path or structural hierarchy must not be converted into an aggregate ownership rule.

## 7. Cardinality analysis

No minimum cardinality is currently authorized from hierarchy alone.

Therefore the following remain OPEN:

- Project ≥ 1 Building;
- Building ≥ 1 Floor;
- Floor ≥ 1 Unit;
- Building may exist temporarily with zero Floors;
- Floor may exist temporarily with zero Units;
- Unit may be created before full structural publication.

This is particularly important for real-estate development workflows where master data can be staged before commercial publication or construction completion.

No database `CHECK`, `NOT NULL`, foreign-key cascade or application invariant should be introduced solely from assumed cardinality.

## 8. Detach / delete / archive red-team

### Scenario A — Archive Building with active Units

The hierarchy does not authorize cascading Unit archive, reservation cancellation, contract cancellation or financial reversal.

**Decision:** no inferred cascade.

### Scenario B — Remove Floor containing Units

Removing a structural relationship cannot be interpreted as deleting the Units.

**Decision:** destructive semantics OPEN / NOT AUTHORIZED.

### Scenario C — Unit has active Reservation while structural metadata changes

Structural changes must not silently mutate reservation state.

**Decision:** reservation remains its own consistency boundary.

### Scenario D — Building construction milestone changes

A building-level construction observation must not automatically become a Building lifecycle transition unless a Building state machine explicitly defines that transition.

**Decision:** no lifecycle inference.

### Scenario E — Public Unit listing depends on structural hierarchy

A structural relationship change may require a publication/read-model reaction, but it does not authorize synchronous mutation of the commercial Unit state.

**Decision:** downstream policy/event semantics remain OPEN.

## 9. Concurrency implications

Relevant concurrent operations include:

- Floor structural amendment while Unit inventory is being updated;
- Unit reservation while Building construction information changes;
- Unit price amendment while public publication is being regenerated;
- Floor/Building structural correction while an active listing is visible;
- multiple Units updated concurrently under the same Floor or Building.

No current evidence requires all these operations to share a single transaction or lock.

Engineering consequence:

> Do not enlarge the Building aggregate merely to make structural descendants appear transactionally atomic.

Atomicity must be justified by a concrete invariant.

## 10. Command boundary candidates

The following are candidate operations only:

- `CreateFloor`
- `AttachFloorToBuilding`
- `AmendFloor`
- `ArchiveFloor`
- `DetachFloor`
- `CreateUnit`
- `AttachUnitToFloor`
- `AmendUnitStructuralData`
- `DetachUnitFromFloor`

They are intentionally not finalized commands.

For Unit especially, structural commands must remain distinct from commercial commands such as inventory, pricing, reservation and contract operations until the respective bounded-context contracts are reconciled.

## 11. Event boundary implications

The hierarchy may support future domain/read-model events, but canonical event names are not invented here.

A future implementation must distinguish:

```text
Structural relationship event
        ≠
Commercial state event
        ≠
Reservation event
        ≠
Finance event
        ≠
Publication event
```

Consumers must be designed for idempotency and must not assume distributed synchronous atomicity.

## 12. Aggregate-boundary conclusion at this stage

The evidence currently supports the following model:

```text
Project
  │ semantic relationship
  ▼
Building
  │ semantic relationship
  ▼
Floor
  │ semantic relationship
  ▼
Unit
```

It does **not** yet support the stronger model:

```text
Project Aggregate
  └── Building
       └── Floor
            └── Unit
```

The second model remains unproven because no complete set of cross-level transactional invariants has been identified.

## 13. LOCKED / OPEN / NOT AUTHORIZED

### LOCKED

- Project → Building → Floor → Unit is canonical real-estate ontology.
- Building → Floor and Floor → Unit are canonical semantic relationships.
- Structural hierarchy does not automatically define DDD aggregate containment.
- Unit downstream commercial/reservation/finance behavior must not be collapsed into Building or Project.
- No destructive cascade may be inferred from `contains`.

### OPEN

- Floor identity model.
- Floor ownership semantics.
- Floor lifecycle.
- Unit exact identity contract in this track.
- Minimum cardinalities.
- Floor/Unit aggregate boundaries.
- Structural command contracts.
- Structural event contracts.
- Archive/restore/detach semantics.
- Final aggregate topology.

### NOT AUTHORIZED

- Delete Floor with Unit cascade.
- Delete Building with Floor/Unit cascade.
- Automatically cancel reservations/contracts because structural hierarchy changes.
- Automatically alter Unit price/inventory state from Building/Floor changes.
- Transfer Floor/Unit across parents without an explicit governed operation.
- Introduce schema/ORM constraints from unproven cardinality.

## 14. Next closure gate

C03 must next reconcile the structural model with the **Inventory / Availability / Pricing** domain.

Required questions:

1. Is inventory owned by Unit, Building, Project, or a separate bounded context?
2. Is availability a Unit property, a projection, or a reservation-derived state?
3. Where does authoritative pricing live?
4. Can a structural amendment affect availability?
5. What happens to inventory when a Unit is structurally detached or archived?
6. What consistency boundary protects double-booking prevention?
7. Which events are authoritative versus derived?

Only after these questions are evidenced should C03 move toward its final aggregate-boundary decision.

**No schema, ORM, migration, API or production implementation is authorized by this document.**
