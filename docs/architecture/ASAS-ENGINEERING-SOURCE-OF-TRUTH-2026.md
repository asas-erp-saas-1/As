# ASAS — ENGINEERING SOURCE OF TRUTH 2026

**Artifact ID:** ASAS-ARCH-SOT-2026-001  
**Status:** CANONICAL CONTROL RESOURCE — PROPOSED / EVIDENCE-BACKED  
**Version:** 1.2.0  
**Effective date:** 2026-09-20  
**Owner:** Lead Architecture / Founder authority boundary  
**Branch:** `platform-architecture-2026`  
**Role:** Single consolidation and routing resource for architecture engineering

> This resource consolidates verified repository facts, source-package facts, historical architectural proposals, current engineering decisions, external research principles, unresolved conflicts, and implementation constraints. It does not erase provenance, and it does not convert inference into fact. Authoritative source artifacts remain authoritative for their own concepts unless an approved decision explicitly promotes or supersedes them.

---

# 0. OPERATING RULE

ASAS engineering follows:

`REALITY → PROVENANCE → AUTHORITY → RECONCILIATION → MODEL → CONTRACT → VERIFICATION → IMPLEMENTATION`

Status vocabulary:

`VERIFIED | SUPPORTED | PARTIAL | OPEN | CONFLICT | BLOCKED | NOT_EXECUTED | FOUNDER DECISION REQUIRED | ARCHITECTURAL RESERVATION`

---

# 1. SOURCE HIERARCHY

## 1.1 Brownfield reality

`LIVE DATABASE / LIVE RUNTIME` > `REPOSITORY IMPLEMENTATION` > `APPROVED CONTRACT / REGISTER` > `APPROVED ARCHITECTURE` > `HISTORICAL ARTIFACT` > `INFERENCE`

## 1.2 Desired future behavior

`FOUNDER / PRODUCT DECISION` > `APPROVED ARCHITECTURE` > `APPROVED ADR` > `CANONICAL CONTRACT / REGISTER` > `IMPLEMENTATION`

## 1.3 External engineering technique

`OFFICIAL DOCUMENTATION / STANDARD` > `PRIMARY ENGINEERING SOURCE` > `AUTHORITATIVE RESEARCH` > `REPUTABLE SECONDARY SOURCE` > `COMMUNITY`

---

# 2. CANONICAL CONTROL FILES

| Role | Canonical resource | State |
|---|---|---|
| Architecture target | `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` | PROPOSED v1.3 |
| Engineering route | `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` | ACTIVE PROPOSED v1.4 |
| AI operating context | `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` | ACTIVE v1.4 |
| Consolidated engineering truth | this file | CANONICAL CONTROL RESOURCE v1.2 |
| Context/domain/module evidence | `docs/architecture/ASAS-CONTEXT-DOMAIN-MODULE-EVIDENCE-MATRIX-2026.md` | CANONICAL DERIVED EVIDENCE |
| Aggregate/invariant contract | `docs/architecture/ASAS-AGGREGATE-INVARIANT-BOUNDARY-REGISTER-2026.md` | DERIVED CONTRACT v1.0 / OPEN |
| Current checkpoint | `docs/handoff/CURRENT-SESSION-STATE.md` | sole current checkpoint |
| Artifact authority | `docs/governance/CANONICAL-ARTIFACT-REGISTER.md` | governance register |
| Founder decisions | `docs/governance/FOUNDER-DECISIONS.md` | decision boundary |

---

# 3. REPOSITORY IDENTITY

Canonical repository:

`asas-erp-saas-1/As`

Current architecture branch:

`platform-architecture-2026`

Historical branches are provenance, not implementation authority. Branch deletion remains a repository-maintainer operation and is not claimed unless executed with evidence.

---

# 4. SOURCE-PACKAGE FACTS

Current reconciled structural observations include:

- 119 unique phase task IDs;
- 3 recurring ritual IDs;
- 122 `T-*` identifiers including rituals;
- 59 schema models;
- 17 enums;
- 56 indexes;
- 22 unique constraints;
- 19 relation annotations;
- 103 domain events across 11 emission groups;
- 50 permission keys across 8 persona columns;
- 11 state machines;
- 42 design primitives.

These are source observations, not runtime proof and not architecture quotas.

---

# 5. ARCHITECTURAL AUTHORITY RECONCILIATION

## 5.1 Nine-context target

The current V3 target uses:

`Core / CRM / Sales / Inventory / Finance / Website Studio / Marketing / Analytics / Documents`

This is the current high-level domain grouping.

## 5.2 Fifteen-module proposal

The historical `ADR-0001-CANONICAL-CONTEXT-MODULE-DECOMPOSITION.md` and `CANONICAL-CONTEXT-TO-MODULE-MAP.md` contain a proposed implementation decomposition:

