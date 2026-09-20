# ASAS — ENGINEERING SOURCE OF TRUTH 2026

**Artifact ID:** ASAS-ARCH-SOT-2026-001
**Status:** CANONICAL CONTROL RESOURCE — PROPOSED / EVIDENCE-BACKED
**Version:** 1.1.0
**Effective date:** 2026-09-20
**Owner:** Lead Architecture / Founder authority boundary
**Branch:** `platform-architecture-2026`
**Role:** Single consolidation and routing resource for architecture engineering

> This resource consolidates verified repository facts, source-package facts, historical architectural proposals, current engineering decisions, external research principles, unresolved conflicts, and implementation constraints. It does not erase provenance. It does not convert inference into fact. It is the first reference for architecture work; authoritative source artifacts remain authoritative for their own domains until this resource explicitly records their promotion.

---

# 0. OPERATING RULE

ASAS engineering follows:

`REALITY → PROVENANCE → AUTHORITY → RECONCILIATION → MODEL → CONTRACT → VERIFICATION → IMPLEMENTATION`

Never reverse this order to make implementation appear complete.

Status vocabulary:

`VERIFIED | PARTIAL | OPEN | CONFLICT | BLOCKED | NOT_EXECUTED | FOUNDER DECISION REQUIRED | ARCHITECTURAL RESERVATION`

Never use `FINAL`, `DONE`, `READY`, or `COMPLETE` as evidence states without objective proof.

---

# 1. SOURCE HIERARCHY

## 1.1 Brownfield reality

`LIVE DATABASE / LIVE RUNTIME` > `REPOSITORY IMPLEMENTATION` > `APPROVED CONTRACT / REGISTER` > `APPROVED ARCHITECTURE` > `HISTORICAL ARTIFACT` > `INFERENCE`

## 1.2 Desired future behavior

`FOUNDER / PRODUCT DECISION` > `APPROVED ARCHITECTURE` > `APPROVED ADR` > `CANONICAL CONTRACT / REGISTER` > `IMPLEMENTATION`

## 1.3 External engineering technique

`OFFICIAL DOCUMENTATION / STANDARD` > `PRIMARY ENGINEERING SOURCE` > `AUTHORITATIVE RESEARCH` > `REPUTABLE SECONDARY SOURCE` > `COMMUNITY`

External research may establish engineering technique, but cannot override ASAS product authority or live brownfield reality.

---

# 2. CANONICAL CONTROL FILES

| Role | Canonical resource | State |
|---|---|---|
| Architecture target | `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` | PROPOSED v1.3 |
| Engineering route | `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` | ACTIVE PROPOSED v1.3 |
| AI operating context | `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` | ACTIVE v1.3 |
| Consolidated engineering truth | **this file** | CANONICAL CONTROL RESOURCE — PROPOSED v1.1 |
| Context/domain/module evidence | `docs/architecture/ASAS-CONTEXT-DOMAIN-MODULE-EVIDENCE-MATRIX-2026.md` | CANONICAL DERIVED EVIDENCE v1.0 |
| Current checkpoint | `docs/handoff/CURRENT-SESSION-STATE.md` | sole current checkpoint |
| Artifact authority | `docs/governance/CANONICAL-ARTIFACT-REGISTER.md` | canonical governance register |
| Forensic evidence | `docs/audit/FORENSIC-REPOSITORY-RECONSTRUCTION-2026-09-20.md` | evidence |
| Source reconciliation | `docs/audit/SOURCE-REGISTER-STRUCTURAL-RECONCILIATION-2026-09-20.md` | evidence |
| Founder decisions | `docs/governance/FOUNDER-DECISIONS.md` | decision boundary |

The four architecture control resources must point to one another. They do not replace the checkpoint or domain-specific canonical registers.

---

# 3. REPOSITORY IDENTITY

Canonical repository:

`asas-erp-saas-1/As`

Current architecture branch:

`platform-architecture-2026`

The branch remains the active consolidation line. Historical branches are evidence, not implementation authority.

No force push or history rewrite is authorized.

