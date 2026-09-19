# ASAS — Context → Module Ownership Reconciliation

**Status:** FOUNDATION WORKING ARTIFACT — NOT CANONICAL ARCHITECTURE APPROVAL
**Repository:** `asas-erp-saas-1/As`
**Date:** 2026-09-20

## 1. Purpose

This document reconciles the authoritative 15-module implementation decomposition with the current nine-context architecture working baseline.

It deliberately does **not** equate module count with bounded-context count.

The source implementation specification defines 15 modules and 15 PostgreSQL schema boundaries. The current architecture working contract defines a nine-context direction supported by the recovered Master Specification and accepted source ADR-0002. The two structures therefore require an explicit mapping rather than a numerical conversion.

## 2. Authority and status

### Evidence used

1. `ASAS_Master_Implementation_Specification` — implementation decomposition and module/schema/process classification.
2. `ASAS_Enterprise_Domain_Model` — domain responsibilities, aggregates, context relationships, and event ownership.
3. `MASTER-SPEC v3.3` — current recovered product/architecture authority supporting the nine-context direction.
4. Accepted source `ADR-0002` — nine bounded-context decision.
5. Repository working contracts — `ASAS-CANONICAL-ARCHITECTURE-DECISIONS.md` and `DOMAIN-OWNERSHIP-AND-TRACEABILITY-CONTRACT.md`.

### Not treated as current architecture authority

- Historical Phase 1.5 roadmap wording that states 15 bounded contexts.
- Draft domain artifacts whose context cardinality differs from the accepted source ADR.
- Existing code, folders, or database tables as evidence of domain ownership.

## 3. Architectural rule

```text
9 Bounded Contexts
        ↓
15 Implementation Modules
        ↓
Aggregates / Invariants
        ↓
Commands / State Transitions
        ↓
Events
        ↓
Read Models / Workers
        ↓
Permissions
        ↓
Persistence Contracts
        ↓
Canonical Tasks
```

A module can be a delivery boundary, worker, projection, generic subdomain, or cross-context orchestration component without being a bounded context.

## 4. Reconciled 15-module matrix

| # | Implementation module | Schema boundary | Process | Working context mapping | Role | Ownership status |
|---|---|---|---|---|---|---|
| 1 | Lead & CRM | `lead_crm` | Web | CRM | Business context | PROPOSED |
| 2 | Property & Inventory | `property_inventory` | Web | Inventory | Business context | PROPOSED |
| 3 | Visit Management | `visit_management` | Web | CRM | CRM capability/module | PROPOSED |
| 4 | Reservation & Contract | `reservation_contract` | Web | Sales | Business context | PROPOSED |
| 5 | Payment & Finance | `payment_finance` | Web | Finance | Business context | PROPOSED |
| 6 | Commission & Payout | `commission_payout` | Web | Finance | Finance capability/module | PROPOSED |
| 7 | Communication | `communication` | Web + Worker | Cross-context / integration | Generic capability | OPEN |
| 8 | Identity, Access & Workspace | `identity_access` | Web | Core / Platform | Open Host Service / tenant authority | PROPOSED |
| 9 | Notification | `notification` | Worker | Cross-context / integration | Event consumer / delivery capability | DERIVED |
| 10 | Collaboration & Extensibility | `collaboration` | Web | Cross-context | Generic/extensibility capability | OPEN |
| 11 | Calendar & Scheduling | `calendar_scheduling` | Web | CRM | CRM capability/module | PROPOSED |
| 12 | Activity, Timeline & Audit | `activity_audit` | Worker | Cross-context / Core policy | Read model / audit projection | DERIVED |
| 13 | Search | `search` | Worker | Cross-context | Read model | DERIVED |
| 14 | Reporting & Analytics | `reporting` | Worker | Analytics | Read model / analytical capability | PROPOSED |
| 15 | Workflow & Automation Engine | `workflow_engine` | Worker | Cross-context / Core orchestration | Orchestration engine | PROPOSED |

The 15 rows above are implementation evidence. They are **not** 15 bounded contexts.

## 5. Reconciliation decisions

### 5.1 Visit Management

Do not promote Visit Management to an independent bounded context merely because it has its own module and schema. Current evidence places visits as a CRM capability with its own consistency needs.

