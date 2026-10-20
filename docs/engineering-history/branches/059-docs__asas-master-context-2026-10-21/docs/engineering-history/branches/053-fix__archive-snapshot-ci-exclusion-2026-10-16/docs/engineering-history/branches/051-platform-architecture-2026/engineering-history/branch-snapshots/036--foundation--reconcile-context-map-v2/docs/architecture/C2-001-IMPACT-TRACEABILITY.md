# C2-001 — Context/Module Impact Traceability

Status: PROPOSED / DERIVED — not canonical until ADR-0001 is accepted.

## Purpose

Trace the proposed 15-module decomposition into the machine-readable contract layer without silently promoting the proposal to architecture-of-record.

## Traceability rules

For every affected task or contract, record:

- source artifact and locator;
- permanent ID;
- proposed module/context owner;
- aggregate owner;
- schema owner;
- commands and events touched;
- permission keys and tenant scope;
- synchronous dependencies;
- asynchronous subscriptions/publications;
- worker/process owner;
- acceptance evidence;
- unresolved conflicts.

A missing mapping is `UNMAPPED`, not an inferred mapping. A conflict is `CONFLICT`, not a best-effort merge.

## Candidate module-to-contract coverage

| Module | Primary contract domains | Primary state/lifecycle domains | Event/side-effect domains | Status |
|---|---|---|---|---|
| M01 Lead & CRM | lead, client, pipeline, activity-facing CRM contracts | Lead lifecycle | lead/client/activity events | PROPOSED |
| M02 Property & Inventory | project, building, unit, listing, pricing, availability | inventory/availability | project/unit/listing events | PROPOSED |
| M03 Visit Management | visit and outcome contracts | visit lifecycle | visit events | PROPOSED |
| M04 Reservation & Contract | reservation, contract, signature contracts | reservation/contract lifecycle | reservation/contract events | PROPOSED |
| M05 Payment & Finance | schedule, installment, payment, receipt, balance contracts | payment/collection lifecycle | payment/finance events | PROPOSED |
| M06 Commission & Payout | commission rule/record contracts | commission lifecycle | commission/payout events | PROPOSED |
| M07 Communication | communication log and provider-dispatch contracts | delivery lifecycle where applicable | outbound/inbound communication events | PROPOSED |
| M08 Identity, Access & Workspace | agency, workspace, branch, user, role, permission, session contracts | identity/session lifecycle | identity/access events | PROPOSED |
| M09 Notification | notification preference/delivery contracts | notification delivery lifecycle | notification events | PROPOSED |
| M10 Collaboration & Extensibility | notes, tasks, attachments, custom fields | task lifecycle where applicable | collaboration events | PROPOSED |
| M11 Calendar & Scheduling | calendar event and scheduling contracts | appointment/calendar lifecycle | scheduling events | PROPOSED |
| M12 Activity, Timeline & Audit | audit/timeline projection contracts | immutable audit trail | consumes domain events | PROPOSED |
| M13 Search | search projection contracts | projection freshness | consumes indexed-domain events | PROPOSED |
| M14 Reporting & Analytics | KPI/reporting projection contracts | reporting freshness | consumes analytical events | PROPOSED |
| M15 Workflow & Automation | workflow definition/run/action contracts | workflow/run lifecycle | event-triggered execution | PROPOSED |

## Required reconciliation passes

### Pass A — Tasks

All source task IDs must be mapped to exactly one primary owner module unless the source explicitly defines a cross-module task. Cross-module tasks must list every affected module and the dependency direction.

Target condition: every source task accounted for; no invented task IDs; no deleted task IDs; declared-vs-observed discrepancy remains explicitly tracked until explained.

### Pass B — Events

For every event, identify one publisher/owner and zero or more consumers. Publisher ownership follows the aggregate owner. Projection consumers must not become upstream owners of business state.

Target condition: all source events accounted for; no event silently reassigned because of naming convenience.

### Pass C — Permissions

Map each permission key to the owning capability/module while preserving the existing permission vocabulary and workspace/tenant scope. Permission scope must never be broadened during reconciliation.

### Pass D — State machines

Map each state machine to its aggregate owner and verify that transitions remain owned by the aggregate's module. No direct status mutation may be introduced by the reconciliation.

### Pass E — Schema

Map every model, enum, relation, unique constraint and index to its proposed module/schema owner. Cross-schema foreign keys are prohibited by the candidate architecture. No live database claim is inferred from this design artifact.

## Current unresolved items

1. C2-001 remains open pending explicit ADR acceptance.
2. Task count discrepancy remains open: repository/source declaration 114 vs source observation 119 phase entries plus 3 recurring rituals.
3. Schema discrepancy remains open: earlier declaration 59 models / 16 enums / 15 indexes versus observed source contract 59 models / 17 enums / 56 `@@index` declarations.
4. C2-002 live-runtime/database evidence remains separate and unresolved.

## Promotion gate

This document may be promoted to canonical traceability only after:

- ADR-0001 is explicitly accepted;
- every task ID is accounted for;
- every event has owner/consumer mapping;
- every permission key is reconciled;
- every state machine has aggregate ownership;
- every schema artifact is structurally reconciled;
- all discrepancies have disposition and provenance;
- verification requirements are updated.

Until then, this file is a planning/traceability artifact and authorizes no code, schema, migration, deployment, or production operation.
