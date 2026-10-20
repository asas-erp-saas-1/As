# ASAS — ARCHITECTURE ENGINEERING ROADMAP 2026

**Artifact ID:** ASAS-ARCH-ROADMAP-2026-001  
**Status:** ACTIVE — RECONCILED ENGINEERING ROUTE  
**Version:** 2.0.1  
**Effective date:** 2026-09-22  
**Owner:** Lead Architecture / Founder authority boundary  
**Canonical branch:** `platform-architecture-2026`  
**Canonical companion:** `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md`  
**Agent companion:** `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md`  
**Execution path:** `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`  
**Control resource:** `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`  

> This roadmap governs HOW ASAS is engineered. It does not override product decisions, approved ADRs, domain contracts, runtime reality, or legal authority. It is intentionally evidence-driven and does not impose arbitrary counts of contexts, modules, services, tables, tasks, or phases.

---

# 0 — ENGINEERING OBJECTIVE

Build ASAS as a professional real-estate operating platform whose implementation can be executed by Claude Code without guessing about ownership, state, authority, data, security, concurrency or scope.

The engineering order is:

`REALITY → PROVENANCE → AUTHORITY → RECONCILIATION → DOMAIN MODEL → CONTRACTS → DATA MODEL → SECURITY → DESIGN SYSTEM → LOCAL PLATFORM → TESTS → CONTROLLED IMPLEMENTATION → INTEGRATION → RUNTIME EVIDENCE → PRODUCTION`

Code and database programming are downstream of architecture and contracts.

Cloud services are not required to design the architecture or establish the initial local code/database foundation.

---

# 1 — SOURCE / AUTHORITY CONTROL PLANE

## 1.1 Mandatory loading order

`Repository → branch → HEAD → AGENTS.md → CURRENT-SESSION-STATE.md → this roadmap → Context Prompt → Source of Truth → Blueprint → Master Execution Path → relevant contracts/registers → source packages → runtime/database only after identity + authorization`

## 1.2 Authority

Brownfield reality:

`LIVE DATABASE/RUNTIME > IMPLEMENTATION > APPROVED CONTRACT/REGISTER > APPROVED ARCHITECTURE > HISTORICAL ARTIFACT > INFERENCE`

Desired future behavior:

`FOUNDER/PRODUCT DECISION > APPROVED ARCHITECTURE > APPROVED ADR > CANONICAL CONTRACT/REGISTER > IMPLEMENTATION`

External technical facts:

`OFFICIAL DOCUMENTATION/STANDARD > PRIMARY ENGINEERING SOURCE > AUTHORITATIVE RESEARCH > REPUTABLE SECONDARY SOURCE > COMMUNITY`

Conflicts are recorded, never silently averaged.

## 1.3 Evidence vocabulary

`VERIFIED | SOURCE-VERIFIED | RUNTIME-VERIFIED | TEST-VERIFIED | EXTERNALLY-VERIFIED | SUPPORTED | ENGINEERING-DERIVATION | PROPOSED | PARTIAL | OPEN | CONFLICT | BLOCKED | NOT_EXECUTED | FOUNDER-DECISION-REQUIRED | ARCHITECTURAL RESERVATION — NOT IMPLEMENTATION REQUIREMENT`

`VERIFIED` requires objective evidence.

---

# 2 — H0: FORENSIC REALITY RECONSTRUCTION

**Objective:** establish what exists before deciding what to build.

### Required work

- verify repository `asas-erp-saas-1/As`;
- verify `platform-architecture-2026` and HEAD;
- read AGENTS and sole current checkpoint completely;
- inventory the complete target-branch tree;
- classify canonical, derived, operational, evidence, historical and temporary artifacts;
- inspect all relevant branches, commits, PRs and unique evidence;
- compare architecture branch with `main` and foundation lineage;
- inspect source packages and historical architecture material;
- search all active references to legacy checkpoint names and old versions;
- distinguish repository facts from runtime facts;
- verify or explicitly block live runtime identity;
- record external research for load-bearing technical/legal questions.

### Branch rule

Historical branches are evidence, not authority. No branch is deleted merely because it is old. Unique evidence must be extracted and provenance recorded first. Branch deletion is a separate repository-maintainer operation.

### Current evidence

The current branch is rooted in a substantial foundation reconstruction lineage. Comparisons show the architecture branch is materially ahead of the forensic foundation branch and diverged from older source-authority/command-contract branches. These branches remain provenance until their unique information is reconciled.

### Exit gate H0

