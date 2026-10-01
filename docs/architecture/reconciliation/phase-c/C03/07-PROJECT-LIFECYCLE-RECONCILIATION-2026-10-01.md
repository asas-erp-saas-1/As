# C03 — Project Lifecycle Reconciliation

**Status:** OPEN — semantic baseline established; no executable state machine authorized.

## 1. Question

Does the ASAS `Project` require a canonical lifecycle state machine? If yes, what states and transitions are authoritative?

## 2. Evidence hierarchy

1. ASAS Architecture V3 — current architecture authority.
2. Existing C03 source corpus and historical domain model — supporting/historical evidence.
3. External real-estate lifecycle research — contextual evidence only.
4. No implementation/schema is inferred from this document.

## 3. Current ASAS evidence

V3 defines the Real Estate Core hierarchy as:

`Organization → Project → Building → Floor → Unit`

It explicitly defines separate **Unit Commercial State** and **Unit Construction State**, but does **not** define a Project state machine or Project lifecycle enum.

Therefore the Unit lifecycle must not be copied upward onto Project.

## 4. External domain evidence

RICS describes the real-estate lifecycle as broader interlinked phases such as development, real-estate use and recovery, with stages including land, planning/design, approvals, construction, occupancy/use, operation/maintenance and redevelopment/refurbishment. This supports treating a real-estate development lifecycle as multidimensional rather than assuming one universal CRUD status.

RICS project-management material likewise treats development/feasibility, design, procurement, construction and handover as lifecycle activities. These are contextual references, not ASAS canonical states.

## 5. Decision

**Decision D-C03-PROJECT-LIFECYCLE-01:**

ASAS will **not** define a single Project lifecycle enum at this point.

Instead, Project lifecycle semantics are modeled as a future combination of governed dimensions/capabilities, subject to business evidence:

- commercial/publication availability;
- development/planning status;
- construction/progress status;
- operational/archive status;
- legal/approval readiness where required;
- data governance status.

A Project may therefore be operationally active while construction is ongoing, commercially unpublished, or legally awaiting an approval. A single scalar status would collapse materially different dimensions and create false semantics.

## 6. What is locked

- Project is a Real Estate Core master-data object.
- Project is above Building/Unit in the structural hierarchy.
- Project lifecycle is **not** the Unit commercial lifecycle.
- Project lifecycle is **not** the Unit construction lifecycle.
- No lifecycle state may be added solely because the UI needs a status badge.
- Any executable state machine requires explicit states, transition guards, actors/permissions, events, invariants, audit requirements and evidence.

## 7. What remains open

- Whether Project needs a publication state.
- Whether Project needs a development-stage state.
- Whether those states are domain states or derived views over other authoritative objects.
- Legal/approval state semantics for Algerian promotion immobilière.
- Archive/decommission semantics.
- Whether Project can be reopened after archival.
- Who can transition each dimension.
- Whether transitions emit domain events.
- Whether a state is authoritative or derived.

## 8. Rejected shortcut

Do **not** introduce an enum such as:

`DRAFT → ACTIVE → PUBLISHED → SUSPENDED → ARCHIVED`

as an ASAS canonical Project state machine yet. Historical implementation evidence may contain similar publication/archive fields, but that does not establish the V3 domain contract.

## 9. Closure condition

Project lifecycle can only be closed after a lifecycle matrix exists with:

`state/dimension → entry criteria → exit criteria → actor → authorization → invariant → event → audit → evidence → cross-domain consumers`.

Until then this item remains OPEN.
