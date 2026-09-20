# ASAS — ENGINEERING SOURCE OF TRUTH 2026

**Artifact ID:** ASAS-ARCH-SOT-2026-001
**Status:** CANONICAL CONTROL RESOURCE — PROPOSED / EVIDENCE-BACKED
**Version:** 1.0.0
**Effective date:** 2026-09-20
**Owner:** Lead Architecture / Founder authority boundary
**Branch:** `platform-architecture-2026`
**Role:** Single consolidation and routing resource for architecture engineering

> This resource consolidates verified repository facts, source-package facts, historical architectural proposals, current engineering decisions, external research principles, unresolved conflicts, and implementation constraints. It does not erase provenance. It does not convert inference into fact. It is the first reference for architecture work; authoritative source artifacts remain authoritative for their own domains until this resource explicitly records their promotion.

---

## 0. OPERATING RULE

ASAS engineering follows:

`REALITY → PROVENANCE → AUTHORITY → RECONCILIATION → MODEL → CONTRACT → VERIFICATION → IMPLEMENTATION`

Never reverse this order to make implementation appear complete.

Status vocabulary:

`VERIFIED | PARTIAL | OPEN | CONFLICT | BLOCKED | NOT_EXECUTED | FOUNDER DECISION REQUIRED | ARCHITECTURAL RESERVATION`

Never use `FINAL`, `DONE`, `READY`, or `COMPLETE` as evidence states without objective proof.

---

# 1. SOURCE HIERARCHY

## 1.1 Brownfield reality

`LIVE DATABASE / LIVE RUNTIME`
`>` `REPOSITORY IMPLEMENTATION`
`>` `APPROVED CONTRACT / REGISTER`
`>` `APPROVED ARCHITECTURE`
`>` `HISTORICAL ARTIFACT`
`>` `INFERENCE`

## 1.2 Desired future behavior

`FOUNDER / PRODUCT DECISION`
`>` `APPROVED ARCHITECTURE`
`>` `APPROVED ADR`
`>` `CANONICAL CONTRACT / REGISTER`
`>` `IMPLEMENTATION`

## 1.3 External engineering technique

`OFFICIAL DOCUMENTATION / STANDARD`
`>` `PRIMARY ENGINEERING SOURCE`
`>` `AUTHORITATIVE RESEARCH`
`>` `REPUTABLE SECONDARY SOURCE`
`>` `COMMUNITY`

External research may establish engineering technique, but cannot override ASAS product authority or live brownfield reality.

---

# 2. CANONICAL CONTROL FILES

| Role | Canonical resource | State |
|---|---|---|
| Architecture target | `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` | PROPOSED |
| Engineering route | `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` | ACTIVE PROPOSED |
| AI operating context | `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` | ACTIVE |
| Consolidated engineering truth | **this file** | CANONICAL CONTROL RESOURCE — PROPOSED |
| Current checkpoint | `docs/handoff/CURRENT-SESSION-STATE.md` | sole current checkpoint |
| Artifact authority | `docs/governance/CANONICAL-ARTIFACT-REGISTER.md` | canonical governance register |
| Forensic evidence | `docs/audit/FORENSIC-REPOSITORY-RECONSTRUCTION-2026-09-20.md` | evidence |
| Source reconciliation | `docs/audit/SOURCE-REGISTER-STRUCTURAL-RECONCILIATION-2026-09-20.md` | evidence |
| Founder decisions | `docs/governance/FOUNDER-DECISIONS.md` | decision boundary |

The three architecture control files and this Source of Truth must point to one another. They do not replace the checkpoint or domain-specific canonical registers.

---

# 3. REPOSITORY IDENTITY

Canonical repository:

`asas-erp-saas-1/As`

Current architecture branch:

`platform-architecture-2026`

Current branch head verified during this consolidation:

`eb215192081104f20f41a1211dd5cc65407608ce`

Parent:

`7ef9c3f2b3357c3ceb4246f069913c85f79adf34`

No force push or history rewrite is authorized.

The branch is the active consolidation line. Historical branches are evidence, not implementation authority.

---

