# ASAS — CONTEXT / DOMAIN / MODULE EVIDENCE MATRIX 2026

**Artifact ID:** ASAS-ARCH-MATRIX-2026-001
**Status:** CANONICAL DERIVED EVIDENCE MATRIX — PROPOSED
**Version:** 1.1.0
**Effective date:** 2026-09-20
**Owner:** Lead Architecture
**Authority:** Derived from the 2026 Blueprint, AGENTS material, historical module-map candidate, task/register evidence, and current architecture checkpoint.
**Branch:** `platform-architecture-2026`
**Decision boundary:** This matrix does not silently resolve founder-boundary decisions. It records the current canonical classification and unresolved ownership so implementation cannot infer authority from stale historical wording.

> **Core rule:** Bounded Context, Domain Group, Implementation Module, Aggregate, Database Schema, Read Model, Worker and Event Consumer are different architectural objects. A row below is evidence, not automatic authorization.

---

## 1. Purpose

This matrix is the working evidence layer for H1 Architectural Reconciliation. It answers:

- What business responsibility is evidenced?
- Which high-level domain grouping currently names it?
- Which implementation module has been proposed historically?
- What data/aggregate ownership has actually been proposed?
- Which platform capabilities are involved?
- What remains unresolved?

It must be read together with:

- `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md`
- `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md`
- `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md`
- `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`
- `docs/governance/FOUNDER-DECISIONS.md`
- domain-specific registers

---

## 2. Evidence classes

| Code | Meaning |
|---|---|
| E1 | Current architecture/control-plane evidence on `platform-architecture-2026` |
| E2 | Current canonical register/contract evidence |
| E3 | Historical architecture candidate / ADR evidence |
| E4 | Historical source-package evidence |
| E5 | External engineering evidence |
| INF | Engineering inference; never closes a gate |
| OPEN | Evidence insufficient to determine ownership |
| CONFLICT | Material authorities disagree |

---

## 3. High-level domain grouping currently evidenced

The 2026 architecture material repeatedly names these nine domain contexts:

1. Core
2. CRM
3. Sales
4. Inventory
5. Finance
6. Website Studio
7. Marketing
8. Analytics
9. Documents

**Status:** PROPOSED DOMAIN VIEW / NOT YET ACCEPTED AS THE SOLE IMPLEMENTATION DECOMPOSITION.

The nine-context view is preserved as a domain-level architectural statement, not converted into a one-context-one-module or one-context-one-schema rule.

---

## 4. Candidate implementation module evidence

The historical `CANONICAL-CONTEXT-TO-MODULE-MAP.md` proposes a 15-module modular-monolith decomposition. It explicitly remains `PROPOSED` until its ownership/dependency ADRs are accepted.

| ID | Candidate module | Primary responsibility evidenced | Candidate aggregates / owned concepts | Candidate schema | Process | High-level domain relationship | Current status |
|---|---|---|---|---|---|---|---|
| M01 | Lead & CRM | lead lifecycle, client profile, pipeline | Lead, Client | `lead_crm` | Web | CRM / Core | PROPOSED |
| M02 | Property & Inventory | projects, units, listings, pricing, availability | Project, Unit, Listing | `property_inventory` | Web | Inventory / Core | PROPOSED |
| M03 | Visit Management | visits and outcomes | Visit | `visit_management` | Web | CRM / Sales | PROPOSED |
| M04 | Reservation & Contract | reservations, contracts, signatures | Reservation, Contract | `reservation_contract` | Web | Sales | PROPOSED |
| M05 | Payment & Finance | schedules, installments, receipts, balances | PaymentSchedule, payment/collection records | `payment_finance` | Web | Finance / Sales | PROPOSED |
| M06 | Commission & Payout | commission calculation and approval | CommissionRule, CommissionRecord | `commission_payout` | Web | Finance / Sales | PROPOSED |
| M07 | Communication | WhatsApp/email/SMS/call records and dispatch integration | CommunicationLog, delivery records | `communication` | Web + Worker | CRM / Marketing / Platform | PROPOSED |
| M08 | Identity, Access & Workspace | users, roles, permissions, agency/workspace tenancy | Agency, Workspace, Branch, User, role/permission/session records | `identity_access` | Web | Core / Platform | PROPOSED |
| M09 | Notification | in-app and external notification delivery | NotificationPreference, delivery records | `notification` | Worker | Platform | PROPOSED |
| M10 | Collaboration & Extensibility | notes, tasks, attachments, custom fields | Note, Task, Attachment, custom-field definitions/values | `collaboration` | Web | Core / Platform | PROPOSED |
| M11 | Calendar & Scheduling | calendar events and scheduling | CalendarEvent | `calendar_scheduling` | Web | CRM / Sales / Platform | FOUNDER DECISION REQUIRED |
| M12 | Activity, Timeline & Audit | immutable audit/timeline projections | audit/timeline projections | `activity_audit` | Worker | Core / Documents / Platform | PROPOSED |
| M13 | Search | cross-context global search read model | search projections | `search` | Worker | Platform | PROPOSED |
| M14 | Reporting & Analytics | KPI/reporting read models | analytical/reporting projections | `reporting` | Worker | Analytics | PROPOSED |
| M15 | Workflow & Automation Engine | event-triggered conditions/actions/workflow runs | Workflow, WorkflowRun, execution records | `workflow_engine` | Worker | Platform / Core | PROPOSED |