`Lead & CRM / Property & Inventory / Visit Management / Reservation & Contract / Payment & Finance / Commission & Payout / Communication / Identity, Access & Workspace / Notification / Collaboration & Extensibility / Calendar & Scheduling / Activity, Timeline & Audit / Search / Reporting & Analytics / Workflow & Automation Engine`

The historical ADR explicitly marks this proposal as awaiting founder acceptance.

### Reclassification

This is **not** currently a requirement to choose between 9 and 15.

`C2-001 = OPEN ARCHITECTURAL REFINEMENT`

The engineering task is to derive implementation modules from ownership, aggregates, invariants, consistency, security, data ownership, change cadence, failure isolation and integration cost.

## 5.3 Scheduling

Historical `ADR-0018` accepted Scheduling as a Core/CRM-hosted capability. The 2026 architecture reopened the question.

`C2-002 = OPEN / PROPOSED SUPERSESSION`

Do not silently supersede ADR-0018. Either explicitly adopt it in the 2026 baseline or create an ADR that replaces it.

---

# 6. DOMAIN / MODULE / DATA DISTINCTIONS

Never collapse:

`Bounded Context ≠ Implementation Module ≠ Aggregate ≠ Entity ≠ Database Schema ≠ Read Model ≠ Worker ≠ Event Consumer ≠ Platform Capability`

No aggregate becomes a table by naming convention. No module becomes a service merely because it exists.

---

# 7. AGGREGATE & INVARIANT CONTRACT

Canonical derived contract:

`docs/architecture/ASAS-AGGREGATE-INVARIANT-BOUNDARY-REGISTER-2026.md`

The current source-supported aggregate candidates include:

- Lead;
- Client;
- Project;
- Unit;
- Listing;
- Visit;
- Reservation;
- Contract;
- PaymentSchedule / Installment;
- CommissionRule;
- CommissionRecord;
- Agency;
- Branch;
- User;
- NotificationPreference.

Source material describes CommunicationLog, Attachment, Activity/Timeline/Audit, Search and Reporting differently; they must not be promoted to aggregates without evidence.

Critical open boundaries:

- Unit ↔ Reservation atomic consistency;
- Offer ownership and invariants;
- Payment vs PaymentSchedule vs Receipt semantics;
- Building ownership and invariants;
- Scheduling ownership.

---

# 8. CORE INVARIANTS

Current source-backed/target invariants include:

1. Lead has one current owner.
2. Lead source/acquisition semantics are controlled.
3. Lead stage transitions follow a legal state machine.
4. Tenant-owned records cannot escape tenant scope.
5. Unit commercial availability and construction state are separate dimensions.
6. One active reservation winner per Unit under concurrency.
7. Contract requires an approved Reservation.
8. Governed Track A installment collection is milestone-gated according to the source rule; legal applicability requires qualified legal verification.
9. Money uses explicit currency and integer minor units where applicable.
10. Posted financial facts are immutable and corrected through controlled reversal/new facts.
11. Balanced double-entry posting is required where ledger functionality is authorized.
12. Commission adjustments require approval.
13. Durable domain events use transactional publication semantics, with outbox as the default architecture.
14. Event consumers are idempotent.
15. AI cannot widen caller authority.

Runtime enforcement remains UNVERIFIED unless evidence exists.

---

# 9. RESERVATION CORRECTNESS

The system must guarantee one active winner per Unit under concurrency.

Required evidence:

- database-level constraint/conditional write strategy;
- transaction/concurrency policy;
- idempotency;
- expiry handling;
- audit;
- outbox/event behavior;
- two-agent race tests;
- duplicate-command tests;
- expiry-vs-conversion race tests;
- reconciliation after partial failure.

The exact PostgreSQL mechanism is not prescribed until schema/workload evidence is available.

---

# 10. STATE MACHINE CONTRACT

`Command → Authentication → Authorization → Tenant Scope → Aggregate Load → Preconditions → Legal Transition → Invariants → State Mutation → Audit → Domain Event → Transactional Outbox → Commit`

Direct governed status mutation is prohibited.

---

# 11. EVENT CONTRACT

Registered observation: 103 event names / 11 emission groups.

Every implementation event requires:

`ID / name / version / producer / aggregate / trigger / invariant / transaction boundary / tenant / causation / correlation / consumers / idempotency / ordering / replay / DLQ / retention / reconciliation / evidence`

Catalog presence does not prove runtime publication.

---

# 12. PERMISSION AND TENANCY

Registered observation: 50 permission keys across 8 persona columns.

Target hierarchy:

`Platform → Organization → Workspace → Branch → Membership → Role → Permission → Scope → Resource`

Rules:

- deny by default;
- server-side authorization;
- tenant scope before sensitive access;
- RLS as defense-in-depth;
- tenant-aware events, caches, search and analytics;
- AI inherits caller authority.

Runtime RLS/tenancy remains BLOCKED until canonical runtime identity is verified and policies are tested.

---

# 13. DATABASE TRUTH

Separate:

`Target Domain Model ≠ Schema Contract ≠ Prisma Contract ≠ Migration History ≠ Live Database`

Source schema observation:

`59 models / 17 enums / 56 indexes / 22 uniques / 19 relations`

Required reconciliation:

`Introspect → Capture → Drift Inventory → Compare → ADR → Migration Plan → Backup Verification → Rehearsal → Forward-only Migration → Verification → Evidence`

No destructive production shortcut is authorized.

---

# 14. SECURITY AND AI

Threat coverage must include tenant escape, IDOR, privilege escalation, mass assignment, injection, XSS/CSRF, webhook forgery/replay, secret exposure, PII leakage, financial manipulation, reservation races, API abuse, cross-tenant analytics leakage, prompt injection, excessive AI agency and tool abuse.

AI authority path:

`Intent → Proposal → Tool Request → Policy → Caller Authorization → Domain/Application Service → Transaction → Audit → Event`

AI is never a direct database authority.

---

# 15. DESIGN / UX

Design architecture precedes page coding:

`tokens → primitives → components → patterns → templates → surfaces`

Source evidence includes 42 design primitives. Arabic/RTL, French/English, mobile field operations, accessibility and failure states are architecture requirements, not cosmetic afterthoughts.

---

# 16. TASK TRUTH

Source reconciliation establishes 119 phase task IDs, 3 recurring rituals and 122 total `T-*` identifiers including rituals.

Implementation packets must carry:

`Task / objective / scope / non-goals / owner / context / module / dependencies / contracts / schema / commands / permissions / invariants / states / events / concurrency / security / UX / tests / DoD / evidence / rollback / authorization`

Unknown fields remain OPEN or BLOCKED.

---

# 17. PRODUCT SCOPE

Controlled initial direction:

- property/project presentation;
- inventory visibility;
- lead capture/qualification;
- assignment and activities;
- visits;
- offers/reservations with correctness controls;
- contract foundations;
- controlled payment-plan/financial recording where authorized;
- audit;
- commercial reporting;
- Arabic/RTL, French and English;
- mobile-first operations.

Future capabilities remain architectural reservations unless separately authorized.

---

# 18. OBSERVABILITY AND RECOVERY

Production readiness requires measured SLI/SLO, latency/error/availability, queue/event lag, database health, reservation latency, financial posting latency, backup verification, restore rehearsal, RPO/RTO and operational runbooks.

A backup without verified restore is not recovery readiness.

---

# 19. CURRENT GATES

- G00 Platform Identity — BLOCKED
- G01 Canonical Artifacts — PARTIAL
- G02 Domain/Module Authority — OPEN REFINEMENT
- G03 Aggregate/Invariant Contracts — PARTIAL / ACTIVE
- G04 Database Reality — BLOCKED
- G05 Security/Tenancy — BLOCKED
- G06 CI Architecture Enforcement — NOT_EXECUTED
- G07 Implementation Authorization — BLOCKED

No implementation authorization is implied.

---

# 20. CURRENT ROADMAP

- H0 Reality and Source Control — PARTIAL
- H1 Architectural Reconciliation — PARTIAL / H1.3 ACTIVE
- H2 Domain Contracts — PARTIAL
- H3 Events and Integrations — BLOCKED for runtime implementation
- H4 Security/Tenancy — BLOCKED
- H5 Data Architecture — BLOCKED
- H6 Design System — PARTIAL
- H7 Application Platform Skeleton — BLOCKED
- H8 Controlled Commercial Slice — BLOCKED
- H9 Observability/Recovery — BLOCKED
- H10 Cloud/Runtime Verification — BLOCKED
- H11 Production Readiness — BLOCKED

---

# 21. BRANCH CONSOLIDATION

Historical branches remain provenance. The current GitHub integration does not expose branch deletion, so no historical branch is reported deleted without evidence.

Before any future deletion:

`inventory → provenance extraction → reference search → canonical promotion → verification → maintainer-approved deletion`

---

# 22. CURRENT CHECKPOINT

**ARCH-2026-H1.3-AGGREGATE-INVARIANT-CLOSURE**

Next work:

1. close Unit/Reservation atomic boundary;
2. define Offer ownership/invariants;
3. reconcile Payment/PaymentSchedule/Receipt semantics;
4. define Building ownership/invariants;
5. map invariants to state machines, permissions and events;
6. resolve or explicitly reaffirm Scheduling through ADR;
7. only then promote schema contracts toward executable local design.

No application or production database implementation is authorized by this document.