- repository/branch/HEAD verified;
- one current checkpoint;
- authority map verified;
- version metadata reconciled;
- relevant branch provenance classified;
- runtime identity verified or BLOCKED;
- no hidden canonical duplicate.

**Current:** `PARTIAL`

---

# 3 — H1: ARCHITECTURAL RECONCILIATION

**Objective:** freeze semantic ownership sufficiently for contract engineering.

## H1.1 Context model

Current target grouping:

`Core / CRM / Sales / Inventory / Finance / Studio / Marketing / Analytics / Documents`

The historical 15-module proposal is not a second bounded-context architecture. Modules must be derived from ownership and consistency boundaries.

## H1.2 Scheduling

`C2-002 = FOUNDER-DECISION-REQUIRED`

Historical ADR-0018 and current architecture materials disagree on Scheduling ownership. No silent reassignment of persistence, events, permissions or dependencies is allowed.

## H1.3 Aggregate / invariant boundaries

For every implementation-critical concept establish:

`owner → aggregate/entity role → invariant → consistency boundary → command → permission → tenant scope → state transition → event → audit → test → evidence`

Do not turn named objects into aggregates by convention.

## H1.4 Current contract closure sequence

The active sequence is:

1. Unit ↔ Reservation consistency;
2. Building ownership and relationship semantics;
3. Offer command/state/permission/event closure;
4. PaymentSchedule / Receipt / Allocation / Ledger semantics;
5. Scheduling decision;
6. cross-context write/read contracts.

### Exit gate H1

No implementation-critical ownership ambiguity remains in the authorized slice.

**Current:** `PARTIAL / ACTIVE`

---

# 4 — H2: DOMAIN CONTRACT ENGINEERING

Close:

- aggregates and entities;
- value objects;
- commands/actions;
- queries/read models;
- invariants;
- state machines;
- approval policies;
- business policies;
- concurrency rules;
- consistency boundaries;
- failure semantics;
- cross-context contracts.

### State-machine contract

Every mutation follows:

`Command → Authentication → Authorization → Tenant Scope → Aggregate Load → Preconditions → Legal Transition → Invariants → State Mutation → Audit → Domain Event → Transactional Outbox → Commit`

Direct governed status mutation is prohibited.

### Exit gate H2

Every implementation-critical behavior has a canonical owner, contract, invariant, authorization rule, failure model and test strategy.

**Current:** `PARTIAL / H1-dependent`

---

# 5 — H3: EVENT / INTEGRATION CONTRACTS

Reconcile every event against its producer command and transaction boundary.

Required fields:

`event ID / name / version / producer / aggregate / trigger / tenant / actor / causation / correlation / consumers / idempotency / ordering / replay / DLQ / retention / reconciliation / evidence`

Use transactional outbox where durable asynchronous publication is required.

Integration contracts must cover authentication, authorization, idempotency, retries, signatures, replay, rate limits, versioning and deprecation.

### Exit gate H3

Critical events and integrations are contractually testable; runtime publication is not claimed until implemented and evidenced.

**Current:** `BLOCKED`

---

# 6 — H4: SECURITY / TENANCY / AI SAFETY

## Tenancy model

`Platform → Organization → Workspace → Branch → Membership → Role → Permission → Scope → Resource`

Required controls:

- deny-by-default;
- server-side authorization;
- tenant scope before sensitive access;
- RLS as defense-in-depth;
- tenant-aware cache/search/analytics/events;
- service-worker authority boundaries;
- support/admin access controls.

## Threat model

Cover at minimum:

`tenant escape / IDOR / privilege escalation / mass assignment / injection / XSS / CSRF / webhook forgery / replay / secret exposure / PII leakage / financial manipulation / reservation races / API abuse / cross-tenant analytics / prompt injection / AI tool abuse`

## AI

`Intent → Proposal → Tool Request → Policy → Caller Authorization → Domain/Application Service → Transaction → Audit → Event`

AI cannot become a direct database authority or widen caller permissions.

### Exit gate H4

Sensitive commands have permission/scope contracts and independent application/database verification; AI authority is bounded.

**Current:** `BLOCKED`

---

# 7 — H5: DATA ARCHITECTURE / LOCAL DATABASE ENGINEERING

Treat these separately:

`Domain Model ≠ Target Schema ≠ Schema Contract ≠ Prisma Contract ≠ Migration History ≠ Live Database`

### Sequence

