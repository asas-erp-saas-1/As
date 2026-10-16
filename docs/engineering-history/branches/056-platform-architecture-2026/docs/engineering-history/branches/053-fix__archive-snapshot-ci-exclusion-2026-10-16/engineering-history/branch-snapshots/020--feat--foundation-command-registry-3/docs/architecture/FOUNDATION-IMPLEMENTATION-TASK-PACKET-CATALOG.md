# ASAS — Foundation Implementation Task Packet Catalog

**Status:** DESIGN / HANDOFF — implementation sequencing contract; no application code authorized by this document alone.
**Date:** 2026-09-15
**Authority:** Product Truth, Blueprint v1.6.1, canonical registers, domain/context maps, state-machine normalization, build orders, security/quality contracts.

## 1. Purpose

This catalog converts the 22 canonical working personas and 20 system pillars into implementation-ready task families without turning personas into database roles or inventing missing business policy.

The catalog is deliberately **contract-first**. A task may be implemented autonomously only when its upstream contract fields are authoritative. Unknown business semantics remain `OPEN`; they are not inferred from UI conventions.

## 2. Non-negotiable task packet

Every executable packet must carry:

```yaml
id: TP-XXX
pillar: PXX
persona: UXX|CROSS
priority: P0|P1|P2
status: BLOCKED|READY|IN_PROGRESS|VERIFYING|DONE
purpose: "..."
authority: []
aggregate: []
commands: []
state_machines: []
permissions: []
invariants: []
idempotency: []
concurrency: []
transaction_boundary: []
events: []
audit: []
projection: []
public_private_boundary: []
data_classification: []
retention: []
integration_effects: []
ux_surfaces: []
tests: []
evidence: []
rollback: []
escalation: []
open_questions: []
```

A packet is not `READY` if a required field is materially undefined for the behavior being implemented.

## 3. Persona operating contracts

### U01 — Founder / Group Executive
Primary system surface: executive control, portfolio, risk, approvals, financial and commercial intelligence.

Required capabilities:
- cross-workspace executive read scope where granted;
- governed high-value approvals;
- KPI/read-model trust indicators;
- audit/evidence access;
- portfolio/project/inventory/commercial/finance views;
- no implicit mutation authority through analytics or AI.

Protected semantics: approval thresholds, group hierarchy, legal authority, financial policy, privileged AI actions remain founder-controlled when undefined.

### U02 — Agency Owner / Managing Director
Primary surface: agency configuration, people, inventory relationships, commercial operations, finance oversight, website/marketing governance.

Required controls:
- workspace-scoped administration;
- user/role/grant management subject to authorization;
- promoter/project relationship management;
- commercial and financial visibility according to grant;
- governed approvals and audit evidence.

### U03 — Sales Manager / Commercial Director
Primary surface: team pipeline, assignments, offers, approvals, forecasting, performance.

Required controls:
- assign/transfer sales ownership;
- inspect team pipeline within scope;
- approve governed commercial actions only within threshold/grant;
- monitor follow-up and conversion;
- no direct bypass of reservation/contract/finance state machines.

### U04 — Sales Representative / Agent
Primary surface: leads, qualification, activities, appointments, opportunities, offers, reservation initiation.

Required controls:
- only granted leads/objects;
- explicit PII boundary;
- command-driven sales actions;
- no arbitrary status setters;
- handover-aware assignment lifecycle.

### U05 — Sales Support / Inside Sales / Qualification
Primary surface: inbound lead handling, contact attempts, qualification, routing, appointment preparation.

Required controls:
- lead capture/assignment within scope;
- working-state transitions distinct from lifecycle transitions;
- PII minimized by field-level authorization;
- duplicate/merge handling via governed command.

### U06 — CRM / Operations Coordinator
Primary surface: CRM hygiene, assignment, appointments, activities, SLA queues, operational coordination.

Required controls:
- operational read/write scope without accidental sales/finance authority;
- appointment lifecycle via canonical machine;
- task/follow-up ownership and handover;
- reconciliation queues for failed integrations.

### U07 — Inventory / Project Manager
Primary surface: projects, buildings, units, pricing, availability, construction progress.

Required controls:
- commercial and construction axes remain separate;
- price overrides require typed authorization/approval;
- holds/reservations obey concurrency guarantees;
- construction milestones require certification semantics where defined.

### U08 — Developer / Promoter Operator
Primary surface: promoter relationship, projects, buildings, units, inventory/accounts and delegated operational access.