---

# 4. BRANCH FORENSIC MODEL

The repository contains numerous historical/foundation branches, including:

- `foundation/architecture-lineage-reconciliation-v1`
- `foundation/blueprint-canonical-shadows`
- `foundation/blueprint-register-ingestion`
- `foundation/c2-001-traceability-v1`
- `foundation/claude-agent-operating-protocol-v1`
- `foundation/external-audit-integration-v1`
- `foundation/forensic-repository-reconstruction-2026-09-20`
- `foundation/reconcile-context-map-v2`
- `foundation/repository-file-organization-v1`
- `foundation/repository-governance`
- `foundation/source-authority-ledger-v1`
- multiple `feat/foundation-*` closure/command/platform-identity branches
- `main`
- `platform-architecture-2026`

Historical branch material is provenance. It must not become current authority merely because it contains a more detailed document.

**Branch deletion status:** the available GitHub integration in this engineering session does not expose a branch-delete operation. No historical branch is falsely reported as deleted. Deletion remains a repository-maintainer operation after provenance review.

---

# 5. SOURCE-PACKAGE FACTS

Important independently reconciled structural observations:

- 119 unique phase task IDs;
- 3 recurring intelligence rituals;
- 122 `T-*` identifiers when rituals are included;
- 59 Prisma model declarations;
- 17 enum declarations;
- 56 `@@index` declarations;
- 22 `@@unique` declarations;
- 19 relation annotations;
- 103 domain events across 11 emission groups/modules;
- 50 permission keys across 8 persona columns;
- 11 state machines;
- 42 design primitives.

Historical claims such as 114 tasks, 59 models/16 enums, and a 15-table live baseline remain historical evidence, not current runtime truth.

---

# 6. STRONG PRINCIPLES RETAINED

- modular monolith first;
- contract-first engineering;
- transactional outbox;
- idempotent event consumers;
- explicit state machines;
- no direct governed status mutation;
- granular permission/scoping model;
- server-side authorization;
- tenant isolation and RLS defense-in-depth;
- integer minor-unit money representation;
- immutable posted financial facts with reversal/correction semantics;
- reservation concurrency protection;
- auditability;
- Arabic/RTL, French and English support;
- design tokens and component contracts;
- CI architecture enforcement;
- local-first engineering;
- evidence-based research;
- red-team/adversarial verification;
- AI must not directly touch authoritative business data;
- database/runtime reality wins for brownfield facts.

---

# 7. ARCHITECTURAL CONFLICTS

## C2-001 — 9-context vs 15-module decomposition

Nine-context view:

`Core / CRM / Sales / Inventory / Finance / Website Studio / Marketing / Analytics / Documents`

Historical 15-module candidate:

`Lead & CRM / Property & Inventory / Visit Management / Reservation & Contract / Payment & Finance / Commission & Payout / Communication / Identity, Access & Workspace / Notification / Collaboration & Extensibility / Calendar & Scheduling / Activity, Timeline & Audit / Search / Reporting & Analytics / Workflow & Automation Engine`

The historical ADR explicitly states the 15-module proposal is `PROPOSED — awaiting explicit founder acceptance`.

### Engineering truth

The conflict is real. The safe interim model is to preserve both views as evidence and use a separate evidence matrix rather than silently choosing one.

**Status: CONFLICT / FOUNDER DECISION REQUIRED**

## C2-002 — Scheduling ownership

Evidence conflicts between Scheduling as a CRM capability and Scheduling as a dedicated candidate implementation module.

**Status: FOUNDER DECISION REQUIRED**

## C2-003 — Blueprint claims vs repository promotion

Presence in architecture prose does not prove repository implementation or live runtime behavior.

**Status: OPEN**

---

# 8. CONTEXT / DOMAIN / MODULE EVIDENCE MATRIX

Canonical derived matrix:

`docs/architecture/ASAS-CONTEXT-DOMAIN-MODULE-EVIDENCE-MATRIX-2026.md`

The matrix records:

- nine-context domain evidence;
- historical 15-module candidate evidence;
- candidate aggregate ownership;
- platform capability classification;
- candidate dependency rules;
- unresolved boundaries;
- schema-promotion guards;
- H1 exit criteria.

It does **not** authorize schemas, migrations or application code.

### Critical unresolved boundaries now explicitly tracked

- C2-001 domain grouping vs implementation decomposition — FOUNDER DECISION REQUIRED;
- C2-002 Scheduling — FOUNDER DECISION REQUIRED;
- C2-003 Identity/Tenancy platform ownership — OPEN;
- C2-004 Collaboration primitive ownership — OPEN;
- C2-005 Activity/Audit ownership — PARTIAL;
- C2-006 Analytics ownership — PARTIAL.

The existence of these rows is a finding, not a design decision.

---

# 9. DOMAIN / MODULE / DATA DISTINCTIONS

Never collapse:

`Bounded Context ≠ Implementation Module ≠ Aggregate ≠ Entity ≠ Database Schema ≠ Read Model ≠ Worker ≠ Event Consumer ≠ Platform Capability`

Architecture is evaluated by semantics, ownership, invariants, consistency, security, data ownership, change cadence and operational behavior—not feature counts.

---

# 10. CURRENT ARCHITECTURAL SHAPE

Target deployment posture:

**Modular monolith first.**

Primary planes:

1. Experience
2. Application / Decision
3. Domain
4. Platform Kernel
5. Data & Operations

No microservices, Kafka, Kubernetes, service mesh, multi-region active-active, global data lake, ontology database or separate deployable per module is mandatory at this stage.

---

# 11. DOMAIN TRACEABILITY SPINE

`Project → Building → Unit → Lead → Assignment → Activity → Visit → Offer → Reservation → Contract → Payment Plan → Payment → Receipt → Audit → Reporting`

This is a traceability spine, not a single transaction or context claim.

---

# 12. DOMAIN CONTRACT RULES

Every implementation-critical aggregate/behavior must define:

- owner;
- identity;
- invariants;
- commands;
- legal transitions;
- authorization;
- tenant scope;
- concurrency policy;
- persistence boundary;
- audit requirements;
- events;
- tests;
- evidence.

No domain object is automatically a database table.

---

# 13. STATE-MACHINE CONTRACT

`Command → Authentication → Authorization → Tenant Scope → Aggregate Load → Preconditions → Legal Transition → Invariants → State Mutation → Audit → Domain Event → Transactional Outbox → Commit`

Direct governed status mutation is prohibited. Legal and illegal transitions require tests.

---

# 14. EVENT CONTRACT

Registered catalog: 103 event names / 11 emission groups, structurally verified.

Every implementation event must define:

`ID / name / version / producer / aggregate / trigger / invariant / transaction boundary / tenant / causation / correlation / consumers / idempotency / ordering / replay / DLQ / retention / reconciliation / evidence`

Catalog presence does not prove runtime publication.

---

# 15. PERMISSION CONTRACT

Registered matrix: 50 permission keys across 8 persona columns.

Every permission must resolve to:

`resource / action / scope / persona / command / approval threshold / owner / test`

Rules:

- deny by default;
- server-side authority;
- tenant/scope evaluation before sensitive access;
- no client-side widening;
- AI tools inherit caller authority.

---

# 16. TENANCY MODEL

Target hierarchy:

`Platform → Organization → Workspace → Branch → Membership → Role → Permission → Scope → Resource`

Required treatment of multi-organization users, delegated access, service accounts, workers, support/admin access, events, cache keys, search, analytics and storage.

RLS is defense-in-depth, not the only authorization layer.

---

# 17. DATABASE TRUTH MODEL

Keep these separate:

`Target Domain Model ≠ Schema Contract ≠ Prisma Contract ≠ Migration History ≠ Live Database`

Current source schema observation: 59 models / 17 enums / 56 indexes / 22 uniques / 19 relations.

Required reconciliation:

`Introspect → Capture → Drift Inventory → Compare → ADR → Migration Plan → Backup Verification → Rehearsal → Forward-only Migration → Verification → Evidence`

