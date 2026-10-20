# C03 — Building Lifecycle Independence and Command Boundary

**Date:** 2026-10-02  
**Status:** RECONCILIATION — OPEN / NO IMPLEMENTATION AUTHORIZATION  
**Depends on:** `17-PROJECT-BUILDING-RELATIONSHIP-ANALYSIS-2026-10-02.md`  
**Scope:** Building lifecycle independence, command boundaries, invariants, concurrency and aggregate implications.

## 1. Evidence classification

- **SOURCE-LOCKED:** directly supported by current ASAS architecture/register artifacts.
- **ENGINEERING CONSEQUENCE:** follows from source-locked rules plus explicit DDD consistency principles.
- **OPEN:** source corpus does not define the behavior sufficiently to authorize an implementation contract.
- **HISTORICAL:** prior implementation evidence retained for provenance only.

## 2. Source-locked Building facts

Current ASAS architecture establishes:

1. `Organization → Project → Building → Floor → Unit` is the canonical real-estate ontology.
2. Project and Building are master-data concepts.
3. Building has an identity of its own.
4. Project→Building is a governed semantic relationship, not proof of aggregate containment.
5. The current state-machine register defines an apartment construction status whose progression is driven by `milestone.certified` events **per building**; it does not define a Building lifecycle state machine.
6. Unit commercial and construction state are not established as Project or Building lifecycle state.

The current source set therefore proves Building identity and domain significance, but does not provide a complete Building lifecycle contract.

## 3. Lifecycle-independence test

| Question | Evidence | Decision |
|---|---|---|
| Can Building have its own identity? | Project/Building relationship analysis + master-data classification | **LOCKED: YES** |
| Can Building exist without a Project? | No source defines orphan Building semantics or minimum Project cardinality | **OPEN** |
| Can Project exist with zero Buildings? | No minimum-cardinality invariant is source-locked | **OPEN** |
| Can Building move Project→Project? | No supported transfer capability is specified | **OPEN / NOT AUTHORIZED** |
| Can Building be archived independently? | No Building lifecycle/archive policy exists | **OPEN** |
| Can Project archive while Buildings remain active? | Project archive review prohibits inferred cascade but does not define eligibility | **OPEN** |
| Can Building be created before Project publication? | Project publication is distinct from Project domain lifecycle, but Building timing is not explicitly specified | **OPEN** |
| Does Building lifecycle control Unit lifecycle? | No; Unit has its own commercial/construction state model | **LOCKED: NO direct lifecycle inheritance** |
| Does Building construction progress directly become Building lifecycle? | No Building state machine is defined | **LOCKED: NO inference** |

Important distinction: **identity independence is established; lifecycle independence is not yet fully established.**

## 4. Aggregate test

DDD guidance defines an aggregate around transactional consistency and invariants, not around an object hierarchy. Aggregates should contain only the state that must remain consistent within the transaction; independent lifecycles are evidence against forcing objects into one aggregate. urlMicrosoft Learn — Tactical DDD aggregateshttps://learn.microsoft.com/en-ca/azure/architecture/microservices/model/tactical-ddd

Applying that test to current ASAS evidence:

- No invariant has been found that requires every Project mutation and every Building mutation to be atomic.
- Building construction observations already operate per building while apartment construction state is tracked separately.
- Unit commercial state, reservation, contract and finance are explicitly downstream consistency boundaries and must not be absorbed into Project merely because Building sits in the ontology.

**Current decision:** the evidence is insufficient to declare `Project + Building` one aggregate. Keep the aggregate boundary **OPEN**.

## 5. Command boundary analysis

### 5.1 Create Building

**Candidate command:** `CreateBuilding`

Required conceptual inputs:

- actor/authorization context;
- tenant/organization context;
- target Project identity;
- Building identity data;
- audit reason where required.

Required checks are currently candidates, not a locked contract:

- actor may create Building in the target organization;
- target Project exists and is tenant-compatible;
- Building identity is valid and unique within the applicable scope;
- creation does not create an invalid downstream topology.

**Transaction boundary:** OPEN. Do not infer Project aggregate transaction.

### 5.2 Attach Building to Project

**Candidate command:** `AttachBuildingToProject`

This must remain distinct from generic CRUD until the domain confirms whether creation and association are one business operation.

**Transaction boundary:** OPEN.

### 5.3 Amend Building

**Candidate command:** `AmendBuilding`

A Building's own descriptive/master-data attributes may plausibly be amended independently, but the authoritative attribute set and invariant catalogue are not yet closed.

**Decision:** independent mutation is a viable architectural candidate; no final contract yet.

### 5.4 Archive Building

**Candidate command:** `ArchiveBuilding`

No authoritative Building archive semantics exist.

Therefore:

- no hard delete;
- no automatic cascade to Floors or Units;
- no automatic cancellation of reservations/contracts;
- no automatic removal of public publication;
- no automatic restore semantics.

**Status:** OPEN.