# 4. BRANCH FORENSIC MODEL

The repository currently contains numerous historical/foundation branches, including:

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

Historical branch material has been reviewed as provenance where relevant. It must not be treated as current authority merely because it contains a more detailed document.

**Branch deletion status:** the available GitHub integration in this engineering session does not expose a branch-delete operation. Therefore no historical branch is falsely reported as deleted. The correct cleanup action is recorded as a repository-maintainer operation after provenance/consolidation review. No branch ref is force-moved to simulate deletion.

---

# 5. SOURCE-PACKAGE FACTS

The supplied source material contains a substantial enterprise architecture specification. Important independently reconciled structural observations include:

- 119 unique phase task IDs;
- 3 recurring intelligence rituals;
- 122 `T-*` identifiers when rituals are included;
- 59 Prisma model declarations;
- 17 enum declarations in the source observed during reconciliation;
- 56 `@@index` declarations;
- 22 `@@unique` declarations;
- 19 relation annotations;
- 103 domain events across 11 emission groups/modules;
- 50 permission keys across 8 persona columns;
- 11 state machines;
- 42 design primitives in the component inventory.

The source package and older AGENTS material also contain historical claims of 114 tasks, 59 models/16 enums, and a 15-table live baseline. These are **historical claims**, not silently promoted current facts.

The external audit independently confirmed the 103/50/11/42 register counts. fileciteturn120file3L2-L2

---

# 6. WHAT IS STRONG AND RETAINED

The following engineering principles are repeatedly supported by the source material and retained unless a later approved decision supersedes them:

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

The source AGENTS material explicitly states that the Blueprint is the specification of record, contracts precede data work, and live database introspection wins for pre-existing tables. fileciteturn120file11L2-L2

---

# 7. ARCHITECTURAL CONFLICTS — DO NOT HIDE

## C2-001 — 9-context vs 15-module decomposition

### Evidence A — nine-context condensed view

`Core / CRM / Sales / Inventory / Finance / Website Studio / Marketing / Analytics / Documents`

This appears in `AGENTS.md` and the earlier V3 architecture material. The source AGENTS text also places Scheduling inside CRM. fileciteturn120file12L2-L2

### Evidence B — 15-module candidate

A historical ADR proposes:

1. Lead & CRM
2. Property & Inventory
3. Visit Management
4. Reservation & Contract
5. Payment & Finance
6. Commission & Payout
7. Communication
8. Identity, Access & Workspace
9. Notification
10. Collaboration & Extensibility
11. Calendar & Scheduling
12. Activity, Timeline & Audit
13. Search
14. Reporting & Analytics
15. Workflow & Automation Engine

The historical ADR explicitly states `PROPOSED — awaiting explicit founder acceptance`.

### Engineering truth

The conflict is real. The safe interpretation is not that one count is automatically correct. A nine-context domain grouping and a finer implementation-module decomposition may coexist, but that relationship has not been formally accepted.

### Status

**CONFLICT / FOUNDER DECISION REQUIRED**

No schema-per-module, task ownership, dependency, or implementation decision may depend on choosing one model silently.

---

## C2-002 — Scheduling ownership

Evidence conflicts between the nine-context AGENTS statement (`CRM scheduling submodule`) and the historical 15-module proposal (`Calendar & Scheduling` dedicated module/schema).

The source material also contains a Scheduling chapter asserting that ASAS owns appointment truth. That is domain evidence, not by itself sufficient to decide implementation ownership.

### Status

**FOUNDER DECISION REQUIRED**

---

## C2-003 — Blueprint claims vs repository promotion

The source Blueprint describes a large architecture, but not every described register or schema artifact is currently promoted to executable/canonical status.

### Rule

Presence in source prose ≠ repository implementation ≠ live runtime.

---

# 8. DOMAIN / MODULE / DATA DISTINCTIONS

These concepts must never be collapsed:

`Bounded Context ≠ Implementation Module ≠ Aggregate ≠ Entity ≠ Database Schema ≠ Read Model ≠ Worker ≠ Event Consumer ≠ Platform Capability`