`Source schema extraction → structural validation → semantic reconciliation → executable schema design → local PostgreSQL/Supabase environment → migration baseline → replay → constraint tests → RLS tests → concurrency tests → evidence`

### Financial controls

- integer minor units;
- explicit currency;
- explicit rounding;
- balanced journal posting;
- immutable posted financial facts;
- reversals instead of mutation;
- allocation/reconciliation semantics;
- commission separated from ledger truth.

### Database safety

No production `DROP`, `TRUNCATE`, `RESET`, blind recreation, destructive rename or unreviewed migration.

### Exit gate H5

Local schema and migrations are reproducible, constraints are tested, critical concurrency is evidenced, and no remote database was used as an undocumented design source.

**Current:** `BLOCKED`

---

# 8 — H6: DESIGN / EXPERIENCE ARCHITECTURE

Design precedes page coding:

`tokens → primitives → components → patterns → templates → surfaces`

Cover:

- Arabic/RTL, French and English;
- responsive behavior;
- accessibility;
- forms/validation;
- loading/empty/error/offline states;
- mobile field operations;
- public property/project experience;
- admin/CRM/ERP workspace patterns;
- visual regression.

Existing design shadows are evidence and should be reconciled, not duplicated.

**Current:** `PARTIAL`

---

# 9 — H7: APPLICATION PLATFORM FOUNDATION

Build a modular-monolith foundation only after H2/H4/H5 prerequisites are satisfied for the selected slice.

Foundation includes:

- module boundaries;
- dependency enforcement;
- configuration;
- validation;
- error model;
- auth/session boundary;
- command/query application layer;
- observability boundary;
- test harness;
- local data adapter;
- architecture CI.

Do not build broad feature sets merely to prove the framework.

**Current:** `BLOCKED`

---

# 10 — H8: CONTROLLED VERTICAL IMPLEMENTATION

Implement one complete, bounded slice.

Candidate journey:

`Project → Building → Unit → Lead → Assignment → Activity → Visit → Offer → Reservation → Contract → Payment Plan → Payment/Receipt → Audit → Reporting`

The actual slice boundary must follow the dependency graph and may be reduced when a contract remains open.

Required evidence:

- unit/integration/contract tests;
- authorization and tenancy tests;
- state-machine tests;
- concurrency/idempotency tests;
- event/outbox tests;
- audit verification;
- E2E/browser evidence;
- failure/retry evidence;
- migration evidence.

**Current:** `BLOCKED`

---

# 11 — H9: OBSERVABILITY / PERFORMANCE / RECOVERY

Define and measure:

`SLI / SLO / error budget / latency / error rate / availability / queue lag / event lag / DB saturation / API saturation / reservation latency / financial posting latency`

Recovery:

`backup → restore → integrity verification → RPO → RTO → evidence`

A backup without a verified restore is not recovery readiness.

**Current:** `BLOCKED`

---

# 12 — H10: CONTROLLED CLOUD / RUNTIME VERIFICATION

Only after local correctness:

- identify canonical Supabase/runtime project;
- introspect live schema;
- reconcile drift;
- verify RLS/storage;
- configure environment separation;
- staging verification;
- remote observability/recovery.

Remote infrastructure is not a prerequisite for architectural truth.

**Current:** `BLOCKED`

---

# 13 — H11: PRODUCTION READINESS

Production requires objective evidence for:

- architecture gates;
- security;
- tenancy;
- migrations;
- performance;
- critical E2E flows;
- observability;
- recovery/restore;
- rollback;
- incident ownership;
- release verification.

**Current:** `BLOCKED`

---

# 14 — TASK PACKET GATE

No implementation task is executable unless it contains:

`Task ID / objective / scope / non-goals / owner / context / module / dependencies / contracts / schema impact / commands / queries / permissions / invariants / state transitions / events / concurrency / security / UX / tests / DoD / evidence / rollback / authorization`

Missing fields remain `OPEN` or `BLOCKED`; they are never guessed.

---

# 15 — RESEARCH / GAP-COMPLETION PROTOCOL

When ASAS sources do not answer a required question:

`exhaust repository → inspect branches/history → inspect source package → consult official technical/legal sources → corroborate → model alternatives/failure modes → derive smallest defensible solution → label ENGINEERING-DERIVATION → record provenance → convert to contract/ADR/test → verify`

External research cannot silently override ASAS authority.

Founder/legal/production-data/financial/security exceptions stop at `FOUNDER-DECISION-REQUIRED` or `BLOCKED`.

---

# 16 — ARCHITECTURE-AS-CODE