### 5.5 Move Building

**Candidate command:** `TransferBuilding` / `MoveBuilding`

No current requirement or authoritative contract establishes this capability.

**Decision:** NOT AUTHORIZED. A future transfer would require explicit source/target authorization, downstream dependency policy, audit, events/outbox and failure/compensation semantics.

### 5.6 Add Unit / Remove Unit

The existence of a `Building → Unit` ontology relationship does not make Unit a child entity of the Project or Building aggregate.

Unit is already represented by independent commercial/construction behavior in the current architecture. Therefore:

- `AddUnitToBuilding` remains a candidate domain/application operation;
- `RemoveUnitFromBuilding` must not imply deletion of a Unit;
- any removal/detachment semantics are OPEN until Unit lifecycle and inventory ownership are fully reconciled.

## 6. Invariant classification

| Invariant / rule | Classification | Current status |
|---|---|---|
| Building belongs to a Project in the canonical ontology | Domain relationship | LOCKED |
| Project and Building are tenant/organization scoped | Authorization/tenancy | LOCKED conceptually |
| Building has independent identity | Domain identity | LOCKED |
| Project and Building must mutate atomically | Aggregate invariant | NOT PROVEN / OPEN |
| Project must contain ≥1 Building | Cardinality invariant | OPEN |
| Building must contain ≥1 Unit | Cardinality invariant | OPEN |
| Building can move between Projects | Capability/policy | OPEN / NOT AUTHORIZED |
| Building archive cascades to Units | Lifecycle policy | NOT AUTHORIZED |
| Project archive cascades to Buildings | Lifecycle policy | NOT AUTHORIZED |
| Building state determines Unit commercial state | Cross-domain invariant | NOT PROVEN |
| Building construction milestone drives apartment construction state | Existing workflow rule | SOURCE-LOCKED via state register |

## 7. Concurrency analysis

Relevant concurrent operations include:

- Project metadata amendment while Building metadata is amended;
- multiple Buildings amended under the same Project;
- Building amendment while Units are being updated;
- Building construction milestone certification while inventory/sales activity continues;
- Unit reservation while Building-level construction information is updated.

No current evidence requires these operations to share one lock/transaction boundary.

**Engineering consequence:** do not enlarge the Project aggregate merely to make concurrent updates appear hierarchically atomic. If a future invariant requires atomicity, that invariant must be explicitly recorded and then used to justify the boundary.

## 8. Event implications

Current evidence supports the following distinction:

- A Building mutation may produce a domain event if and when the command/event contract is closed.
- Downstream consumers should not be assumed to receive a synchronous distributed transaction.
- Unit, Sales, Finance, Studio and Analytics reactions should be modeled as projections/policies/events according to their own consistency needs.

No canonical event names are invented here.

## 9. Cross-domain red-team findings

### Failure: Project archive while Building has active Units

Current architecture does not authorize cascade archive. The operation must therefore be blocked or handled by an explicitly defined policy; exact eligibility remains OPEN.

### Failure: Building moved while Unit has active Reservation

No move capability is authorized. A future transfer must explicitly define the effect on dependent inventory and sales records.

### Failure: duplicate event delivery

Any future Building event consumer must be idempotent under the platform event/outbox architecture. Exact consumer contracts remain OPEN.

### Failure: tenant mismatch

A Project/Building relationship cannot cross tenant/organization scope without an explicitly authorized cross-boundary workflow. Current transfer semantics are not authorized.

### Failure: historical data violates future Building invariants

Historical implementation is evidence, not authority. Migration/repair behavior must be defined during the later persistence reconciliation and cannot be inferred now.

## 10. Current architectural position

### LOCKED

- `Project → contains → Building` is canonical ontology.
- Project and Building are master-data concepts.
- Building has its own identity.
- Identity independence does not imply lifecycle or aggregate independence.
- No Project+Building aggregate is established.
- No Building lifecycle state machine is established.
- No Building transfer capability is authorized.
- No destructive/cascade semantics are authorized from hierarchy alone.
- Unit commercial/construction behavior remains a downstream consistency concern.

### OPEN

- Building lifecycle/state model.
- Minimum cardinality rules.
- Exact Create/Attach command contract.
- Exact Building amendment invariants.
- Archive eligibility and restore semantics.
- Detach/remove semantics.
- Move/transfer semantics if a business requirement is later confirmed.
- Building event contract.
- Persistence constraints after domain closure.
- Final aggregate boundary decision.

## 11. Closure gate

This stage is **NOT CLOSED**.

The next required work is:

1. reconcile Building with Floor/Unit ownership;
2. reconcile Building with Inventory availability and pricing;
3. reconcile Building with Construction milestone semantics;
4. reconcile Building with Studio/publication and Documents/Media;
5. perform a Project/Building red-team concurrency pass;
6. produce the aggregate-boundary decision only after those dependencies are evidenced.

No schema, ORM, migration, API or production implementation is authorized by this document.