The architecture is therefore evaluated on ownership and semantics, not on feature counts or document counts.

---

# 9. CURRENT ARCHITECTURAL SHAPE

Target deployment posture:

**Modular monolith first.**

Primary planes:

1. Experience
2. Application / Decision
3. Domain
4. Platform Kernel
5. Data & Operations

Initial architecture does not require:

- microservices;
- Kafka;
- Kubernetes;
- service mesh;
- multi-region active-active;
- global data lake;
- ontology database;
- separate deployables per module.

These remain architectural reservations until measured evidence and an ADR justify them.

---

# 10. DOMAIN TRACEABILITY SPINE

The commercial loop is:

`Project → Building → Unit → Lead → Assignment → Activity → Visit → Offer → Reservation → Contract → Payment Plan → Payment → Receipt → Audit → Reporting`

This is a traceability spine, not a claim that all stages share one context or transaction.

---

# 11. DOMAIN CONTRACT RULES

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

# 12. STATE-MACHINE CONTRACT

Required mutation pipeline:

`Command → Authentication → Authorization → Tenant Scope → Aggregate Load → Preconditions → Legal Transition → Invariants → State Mutation → Audit → Domain Event → Transactional Outbox → Commit`

Direct governed status mutation is prohibited.

Both legal and illegal transitions require tests.

---

# 13. EVENT CONTRACT

The registered event catalog is independently verified at 103 events / 11 emission groups. fileciteturn120file3L2-L2

Every implementation event must define:

`ID / name / version / producer / aggregate / trigger / invariant / transaction boundary / tenant / causation / correlation / consumers / idempotency / ordering / replay / DLQ / retention / reconciliation / evidence`

Catalog presence does not prove runtime publication.

---

# 14. PERMISSION CONTRACT

The registered matrix contains 50 permission keys across 8 persona columns. fileciteturn120file3L2-L2

Every permission must resolve to:

`resource / action / scope / persona / command / approval threshold / owner / test`

Rules:

- deny by default;
- server-side authority;
- tenant/scope evaluation before sensitive data access;
- no client-side widening;
- AI tools inherit caller authority.

---

# 15. TENANCY MODEL

Target hierarchy:

`Platform → Organization → Workspace → Branch → Membership → Role → Permission → Scope → Resource`

Required treatment of:

- multi-organization users;
- delegated access;
- service accounts;
- workers;
- support/admin access;
- events;
- cache keys;
- search;
- analytics;
- storage.

RLS is defense-in-depth, not the only authorization layer.

---

# 16. DATABASE TRUTH MODEL

Keep these separate:

`Target Domain Model ≠ Schema Contract ≠ Prisma Contract ≠ Migration History ≠ Live Database`

The source contract observations include 59 models and 17 enums in the current reconciliation. Historical AGENTS material reports 59/16 and a 15-table live baseline; the live database must be introspected before any claim about current runtime reality. fileciteturn120file6L2-L2

Required reconciliation sequence:

`Introspect → Capture → Drift Inventory → Compare → ADR → Migration Plan → Backup Verification → Rehearsal → Forward-only Migration → Verification → Evidence`

Never use production `DROP`, `TRUNCATE`, `RESET`, blind recreate, or destructive rename without explicit authorization and rehearsed recovery evidence.

---

# 17. SECURITY TRUTH MODEL

Threats requiring explicit controls and tests:

- tenant escape;
- IDOR;
- privilege escalation;
- mass assignment;
- SQL injection;
- XSS/CSRF;
- webhook forgery/replay;
- secret exposure;
- PII leakage;
- financial manipulation;
- reservation races;
- API abuse/rate-limit bypass;
- cross-tenant analytics leakage;
- AI prompt injection;
- AI excessive agency;
- AI tool abuse;
- storage access violations.

A threat finding closes only with root cause, corrective control, verification, evidence and no conflicting canonical artifact.

---

# 18. AI AUTHORITY MODEL

`User Intent → AI Interpretation → Proposed Action → Tool Request → Policy → Caller Authorization → Domain/Application Service → Transaction → Audit → Event`

AI is never a direct database authority.

