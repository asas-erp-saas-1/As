# C2-001 Traceability Matrix

Status: DERIVED / NOT CANONICAL
Owner: Foundation Architecture

## Purpose

Provide a deterministic traceability contract for reconciling context/module decomposition before implementation. This document does not choose a winner and must not be used as an implementation authority until the required architectural decision is accepted and its source status is verified.

## Authority order

1. Explicitly approved/source Blueprint artifacts and their authority rules.
2. The authoritative Domain Model v2 / Context Map v2 artifact, once its approval/version status is directly evidenced.
3. The implementation specification as an implementation-design source.
4. Repository summaries and AGENTS.md as operational guidance; conflicts are recorded, not silently normalized.
5. Generated/derived registers are shadows and cannot override their source.

## Important source-status finding

The current searchable copy of `ASAS_Enterprise_Domain_Model` is headed `Status: Draft — for stakeholder review before Phase 2 begins` and dated July 21, 2026. It explicitly says Sections 3 and 4 require stakeholder review before Phase 2 and lists 14 contexts in the displayed context table (Lead & CRM through Reporting & Analytics). The Master Roadmap, however, describes `Phase 1.5 — Enterprise Domain Model` as `Approved (v2)` and states that its deliverables are `Domain Model v2 (15 bounded contexts)` and `Context Map v2`.

Therefore the previous claim that the retrieved Domain Model file itself is an approved 15-context authority is NOT yet proven by that file. The repository must identify the exact approved v2 artifact/version before C2-001 can be closed.

This is a provenance/version reconciliation issue, not permission to choose 9 or 15 by assumption.

## Required trace chain

Every affected object must be traceable as:

`Context → Module → Aggregate → Schema → Command/Interface → Event → Permission → State Machine → Task → Acceptance Evidence`

A mapping may be marked `CONFIRMED`, `DERIVED`, `CONFLICTING`, `UNVERIFIED`, or `NOT_APPLICABLE`.

## Current source observations

| Source | Observation | Status |
|---|---|---|
| `AGENTS.md` | Nine bounded contexts; Scheduling described within CRM-oriented guidance | CONFLICTING / likely summary drift; exact source version required |
| `ASAS_Enterprise_Domain_Model` retrieved copy | Draft document; displayed table contains 14 contexts | CONFLICTING with roadmap claim of approved v2 / 15 contexts |
| `ASAS_Master_Roadmap` | Phase 1.5 described as Approved (v2), with Domain Model v2 + Context Map v2 and 15 bounded contexts | AUTHORITATIVE ROADMAP CLAIM; exact approved artifact still required |
| `ASAS_Master_Implementation_Specification` | 15 implementation modules and 15 PostgreSQL schemas | IMPLEMENTATION-DESIGN SOURCE; not by itself proof of bounded-context approval |

## Domain-model contexts evidenced in the retrieved file

1. Lead & CRM
2. Property & Inventory
3. Visit Management
4. Reservation & Contract
5. Payment & Finance
6. Commission & Payout
7. Communication
8. Identity & Access
9. Notification
10. Document & Attachment
11. Activity, Timeline & Audit
12. Search
13. Reporting & Analytics

The retrieved file also classifies future AI / Intelligence as a supporting future concern in its strategic classification, but the displayed bounded-context table does not establish it as a separate context. Do not silently convert that future subdomain into a context.

## Implementation modules evidenced in the implementation specification

The implementation specification explicitly defines 15 modules / 15 database schemas, including `collaboration`, `calendar_scheduling`, `activity_audit`, `search`, `reporting`, and `workflow_engine`. This is an implementation decomposition and must be reconciled against the approved domain model rather than treated as automatic context identity.

## Mapping rules

### Context → Module

- Do not assume one-to-one cardinality.
- A bounded context may map to one or more implementation modules only when the approved domain model and module contract support it.
- A module must not span independent aggregate ownership boundaries without an explicit architectural decision.

### Module → Schema

- Schema ownership must be explicit.
- Documentation claims about live schemas are not runtime evidence.
- No migration or database change may be generated from this matrix.

### Aggregate → Event

- Each domain event must have an identifiable owner/publisher.
- Consumers do not acquire ownership of the source aggregate merely by subscribing.

### Permission → Context/Module

- Preserve canonical permission vocabulary.
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
| Context count/decomposition | CONFLICTING | Exact approved Domain Model v2 + Context Map v2 artifact/version |
| Module decomposition | DERIVED | Implementation specification + accepted architecture decision |
| Aggregate ownership | UNVERIFIED | Approved domain-model trace |
| Schema ownership | UNVERIFIED | Schema contract trace; not live DB inference |
| Events | DERIVED | Event register cross-reference |
| Permissions | DERIVED | Permission register cross-reference |
| State machines | DERIVED | State-machine register cross-reference |
| Tasks | DERIVED | Full task-register coverage |
| Acceptance evidence | UNVERIFIED | Task packet / gate evidence |

## Prohibited actions while OPEN

- Do not select 9 or 15 as canonical by count alone.
- Do not treat the retrieved Draft domain-model copy as the approved v2 artifact.
- Do not rewrite source registers to fit code.
- Do not create migrations.
- Do not alter the database.
- Do not claim live runtime verification.
- Do not authorize Claude to implement tasks whose architecture boundary depends on unresolved C2-001.

## Closure criteria

C2-001 may be marked CLOSED only when:

1. The exact approved Domain Model v2 and Context Map v2 artifacts are identified and versioned.
2. Conflicting source claims are explicitly recorded.
3. The canonical context interpretation is recorded in an accepted ADR or approved contract.
4. Every affected task is traced.
5. Every affected register reference is reconciled.
6. Security/tenant ownership is assigned.
7. Verification requirements are updated.
8. The checkpoint records the accepted decision and evidence.

Until then, this matrix is a control artifact, not an implementation specification.
