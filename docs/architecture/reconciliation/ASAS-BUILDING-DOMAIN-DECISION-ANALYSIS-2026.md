# ASAS — Building Domain Decision Analysis 2026

**Artifact ID:** ASAS-ARCH-DECISION-BUILDING-2026-001  
**Status:** ANALYSIS COMPLETE / CONTRACT REMAINS OPEN  
**Branch:** `platform-architecture-2026`  
**Scope:** Q1 Building Contract Closure  
**Authority:** Derived architecture analysis; does not authorize schema or runtime implementation.

## 1. Decision question

Determine the strongest defensible DDD classification for `Building` before persistence design:

- bounded context;
- module;
- aggregate root;
- entity within another aggregate;
- structural/reference entity;
- read model.

The analysis must not infer domain boundaries from table shape.

## 2. Evidence reviewed

### Product authority

`docs/product/PRODUCT_TRUTH.md` explicitly places the promoter portfolio hierarchy at `projects → buildings → units` and requires the exact commercial/legal representation to follow validated domain contracts rather than UI invention.

### Canonical lifecycle

`docs/governance/CORE-LIFECYCLE-CANONICAL-MAP.md` assigns `Project / building / unit inventory` to `Real Estate / Inventory` and states that lifecycle edges remain blocked when their contract semantics are unknown.

### Architecture blueprint

`docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` establishes that an entity does not automatically become an aggregate and an aggregate does not automatically become a table. It also places Project/Building/Unit in the Real Estate Core while keeping implementation boundaries evidence-driven.

### Aggregate register

`docs/architecture/ASAS-AGGREGATE-INVARIANT-BOUNDARY-REGISTER-2026.md` lists `Project` as SUPPORTED, `Building` as OPEN with ownership currently `Inventory / ownership TBD`, and `Unit` as SUPPORTED with the critical reservation-concurrency boundary.

### State machine register

`registers/state-machines.json` contains commercial and construction state machines for `apartment`, not an independent Building state machine. The construction machine is driven by `milestone.certified` events per building while the aggregate target remains `apartment.construction_status`.

### Context coverage

`docs/governance/CONTEXT-CAPABILITY-COVERAGE-MATRIX.md` assigns Projects / Buildings / Units to the Real Estate context and requires contract, permissions, state, events, data boundary and verification before READY status.

## 3. Findings

### F1 — Bounded context

**Decision:** Building belongs semantically to the **Real Estate / Inventory** capability boundary.

**Confidence:** SUPPORTED.

There is no evidence that Building is its own bounded context. Product, lifecycle and coverage artifacts consistently group Project / Building / Unit inventory together.

### F2 — Implementation module

**Decision:** Building should initially be implemented inside the **Real Estate / Inventory module boundary**, not as an independent deployable or microservice.

**Confidence:** SUPPORTED target direction.

This follows the modular-monolith rule and the existing Real Estate ownership evidence. It does not prevent later extraction if measured operational evidence requires it.

### F3 — Domain object classification

**Decision:** Building should be modeled as a **domain Entity candidate with durable identity**, not as a value object or read-only projection.

**Confidence:** CANDIDATE.

Reasoning: the product requires buildings to persist as identifiable structural members of a promoter/project portfolio; the concept has relationships to Units and construction aggregation. A display name alone is not sufficient identity. However, the authoritative identity/uniqueness contract is still open.

### F4 — Aggregate-root classification

**Decision:** **Do not promote Building to an independent Aggregate Root at this stage.**

**Confidence:** ARCHITECTURAL RECOMMENDATION / OPEN.

The evidence does not identify a Building-specific consistency invariant that must be transactionally protected independently from Project/Unit. The strongest current model is therefore:

`Real Estate context → Project / Building structural entity → Unit aggregate`

rather than `Building` as an independently authorized aggregate root.

This is deliberately a conservative DDD boundary. It can be promoted later if an explicit invariant, command set, authorization boundary, concurrency requirement, or lifecycle requires Building-level consistency.

### F5 — Project relationship

