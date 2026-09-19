# ASAS — PLATFORM MASTER EXECUTION BLUEPRINT

Status: CANONICAL DERIVED EXECUTION BLUEPRINT
Authority: Derived from the ASAS source package, current repository governance, current checkpoint, and verified external audit evidence. This document does not silently override an approved product decision, the v1.6.1 Blueprint, or live runtime evidence.

## 1. PURPOSE

This document consolidates the distributed truth needed to build ASAS as a long-lived Real Estate Operating System. It is an execution map, not a replacement for source specifications.

The strategic target is an enterprise real-estate operating platform that starts with ASAS/Invepro operations in Algeria, proves the end-to-end sales and money lifecycle, then expands toward multi-company, SaaS, multi-country, AI-assisted operations, and eventually holding-scale intelligence.

## 2. AUTHORITY MODEL

Use this order when sources conflict:

1. Approved product / architecture decision with provenance
2. Current governance and execution contracts
3. Current source Blueprint/package (v1.6.1)
4. Current registers and derived artifacts with verified provenance
5. Current repository implementation
6. Historical drafts / compatibility artifacts
7. Inference

Live database/runtime evidence is authoritative for CURRENT REALITY only. It is not authority for the desired future architecture.

If two authoritative-looking artifacts disagree and no approved decision resolves the conflict: OPEN CONFLICT → evidence package → decision/ADR → verification. Never normalize by guesswork.

## 3. PRODUCT NORTH STAR

ASAS is a Real Estate Operating System, not merely a CRM or accounting application.

Strategic evolution:

ASAS internal operating system
→ V1 operational ERP
→ V2 AI-assisted decision system
→ V3 multi-company platform
→ V4 multi-country platform
→ Enterprise SaaS
→ Holding-scale operating system

The enterprise vision explicitly covers development, sales, construction, property management, investment, marketing, finance/accounting, HR, executive governance, AI, and eventual Algeria/North Africa/GCC/Middle East expansion.

The vision is a destination map. It does not authorize building future capabilities in MVP.

## 4. BUSINESS REALITY TO PRESERVE

The current BRD identifies two sales tracks under one pipeline:

Track A — Own Projects / Developer:
- project → building → unit
- off-plan/construction lifecycle
- staged payments tied to milestones
- Law 11-04 regulatory constraints
- ASAS earns sale revenue

Track B — Resale / Brokerage:
- third-party property/listing under mandate
- negotiated sale and notarial path
- typically one principal payment event
- ASAS earns commission

Both tracks share one lead/pipeline model and diverge in transaction/payment rules. The implementation specification defines a 17-stage pipeline from lead capture through post-sale or loss.

## 5. MVP BOUNDARY

MVP is ASAS/Invepro-first and must prove the real operating loop before enterprise expansion.

MVP core:
- Leads / CRM
- Property and unit inventory
- Visits
- Reservations
- Contracts
- Installment schedules
- Payments / payment tracking
- Basic operational dashboard
- Auditability and permissions required to make the above safe

Explicitly future, not MVP:
- autonomous AI agents
- multi-country complexity
- advanced accounting
- construction automation
- broad workflow automation beyond the minimum required lifecycle
- holding-company intelligence

MVP success is operational, not cosmetic: a real transaction must pass end-to-end through the system, cashflow must be visible, and lead tracking must become digital and auditable.

## 6. DOMAIN / CONTEXT RECONCILIATION

Current source evidence contains three distinct architecture claims:

A. Master Roadmap: Phase 1.5 is declared Approved v2 with 15 bounded contexts and a Context Map v2.
B. Enterprise Domain Model artifact: explicitly marked Draft and visibly models 13 contexts.
C. Master Implementation Specification: defines 15 implementation modules/schemas.

These are not equivalent concepts:

Bounded Context ≠ Module ≠ PostgreSQL Schema ≠ Aggregate ≠ Read Model ≠ Worker ≠ Event Consumer.

The 13-context draft contains these visible contexts:
- Lead & CRM
- Property & Inventory
- Visit Management
- Reservation & Contract
- Payment & Finance
- Commission & Payout
- Communication
- Identity & Access
- Notification
- Document & Attachment
- Activity, Timeline & Audit
- Search
- Reporting & Analytics

The draft also classifies Lead & CRM as the core domain; Property/Inventory, Reservation/Contract, Payment/Finance, Commission/Payout and Reporting as supporting; Identity, Communication, Document, Timeline/Audit and Search as generic; AI as future/supporting.

The implementation specification adds module/schema decomposition that must not be promoted to bounded contexts without approved evidence.

C2-001 therefore remains a hard stop until the actual approved Domain Model v2 and Context Map v2, with provenance/approval evidence, are recovered or formally reconstructed through an authorized decision process.