Autonomous prohibition includes:

- destructive production changes;
- financial corrections;
- tenant deletion;
- security bypass;
- risky credential rotation;
- legal interpretation;
- contract-signature decisions;
- unauthorized mass communication.

The supplied V3 explicitly retains this human authority boundary and research protocol. fileciteturn120file0L2-L2

---

# 19. DESIGN / UX ENGINEERING

The design system is a contract, not decoration.

Current source evidence includes:

- 42 component primitives;
- design tokens;
- RTL/LTR rules;
- accessibility contracts;
- loading/error/empty states;
- mobile field patterns;
- workspace patterns;
- visual regression intent.

The external audit independently counted 42 primitives. fileciteturn120file3L2-L2

Architecture work must define experience boundaries before page-by-page implementation.

---

# 20. TASK TRUTH

Source reconciliation established:

- 119 unique phase tasks;
- 3 recurring rituals;
- 122 T-identifiers including rituals.

Older AGENTS material says 114 tasks. That is historical/source-edition evidence, not current truth. The source task register is not sufficient by itself to authorize implementation because it lacks a complete packet for context ownership, dependencies, invariants, permissions, schema impact, concurrency, tests and Definition of Done.

Every implementation task must be derived into a task packet containing:

`Task ID / objective / scope / non-goals / context / module / owner / dependencies / contracts / schema / commands / queries / permissions / invariants / state transitions / events / concurrency / security / UX / tests / DoD / evidence / rollback / authorization`

Missing fields remain `OPEN` rather than guessed.

---

# 21. PRODUCT SCOPE

Current controlled product direction:

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

Future reservations, not implementation requirements:

- autonomous finance;
- autonomous AI;
- marketplace;
- construction ERP;
- property management expansion;
- developer platform;
- global multi-country packs;
- active-active multi-region;
- global data lake;
- premature microservices.

---

# 22. OBSERVABILITY AND RECOVERY

Production readiness requires evidence for:

- SLI/SLO;
- latency/error rate/availability;
- queue and event lag;
- DB health;
- reservation latency;
- financial posting latency;
- backup;
- restore rehearsal;
- RPO/RTO;
- incident runbooks;
- degradation/failure behavior.

A backup without verified restore is not recovery readiness.

---

# 23. RESEARCH RULE

For any load-bearing external fact:

`Question → primary source → current version/date → corroboration → applicability → decision → evidence → review date`

The repository source explicitly prioritizes official documentation, standards/regulatory sources, vendor documentation, authoritative research, reputable secondary analysis, and community evidence only as supplementary evidence. fileciteturn120file9L2-L2

Current engineering research already incorporated into the 2026 architecture includes DDD/domain-boundary guidance, modular-monolith evolution, PostgreSQL concurrency semantics, Supabase local migration workflows, GitHub status-check evidence, and OWASP excessive-agency controls.

---

# 24. LOCAL-FIRST ENGINEERING

Architecture and initial engineering do not require cloud runtime.

Preferred sequence:

`Architecture → Contracts → Local schema → Local migrations → Local tests → CI → Controlled staging → Production`

Cloud identity is introduced when runtime verification requires it, not as the source of architectural design.

---

# 25. ARCHITECTURE GATES

Current gates:

- G00 Platform Identity — BLOCKED
- G01 Canonical Artifacts — PARTIAL
- G02 Architecture Conflict — BLOCKED / FOUNDER DECISION REQUIRED
- G03 Database Reality — BLOCKED
- G04 Security/Tenancy — BLOCKED
- G05 CI Architecture Enforcement — NOT_EXECUTED
- G06 Repository Hygiene — PARTIAL
- G07 Implementation Authorization — BLOCKED

No implementation authorization is implied by this resource.

---

# 26. CURRENT ROADMAP

### H0 Reality and Source Control
Status: PARTIAL

### H1 Architectural Reconciliation
Status: BLOCKED — C2-001 / Scheduling

### H2 Domain Contracts
Status: PARTIAL; ownership-dependent items blocked

### H3 Events and Integrations
Status: BLOCKED for runtime implementation; register structurally verified