No destructive production database shortcut is authorized.

---

# 18. SECURITY TRUTH MODEL

Threats requiring explicit controls and tests include tenant escape, IDOR, privilege escalation, mass assignment, injection, XSS/CSRF, webhook forgery/replay, secret exposure, PII leakage, financial manipulation, reservation races, API abuse, cross-tenant analytics leakage, AI prompt injection, AI excessive agency and AI tool abuse.

A threat finding closes only with root cause, corrective control, verification, evidence and no conflicting canonical artifact.

---

# 19. AI AUTHORITY MODEL

`User Intent → AI Interpretation → Proposed Action → Tool Request → Policy → Caller Authorization → Domain/Application Service → Transaction → Audit → Event`

AI is never a direct database authority.

Prohibited autonomous actions include destructive production changes, financial corrections, tenant deletion, security bypass, risky credential rotation, legal interpretation, contract-signature decisions and unauthorized mass communication.

---

# 20. DESIGN / UX ENGINEERING

The design system is a contract, not decoration. Source evidence includes 42 component primitives, design tokens, RTL/LTR rules, accessibility contracts, loading/error/empty states, mobile field patterns, workspace patterns and visual-regression intent.

Architecture work defines experience boundaries before page-by-page implementation.

---

# 21. TASK TRUTH

Source reconciliation established 119 unique phase tasks, 3 recurring rituals and 122 T-identifiers including rituals.

Every implementation task must be derived into a packet containing:

`Task ID / objective / scope / non-goals / context / module / owner / dependencies / contracts / schema / commands / queries / permissions / invariants / state transitions / events / concurrency / security / UX / tests / DoD / evidence / rollback / authorization`

Missing fields remain OPEN rather than guessed.

---

# 22. PRODUCT SCOPE

Controlled initial direction:

- property/project presentation;
- inventory visibility;
- lead capture and qualification;
- assignment and commercial activities;
- visits;
- offer/reservation correctness;
- contract foundations;
- controlled payment-plan visibility/financial recording where authorized;
- audit;
- commercial reporting;
- Arabic/RTL, French, English;
- mobile-first operations.

Future reservations remain non-implementation requirements until separately authorized.

---

# 23. OBSERVABILITY AND RECOVERY

Production readiness requires SLI/SLO, latency/error/availability measurement, queue/event lag, DB health, reservation latency, financial posting latency, backup verification, restore rehearsal, RPO/RTO, incident runbooks and degradation evidence.

A backup without verified restore is not recovery readiness.

---

# 24. RESEARCH RULE

For load-bearing external facts:

`Question → primary source → current version/date → corroboration → applicability → decision → evidence → review date`

External research validates engineering technique; it does not override ASAS authority.

---

# 25. LOCAL-FIRST ENGINEERING

Preferred sequence:

`Architecture → Contracts → Local schema → Local migrations → Local tests → CI → Controlled staging → Production`

Cloud identity is introduced when runtime verification requires it, not as the source of architectural design.

---

# 26. ARCHITECTURE GATES

Current gates:

- G00 Platform Identity — BLOCKED
- G01 Canonical Artifacts — PARTIAL
- G02 Architecture Conflict — BLOCKED / FOUNDER DECISION REQUIRED
- G03 Database Reality — BLOCKED
- G04 Security/Tenancy — BLOCKED
- G05 CI Architecture Enforcement — NOT_EXECUTED
- G06 Repository Hygiene — PARTIAL
- G07 Implementation Authorization — BLOCKED

No implementation authorization is implied.

---

# 27. CURRENT ROADMAP

- H0 Reality and Source Control — PARTIAL
- H1 Architectural Reconciliation — BLOCKED / C2-001 + Scheduling
- H2 Domain Contracts — PARTIAL; ownership-dependent items blocked
- H3 Events and Integrations — BLOCKED for runtime implementation
- H4 Security/Tenancy — BLOCKED
- H5 Data Architecture — BLOCKED
- H6 Design System — PARTIAL
- H7 Application Platform Skeleton — BLOCKED
- H8 Controlled Commercial Slice — BLOCKED
- H9 Observability/Recovery — BLOCKED
- H10 Cloud/Runtime Verification — BLOCKED
- H11 Production Readiness — BLOCKED

