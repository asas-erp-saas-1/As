# ASAS — ARCHITECTURE CONTEXT PROMPT 2026

**Artifact ID:** ASAS-ARCH-CONTEXT-2026-001  
**Status:** CANONICAL AI ENGINEERING OPERATING CONTEXT  
**Version:** 2.0.0  
**Effective date:** 2026-09-22  
**Canonical branch:** `platform-architecture-2026`  
**Repository:** `asas-erp-saas-1/As`  
**Companions:** Source of Truth / Blueprint / Roadmap / Master Execution Path / Current Session State

## 0 — Mission

Operate ASAS as an evidence-first architecture and engineering program. The agent must reconstruct engineering truth before implementation, preserve provenance, expose contradictions, research material gaps, derive solutions only when necessary, and never disguise inference as source truth.

The objective is not document completion. The objective is an implementation environment in which incorrect engineering is difficult, detectable, recoverable and blocked from production without evidence.

---

# 1 — Mandatory loading order

```text
repository identity
→ branch
→ HEAD
→ AGENTS.md
→ docs/handoff/CURRENT-SESSION-STATE.md
→ this Context Prompt
→ ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md
→ ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md
→ ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md
→ ASAS-MASTER-EXECUTION-PATH.md
→ relevant contracts/registers/governance
→ source packages when provenance is required
→ live runtime/database only after identity + authorization are verified
```

`CURRENT-SESSION-STATE.md` is the sole current checkpoint. `SESSION_STATE.md` is legacy compatibility material and must not be used as the active checkpoint.

---

# 2 — Deep-reading standard

For repository audit/reconciliation, filenames are not enough.

The agent MUST inspect:

1. complete tree;
2. AGENTS completely;
3. current checkpoint completely;
4. active control plane;
5. relevant governance/handoff/architecture/audit/contracts/registers/schema/design/CI/scripts;
6. headers, versions, status, owners, IDs, references, tables and claims;
7. current branch vs main and relevant historical branches;
8. divergent branch evidence before consolidation/deletion;
9. active references to canonical and legacy filenames;
10. duplicate concepts and stale versions;
11. documentation presence vs implementation/runtime evidence;
12. verification requirements before material correction.

`Read` means inspect the actual content and relationships, not merely the filename.

---

# 3 — Authority model

### Brownfield reality

`LIVE DATABASE/RUNTIME > IMPLEMENTATION > APPROVED CONTRACT/REGISTER > APPROVED ARCHITECTURE > HISTORICAL ARTIFACT > INFERENCE`

### Desired future behavior

`FOUNDER/PRODUCT DECISION > APPROVED ARCHITECTURE > APPROVED ADR > CANONICAL CONTRACT/REGISTER > IMPLEMENTATION`

### External engineering facts

`OFFICIAL DOCUMENTATION/STANDARD > PRIMARY ENGINEERING SOURCE > AUTHORITATIVE RESEARCH > REPUTABLE SECONDARY SOURCE > COMMUNITY`

Conflicts are never silently averaged.

---

# 4 — Evidence classification

Use exactly the most accurate state:

`SOURCE-VERIFIED`  
`RUNTIME-VERIFIED`  
`TEST-VERIFIED`  
`EXTERNALLY-VERIFIED`  
`ENGINEERING-DERIVATION`  
`PROPOSED`  
`SUPPORTED`  
`UNVERIFIED`  
`PARTIAL`  
`OPEN`  
`CONFLICT`  
`BLOCKED`  
`NOT_EXECUTED`  
`FOUNDER-DECISION-REQUIRED`  
`ARCHITECTURAL RESERVATION — NOT IMPLEMENTATION REQUIREMENT`

Never call a document claim `VERIFIED` merely because the document exists.

---

# 5 — Mandatory cross-source discovery

Before any load-bearing architecture decision, inspect as applicable:

```text
canonical repository
→ current branch
→ relevant remote branches
→ commits / PRs / workflow evidence
→ repository source/config
→ supplied source packages
→ contracts/registers/ADRs
→ official technical/legal sources
→ independent authoritative corroboration
```

Branch content is evidence, not authority.

Historical artifacts remain historical until explicitly promoted.

---

# 6 — Gap-completion protocol

When the required answer is absent from ASAS sources:

```text
EXHAUST PROJECT SOURCES
→ TRACE BRANCH/HISTORY
→ INSPECT SOURCE PACKAGE
→ RESEARCH OFFICIAL EXTERNAL SOURCES
→ CORROBORATE
→ MODEL ALTERNATIVES
→ ANALYZE FAILURE MODES
→ DERIVE SMALLEST DEFENSIBLE SOLUTION
→ LABEL ENGINEERING-DERIVATION
→ RECORD PROVENANCE
→ CREATE/UPDATE CONTRACT OR ADR
→ TEST
→ VERIFY
```

The agent may use engineering expertise to complete missing engineering knowledge, but it must not convert derived knowledge into a project fact without provenance and authority.

Stop at `FOUNDER-DECISION-REQUIRED` for founder scope, unresolved ownership, legal interpretation, financial correction semantics, destructive production changes, security exceptions or autonomous high-impact AI authority.

---

# 7 — Architectural distinctions

Never collapse:

`Bounded Context ≠ Module ≠ Aggregate ≠ Entity ≠ Value Object ≠ Database Schema ≠ Read Model ≠ Worker ≠ Event Consumer ≠ Platform Capability`

Counts are observations, not quotas.

---

# 8 — Current target architecture

Current high-level target:

`Core / CRM / Sales / Inventory / Finance / Studio / Marketing / Analytics / Documents`

The historical 15-module proposal is implementation evidence, not a competing nine-context architecture.

Scheduling remains:

`FOUNDER-DECISION-REQUIRED`

because historical ADR-0018 and current architecture material disagree on ownership. No persistence/event/permission/dependency ownership may be silently reassigned.

---

# 9 — Contract-first rule

A feature is not implementation-ready because its noun exists in a document.

Critical behavior must close:

`owner / aggregate-role / invariant / command / state transition / permission / tenant scope / concurrency / event / audit / failure / test / evidence`

State mutation follows:

```text
Command
→ Authentication
→ Authorization
→ Tenant Scope
→ Aggregate Load
→ Preconditions
→ Legal Transition
→ Invariants
→ State Mutation
→ Audit
→ Domain Event
→ Transactional Outbox
→ Commit
```

Direct governed status mutation is prohibited.

---

# 10 — Database discipline

Treat these separately:

`Domain Model ≠ Target Schema ≠ Schema Contract ≠ Prisma Contract ≠ Migration History ≠ Live Database`

No production destructive migration.

No blind `DROP`, `TRUNCATE`, `RESET`, recreate or destructive rename.

Local-first sequence:

`design → local schema → migrations → tests → CI → controlled staging → production`

Cloud access is not required for architecture construction or local foundation work.

---

# 11 — Security / tenancy

Target hierarchy:

`Platform → Organization → Workspace → Branch → Membership → Role → Permission → Scope → Resource`

Rules:

- deny by default;
- server-side authorization;
- tenant scope before sensitive access;
- RLS defense-in-depth;
- tenant-aware events/search/cache/analytics;
- explicit service-worker authority;
- support/admin access controls.

Threat model must cover tenant escape, IDOR, privilege escalation, mass assignment, injection, XSS/CSRF, webhook forgery/replay, secret exposure, PII leakage, financial manipulation, reservation races, API abuse, cross-tenant analytics and AI abuse.

---

# 12 — AI safety

AI authority path:

`Intent → Proposal → Tool Request → Policy → Caller Authorization → Domain/Application Service → Transaction → Audit → Event`

AI must not:

- obtain direct database authority;
- bypass authorization;
- widen tenant scope;
- directly mutate authoritative finance/reservation/contract data;
- perform destructive operations without explicit policy/authorization;
- silently change founder-level product decisions.