### H4 Security/Tenancy
Status: BLOCKED pending ownership/runtime identity

### H5 Data Architecture
Status: BLOCKED

### H6 Design System
Status: PARTIAL and can progress independently where safe

### H7 Application Platform Skeleton
Status: BLOCKED

### H8 Controlled Commercial Slice
Status: BLOCKED

### H9 Observability/Recovery
Status: BLOCKED

### H10 Cloud/Runtime Verification
Status: BLOCKED

### H11 Production Readiness
Status: BLOCKED

The roadmap expands when evidence reveals missing engineering work; it does not optimize for a predetermined number of files, contexts, modules or services.

---

# 27. CLAUDE OPERATING RULE

Claude must load, in order:

`CURRENT SESSION STATE → this Source of Truth → Blueprint → Roadmap → Context Prompt → relevant canonical contracts/registers → live schema when applicable`

Claude must not use historical branches as authority.

Claude must stop on:

- unresolved architecture ownership;
- missing authority;
- unknown runtime identity;
- unsafe database action;
- security exception;
- founder decision boundary;
- unsupported external claim.

---

# 28. CONSOLIDATION POLICY

One concept → one canonical owner.

Historical documents remain preserved for provenance.

Duplicates are not deleted merely because they overlap. Consolidation requires:

`inventory → provenance → reference search → authority decision → pointer/archive/update → verification`

The old branches should be deleted only after their unique evidence is captured and after a repository-maintainer operation removes the branch refs. This session's GitHub connector has no branch-delete primitive, so deletion is **NOT EXECUTED** and must not be falsely reported.

---

# 29. CURRENT FINDINGS

| ID | Finding | Status |
|---|---|---|
| SOT-001 | Nine vs 15 architecture views conflict | CONFLICT / FOUNDER DECISION REQUIRED |
| SOT-002 | Scheduling ownership conflict | FOUNDER DECISION REQUIRED |
| SOT-003 | Task register historical count discrepancy | RECONCILED — 119 + 3 rituals |
| SOT-004 | Schema source count discrepancy | RECONCILED — 59 models / 17 enums / 56 indexes / 22 uniques / 19 relations observed |
| SOT-005 | Live database current identity | BLOCKED / UNVERIFIED |
| SOT-006 | Event register | VERIFIED structurally — 103 / 11 |
| SOT-007 | Permission register | VERIFIED structurally — 50 / 8 |
| SOT-008 | State-machine register | VERIFIED structurally — 11 |
| SOT-009 | Design component inventory | VERIFIED structurally — 42 |
| SOT-010 | Canonical artifact register | PARTIAL — must remain synchronized |
| SOT-011 | CI evidence on current architecture head | NOT_EXECUTED |
| SOT-012 | Historical branch deletion | NOT_EXECUTED — connector limitation |

---

# 30. NEXT EXECUTION CHECKPOINT

## ARCH-2026-H1-RECONCILIATION

1. Preserve this Source of Truth as the consolidation anchor.
2. Complete context/domain ↔ module evidence matrix.
3. Prepare founder decision record for C2-001.
4. Prepare founder decision record for Scheduling.
5. Derive implementation-safe task packets without changing source semantics.
6. Build schema traceability only after ownership decisions.
7. Build architecture-as-code checks from actual paths and registers.
8. Repair checkpoint/reference drift.
9. Verify local development/database strategy.
10. Only then authorize the first controlled implementation slice.

**No application code or production database change is authorized by this checkpoint.**

---

# 31. EVIDENCE RULE

Every future update to this file must record:

`date / change / source / reason / authority / affected artifacts / verification / unresolved consequences`

This file is a consolidation index and engineering memory, not permission to silently rewrite authoritative source documents.

---

## CURRENT ENGINEERING TRUTH

ASAS is **not yet implementation-authorized at the platform level**.

The engineering foundation is strong in domain specification, event/state/permission modeling and design intent, but authority reconciliation, runtime identity, executable schema promotion, security/runtime verification and architecture CI remain open or blocked.

The correct next move is therefore **reconciliation and contract closure**, not feature coding.
