# ASAS — MASTER EXECUTION PATH 2026

**Status:** CANONICAL HANDOFF CONTROL  
**Version:** 2.0.1  
**Effective date:** 2026-09-22  
**Repository:** `asas-erp-saas-1/As`  
**Architecture branch:** `platform-architecture-2026`  
**Implementation state:** PRE-IMPLEMENTATION / ARCHITECTURE ENGINEERING

## 0 — Mission

Prepare and govern the ASAS Real Estate OS so Claude Code or another autonomous engineering agent can implement it incrementally without inventing business semantics, bypassing security, confusing research with authority, or turning future architecture into accidental MVP scope.

The path is an execution control plane, not a replacement for the Blueprint or domain contracts.

---

# 1 — Non-negotiable sequence

```text
IDENTITY
→ REALITY
→ PROVENANCE
→ AUTHORITY
→ RECONCILIATION
→ DOMAIN MODEL
→ CONTRACTS
→ DATA CONTRACT
→ SECURITY/TENANCY
→ DESIGN SYSTEM
→ LOCAL PLATFORM
→ TESTS
→ CONTROLLED IMPLEMENTATION
→ INTEGRATION
→ RUNTIME EVIDENCE
→ PRODUCTION
```

Code and database programming are downstream of architecture and contracts.

Cloud infrastructure is not required to construct the architecture or local development foundation.

---

# 2 — Entry / loading protocol

On every continuation:

```text
Repository
→ branch
→ HEAD
→ AGENTS.md
→ CURRENT-SESSION-STATE.md
→ ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md
→ ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md
→ ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md
→ ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md
→ this file
→ affected contracts/registers/governance
```

Then inspect branch provenance and external sources only where the current dependency requires them.

`CURRENT-SESSION-STATE.md` is the sole active checkpoint.

---

# 3 — Source-package research boundary

The supplied **v1.6.1 source package** is a research/provenance input for the lead architecture process. It is **not an implementation authority for Claude Code or Codex**.

Use it to discover:

- historical design rationale;
- candidate capabilities;
- missing concerns;
- alternative architectures;
- security/reliability gaps;
- research questions.

Do not promote its claims directly into implementation. The required path is:

```text
v1.6.1 / source package
→ architect review
→ repository + branch evidence
→ official/authoritative corroboration
→ contradiction analysis
→ engineering decision
→ ADR / canonical contract / register / roadmap
→ explicit implementation authorization
→ Claude Code / Codex
```

If v1.6.1 conflicts with verified repository/runtime evidence, classify the conflict and determine authority; never force the repository to match the package.

Future capabilities from the package remain:

`ARCHITECTURAL RESERVATION — NOT IMPLEMENTATION REQUIREMENT`

until explicitly promoted by an approved canonical artifact.

See `docs/architecture/ASAS-SOURCE-PACKAGE-ROLE-AND-DECISION-2026.md`.

---

# 4 — Current route

```text
Q0 CONTROL-PLANE CONVERGENCE
        ↓
Q1 BUILDING CONTRACT
        ↓
Q2 OFFER CONTRACT
        ↓
Q3 PAYMENT / RECEIPT / ALLOCATION / LEDGER
        ↓
Q4 SCHEDULING ADR
        ↓
Q5 QUERY / READ-MODEL CONTRACTS
        ↓
Q6 PERMISSION / EVENT RECONCILIATION
        ↓
Q7 IMPLEMENTATION TASK PACKETS
        ↓
Q8 LOCAL EXECUTABLE SCHEMA
        ↓
Q9 ARCHITECTURE-AS-CODE / CI
        ↓
Q10 FIRST AUTHORIZED VERTICAL SLICE
        ↓
Q11 CONTROLLED INTEGRATION
        ↓
Q12 OPERATIONAL / RECOVERY EVIDENCE
        ↓
Q13 PRODUCTION READINESS
```

The route is evidence-driven. If Q1 reveals a missing prerequisite, the route expands; it does not bypass the dependency.

