# ASAS C2-001 — Evidence & Reconciliation Package

Status: INVESTIGATING / HARD STOP
Repository: `asas-erp-saas-1/As`
Branch: `foundation/repository-file-organization-v1`
Date: 2026-09-19

## 1. Purpose

This package is the evidence record for C2-001: reconciliation of the authoritative Domain Model / Context Map with the later implementation-module decomposition.

It does **not** choose a canonical context cardinality. It prevents accidental promotion of a module list into a bounded-context decision and prepares the evidence required for an approved ADR.

Governing rule:

`Source → Provenance → Comparison → Decision authority → ADR → Canonical map → Verification`

## 2. Evidence hierarchy used

1. approved source / Blueprint authority;
2. current governance and operating contracts;
3. canonical registers and current checkpoint;
4. reconciled architecture contracts;
5. approved product requirements;
6. repository implementation;
7. historical/reference artifacts;
8. inference only when explicitly labelled.

A derived repository register cannot override its source.

## 3. Evidence A — Master Roadmap claim

`ASAS_Master_Roadmap` and its later copies explicitly state:

- Phase 1.5 — Enterprise Domain Model is marked Approved (v2).
- Its stated deliverables are `Domain Model v2 (15 bounded contexts)` and `Context Map v2`.
- It says Phase 2.1 depends on those bounded contexts, aggregates, and event stream.

This is strong evidence of an approved **claim**, but the currently available source evidence must still identify the actual Domain Model v2 and Context Map v2 artifacts and their provenance before the 15-context claim is promoted into the canonical implementation map.

## 4. Evidence B — Enterprise Domain Model artifact

The available `ASAS_Enterprise_Domain_Model` artifact is explicitly labelled:

`Status: Draft — for stakeholder review before Phase 2 begins`.

Its visible bounded-context table contains these 13 contexts:

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

The artifact also describes AI / Intelligence as future supporting capability, not as a current context.

This artifact therefore **cannot by itself prove** the approved 15-context cardinality, because its own status is Draft and its visible table contains 13 contexts.

## 5. Evidence C — Context Map artifact

`ASAS_Context_Map.mermaid` visually represents the same domain shape: Identity and Access, Lead and CRM, Property and Inventory, Visit Management, Reservation and Contract, Payment and Finance, Commission and Payout, Communication, Document and Attachment, Activity/Timeline/Audit, Notification, Search, Reporting and Analytics, plus a future AI Assistant and a shared Domain Event Stream.

The map therefore corroborates the draft 13-context model rather than independently proving a 15-context approved model.

## 6. Evidence D — Master Implementation Specification

`ASAS_Master_Implementation_Specification` explicitly states a modular-monolith design with **15 independent modules**, described as one per Domain-Model bounded context, and a schema-per-module PostgreSQL strategy.

The 15 implementation modules are:

1. Lead & CRM → `lead_crm`
2. Property & Inventory → `property_inventory`
3. Visit Management → `visit_management`
4. Reservation & Contract → `reservation_contract`
5. Payment & Finance → `payment_finance`
6. Commission & Payout → `commission_payout`
7. Communication → `communication`
8. Identity, Access & Workspace → `identity_access`
9. Notification → `notification`
10. Collaboration & Extensibility → `collaboration`
11. Calendar & Scheduling → `calendar_scheduling`
12. Activity, Timeline & Audit → `activity_audit`
13. Search → `search`
14. Reporting & Analytics → `reporting`
15. Workflow & Automation Engine → `workflow_engine`

The specification also states that Activity/Audit, Notification, Search, Reporting, and Workflow are asynchronous event consumers/read-model/worker-oriented components, while Identity/Access/Workspace is the Open Host Service for identity and tenancy.

## 7. Evidence E — Current repository root contract

The currently supplied `AGENTS.md` artifact contains a separate, older/current-operating claim that ASAS has **nine bounded contexts**:

- Core
- CRM
- Sales
- Inventory
- Finance
- Website Studio
- Marketing
- Analytics
- Documents

It explicitly states that Scheduling is a CRM submodule and that the context map remains at nine.

This is materially different from both the 13-context Draft Domain Model and the 15-context Approved-v2 claim in the roadmap. Because `AGENTS.md` is the root operating contract but its architecture statement is itself a derived/condensed Blueprint digest, it is evidence of a repository-level claim, not proof that it supersedes the explicitly named approved Domain Model v2.

It must therefore be reconciled rather than silently treated as the final architecture.

## 8. Observed structural delta

The complete evidence set currently supports at least four distinct claims:

`Roadmap: 15 approved bounded contexts`

versus

`Draft Domain Model / Context Map: 13 visible contexts`

versus

`Implementation Specification: 15 implementation modules`

versus

`Current AGENTS root contract: 9 bounded contexts`

The additional implementation concepts not visible as separate bounded contexts in the Draft Domain Model include:

- Collaboration & Extensibility
- Workflow & Automation Engine
- Calendar & Scheduling as an explicit module boundary, while Scheduling is not independently established as a bounded context in the draft artifact.

The 9-context AGENTS decomposition also groups concepts differently and cannot be mapped to the 13/15 model by filename or label similarity alone.

**This observation is not a decision that any of these decompositions is correct.** It is the current evidence delta.

## 9. Non-interchangeability rule

The following identities are prohibited:

`Bounded Context ≠ Implementation Module ≠ PostgreSQL Schema ≠ Aggregate ≠ Read Model ≠ Worker ≠ Event Consumer`

The implementation specification's phrase “one per Domain-Model bounded context” is therefore a source claim that must be checked against the approved Domain Model v2, not sufficient proof by itself.

## 10. Stable architectural principles already supported

The available source material establishes several principles that are not currently in dispute:

- modular boundaries are required;
- the preferred near-term deployment model is a modular monolith rather than premature distributed microservices;
- event-driven integration is central to Timeline/Audit, Notification, Search, Reporting and future AI consumers;
- Identity/Access/Workspace is intended to provide tenancy and authorization authority;
- future AI is a downstream consumer of governed domain events rather than a reason to create a separate business context prematurely.

These principles may be carried forward independently of the unresolved context cardinality.

## 11. Source-recovery attempt — 2026-09-19

A targeted recovery search was performed across the available ASAS source/file set for:

- the actual `Domain Model v2` artifact;
- the actual `Context Map v2` artifact;
- explicit approval/provenance evidence for those artifacts;
- later architecture decisions that supersede the Draft Domain Model.

The search recovered the roadmap's explicit Approved-v2 claim, the Draft 13-context Domain Model, the draft Context Map, the 15-module Implementation Specification, and the 9-context AGENTS claim. It did **not** recover a separately identifiable approved `Domain Model v2` artifact or a separately identifiable approved `Context Map v2` artifact with provenance/approval evidence.

Therefore the current state is:

`SOURCE RECOVERY INCOMPLETE / C2-001 BLOCKED`

This is a source-recovery finding, not a conclusion that the roadmap's Approved-v2 claim is false.

## 12. Decisions that must NOT be inferred

The following remain unresolved until authoritative approval/provenance is recovered or an authorized Founder/Product Architecture decision formally resolves them:

- whether the canonical model has 9, 13, 15, or another number of bounded contexts;
- whether Collaboration & Extensibility is a bounded context or generic/supporting module;
- whether Workflow & Automation is a bounded context, infrastructure capability, or supporting module;
- whether Calendar & Scheduling is an independent context or a capability/submodule;
- whether Document & Attachment remains a generic subdomain/context boundary;
- how the 9-context AGENTS model reconciles with the later roadmap/model claims;
- exact aggregate ownership for any newly separated context;
- schema ownership and transaction boundaries derived from those decisions.

## 13. Required next evidence

Before the ADR can be closed, locate or formally establish through an authorized decision process:

1. `Domain Model v2`
2. `Context Map v2`
3. their approval/provenance record
4. any later approved architecture decision that supersedes them
5. the intended disposition of the 9-context AGENTS architecture statement.

If those artifacts cannot be recovered from the canonical source set, the correct state is `BLOCKED / SOURCE RECOVERY REQUIRED`, not an invented reconciliation.

## 14. ADR decision template

The eventual ADR must record:

- Decision ID
- Source versions reviewed
- Approval/provenance evidence
- Canonical bounded-context list and IDs
- Context responsibilities
- Explicit non-responsibilities
- Aggregate ownership
- Context → module mapping
- Schema ownership
- Command/event ownership
- Synchronous interfaces
- Asynchronous events
- Dependency direction
- Tenant/security authority
- Worker/read-model ownership
- Future extraction boundaries
- Explicit rejected interpretations
- Impacted registers/tasks/contracts
- Verification evidence
- Effective date/status

## 15. Closure condition

C2-001 may move from `BLOCKED` to `RESOLVED` only when an authorized architecture decision is recorded and the canonical Context → Module map is verified against it.

Until then:

`No executable schema implementation`
`No migration`
`No implementation slice whose correctness depends on unresolved context ownership`

## 16. Source observations used

The evidence above is derived from the project source materials currently available in the ASAS working environment, especially:

- `ASAS_Master_Roadmap` / later copies — Phase 1.5 approved-v2 claim;
- `ASAS_Enterprise_Domain_Model` — draft 13-context model and context relationships;
- `ASAS_Context_Map.mermaid` — visual corroboration of the draft context map;
- `ASAS_Master_Implementation_Specification` — 15-module/schema implementation decomposition;
- `AGENTS.md` — repository root operating contract containing the 9-context architecture claim;
- repository `OPEN-CONTRACT-CONFLICTS.md` — current canonical blocker classification.

This package preserves the source distinctions and does not silently normalize them.
