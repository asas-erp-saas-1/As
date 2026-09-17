# C2-001 Traceability Matrix

Status: DERIVED / NOT CANONICAL
Owner: Foundation Architecture

## Purpose

Provide a deterministic traceability contract for reconciling the conflicting context/module decompositions before implementation. This document does not choose a winner and must not be used as an implementation authority until the required ADR is accepted.

## Authority order

1. Approved/source Blueprint artifacts and their explicit authority rules.
2. Approved Domain Model v2 / Context Map v2 where explicitly identified as approved.
3. Implementation specification as an implementation-design source.
4. Repository summaries and AGENTS.md as operational guidance; conflicts must be recorded rather than silently normalized.
5. Generated/derived registers are shadows and cannot override their source.

## Required trace chain

Every affected object must be traceable as:

`Context → Module → Aggregate → Schema → Command/Interface → Event → Permission → State Machine → Task → Acceptance Evidence`

A mapping may be marked `CONFIRMED`, `DERIVED`, `CONFLICTING`, `UNVERIFIED`, or `NOT_APPLICABLE`.

## C2-001 source observations

| Source | Observation | Status |
|---|---|---|
| `AGENTS.md` | Nine bounded contexts; Scheduling described as a CRM submodule | CONFLICTING |
| `ASAS_Master_Implementation_Specification` | Fifteen modules / fifteen database schemas | CONFLICTING |
| Domain Model v2 | Fifteen bounded contexts / Context Map v2 | SOURCE-DEPENDENT; verify exact artifact/version before canonical promotion |

## Mapping rules

### Context → Module

- Do not assume one-to-one cardinality.
- A bounded context may contain one or more implementation modules only when the approved domain model and module contract support it.
- A module must not span two independent aggregate ownership boundaries without an explicit architectural decision.

### Module → Schema

- Schema ownership must be explicit.
- Documentation claims about live schemas are not runtime evidence.
- No migration or database change may be generated from this matrix.

### Aggregate → Event

- Each domain event must have an identifiable owner/publisher.
- Consumers do not acquire ownership of the source aggregate merely by subscribing.

### Permission → Context/Module

- Preserve the canonical permission vocabulary.
- Do not invent permissions to make a mapping appear complete.

### State Machine → Aggregate

- Every lifecycle state machine must identify the aggregate/process that owns its transition authority.
- Direct status mutation remains prohibited where the state-machine contract requires transition commands.

### Task → Architecture

For every task affected by C2-001, record:

- task ID
- source locator
- context/module dependency
- aggregate dependency
- schema dependency
- event dependency
- permission dependency
- state-machine dependency
- acceptance evidence dependency
- gate impact

## Reconciliation status

| Domain | Current status | Required evidence before CANONICAL |
|---|---|---|
| Context count/decomposition | CONFLICTING | Approved Domain Model v2 exact source + reconciliation |
| Module decomposition | DERIVED | Implementation specification + accepted architecture decision |
| Aggregate ownership | UNVERIFIED | Domain model trace |
| Schema ownership | UNVERIFIED | Schema contract trace; not live DB inference |
| Events | DERIVED | Event register cross-reference |
| Permissions | DERIVED | Permission register cross-reference |
| State machines | DERIVED | State-machine register cross-reference |
| Tasks | DERIVED | Full task register coverage |
| Acceptance evidence | UNVERIFIED | Task packet / gate evidence |

## Prohibited actions while OPEN

- Do not select 9 or 15 as canonical by count alone.
- Do not rewrite source registers to fit code.
- Do not create migrations.
- Do not alter the database.
- Do not claim live runtime verification.
- Do not authorize Claude to implement tasks whose architecture boundary depends on unresolved C2-001.

## Closure criteria

C2-001 may be marked CLOSED only when all of the following are true:

1. Conflicting sources are explicitly cited.
2. The canonical interpretation is recorded in an accepted ADR or approved contract.
3. Every affected task is traced.
4. Every affected register reference is reconciled.
5. Security/tenant ownership is assigned.
6. Verification requirements are updated.
7. The checkpoint is updated with the accepted ADR and evidence.

Until then, this matrix is a control artifact, not an implementation specification.
