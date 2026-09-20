# ASAS — ARCHITECTURE ENGINEERING ROADMAP 2026

**Artifact ID:** ASAS-ARCH-ROADMAP-2026-001  
**Status:** ACTIVE PROPOSED ROADMAP  
**Version:** 1.0.0  
**Owner:** Lead Architecture / Technical Program Lead  
**Canonical companion:** `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md`  
**Agent operating companion:** `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md`

## PURPOSE

Build the ASAS engineering framework in the correct order:

**Reality → Authority → Architecture → Domain Contracts → Data Contracts → Security → Design System → Local Platform → Tests → Implementation → Integration → Deployment → Production Evidence**

The roadmap deliberately prevents code and database programming from becoming the source of architectural truth.

---

# H0 — REALITY AND SOURCE CONTROL

### Objective
Establish one trusted understanding of what exists.

### Work
- verify canonical repository, branch and commit;
- inventory all branches and classify branch purpose/provenance;
- identify canonical checkpoint;
- classify artifacts;
- reconcile source package against repository shadows;
- preserve historical evidence;
- eliminate stale canonical references;
- establish one artifact authority map.

### Exit evidence
- repository identity verified;
- canonical checkpoint verified;
- source/derived/historical classes documented;
- no ambiguous active checkpoint.

### Current state
`PARTIAL`

---

# H1 — ARCHITECTURAL RECONCILIATION

### Objective
Freeze the semantic architecture before implementation.

### Work
1. Resolve C2-001 context/module conflict.
2. Resolve Scheduling ownership.
3. Build Context → Module → Aggregate → Capability map.
4. Define platform planes.
5. Define dependency direction.
6. Define bounded-context interaction rules.
7. Define shared kernel rules.
8. Define anti-corruption/integration boundaries.

### Exit evidence
- approved architecture decision(s);
- context map;
- dependency matrix;
- no unresolved implementation-critical ownership ambiguity.

### Current state
`BLOCKED — founder decisions required`

---

# H2 — DOMAIN CONTRACT ENGINEERING

### Objective
Convert the semantic model into implementation-safe contracts.

### Work
- aggregate catalog;
- value-object catalog;
- invariant catalog;
- command catalog;
- query catalog;
- state-machine catalog;
- approval rules;
- business policy catalog;
- concurrency rules;
- failure semantics.

### Critical rule
Do not generate database tables merely because a domain object exists.

### Exit evidence
Every implementation-critical behavior has an owner, invariant, command, state transition and test strategy.

### Current state
`PARTIAL`

---

# H3 — EVENT AND INTEGRATION CONTRACTS

### Objective
Make asynchronous behavior explicit and reliable.

### Work
- reconcile 103 registered events;
- define event schemas/versioning;
- producer/consumer ownership;
- transactional outbox;
- idempotency keys;
- correlation/causation IDs;
- replay policy;
- dead-letter handling;
- ordering scope;
- integration/webhook contracts.

### Exit evidence
Event register reconciled against domain commands and transaction boundaries; critical events have testable consumers.

### Current state
`BLOCKED — application implementation absent`

---

# H4 — AUTHORIZATION, TENANCY AND SECURITY ENGINEERING

### Objective
Make unauthorized access structurally difficult and detectable.

### Work
- reconcile 50 permission keys × 8 personas;
- resource/action/scope matrix;
- tenant hierarchy;
- support/admin access;
- service-account/worker authority;
- server authorization policy;
- RLS policy model;
- storage security;
- threat matrix;
- security test plan;
- AI tool authority model.

### Exit evidence
Every sensitive command has explicit permission/scope; database and application controls have independent verification.

### Current state
`BLOCKED — final domain ownership and live runtime identity unresolved`

---

# H5 — DATA ARCHITECTURE AND LOCAL DATABASE ENGINEERING

### Objective
Create a reproducible, local-first data engineering foundation.

### Work
1. Promote source schema contract after structural validation.
2. Reconcile all models, enums, relations, unique constraints and indexes.
3. Separate domain model from persistence model.
4. Design tenant keys and ownership fields.
5. Define audit/outbox/idempotency tables.
6. Define financial immutability.
7. Define concurrency constraints.
8. Generate migration baseline.
9. Run local PostgreSQL/Supabase stack.
10. Replay migrations locally.
11. Add database tests.
12. Add RLS tests.

### Exit evidence
- executable schema exists;
- migration history is reproducible;
- local reset/replay passes;
- constraints are tested;
- no production database has been touched.

### Current state
`BLOCKED`

---

# H6 — DESIGN SYSTEM AND EXPERIENCE ARCHITECTURE

### Objective
Create the UI architecture before page-by-page coding.

### Work
- design tokens;
- typography;
- spacing;
- color semantics;
- elevation;
- RTL/LTR rules;
- responsive breakpoints;
- accessibility rules;
- primitive components;
- domain components;
- workspace patterns;
- public property patterns;
- mobile field patterns;
- loading/error/empty states.

### Exit evidence
Design system contract and component inventory are implementation-ready and independently testable.

### Current state
`PARTIAL`

---

# H7 — APPLICATION PLATFORM SKELETON

### Objective
Create the smallest executable modular-monolith shell.

### Work
- application structure;
- module boundaries;
- dependency rules;
- configuration boundary;
- logging/observability boundary;
- validation;
- error model;
- auth/session boundary;
- command/query application layer;
- test harness;
- local database adapter.