CI must eventually verify, without fabricated commands:

- canonical paths and headers;
- stale checkpoint references;
- version/routing consistency;
- duplicate canonical concepts;
- context/module ownership consistency;
- event/register consistency;
- permission/register consistency;
- state-machine consistency;
- task references;
- schema-contract consistency;
- forbidden destructive operations;
- dangerous dependency introduction;
- MVP/future-scope contamination.

A CI check is valid only when the command/script actually exists and its output is evidenced.

---

# 17 — ROADMAP GOVERNANCE

The roadmap expands when evidence reveals missing engineering work. It does not compress the system to satisfy arbitrary counts.

Every roadmap modification records:

`reason → evidence → authority → affected artifacts → risk → verification → checkpoint`

Historical artifacts are preserved. New canonical artifacts are created only when an existing canonical owner cannot safely absorb the concern.

---

# 18 — CURRENT EXECUTION QUEUE

### Q0 — Control-plane convergence

Reconcile active file headers and routing metadata. The source package v1.6.1 is explicitly a research/provenance input for the lead architect, not an implementation authority for Claude Code/Codex. The repository Blueprint remains the architectural target.

### Q1 — Building contract

Resolve aggregate/entity role, relationship semantics, structural mutation, archival and persistence representation without inventing a table.

A new evidence record now captures historical schema evidence for `Building`:

`docs/architecture/ASAS-BUILDING-SCHEMA-PROVENANCE-RECONCILIATION-2026.md`

That evidence confirms historical existence of a Building schema concept but does not prove current executable or live-database state. Q1 therefore remains `OPEN / BLOCKED` until current schema/runtime reconciliation and semantic closure are complete.

### Q2 — Offer contract

Close command/state/permission/approval/event/idempotency/concurrency semantics.

### Q3 — Finance contract

Close PaymentSchedule → Receipt → Allocation → Ledger semantics and legal assumptions.

### Q4 — Scheduling ADR

Founder decision / explicit supersession only.

### Q5 — Query/read models

Define read ownership without introducing write ownership leakage.

### Q6 — Permission/event reconciliation

Map critical commands to canonical permission and event registers.

### Q7 — Task packet derivation

Convert source task records into implementation-ready packets without changing their semantics.

### Q8 — Local executable schema

Only after Q1–Q7 applicable blockers are closed.

### Q9 — Architecture CI

Machine-check the control plane and contracts.

### Q10 — First vertical slice

Only after implementation authorization is explicitly GREEN.

---

# 19 — DEFINITION OF DONE FOR ARCHITECTURE

Architecture is not complete because documents exist.

A gate closes only when:

`root cause resolved + authority identified + canonical artifact updated + references reconciled + implementation implications explicit + tests/verification defined or executed + evidence captured + no unresolved conflicting artifact remains`

Otherwise the gate remains `PARTIAL`, `OPEN`, `BLOCKED` or `NOT_EXECUTED`.

---

# 20 — RESUME COMMAND

When the operator says **Continue / أكمل العمل على المسار**:

1. read the current checkpoint;
2. read this roadmap;
3. read the Context Prompt;
4. inspect the current branch/HEAD;
5. verify the first unresolved dependency;
6. inspect its canonical contracts/registers and provenance;
7. perform external research only where material;
8. make the smallest authorized correction;
9. verify;
10. update the routing artifacts and checkpoint when the route changes;
11. report evidence and the next dependency.

Never restart completed work without evidence that it is invalid.

---

# 21 — CURRENT RECONCILIATION AMENDMENT 001

**Date:** 2026-09-22  
**Reason:** Building provenance reconciliation and explicit source-package role enforcement.

### Decision A — v1.6.1 source package role

The supplied v1.6.1 package is an architect research/provenance source. It is not an implementation authority for Claude Code or Codex. Any useful conclusion must be promoted through the canonical Blueprint/ADR/contract/register/task chain before implementation.

### Decision B — Building evidence

Historical schema evidence proves the existence of a Building concept in prior ASAS material. It does not authorize a current table, fields, aggregate, state machine, permission, event or migration.

### Decision C — no premature closure

Building remains `OPEN / IMPLEMENTATION BLOCKED`. The correct next work is reconciliation, not schema invention.

### Evidence record

`docs/architecture/ASAS-BUILDING-SCHEMA-PROVENANCE-RECONCILIATION-2026.md`

### Verification rule

No Q1 closure may be claimed until the current schema contract and, when identity is verified, live database reality have been reconciled against this evidence.