Required controls:
- tenant/workspace boundary is explicit;
- third-party/promoter data access is relationship-scoped;
- no implicit access to agency-private CRM/finance data;
- project/inventory mutations use canonical commands.

### U09 — Site / Construction / Technical User
Primary surface: milestones, construction state, technical evidence, change orders, delivery readiness.

Required controls:
- construction status cannot mutate commercial status silently;
- milestone certification is evidence-bearing;
- regressions require the registered governed mechanism; if undefined, remain `OPEN`;
- technical documents are classified and scoped.

### U10 — Finance / Accounting
Primary surface: payment plans, receipts, allocations, ledger, periods, commissions, financial reporting.

Required controls:
- integer money in DZD centimes plus explicit currency;
- balanced double-entry postings;
- immutable posted records;
- closed-period protection;
- duplicate payment/idempotency protection;
- no UI-only financial invariants.

### U11 — Collection / Cashier / Receivables
Primary surface: due items, receipts, allocations, collection follow-up, refund requests.

Required controls:
- receipt recording is distinct from allocation;
- amount/currency validation;
- duplicate/replay protection;
- refund approval separated from request;
- restricted financial data.

### U12 — SAV / After-Sales
Primary surface: post-sale customer service, issues, handover/delivery, follow-up.

Required controls:
- contractual customer relationship is authoritative;
- service records do not rewrite sales/finance history;
- document/appointment/customer data access is scoped;
- escalations and approvals are governed.

### U13 — Marketing / Growth
Primary surface: campaigns, attribution, spend, lead ingestion, consent, conversion analysis.

Required controls:
- provider payload idempotency;
- UTM/source/campaign traceability;
- consent enforcement;
- raw provider identifiers retained for reconciliation where permitted;
- marketing projections cannot mutate transactional truth directly.

### U14 — Website / Studio Editor
Primary surface: pages, sections, media, SEO, forms/CTA, preview, publish/rollback.

Required controls:
- draft/review/publish/archived lifecycle;
- published versions immutable;
- rollback as governed new version;
- content sanitization;
- public/private exposure contract;
- contextual CTA binds to canonical project/unit data.

### U15 — Executive / BI / Analyst
Primary surface: analytical models, dashboards, KPI definitions, trends, forecasts.

Required controls:
- operational truth vs derived data explicitly labeled;
- freshness/staleness visible;
- projections rebuildable;
- no analytical write authority over transactional aggregates.

### U16 — Platform Administrator
Primary surface: platform configuration, users, grants, integrations, workflow and system governance.

Required controls:
- deny-by-default;
- privileged actions audited;
- tenant boundary cannot be bypassed by UI role alone;
- secrets never exposed to application/domain code unnecessarily;
- support/impersonation is governed and evidence-bearing.

### U17 — HR / People Operator
Primary surface: demand, candidate, application, assessment, offer, hire, onboarding, employment lifecycle, handover/offboarding.

Required controls:
- Person, Applicant, Employee, Assignment, User Account, Employment Status, Access Status, Compensation and Commission Eligibility remain separate concepts;
- restricted HR data;
- employment policy is not inferred;
- access revocation is distinct from termination;
- leave/transfer/offboarding cannot silently orphan operational work.

### U18 — Document / Legal / Contract Operations
Primary surface: generated/uploaded documents, templates, versions, classification, expiry, legal workflow.

Required controls:
- immutable version history;
- generated vs uploaded distinction;
- permission/tenant-scoped access;
- expiry/retention evidence;
- contract lifecycle remains owned by its canonical context.

### U19 — Integration / Automation Operator
Primary surface: provider connections, webhooks, retries, dead letters, mappings, automation health.

Required controls:
- credentials isolated;
- canonical signature verification;
- replay protection;
- idempotency;
- retry/dead-letter semantics;
- provider failure never becomes silent domain mutation.

### U20 — Customer / Buyer / Public Visitor
Primary surface: public project/unit pages, inquiry, contextual CTA, appointment request, communications and customer journey.

Required controls:
- minimum data collection;
- explicit consent where required;
- public/private boundary;
- tenant attribution preserved;
- public mutations use idempotency and abuse controls;
- no exposure of restricted inventory/CRM/finance data.

### U21 — External Partner / Broker / Referral
Primary surface: relationship-scoped inventory discovery, referral/lead submission, attribution and commission visibility where explicitly granted.

Required controls:
- partner scope never becomes tenant-wide access;
- referral identity/attribution is traceable;
- sensitive customer fields minimized;
- commission information follows explicit policy.

### U22 — ASAS Support / Service Operator
Primary surface: support diagnostics, customer assistance, controlled impersonation, integration/reconciliation queues.