### Rule
No domain feature is implemented merely to prove the framework works.

### Exit evidence
Local application starts, health checks work, test harness runs, module boundaries are enforceable.

### Current state
`BLOCKED — implementation authorization not yet granted`

---

# H8 — CONTROLLED COMMERCIAL SLICE

### Objective
Implement one complete vertical slice rather than many partial features.

### Candidate slice
`Project → Building → Unit → Lead → Assignment → Activity → Visit`

Then extend through:

`Offer → Reservation → Contract → Payment Plan → Payment → Receipt → Audit → Reporting`

### Required evidence
- unit/integration/contract tests;
- authorization tests;
- tenancy tests;
- state-machine tests;
- concurrency tests where relevant;
- event/outbox tests;
- audit verification;
- browser/E2E verification.

### Exit evidence
One complete business slice is production-shaped and independently auditable.

---

# H9 — OBSERVABILITY, PERFORMANCE AND RECOVERY

### Objective
Prove the platform can be operated safely.

### Work
- structured logs;
- metrics;
- tracing where justified;
- error tracking;
- SLI/SLO definitions;
- database health metrics;
- queue/event lag;
- performance budgets;
- backup verification;
- restore rehearsal;
- RPO/RTO definition;
- incident/runbook design.

### Exit evidence
Measured operational behavior, tested restore and documented recovery evidence.

### Current state
`BLOCKED`

---

# H10 — INTEGRATION AND CLOUD VERIFICATION

### Objective
Introduce remote dependencies only after local architecture is stable.

### Work
- verify canonical Supabase project identity;
- reconcile live schema;
- verify RLS;
- verify storage;
- configure environment separation;
- integrate Vercel/hosting when appropriate;
- run staging verification;
- compare local and remote migration state.

### Exit evidence
Every remote system has identity evidence and environment mapping.

### Current state
`BLOCKED — canonical runtime identity unresolved`

---

# H11 — PRODUCTION READINESS

### Objective
Permit controlled production operation only after evidence closure.

### Gates
- architecture gates 00–15;
- security review;
- recovery test;
- performance budget;
- E2E critical workflows;
- migration rehearsal;
- observability;
- rollback plan;
- incident ownership;
- release evidence.

### Current state
`BLOCKED`

---

# 12. TASK PACKET STANDARD

No task enters implementation unless it contains:

```text
Task ID
Title
Objective
Scope
Non-goals
Context
Module
Owner
Dependencies
Contract references
Schema impact
Commands
Queries
Permissions
Invariants
State transitions
Events
Concurrency
Security considerations
UX impact
Tests
Definition of Done
Evidence required
Rollback/recovery consideration
Authorization state
```

Source task semantics are preserved; this packet is a derived implementation layer.

---

# 13. ENGINEERING LOOP

Every architectural or implementation change follows:

```text
DISCOVER
 → CLASSIFY
 → RESEARCH
 → RECONCILE
 → MODEL
 → DECIDE
 → CONTRACT
 → PLAN
 → IMPLEMENT
 → TEST
 → ATTACK
 → VERIFY
 → CONVERGE
 → RECORD EVIDENCE
```

No step may be silently skipped for a high-risk change.

---

# 14. RESEARCH STANDARD

For external technical facts:

1. official documentation;
2. standards/RFCs;
3. primary engineering documentation;
4. authoritative research;
5. reputable secondary analysis;
6. community evidence only as supplementary evidence.

Record:

`question → source/date/version → finding → conflict → decision → impact → review date`

Current official references consulted for this roadmap include Next.js documentation and Supabase local development/migration/RLS guidance, plus reliability guidance emphasizing tested restoration and RPO/RTO evidence.

---

# 15. LOCAL-FIRST DATABASE PRINCIPLE

The platform does not need cloud connectivity to construct the architecture or build the initial code/database framework.

The preferred sequence is:

`Local design → local schema → local migrations → local tests → CI → controlled staging → controlled production`

This is supported by Supabase's documented local workflow: local stacks, version-controlled migrations, schema pull/diff, seed data and database tests are supported before remote deployment.

---

# 16. CURRENT EXECUTION QUEUE

### Q0 — Architecture authority closure
**BLOCKED:** founder decisions.

### Q1 — Task packet derivation
**READY:** can proceed without changing source task semantics.

### Q2 — Schema contract promotion
**READY AFTER:** Q0 where ownership affects schema.

### Q3 — Security/tenancy contract closure
**DEPENDENT:** Q0/Q2.

### Q4 — Local database foundation
**DEPENDENT:** Q2/Q3.

### Q5 — Application shell
**DEPENDENT:** architecture implementation gate.

### Q6 — First vertical slice
**DEPENDENT:** Q5 + task authorization.

### Q7 — Runtime integration
**DEPENDENT:** local verification + platform identity gate.

---

# 17. DEFINITION OF DONE FOR ARCHITECTURE

Architecture is not complete because the document is long.

A phase is complete only when:

`decision resolved + artifact updated + implementation constraint explicit + tests/evidence defined + references reconciled + no contradictory canonical artifact remains`

---

# 18. NEXT CHECKPOINT

The next engineering checkpoint is:

**ARCH-2026-H1-CLOSURE**

Required before H7:

1. C2-001 resolution;
2. Scheduling ownership resolution;
3. context/module map;
4. derived task packet framework;
5. schema promotion plan;
6. canonical artifact map;
7. architecture gate status update.

No code/database implementation authorization is implied by this roadmap.