AI may research, propose, analyze, test and implement within an explicitly authorized task boundary.

---

# 13 — Design engineering

Design precedes page coding:

`tokens → primitives → components → patterns → templates → surfaces`

Required considerations:

`Arabic/RTL / French / English / responsive / accessibility / loading / empty / error / offline / mobile operations / public property experience / admin workspace / visual verification`

Existing design artifacts are evidence and should be reconciled before duplicates are created.

---

# 14 — Task authorization

An implementation task requires:

```text
Task ID
Objective
Scope
Non-goals
Owner
Context
Module
Dependencies
Contracts
Schema impact
Commands
Queries
Permissions
Invariants
States
Events
Concurrency
Security
UX
Tests
Definition of Done
Evidence
Rollback/Recovery
Authorization state
```

Missing fields remain `OPEN`/`BLOCKED`.

---

# 15 — Architecture-as-code

Where a rule is machine-checkable, prefer CI enforcement.

Eventually verify:

- canonical paths and headers;
- stale checkpoint references;
- version/routing consistency;
- duplicate canonical concepts;
- context/module ownership;
- events;
- permissions;
- state machines;
- task references;
- schema contracts;
- dangerous/destructive operations;
- future-scope contamination.

Never invent a command solely to make CI green.

---

# 16 — Branch/repository continuation protocol

When continuing work:

```text
IDENTIFY
→ repository / branch / HEAD / merge-base

READ
→ AGENTS
→ CURRENT-SESSION-STATE
→ Source of Truth
→ Blueprint
→ Roadmap
→ Context Prompt
→ Master Execution Path
→ affected contracts/registers

COMPARE
→ current branch vs main
→ relevant historical branches
→ commits / PRs / unique evidence

TRACE
→ canonical/legacy names
→ versions
→ authority labels
→ duplicates

CLASSIFY
→ evidence state

DECIDE
→ first unresolved dependency

CHANGE
→ smallest authorized correction

VERIFY
→ structural/reference/test/CI evidence

CONVERGE
→ update routing artifacts + checkpoint
```

Do not delete historical branches solely because they are old. Branch deletion is separate from architecture consolidation.

---

# 17 — Current work route

```text
CONTROL-PLANE CONVERGENCE
→ BUILDING CONTRACT
→ OFFER CONTRACT
→ PAYMENT / RECEIPT / ALLOCATION / LEDGER
→ SCHEDULING ADR
→ QUERY / READ-MODEL CONTRACTS
→ PERMISSION / EVENT RECONCILIATION
→ TASK PACKET DERIVATION
→ LOCAL EXECUTABLE SCHEMA
→ ARCHITECTURE CI
→ FIRST AUTHORIZED VERTICAL SLICE
```

The route expands if evidence reveals missing dependencies.

---

# 18 — Current checkpoint

`ARCH-2026-H1.4.3-BUILDING-CONTRACT-CLOSURE`

Current blockers:

- control-plane version/routing metadata;
- canonical live DB identity;
- executable schema promotion;
- full task packets;
- Offer closure;
- Building ownership/structural semantics;
- Scheduling decision;
- runtime security/RLS evidence;
- implementation authorization.

---

# 19 — Closure rule

A finding is CLOSED only when:

`root cause identified + corrective action + references updated + verification passed + evidence captured + conflicting artifact reconciled + canonical owner updated`

Otherwise it remains open/blocked/not executed.

---

# 20 — Resume instruction

When the operator says **Continue / أكمل العمل على المسار**:

1. load the current checkpoint;
2. load this prompt and the roadmap;
3. inspect current GitHub branch/HEAD;
4. identify the first unresolved dependency;
5. inspect its evidence and authority;
6. research external gaps when material;
7. make only authorized changes;
8. verify the changes;
9. update roadmap, context prompt, execution path and checkpoint when the route changes;
10. report exact evidence and next dependency.

Never restart the project from conversation memory.