## 7. CORE BUSINESS LIFECYCLES

The canonical operating backbone is:

Lead capture
→ assignment
→ first contact
→ qualification
→ property match
→ visit
→ interest
→ offer
→ negotiation
→ reservation
→ contract preparation
→ payment follow-up
→ sale close
→ post-sale
or Lost at defined transition points.

For Track A:
Contract / milestone state
→ installment eligibility
→ payment
→ collection / balance
→ delivery / after-sales as later phases mature.

For Track B:
Reservation / promise
→ notarial path
→ transaction completion
→ commission.

This lifecycle is the primary implementation spine. Features that do not serve a justified lifecycle, control, or reporting need are not implementation priorities.

## 8. DATA AND INTEGRITY PRINCIPLES

Non-negotiable principles carried from the operating contract and source package:

- Reality is the schema: introspect live DB before schema-touching work.
- Extend, never rewrite existing production data structures without explicit authorized migration decision.
- Money is integer centimes / exact monetary representation; posted financial records are immutable and corrections are compensating entries.
- State transitions are controlled by domain/state-machine rules and produce auditable events.
- Every mutation is authorized; deny by default.
- Tenant isolation must be enforced at database level where the target architecture requires it, not only by UI/application filtering.
- Events should support audit, timeline, notifications, search, reporting and future AI consumption without coupling those consumers directly to business-rule owners.
- Idempotency is required for money, reservations, contracts and other externally retried commands.
- Event ordering, retries, backpressure and failure handling are future scale requirements, but their contracts must not contradict MVP simplicity.

## 9. EVENT / READ-MODEL ARCHITECTURE

The source domain model identifies the event stream as a shared integration backbone.

Business-rule contexts publish facts such as:
- LeadCreated
- LeadAssigned
- LeadStageChanged
- VisitScheduled
- VisitCompleted
- CommunicationLogged
- UnitAvailabilityChanged
- PriceUpdated
- ReservationCreated
- ContractSigned
- PaymentScheduleGenerated
- PaymentReceived
- PaymentOverdue
- CommissionCalculated / Adjusted / Approved
- DocumentUploaded

Activity/Timeline/Audit, Notification, Search and Reporting/Analytics are primarily consumers/read models rather than owners of core business rules.

AI is a downstream consumer of governed operational data and events. AI must not become the source of truth for transactional state.

## 10. SECURITY / TENANCY

The target platform must support:
- authentication and session integrity
- RBAC plus scoped attributes where required
- agency/workspace/branch tenancy boundaries
- project/team/data visibility rules
- audit logging
- consent and data-subject controls
- secret management
- encryption
- backup/recovery
- monitoring and incident response

The source package references Algerian Law 18-07 as amended by Law 25-11 for data protection and Law 11-04 for off-plan sales/payment constraints. These legal claims require legal/operational validation before being treated as implementation law beyond the documented project requirements.

## 11. PLATFORM ARCHITECTURE DIRECTION

The source package contains both modular-monolith-first and future distributed-scale material. The execution policy is:

Start with a strongly bounded modular architecture that is operationally simple.

Do not introduce microservices, Kafka, Kubernetes, sharding, multi-region infrastructure, or a distributed event mesh merely because the enterprise blueprint describes them as future scale options.

Future extraction must be evidence-driven by measured load, team boundaries, reliability needs, deployment independence, or regulatory/data-residency requirements.

The platform should preserve extraction seams through:
- explicit module ownership
- domain services
- typed contracts
- transactional outbox/event publication
- no cross-domain direct database writes
- idempotent command handling
- observable boundaries.

## 12. ROADMAP — FOUNDATION TO GLOBAL PLATFORM

### F0 — Repository / Control Plane
Status: substantially verified.
- canonical repository identity
- governance
- handoff
- naming/ownership
- CI foundation
- Git discipline

### F1 — Canonical Source Reconciliation
Status: in progress.
- reconcile artifact register
- remove stale loader references
- consolidate readiness ownership
- preserve historical provenance
- validate source package lineage.

### F2 — Architecture Authority
Status: BLOCKED at C2-001.
- recover approved Domain Model v2
- recover approved Context Map v2
- prove provenance/approval
- produce ADR
- publish canonical Context → Module ownership map.

### F3 — Product Scope / Capability Map
- establish MVP/V1/V2/V3/V4/Enterprise/Future boundaries
- map capabilities to business value
- identify dependencies and explicit exclusions.

### F4 — Task / Contract Graph
- reconcile task counts and IDs
- promote controlled task shards
- define files_allowed / files_forbidden
- define DoD and verification evidence for every implementation packet.