**Implementation consequence:** the module may retain a strong internal boundary, but business ownership remains CRM-owned unless a later approved architecture decision establishes an independent context.

### 5.2 Calendar & Scheduling

Calendar/Scheduling is treated as a CRM capability/module, not automatically as a separate bounded context. Scheduling can own scheduling-specific state while CRM remains the business context for visit-related workflows.

### 5.3 Commission & Payout

Commission & Payout remains a distinct implementation module because its operational concerns and money-out lifecycle differ from payment collection. It maps to Finance rather than creating a tenth bounded context.

### 5.4 Activity, Timeline & Audit

This is a projection/audit capability fed by domain events. It does not own the business facts generated by other contexts.

### 5.5 Search

Search is a cross-context read model. It cannot become the owner of source business data merely because it stores indexed copies.

### 5.6 Reporting & Analytics

Reporting consumes facts produced elsewhere. It owns analytical projections and KPI computation, not transactional business invariants.

### 5.7 Notification

Notification is an event-driven delivery worker. It does not own the business state that caused a notification.

### 5.8 Workflow & Automation

Workflow may orchestrate cross-context processes, but it must not silently become the owner of CRM, Sales, Inventory, or Finance invariants.

### 5.9 Identity, Access & Workspace

Identity/Access/Workspace is the explicit Open Host Service for authentication, tenant/workspace scope, and authorization context. Other modules may consume its published interface without owning its internal identity state.

### 5.10 Communication

Communication remains OPEN. The sources establish communication as a reusable capability around calls/WhatsApp/email/SMS, but they do not provide enough evidence to promote it to an independent bounded context under the current nine-context model.

### 5.11 Collaboration & Extensibility

Collaboration/Extensibility remains OPEN. Its role spans shared capabilities such as notes, tasks, custom fields, and extensions. No independent bounded-context promotion is authorized from module existence alone.

### 5.12 Website Studio and Marketing

The current 15-module implementation decomposition does not contain dedicated `Website Studio` or `Marketing` modules in its 15-row table. Their presence in the nine-context architecture baseline therefore remains a **context-level concern without a corresponding implementation-module row**.

This is intentional and must not be repaired by inventing modules. Before implementation, their concrete module boundaries, tasks, and persistence ownership must be established from the approved product scope and task graph.

## 6. Aggregate ownership — current evidence

| Aggregate / business object | Authoritative context | Notes | Status |
|---|---|---|---|
| Lead / Client | CRM | Lead remains the continuous pipeline aggregate; Deal is a derived/computed concept in the recovered implementation specification. | PROPOSED |
| Project / Unit / Listing | Inventory | Unit availability and pricing are correctness-critical. | PROPOSED |
| Visit | CRM | Visit lifecycle is currently treated as CRM-owned capability. | PROPOSED |
| Reservation / Contract | Sales | Contract/reservation transitions gate downstream financial operations. | PROPOSED |
| Payment Schedule / Payment / Collection state | Finance | Money-in and financial posting remain Finance-owned. | PROPOSED |
| Commission Rule / Commission Record | Finance | Money-out calculation/posting remains Finance-owned. | PROPOSED |
| Agency / Workspace / Membership / Identity | Core | Tenant and authorization authority. | PROPOSED |
| Communication Log | OPEN | Capability exists; canonical context ownership needs final evidence. | OPEN |
| Notification Preference / delivery state | Core/integration capability | Delivery state is not source business ownership. | DERIVED |
| Attachment metadata | Cross-context generic capability | Referenced by owning context; does not own source business invariants. | OPEN |
| Timeline / Audit projection | Source contexts + Core audit policy | Projection, not source-of-truth aggregate. | DERIVED |
| Search document | Search read model | Derived index only. | DERIVED |
| KPI / report projection | Analytics | Derived analytical state. | PROPOSED |
| Workflow definition/execution | Cross-context orchestration | Workflow coordinates; source contexts enforce invariants. | PROPOSED |

## 7. Event ownership rule

The event producer is the context/capability that changes the business fact.

Evidence-backed examples include:

- `LeadCreated` → CRM
- `LeadAssigned` → CRM
- `LeadStageChanged` → CRM
- `VisitScheduled` → CRM capability
- `VisitCompleted` → CRM capability
- `UnitAvailabilityChanged` → Inventory
- `PriceUpdated` → Inventory
- `ReservationCreated` → Sales
- `ContractSigned` → Sales
- `PaymentScheduleGenerated` → Finance
- `PaymentReceived` → Finance
- `CommissionCalculated` → Finance
- `CommunicationLogged` → Communication capability, pending final context ownership
- `DocumentUploaded` → Document capability, pending reconciliation with the current nine-context decomposition

Consumers such as Audit, Notification, Search, Reporting, and future AI do not acquire ownership of the originating business rule.

## 8. Permission ownership rule

Permissions resolve to the authoritative resource/context plus tenant/workspace scope.

Current working pattern:

```text
Core tenant / identity policy
        +
resource-owning context permission
        ↓
command authorization
        ↓
state transition
```

UI visibility is never authorization.

## 9. Persistence rule

The 15 implementation schemas are boundaries in the implementation specification, not proof that 15 bounded contexts exist.

Cross-schema references may be represented by identifiers, but a module must not directly mutate another module's owned persistence except where an explicit architecture exception is documented and approved.

The live database remains a separate authority. This document does not authorize migrations, schema creation, RLS changes, or database mutations.

## 10. Verification requirements before any row becomes VERIFIED

For every module/context relationship, establish:

1. authoritative context;
2. business invariant owner;
3. aggregate owner;
4. command/state-transition owner;
5. event producer;
6. event consumers;
7. permission resource;
8. tenant/workspace boundary;
9. persistence contract;
10. canonical task ID;
11. definition of done;
12. verification evidence;
13. rollback/stop condition where applicable.

If any item lacks authoritative evidence, status remains `OPEN`, `UNRESOLVED`, `PROPOSED`, or `DERIVED` as appropriate.

## 11. Current unresolved decisions

### C2-MOD-001 — Communication ownership
Status: OPEN

Question: Is Communication a capability inside CRM/Core integration or an independently governed bounded context?

Current evidence favors capability/module treatment, but no final context promotion is made here.

### C2-MOD-002 — Collaboration & Extensibility ownership
Status: OPEN

Question: Which context owns custom fields, notes, tasks, collaboration, and extensibility invariants?

No implementation ownership should be inferred from the module name.

### C2-MOD-003 — Document capability placement
Status: OPEN

Question: How should the historically named Document & Attachment generic capability map into the current nine-context decomposition without creating an additional bounded context?

The capability is reusable and cross-context, but canonical ownership has not yet been fully reconciled.

### C2-MOD-004 — Website Studio implementation boundary
Status: OPEN

Question: Which concrete implementation module(s), persistence boundary, tasks, and permissions implement Website Studio under the current nine-context architecture?

No module is invented here.

### C2-MOD-005 — Marketing implementation boundary
Status: OPEN

Question: Which concrete implementation module(s), persistence boundary, tasks, and permissions implement Marketing under the current nine-context architecture?

No module is invented here.

### C2-MOD-006 — Analytics boundary
Status: PROPOSED

Reporting & Analytics remains a derived analytical context/module. Its exact read-model contract and task ownership must be reconciled with the event catalog and task graph.

## 12. Prohibited shortcuts

Do not:

- convert 15 modules into 15 bounded contexts;
- delete modules because they are not contexts;
- invent Website Studio or Marketing modules merely to make counts match;
- merge schemas solely to make counts match;
- create aggregates from table names;
- make read models authoritative;
- allow workflow to own another context's invariants;
- infer ownership from existing code;
- alter the live database to match this document.

## 13. Next verification wave

1. Reconcile every module row against the complete implementation specification.
2. Map every module/capability to canonical task IDs.
3. Map module responsibilities to the event register.
4. Map module resources to the permission register.
5. Map aggregate candidates to the state-machine register.
6. Reconcile schema contract counts and ownership without touching the live database.
7. Resolve C2-MOD-001 through C2-MOD-006 where authoritative evidence exists.
8. Audit active repository references to historical 15-context claims.
9. Keep remaining uncertainty explicit until ADR-0021 is accepted.

## 14. Closure rule

This artifact is complete only when every implementation module and every current architecture context has a supported ownership chain from architecture to task and verification evidence.

Until then, this document is a reconciliation artifact, not permission to implement.