The roadmap expands when evidence reveals missing engineering work; it does not optimize for a predetermined number of files, contexts, modules or services.

---

# 28. CLAUDE OPERATING RULE

Claude must load:

`CURRENT SESSION STATE → Source of Truth → Blueprint → Roadmap → Context Prompt → Context/Domain/Module Evidence Matrix → relevant canonical contracts/registers → live schema when applicable`

Claude must not use historical branches as authority.

Claude must stop on unresolved architecture ownership, missing authority, unknown runtime identity, unsafe database action, security exception, founder decision boundary or unsupported external claim.

---

# 29. CONSOLIDATION POLICY

One concept → one canonical owner.

Historical documents remain preserved for provenance.

Duplicates are not deleted merely because they overlap. Consolidation requires:

`inventory → provenance → reference search → authority decision → pointer/archive/update → verification`

Historical branches should be deleted only after unique evidence is captured and a repository-maintainer operation removes the refs. The current connector exposes no branch-delete primitive, so deletion is **NOT_EXECUTED**.

---

# 30. CURRENT FINDINGS

| ID | Finding | Status |
|---|---|---|
| SOT-001 | Nine vs 15 architecture views conflict | CONFLICT / FOUNDER DECISION REQUIRED |
| SOT-002 | Scheduling ownership conflict | FOUNDER DECISION REQUIRED |
| SOT-003 | Task-count discrepancy | RECONCILED — 119 + 3 rituals |
| SOT-004 | Schema structural discrepancy | RECONCILED — 59 / 17 / 56 / 22 / 19 observed |
| SOT-005 | Live database identity | BLOCKED / UNVERIFIED |
| SOT-006 | Event register | VERIFIED structurally — 103 / 11 |
| SOT-007 | Permission register | VERIFIED structurally — 50 / 8 |
| SOT-008 | State-machine register | VERIFIED structurally — 11 |
| SOT-009 | Design component inventory | VERIFIED structurally — 42 |
| SOT-010 | Canonical artifact register | PARTIAL — synchronization required |
| SOT-011 | CI evidence on architecture head | NOT_EXECUTED |
| SOT-012 | Historical branch deletion | NOT_EXECUTED — connector limitation |
| SOT-013 | Context/domain/module evidence matrix | CREATED — derived evidence, not authority |
| SOT-014 | Blueprint/Roadmap/Prompt synchronization | UPDATED v1.3; checkpoint update still required |

---

# 31. NEXT EXECUTION CHECKPOINT

## ARCH-2026-H1-CLOSURE

1. Preserve this Source of Truth as the consolidation anchor.
2. Use the context/domain/module evidence matrix for all ownership analysis.
3. Prepare C2-001 founder decision packet.
4. Prepare Scheduling founder decision packet.
5. Derive implementation-safe task packets without changing source semantics.
6. Build aggregate/invariant/command traceability without promoting schema ownership.
7. Build schema traceability only after ownership decisions.
8. Build architecture-as-code checks from actual paths and registers.
9. Repair checkpoint/reference drift.
10. Verify local development/database strategy.
11. Only then authorize the first controlled implementation slice.

**No application code or production database change is authorized by this checkpoint.**

---

# 32. EVIDENCE RULE

Every future update to this file must record:

`date / change / source / reason / authority / affected artifacts / verification / unresolved consequences`

This file is a consolidation index and engineering memory, not permission to silently rewrite authoritative source documents.

---

## CURRENT ENGINEERING TRUTH

ASAS is **not yet implementation-authorized at the platform level**.

The engineering foundation is strong in domain specification, event/state/permission modeling and design intent, but authority reconciliation, runtime identity, executable schema promotion, security/runtime verification and architecture CI remain open or blocked.

The correct next move is **reconciliation and contract closure**, not feature coding.