**Decision:** A Building belongs to exactly one Project in the initial target model.

**Confidence:** SUPPORTED by current product hierarchy, but cardinality remains contract-level OPEN until explicit schema/domain evidence closes it.

No evidence currently supports a Building belonging simultaneously to multiple Projects.

### F6 — Floor relationship

**Decision:** Floor is a structural sub-level that may mediate the physical hierarchy:

`Project → Building → Floor → Unit`

but it is not currently authorized as a separate aggregate boundary.

**Confidence:** SUPPORTED structural model / persistence OPEN.

### F7 — Unit ownership

**Decision:** Unit remains the primary inventory/commercial consistency boundary for availability, pricing and reservation-sensitive state.

**Confidence:** SUPPORTED.

This follows the aggregate register and state-machine register. Building provides structural grouping; it does not own the Unit's reservation race.

### F8 — Construction semantics

**Decision:** Building may be a **construction aggregation scope** without becoming the construction state-machine aggregate.

The registered construction state machine remains `apartment.construction_status`, with milestone events operating per building.

**Confidence:** SUPPORTED by current register evidence.

### F9 — Tenant ownership

**Decision:** Building must be tenant-scoped, but the exact physical persistence of the tenant key remains OPEN.

The target authorization hierarchy must prevent cross-tenant access. Whether Building stores a direct tenant/organization reference or derives it through Project must be decided by the tenancy/data contract after schema reconciliation.

### F10 — Identity and uniqueness

**Decision:** No natural key is authorized yet.

Candidates such as `project_id + code` are design candidates only. `name` must not be treated as durable identity without explicit domain evidence.

## 4. Resulting provisional model

```text
Real Estate / Inventory context
        │
        ├── Project aggregate
        │      │
        │      └── Building entity (structural)
        │              │
        │              └── Floor structural level (if required)
        │                       │
        │                       └── Unit aggregate
        │
        └── Unit commercial/construction state
               ├── availability
               └── construction_status
```

This diagram is a domain hypothesis, not a schema instruction.

## 5. What this analysis rules out

Until contrary evidence appears, implementation must NOT:

- create a Building microservice;
- create Building-specific event streams;
- create a Building state machine merely because buildings have construction milestones;
- move Unit reservation ownership to Building;
- invent Building permissions;
- invent Building API endpoints;
- infer a natural key from UI naming;
- create a `buildings` table solely because the domain concept exists.

## 6. Remaining closure questions

Q1 cannot yet be marked CLOSED. The following remain evidence gates:

| ID | Question | Status |
|---|---|---|
| BLD-01 | authoritative Building definition | SUPPORTED / needs canonical home-chapter confirmation |
| BLD-02 | aggregate/entity classification | CANDIDATE — no independent aggregate root authorized |
| BLD-03 | Project → Building cardinality | OPEN |
| BLD-04 | Building → Floor → Unit semantics | SUPPORTED / persistence OPEN |
| BLD-05 | durable identity / uniqueness | OPEN |
| BLD-06 | rename semantics | OPEN |
| BLD-07 | Unit move semantics | OPEN |
| BLD-08 | archive semantics | OPEN |
| BLD-09 | tenant ownership representation | OPEN |
| BLD-10 | current repository persistence | OPEN — requires complete repository inspection |
| BLD-11 | live DB representation | BLOCKED until verified runtime identity/access |
| BLD-12 | permission mapping | OPEN |
| BLD-13 | event implications | SUPPORTED: no new Building event authorized |
| BLD-14 | verification strategy | OPEN |

## 7. Implementation gate

**Result: Q1 remains IMPLEMENTATION BLOCKED.**

The domain analysis is sufficiently mature to constrain future implementation, but not sufficiently complete to authorize schema programming.

The next evidence activity is not coding. It is **Building persistence reconciliation**:

`repository schema → migration history → references → generated clients/types → runtime/live DB when authorized → drift classification → contract update`

Only after that comparison can the team determine whether ASAS already has a valid Building representation under another name, requires a new persistence structure, or should remain structurally derived.