---

# 5 — Q0 Control-plane convergence

Current architecture branch evidence identifies stale routing/version metadata between the Source of Truth, Blueprint, Roadmap and Context Prompt.

The active branch now establishes:

- Blueprint `v1.5.0`;
- Roadmap `v2.0.0`;
- Context Prompt `v2.0.0`;
- Master Execution Path `v2.0.1`;
- Source of Truth must remain aligned with these routing artifacts;
- current checkpoint remains the operational state authority.

The v1.6.1 source package is research-only for the architect and is never an implementation instruction for Claude Code/Codex.

**Gate:** `PARTIAL`

Closure requires all routing metadata to agree and reference the same active artifacts.

---

# 6 — Q1 Building contract

Resolve without inventing persistence:

```text
Project → Building → Floor → Unit
```

Determine:

- entity vs aggregate role;
- ownership;
- relationship cardinality;
- structural mutation policy;
- archival/deletion semantics;
- construction milestone relationship;
- permission impact;
- event impact;
- concurrency impact;
- schema representation;
- historical schema provenance.

No Building table/model/migration is authorized merely because historical schema evidence contains one.

**Gate:** `OPEN / IMPLEMENTATION BLOCKED`

---

# 7 — Q2 Offer contract

Close:

```text
submit_offer
approve_discount
send_offer
expire_offer
accept_offer
```

For each define:

`authentication / authorization / tenant scope / preconditions / pricing authority / approval / state transition / idempotency / concurrency / audit / event / failure`

Offer is not Reservation.

Accepted Offer does not itself create an inventory winner.

**Gate:** `PARTIAL / IMPLEMENTATION BLOCKED`

---

# 8 — Q3 Finance contract

Reconcile:

```text
Contract
→ Payment Plan
→ Schedule Item / Obligation
→ Payment fact
→ Receipt
→ Receipt Allocation
→ Subledger / Ledger
→ Reconciliation
→ Reporting
```

Do not invent a standalone Payment aggregate solely to resolve terminology.

Close:

- money units/currency/rounding;
- eligibility;
- receipt semantics;
- allocation;
- over/under payment;
- refund/reversal;
- ledger posting;
- immutability;
- commission boundary;
- idempotency/concurrency;
- legal assumptions requiring external verification.

**Gate:** `PARTIAL / EXECUTABLE FINANCE CONTRACT OPEN`

---

# 9 — Q4 Scheduling ADR

Historical ADR-0018 and current architecture material contain conflicting ownership statements.

Required action:

`FOUNDER DECISION / EXPLICIT ADR SUPERSESSION`

No silent ownership change.

**Gate:** `FOUNDER-DECISION-REQUIRED`

---

# 10 — Q5 Query / Read-model contracts

Define read ownership separately from write ownership.

Every critical query must specify:

`source context / authorized scope / filters / pagination / consistency expectation / freshness / projection owner / tenant boundary / sensitive fields / performance expectation`

Read models must not become an accidental back door for cross-context writes or tenant leakage.

**Gate:** `NOT_STARTED / DEPENDENT`

---

# 11 — Q6 Permission / Event reconciliation

Map every critical command to:

`permission → scope → actor/persona → state transition → invariant → event → audit → test`

The registered event/permission counts are observations, not implementation quotas.

Catalog presence does not prove runtime enforcement.

**Gate:** `BLOCKED until affected contracts close`

---

# 12 — Q7 Implementation task packets

A task is executable only when it contains:

```text
ID
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
State transitions
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

Missing information is `OPEN`/`BLOCKED`, never guessed.

---

# 13 — Q8 Local executable schema

Only after relevant contract gates close:

```text
source schema extraction
→ structural validation
→ semantic reconciliation
→ executable schema
→ local database
→ forward migrations
→ replay
→ constraint tests
→ RLS tests
→ concurrency tests
→ evidence
```

No destructive production command is allowed.

---

# 14 — Q9 Architecture-as-code / CI

Machine-check what is actually checkable:

- canonical file paths;
- headers/version routing;
- stale checkpoint references;
- duplicate authority;
- context/module consistency;
- event consistency;
- permission consistency;
- state-machine consistency;
- task references;
- schema-contract consistency;
- destructive operation patterns;
- dangerous dependencies;
- future-scope contamination.

Never fabricate commands for a green CI result.

---

# 15 — Q10 First authorized vertical slice

Candidate commercial journey:

```text
Project
→ Building
→ Unit
→ Lead
→ Assignment
→ Activity
→ Visit
→ Offer
→ Reservation
→ Contract
→ Payment Plan
→ Payment/Receipt
→ Audit
→ Reporting
```

The actual first slice may be smaller if dependencies remain open.

Required verification:

- unit;
- integration;
- contract;
- authorization;
- tenancy/RLS;
- state machine;
- concurrency;
- idempotency;
- event/outbox;
- audit;
- E2E;
- migration safety;
- failure/retry;
- UX/accessibility/localization.

**Gate:** `BLOCKED until explicit implementation authorization`

---

# 16 — Q11 Controlled integration

Introduce remote systems only after local evidence exists.

Required:

- canonical runtime identity;
- environment separation;
- schema reconciliation;
- RLS verification;
- storage verification;
- webhook/integration security;
- remote observability;
- rollback/recovery evidence.

---

# 17 — Q12 Operational evidence

Measure:

`SLI / SLO / latency / error rate / availability / queue lag / event lag / DB saturation / reservation latency / financial posting latency`

Recovery:

`backup → restore → integrity → RPO/RTO → evidence`

A backup without restore evidence is not recovery readiness.

---

# 18 — Q13 Production readiness

Production is authorized only when all applicable gates are objectively evidenced:

`architecture / security / tenancy / schema / migration / tests / performance / observability / recovery / rollback / incident ownership / release evidence`

No document-only green status.

---

# 19 — Hard stops

Stop the affected slice for:

- unresolved business semantics;
- founder-level scope;
- unresolved aggregate ownership;
- privileged authorization ambiguity;
- tenant isolation uncertainty;
- financial mutation ambiguity;
- illegal state transition;
- cross-context write ownership conflict;
- destructive migration;
- external side-effect uncertainty;
- missing critical invariant evidence;
- missing task dependency;
- repository reality contradicting declared architecture;
- unverified runtime identity.

---

# 20 — Claude autonomy boundary

Claude may inspect, research, reason, propose, implement, test and refactor within an authorized task.

Claude may not silently redefine:

- product scope;
- canonical business semantics;
- bounded-context ownership;
- tenancy model;
- financial invariants;
- security policy;
- legal rules;
- irreversible data operations;
- autonomous high-impact AI authority.

The v1.6.1 source package is not an autonomous implementation instruction. Its promoted conclusions must first appear in the canonical architecture/contracts/ADRs/task packets.

---

# 21 — Change loop

Every material change follows:

`DISCOVER → CLASSIFY → RESEARCH → RECONCILE → MODEL → DECIDE → CONTRACT → PLAN → IMPLEMENT → TEST → ADVERSARIAL REVIEW → VERIFY → CONVERGE → EVIDENCE`

No step is silently skipped for a high-risk change.

---

# 22 — Closure rule

A finding/task/gate is closed only when:

`root cause → corrective action → references → verification → evidence → canonical reconciliation`

all exist.

Documentation alone cannot close an implementation gate.

---

# 23 — Resume command

When the operator says **Continue / أكمل العمل على المسار**:

1. load this path;
2. load `CURRENT-SESSION-STATE.md`;
3. load Roadmap and Context Prompt;
4. inspect branch/HEAD;
5. identify the first unresolved dependency;
6. inspect canonical sources and provenance;
7. research material gaps;
8. make the smallest authorized change;
9. verify;
10. update the routing artifacts and checkpoint;
11. report exact evidence and next dependency.

Never restart from conversational memory. Never claim closure without evidence.
