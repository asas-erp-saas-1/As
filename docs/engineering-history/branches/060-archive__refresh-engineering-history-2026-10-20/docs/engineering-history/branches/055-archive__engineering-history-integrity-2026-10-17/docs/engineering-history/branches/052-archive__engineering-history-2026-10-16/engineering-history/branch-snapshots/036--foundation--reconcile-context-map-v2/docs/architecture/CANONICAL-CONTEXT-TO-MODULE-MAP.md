# ASAS Canonical Candidate Context-to-Module Map

Status: PROPOSED — derived from the approved Phase 1.5 domain model and Master Implementation Specification; becomes canonical only with ADR-0001 acceptance.

## Architecture shape

- Deployment model: modular monolith, not microservices.
- Codebase: one deployable codebase with Web and Worker processes.
- Module boundaries: enforced in CI; cross-module database foreign keys are not used.
- Database strategy: one PostgreSQL instance with one schema per module.
- Identity/tenancy is the Open Host Service consumed directly by all modules.
- Other cross-module effects use the transactional domain-event/outbox backbone.

## Module map

| ID | Bounded context / module | Schema | Primary responsibility | Process |
|---|---|---|---|---|
| M01 | Lead & CRM | `lead_crm` | Lead lifecycle, client profile, pipeline | Web |
| M02 | Property & Inventory | `property_inventory` | Projects, units, listings, pricing, availability | Web |
| M03 | Visit Management | `visit_management` | Visits and visit outcomes | Web |
| M04 | Reservation & Contract | `reservation_contract` | Reservations, contracts, signatures | Web |
| M05 | Payment & Finance | `payment_finance` | Schedules, installments, receipts, balances | Web |
| M06 | Commission & Payout | `commission_payout` | Commission calculation and approval | Web |
| M07 | Communication | `communication` | WhatsApp/email/SMS/call records and dispatch integration | Web + Worker |
| M08 | Identity, Access & Workspace | `identity_access` | Users, roles, permissions, agency/workspace tenancy | Web |
| M09 | Notification | `notification` | In-app, WhatsApp, SMS, email, push notification delivery | Worker |
| M10 | Collaboration & Extensibility | `collaboration` | Notes, tasks, attachments, custom fields and shared collaboration primitives | Web |
| M11 | Calendar & Scheduling | `calendar_scheduling` | Calendar events and scheduling | Web |
| M12 | Activity, Timeline & Audit | `activity_audit` | Immutable audit and timeline projections | Worker |
| M13 | Search | `search` | Cross-context global search read model | Worker |
| M14 | Reporting & Analytics | `reporting` | KPI/reporting read models | Worker |
| M15 | Workflow & Automation Engine | `workflow_engine` | Event-triggered conditions/actions and workflow runs | Worker |

## Ownership rules

1. Each module owns its domain data and invariants.
2. A module may synchronously call another module only for an immediate same-request answer through a published interface.
3. Cross-module side effects are asynchronous domain events through the outbox.
4. Identity/Access/Workspace is the sole cross-cutting Open Host Service for authentication, authorization, and tenant context.
5. Activity/Audit, Notification, Search, Reporting, and Workflow consume events rather than receiving direct business writes from other modules.
6. Cross-schema references are UUID identifiers without cross-schema foreign keys; referential integrity is enforced at the application boundary.
7. A module cannot write another module's owned tables.
8. Every implementation slice must declare its owning module, aggregate ownership, allowed dependencies, events, tenant scope, and process ownership.

## Core relationship map

- M08 Identity/Access/Workspace → all modules: tenant/session/authorization authority.
- M01 Lead & CRM → M02 Property & Inventory, M03 Visit Management, M04 Reservation & Contract.
- M04 Reservation & Contract → M05 Payment & Finance.
- M05 Payment & Finance → M06 Commission & Payout.
- M07 Communication → lead/client communication records and external messaging integrations.
- M10 Collaboration & Extensibility → shared notes/tasks/attachments/custom-field capabilities through explicit published interfaces.
- M11 Calendar & Scheduling → visit/meeting/reservation appointment scheduling; it is a dedicated implementation module in the 15-module architecture.
- M12 Activity/Audit, M09 Notification, M13 Search, M14 Reporting, M15 Workflow → consume the event stream and do not become upstream owners of core business state.

## Aggregate ownership baseline

- M01: Lead, Client.
- M02: Project, Unit, Listing.
- M03: Visit.
- M04: Reservation, Contract.
- M05: PaymentSchedule and payment/collection records.
- M06: CommissionRule, CommissionRecord.
- M07: CommunicationLog and communication delivery records.
- M08: Agency, Workspace, Branch, User, role/permission/session records.
- M09: NotificationPreference and delivery records.
- M10: Note, Task, Attachment, custom-field definitions/values.
- M11: CalendarEvent.
- M12: event/audit/timeline projections.
- M13: search projections.
- M14: analytical/reporting projections.
- M15: Workflow, WorkflowRun, outbox/workflow execution records.

## Candidate implementation dependency policy

Allowed dependencies are not inferred from business convenience. They must be declared per task packet and checked by architecture CI. The module graph must remain acyclic at the synchronous-call layer. Event subscriptions may fan out without creating synchronous ownership cycles.

## Acceptance

This map is a derived architectural candidate until ADR-0001 is explicitly accepted. It must not be treated as authorization to create schemas, migrations, endpoints, or application code.