**Important:** The candidate schema names above are historical architecture evidence. They are not permission to create PostgreSQL schemas.

---

## 5. Capability classification

| Capability | Current classification | Ownership status | Evidence | Implementation consequence |
|---|---|---|---|---|
| Identity | Platform capability | Open | E1/E3 | Must provide caller identity; exact module ownership not yet accepted |
| Tenancy | Platform capability | Open | E1/E3 | Must be enforced across all tenant-owned resources |
| Authorization | Platform capability | Open | E1/E2/E3 | Server authority required; exact module ownership unresolved |
| Audit | Platform capability / read model | Proposed | E1/E3 | Must not become an upstream owner of business state |
| Events / Outbox | Platform capability | Proposed | E1/E3 | Reliability mechanism; domain event ownership remains with producer |
| Workflow | Platform capability / candidate module | Proposed | E3 | Cannot mutate arbitrary contexts directly |
| Scheduling | Platform capability / candidate module | **Founder decision required** | E1/E3 | No schema/module ownership may be assumed |
| Search | Platform read capability | Proposed | E3 | Projection only unless a domain ownership case is proven |
| Media / Storage | Platform capability | Open | E1 | Storage access must remain tenant-aware |
| Notifications | Platform capability / worker | Proposed | E3 | Consumer/delivery role, not source of business truth |
| Integrations | Platform capability | Open | E1 | External systems cannot become ASAS authority |
| Configuration | Platform capability | Open | E1 | Scope and governance require contract |
| AI | Platform capability / control plane | Proposed | E1 | Caller authority inheritance mandatory |
| SaaS Control | Future platform reservation | Architectural reservation | E1 | Not an MVP implementation requirement |
| Developer Platform | Future platform reservation | Architectural reservation | E1 | Not an MVP implementation requirement |

---

## 6. Evidence-based relationship model

The current safe model is a two-level architecture until the remaining ownership decisions are recorded:

```text
HIGH-LEVEL DOMAIN VIEW
Core / CRM / Sales / Inventory / Finance / Studio / Marketing / Analytics / Documents
                           │
                           │ relationship is NOT assumed to be one-to-one
                           ▼
IMPLEMENTATION MODULE VIEW
M01 ... M15 candidate modular-monolith decomposition
```

The nine-context view is **not** itself a founder blocker. C2-001 has been reclassified as **OPEN ARCHITECTURAL REFINEMENT** because the numerical difference from the historical 15-module candidate does not establish a semantic contradiction.

Neither side is allowed to silently redefine the other.

### Required ownership decision output

For each material mapping, the accepted ADR/contract must establish one of these classes explicitly:

1. **One-to-one**
2. **One-to-many**
3. **Many-to-one**
4. **Cross-cutting platform**
5. **Hybrid**

The decision must be based on semantics, ownership, invariants, consistency, authorization, data ownership, change cadence, failure isolation, scaling and integration cost.

---

## 7. Dependency evidence

The historical 15-module proposal establishes these candidate rules:

- M08 Identity/Access/Workspace is an Open Host Service for identity, authorization and tenant context.
- A module may synchronously call another only for an immediate same-request answer through a published interface.
- Cross-module side effects use domain events/outbox.
- M09 Notification, M12 Activity/Audit, M13 Search, M14 Reporting and M15 Workflow consume events and should not receive direct business-state writes from upstream modules.
- Cross-schema foreign keys are not part of the candidate model.
- The synchronous dependency graph must remain acyclic.

**Status:** candidate architecture only. These rules become implementation constraints only after the corresponding ADR is accepted.

---

## 8. Aggregate evidence

The candidate map proposes ownership for:

```text
M01 Lead / Client
M02 Project / Unit / Listing
M03 Visit
M04 Reservation / Contract
M05 PaymentSchedule / payment & collection records
M06 CommissionRule / CommissionRecord
M07 CommunicationLog / delivery records
M08 Agency / Workspace / Branch / User / access records
M09 NotificationPreference / delivery records
M10 Note / Task / Attachment / custom fields
M11 CalendarEvent
M12 audit / timeline projections
M13 search projections
M14 analytical/reporting projections
M15 Workflow / WorkflowRun / execution records
```

These are **candidate aggregate ownership statements**, not verified aggregate boundaries. Before schema promotion each aggregate must pass:

`identity → invariant → command → transaction boundary → authorization → concurrency → persistence → event → test`

---

## 9. Critical unresolved boundaries

### C2-001 — Domain grouping vs implementation decomposition

**Status:** OPEN ARCHITECTURAL REFINEMENT — NOT A COUNT-BASED FOUNDER BLOCKER

**Reason:** The nine-context view and historical 15-module view represent different architectural layers. The numerical difference does not itself constitute a contradiction. Individual ownership/dependency decisions remain subject to evidence and ADR/contract closure.

### C2-002 — Scheduling ownership

**Status:** FOUNDER DECISION REQUIRED

### C2-003 — Identity/Tenancy platform ownership

**Status:** OPEN

Reason: architecture requires a shared authority model, but the exact boundary and persistence ownership must be reconciled against the current repository implementation and future SaaS control requirements.

### C2-004 — Collaboration primitive ownership

**Status:** OPEN

Reason: Notes/Tasks/Attachments/Custom Fields appear as platform primitives in the candidate module model but also occur as domain capabilities across contexts. Ownership and extension semantics require contract work.

### C2-005 — Activity/Audit ownership

**Status:** PARTIAL

Reason: audit is a cross-cutting evidence capability, while Activity/Timeline is a read/projection concern. They must not be treated as one generic write-owned business domain without explicit boundaries.

### C2-006 — Analytics ownership

**Status:** PARTIAL

Reason: Analytics is a high-level domain context in the nine-context model and a read-model module in the 15-module candidate. The distinction between analytical domain definitions and projection infrastructure must be formalized.

---

## 10. Boundary decision checklist

A boundary is not accepted until the following are answered:

- What business language belongs here?
- Who owns the invariant?
- Which commands can mutate it?
- Which aggregate owns the mutation?
- Who authorizes the command?
- What tenant scope applies?
- What data is authoritative?
- What data is derived?
- Which transactions must be atomic?
- Which effects may be asynchronous?
- What events are emitted?
- What failures can be isolated?
- What changes independently?
- What scales independently?
- What must never synchronously depend back on this boundary?
- Which team/agent owns implementation?
- Which tests prove the boundary?
- Which evidence proves it in runtime?

If any implementation-critical answer is unknown, the boundary remains `OPEN`.

---

## 11. Schema promotion guard

No row in this matrix authorizes a schema.

Before a candidate module receives persistent schema ownership:

```text
Founder/ADR authority
→ accepted boundary
→ aggregate ownership
→ invariant catalog
→ command/state contract
→ permission/tenant contract
→ event contract
→ access-pattern evidence
→ schema design
→ local migration
→ tests
```

---

## 12. H1 exit criteria

H1 can close only when:

- the domain/module relationship is explicit for all implementation-critical boundaries;
- Scheduling ownership is resolved;
- aggregate ownership is accepted where implementation is authorized;
- dependency matrix is accepted;
- platform capabilities are classified;
- unresolved boundaries have owners and next actions;
- no implementation-critical task depends on an unstated ownership assumption.

The historical C2-001 count difference is not itself an H1 blocker.

Until the remaining implementation-critical boundaries are closed:

**H1 = BLOCKED.**

---

## 13. Provenance

Primary evidence used:

1. `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` on `platform-architecture-2026`.
2. `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` on `platform-architecture-2026`.
3. `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md` on `platform-architecture-2026`.
4. `docs/handoff/CURRENT-SESSION-STATE.md` on `platform-architecture-2026`.
5. `docs/architecture/CANONICAL-CONTEXT-TO-MODULE-MAP.md` on historical `foundation/reconcile-context-map-v2`.
6. `AGENTS.md` / source-package evidence as reconciled in the forensic audit.

Historical evidence is retained for provenance and is not silently promoted.

---

## 14. Current status

**H1.3 — EVIDENCE MATRIX RECONCILED WITH CANONICAL C2 STATUS / IMPLEMENTATION STILL BLOCKED**

Next permitted work: non-decision-dependent contract analysis, task packet normalization, invariant extraction, event-to-command reconciliation and research. Schema/application ownership may not be inferred from this matrix until the relevant ownership contracts and founder decisions are resolved.