Required controls:
- least privilege;
- break-glass/impersonation semantics explicit;
- support access auditable;
- no silent tenant boundary bypass;
- customer data exposure minimized.

## 4. System pillar task families

### P01 — Identity / Tenant / Authorization
Must establish identity, tenant/workspace resolution, roles/grants, scopes, deny overrides, ABAC, command authorization, sessions and audit. Hard dependency for all protected mutations.

### P02 — Organization / People / Workforce
Must establish organizational hierarchy, teams, assignments and HR capability without conflating employment/access/assignment/compensation. HR policy gaps remain `OPEN`.

### P03 — Developer / Promoter Relationship
Must model relationship scope, delegated access, promoter accounts, project ownership/participation and boundaries between agency-private and promoter-visible data.

### P04 — Project / Building / Inventory
Must preserve Project → Building → Unit identity, dual commercial/construction state, holds, availability, pricing and construction evidence. Reservation concurrency is P0.

### P05 — CRM / Customer Data
Must cover lead creation, assignment, qualification, working state, lifecycle, merge, PII, activities, appointments and source attribution.

### P06 — Sales / Opportunity / Offer / Reservation
Must cover opportunity pipeline, offers, approvals, reservation race safety and contract handoff. Discount/approval thresholds remain governed data, not UI assumptions.

### P07 — Contracts / Documents
Must separate document evidence from contract business state, preserve versions, enforce classification/access/expiry and integrate legal gates.

### P08 — Finance / Collections / Accounting
Must cover payment plans, due/overdue, receipts, allocations, commissions, refunds, ledger, periods and immutable balanced postings.

### P09 — Website Studio / Public Experience
Must cover page/version lifecycle, preview, publish, rollback, SEO, media, forms/CTAs and public projection without becoming inventory truth.

### P10 — Marketing / Attribution / Growth
Must cover campaigns, UTM, web events, ad leads, consent, attribution, spend and conversion evidence with provider idempotency.

### P11 — Scheduling / Communication
Must cover appointment lifecycle, check-in/no-show/reschedule semantics, conversation events, notifications and calendar projections. ASAS appointment truth remains authoritative.

### P12 — Workflow / Approval Orchestration
Must orchestrate domain commands, approvals, retries and timeouts without owning domain state. Approval decisions are append-only evidence.

### P13 — Search / Projection / Read Models
Must define projection ownership, rebuildability, freshness and authorization filtering. Search never authorizes a mutation.

### P14 — Analytics / Executive Intelligence
Must distinguish operational truth, projections, aggregates and forecasts; expose freshness and provenance.

### P15 — Integrations / Plugin Platform
Must isolate credentials/providers, verify signatures, prevent replay, retry safely and expose delivery/dead-letter observability.

### P16 — AI Copilot / Intelligence
Must classify AI actions into read-only insight, recommendation, workflow initiation and governed command execution. Human permission does not automatically grant AI `ALL` scope.

### P17 — Notifications
Must define creation, delivery, failure, retry and user/channel preference semantics without becoming business truth.

### P18 — Audit / Governance / Compliance Evidence
Must preserve append-only evidence, actor/tenant/correlation context, tamper evidence and privileged-action traceability.

### P19 — Observability / Reliability / Recovery
Must establish correlation IDs, traces/logs/metrics, business probes, outbox lag, SLOs, RPO/RTO, restore drills and failure evidence.

### P20 — UX / Design System / Accessibility
Must map user actions to canonical commands, support role/task-specific workflows, RTL/LTR, responsive states, accessibility, loading/empty/error/permission states and golden journeys.

## 5. Universal cross-persona task sequence

For every persona/pillar intersection, Claude must execute in this order:

`discover contract → identify aggregate → identify command → map permission → map state edge → define invariant → define idempotency → identify race → define transaction → audit/outbox → projection → public/private → data lifecycle → integration effects → UX action → positive tests → negative/security tests → evidence`

No CRUD-first implementation is permitted for governed aggregates.

## 6. Persona × pillar priority matrix

The following matrix identifies **task families**, not automatic permissions:

| Persona | Primary pillars | Secondary pillars | P0 dependency |
|---|---|---|---|
| U01 Founder | P01,P06,P08,P14,P18,P19 | P03,P09,P10,P12,P16 | P01 |
| U02 Agency Owner | P01,P02,P03,P04,P06,P08,P09,P10 | P07,P12,P15,P18 | P01 |
| U03 Sales Manager | P01,P05,P06,P11,P14 | P10,P12,P18 | P01,P05,P06 |
| U04 Sales Rep | P01,P05,P06,P11 | P07,P09,P10,P17 | P01,P05,P06 |
| U05 Inside Sales | P01,P05,P11 | P10,P17,P13 | P01,P05 |
| U06 CRM Ops | P01,P05,P11,P13,P17 | P10,P15,P18 | P01,P05 |
| U07 Inventory PM | P01,P03,P04 | P06,P07,P13,P18 | P01,P04 |
| U08 Promoter Operator | P01,P03,P04 | P07,P09,P10,P14 | P01,P03,P04 |
| U09 Technical | P01,P04,P07,P11,P18 | P19,P13 | P01,P04 |
| U10 Finance | P01,P08,P07,P18,P19 | P14,P12 | P01,P08 |
| U11 Collection | P01,P08,P17,P18 | P11,P14 | P01,P08 |
| U12 SAV | P01,P07,P11,P05 | P08,P17,P18 | P01,P05,P07 |
| U13 Marketing | P01,P10,P09,P13 | P11,P15,P17,P14 | P01,P10 |
| U14 Studio | P01,P09,P13,P10 | P15,P17,P20 | P01,P09 |
| U15 BI | P01,P14,P13,P19 | P18,P10 | P01,P13,P14 |
| U16 Platform Admin | P01,P15,P12,P17,P18,P19 | P13,P16,P20 | P01 |
| U17 HR | P01,P02,P18 | P17,P12,P19 | P01,P02 |
| U18 Legal/Docs | P01,P07,P18 | P08,P12,P15 | P01,P07 |
| U19 Integration | P01,P15,P12,P17,P18,P19 | P10,P13,P16 | P01,P15 |
| U20 Buyer/Visitor | P09,P10,P11,P05 | P07,P17,P20 | Public boundary |
| U21 Partner/Broker | P01,P03,P05,P06,P10 | P07,P11,P08 | P01,P03 |
| U22 ASAS Support | P01,P15,P18,P19 | P05,P07,P17 | P01 |

## 7. Autonomy classes

### A0 — Fully autonomous
Claude may choose implementation details, component decomposition, test structure, refactors, observability details, error handling and performance improvements when contracts are already authoritative and no protected semantics change.

### A1 — Autonomous + micro-ADR
Technical alternatives with no change to business meaning require a short ADR recording the choice, rejected alternatives and evidence.

### A2 — Stop dependent task; continue unrelated READY work
Use when a business/legal/HR/financial policy field is missing. Record `OPEN`, identify the exact dependent behavior, and continue other work that is not blocked.

### A3 — Hard stop
Never autonomously cross tenant isolation, weaken authorization, create an unregistered canonical permission/event/context, perform destructive production migration, bypass financial invariants, or grant AI privileged mutation authority implicitly.

## 8. Definition of READY

A task packet becomes `READY` only when:

1. authoritative source is identified;
2. aggregate ownership is known;
3. command is canonical or explicitly approved as a technical command over a canonical operation;
4. required state edge is known;
5. permission mapping exists;
6. critical invariant is known;
7. idempotency/concurrency requirement is known or explicitly marked not applicable;
8. transaction boundary is defined;
9. audit/event requirements are known;
10. tests and evidence are defined.

## 9. Definition of DONE

A packet is `DONE` only when the complete chain is evidenced:

`contract → command → authorization → invariant → transaction → state → audit/outbox → projection → UX → tests → evidence`

and all material residual gaps are explicitly recorded.

## 10. Autonomous continuation rule

After a packet reaches `DONE`, Claude must inspect the dependency graph and select the highest-priority unblocked packet that maximizes downstream unblocking. It must not wait merely because the previous packet belonged to another persona or pillar.

The exception is an escalation trigger: protected business/legal/financial/HR semantics, new canonical boundary, security failure, tenant isolation failure, destructive migration, or evidence failure.

## 11. Current foundation blockers

This catalog intentionally does not claim that the following are closed:

- exhaustive B.2–B.11 edge graphs;
- complete 103-event producer/consumer metadata;
- complete 50-permission command/object/property/ABAC mapping;
- canonical command registry;
- complete invariant catalog;
- idempotency key catalog;
- concurrency/race catalog;
- outbox/inbox implementation contract;
- finance/time/PII lifecycle closure;
- public/private projection closure;
- AI egress/action closure;
- J1–J12 golden-journey traceability;
- Figma action mapping;
- package verifier reconciliation;
- canonical HR ownership/state policy where the authoritative package is silent.

Therefore this document is a **task decomposition contract**, not permission to skip those gates.