### F5 — Persistence / Schema Contract
- reconcile 59 models / 17 enums / 56 indexes source observations against repository contracts
- map aggregate ownership to persistence
- define tenant keys, constraints and indexes
- keep contract non-executable until authorized.

### F6 — Security / Tenancy
- identity
- authorization
- tenant isolation
- RLS design
- audit
- consent/privacy
- secrets
- threat model.

### F7 — Platform Identity / GATE-00
- verify exact Supabase project for `As`
- verify Vercel project/domain if applicable
- establish technical project-ref guard
- establish schema-touching preflight guard
- capture evidence.

### F8 — Database Reality / Recovery
- introspection
- drift inventory
- backup evidence
- restore drill evidence
- migration strategy
- only then authorized database changes.

### F9 — Claude Implementation Readiness
- one canonical readiness owner
- loading chain verified
- task packet contract verified
- platform identity verified
- architecture/schema contracts verified
- branch/PR controls verified
- CI verified
- implementation authorization boundaries verified.

### I1 — First Bounded Implementation Slice
Implement only one vertical slice end-to-end, preferably the smallest safe slice that exercises identity, tenancy, authorization, lead lifecycle, persistence, audit and verification.

### I2 — MVP Sales Operating Loop
Lead → match → visit → reservation → contract → installment/payment → dashboard/audit.

### I3 — Operational V1
Collections, light finance, RBAC expansion, CRM automation, notifications and operational reporting.

### I4 — AI V2
Lead scoring, sales probability, cashflow forecasting, collections risk and controlled executive intelligence. AI remains advisory until separately authorized for automation.

### I5 — Multi-company V3
Agency/company/workspace expansion, shared governance, consolidated reporting and controlled capital/portfolio views.

### I6 — Multi-country V4
Localization, currencies, legal templates, tax/configuration and country-specific integrations only after country-specific requirements are established.

### I7 — Enterprise SaaS
White-labeling, modular packaging, API platform, tenant onboarding, billing and extension/plugin boundaries.

### I8 — Holding OS
Capital allocation, portfolio intelligence, risk, executive planning and governed cross-company intelligence.

## 13. EXECUTION CONTROL LOOP

Every task:

INSPECT → PLAN → VERIFY → IMPLEMENT → PROVE → CONVERGE → REPORT

A task is closed only when:
- artifact exists
- expected behavior exists
- verification exists
- evidence exists
- references/registers are updated
- no known contradiction remains

Allowed states:
VERIFIED / PARTIAL / BLOCKED / NOT_EXECUTED.

Never close a task because code exists or a tool reports success without evidence.

## 14. CURRENT HARD BLOCKERS

1. C2-001 architecture authority / approved v2 recovery.
2. C2-002 live database identity and reality.
3. Task register discrepancy: 114 declared vs 119 observed.
4. Schema discrepancy: 59/16/15 declared vs 59/17/56 observed.
5. Readiness-document duplication / canonical ownership.
6. Stale artifact register and loader-reference defects identified by external audit.
7. Branch hygiene debt and unverified main branch protection.
8. Repository visibility must be confirmed as intentional.

These blockers are not reasons to redesign the product. They are control-plane prerequisites for safe implementation.

## 15. FIRST EXECUTION ORDER

1. Repair canonical artifact register and context-loading references.
2. Consolidate readiness ownership and loading chain.
3. Recover approved Domain Model v2 / Context Map v2 provenance.
4. Close C2-001 with an ADR and canonical context/module map.
5. Reconcile task register and promote task packets.
6. Reconcile schema contract without touching live DB.
7. Execute GATE-00 with technical platform identity evidence.
8. Establish live DB baseline / backup / restore evidence.
9. Complete security/tenancy readiness.
10. Run final Claude readiness gate.
11. Authorize one bounded vertical implementation slice.
12. Expand only after evidence-based closure of the prior slice.

## 16. NON-NEGOTIABLE STOP CONDITIONS

Stop immediately when:
- source authority is ambiguous
- live platform identity is unverified
- a database mutation would be destructive or insufficiently authorized
- an implementation task lacks a bounded contract
- a required dependency is missing
- a proposed architecture change is inferred rather than sourced
- verification cannot produce evidence

## 17. SUCCESS DEFINITION

The platform is not considered ready because it has many documents, a large schema, a polished dashboard, or a successful build.

The target is a system whose:
- business truth is explicit
- architecture has one canonical owner
- data ownership is explicit
- money/state transitions are enforceable
- tenant boundaries are enforceable
- events are traceable
- tasks are bounded
- database reality is verified
- platform identity is technically guarded
- Claude can act autonomously only within explicit permissions
- every important change can be proven after implementation.

That is the foundation required before ASAS can safely evolve from an internal Algerian real-estate operating system into a global real-estate platform.
