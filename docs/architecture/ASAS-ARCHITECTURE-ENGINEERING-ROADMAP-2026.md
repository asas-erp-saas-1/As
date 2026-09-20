# ASAS — ARCHITECTURE ENGINEERING ROADMAP 2026

**Artifact ID:** ASAS-ARCH-ROADMAP-2026-001  
**Status:** ACTIVE PROPOSED ROADMAP  
**Version:** 1.5.0  
**Owner:** Lead Architecture / Technical Program Lead  
**Canonical companion:** `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` v1.4.0  
**Historical amendment:** `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026-AMENDMENT-001.md` — superseded by Blueprint v1.4.0 and retained as provenance  
**Agent operating companion:** `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` v1.5.0  
**Evidence companion:** `docs/architecture/ASAS-CONTEXT-DOMAIN-MODULE-EVIDENCE-MATRIX-2026.md`  
**Aggregate contract companion:** `docs/architecture/ASAS-AGGREGATE-INVARIANT-BOUNDARY-REGISTER-2026.md`  
**Command contract companion:** `docs/architecture/ASAS-COMMAND-ACTION-CONTRACT-REGISTER-2026.md`  
**Offer contract companion:** `docs/architecture/ASAS-OFFER-DOMAIN-CONTRACT-2026.md`

## PURPOSE

Build the ASAS engineering framework in the correct order:

**Reality → Authority → Architecture → Domain Contracts → Data Contracts → Security → Design System → Local Platform → Tests → Implementation → Integration → Deployment → Production Evidence**

The roadmap deliberately prevents code and database programming from becoming the source of architectural truth.

> **Scale principle:** phases and counts are planning aids, not quotas. Work continues until the engineering objective and evidence are satisfied. If new evidence reveals additional architecture work, the roadmap expands through controlled change; it does not compress the work to fit an arbitrary count.

---

# H0 — REALITY AND SOURCE CONTROL

### Objective
Establish one trusted understanding of what exists.

### Work
- verify canonical repository, branch and commit;
- inventory relevant branches and classify branch purpose/provenance;
- identify canonical checkpoint;
- classify artifacts;
- reconcile source package against repository shadows;
- preserve historical evidence;
- eliminate stale canonical references;
- establish one artifact authority map;
- identify runtime/database identity separately from repository identity.

### Exit evidence
- repository identity verified;
- canonical checkpoint verified;
- source/derived/historical classes documented;
- no ambiguous active checkpoint;
- runtime identity either verified or explicitly blocked.

### Current state
`PARTIAL`

---

# H1 — ARCHITECTURAL RECONCILIATION

### Objective
Freeze the semantic architecture sufficiently for safe contract engineering—not by forcing a fixed number of contexts, but by proving ownership boundaries.

### C2 status

- `C2-001` — **OPEN ARCHITECTURAL REFINEMENT**. Nine contexts remain the current target domain grouping; the 15-module proposal remains historical/proposed implementation evidence. Module decomposition must be derived from ownership and consistency evidence; no founder decision is required merely to choose between the counts.
- `C2-002` — **OPEN / PROPOSED SUPERSESSION**. Historical `ADR-0018` accepted Scheduling as a Core/CRM-hosted capability; the 2026 architecture reopened that decision. The older ADR remains evidence until a new ADR explicitly supersedes it. No silent reassignment is permitted.

### Work
1. Maintain the nine-context domain grouping as the current target unless an approved ADR changes it.
2. Reconcile implementation modules independently from context count.
3. Define aggregate ownership and transaction boundaries.
4. Define platform capability ownership.
5. Close Scheduling through explicit decision/ADR if reopening is retained.
6. Define dependency direction and integration boundaries.
7. Record rejected alternatives.
8. Define extraction triggers for future decomposition.

### H1.2 — Evidence matrix
Completed in:

`docs/architecture/ASAS-CONTEXT-DOMAIN-MODULE-EVIDENCE-MATRIX-2026.md`

### H1.3 — Aggregate & invariant boundary engineering
Active artifact:

`docs/architecture/ASAS-AGGREGATE-INVARIANT-BOUNDARY-REGISTER-2026.md`

### H1.4 — Command / action contract engineering
Active artifacts:

- `docs/architecture/ASAS-COMMAND-ACTION-CONTRACT-REGISTER-2026.md`
- `docs/architecture/ASAS-OFFER-DOMAIN-CONTRACT-2026.md`
- `docs/architecture/ASAS-UNIT-RESERVATION-CONSISTENCY-CONTRACT-2026.md`
- `docs/architecture/ASAS-COMMERCIAL-FINANCE-SEMANTIC-RECONCILIATION-2026.md`

The current H1.4 objective is not endpoint design. It is to close command semantics against aggregate ownership, invariants, state transitions, authorization, tenancy, concurrency, events, audit and failure behavior.

### Current findings

The source Enterprise Domain Model supports Lead, Client, Project, Unit, Listing, Visit, Reservation, Contract, PaymentSchedule, CommissionRule, CommissionRecord, Agency, Branch, User and NotificationPreference as aggregate candidates. Communication, Attachment, Activity/Timeline/Audit, Search and Reporting are described differently and must not be converted into aggregates merely because they are named objects/capabilities.

The Unit/Reservation logical invariant is supported: one active reservation winner per Unit under concurrency. The exact executable persistence strategy remains implementation work after contract closure and workload validation.

Offer is source-supported as a commercial concept and candidate Sales-owned aggregate/object. Its ownership, state machine, permission mapping, approval thresholds, event mapping and concurrency contract remain OPEN.

Payment semantics have been partially reconciled: do not create a standalone Payment aggregate/table solely to reconcile terminology between V3 and the source schema. Payment fact, PaymentSchedule, Receipt, ReceiptAllocation and Ledger semantics must be closed explicitly before schema promotion.

Building ownership and Scheduling ownership remain OPEN.

### Boundary test
A boundary is acceptable only when semantic cohesion, ownership, consistency, authorization, data ownership, change cadence, failure behavior, scaling characteristics, team ownership and integration cost have been considered.

### Exit evidence
- accepted domain grouping;
- implementation module map or explicitly accepted provisional map;
- aggregate ownership matrix;
- invariant catalog;
- transaction-boundary matrix;
- command/action contract map;
- dependency matrix;
- unresolved boundaries explicitly marked;
- no hidden implementation-critical ownership ambiguity.

### Current state
`PARTIAL — H1.4 active; Offer/Building/Finance/Scheduling ownership-dependent items remain OPEN/BLOCKED`

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
- failure semantics;
- consistency boundaries;
- domain service responsibilities;
- cross-context/module contract rules.

### Critical rule
Do not generate database tables merely because a domain object exists.

### Exit evidence
Every implementation-critical behavior has an owner, invariant, command, state transition, authorization rule and test strategy.

### Current state
`PARTIAL — dependent on H1 closure`

---

# H3 — EVENT AND INTEGRATION CONTRACTS

### Objective
Make asynchronous behavior explicit and reliable.

### Work
- reconcile registered events;
- define event schemas/versioning;
- producer/consumer ownership;
- transactional outbox;
- idempotency keys;
- correlation/causation IDs;
- replay policy;
- dead-letter handling;
- ordering scope;
- integration/webhook contracts;
- compatibility/deprecation rules;
- event-to-command traceability.

### Exit evidence
Event register reconciled against domain commands and transaction boundaries; critical events have testable consumers, failure semantics and evidence.

### Current state
`BLOCKED — application implementation absent`

---

# H4 — AUTHORIZATION, TENANCY AND SECURITY ENGINEERING

### Objective
Make unauthorized access structurally difficult and detectable.

### Work
- reconcile permission register;
- resource/action/scope matrix;
- tenant hierarchy;
- support/admin access;
- service-account/worker authority;
- server authorization policy;
- RLS policy model;
- storage security;
- threat matrix;
- security test plan;
- AI tool authority model;
- prompt-injection/excessive-agency controls;
- webhook trust boundaries;
- data classification and privacy controls.

### Exit evidence
Every sensitive command has explicit permission/scope; application and database controls have independent verification; AI tools cannot widen caller authority.

### Current state
`BLOCKED — final domain/module ownership and live runtime identity unresolved`

---

# H5 — DATA ARCHITECTURE AND LOCAL DATABASE ENGINEERING

### Objective
Create a reproducible, local-first data engineering foundation.

### Work
1. Promote source schema contract after structural validation.
2. Reconcile models, enums, relations, unique constraints and indexes.
3. Separate domain model from persistence model.
4. Design tenant keys and ownership fields.
5. Define audit/outbox/idempotency structures.
6. Define financial immutability.
7. Define concurrency constraints.
8. Define indexing strategy from access patterns.
9. Generate migration baseline.
10. Run local PostgreSQL/Supabase stack.
11. Replay migrations locally.
12. Add database tests.
13. Add RLS tests.
14. Add concurrency tests for sensitive workflows.
15. Capture schema diff evidence.

### Exit evidence
- executable schema exists;
- migration history is reproducible;
- local reset/replay passes;
- constraints are tested;
- concurrency semantics are proven for critical operations;
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
- responsive behavior;
- accessibility rules;
- primitive components;
- domain components;
- workspace patterns;
- public property patterns;
- mobile field patterns;
- loading/error/empty/offline states;
- interaction contracts;
- form validation and error semantics;
- visual regression strategy.

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
- local database adapter;
- architecture enforcement rules.

### Rule
No domain feature is implemented merely to prove the framework works.

### Exit evidence
Local application starts, health checks work, test harness runs, module boundaries are enforceable, and architectural violations fail verification.

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

The exact slice boundary may change if architecture evidence identifies a safer vertical cut.

### Required evidence
- unit/integration/contract tests;
- authorization tests;
- tenancy tests;
- state-machine tests;
- concurrency tests where relevant;
- event/outbox tests;
- audit verification;
- browser/E2E verification;
- failure/retry verification.

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
- incident/runbook design;
- capacity evidence;
- degradation/failure-mode tests.

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
- integrate hosting when appropriate;
- run staging verification;
- compare local and remote migration state;
- verify remote observability and recovery controls.

### Exit evidence
Every remote system has identity evidence and environment mapping.

### Current state
`BLOCKED — canonical runtime identity unresolved`

---

# H11 — PRODUCTION READINESS

### Objective
Permit controlled production operation only after evidence closure.

### Gates
- architecture gates;
- security review;
- recovery test;
- performance budget;
- E2E critical workflows;
- migration rehearsal;
- observability;
- rollback plan;
- incident ownership;
- release evidence;
- operational readiness review.

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
Context/domain owner
Implementation module
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

Source task semantics are preserved; this is a derived implementation layer. Missing fields are not silently guessed.

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

Research depth must be proportional to risk and architectural impact.

Record:

`question → source/date/version → finding → conflict → decision → impact → review date`

---

# 15. LOCAL-FIRST DATABASE PRINCIPLE

The platform does not need cloud connectivity to construct the architecture or build the initial code/database framework.

Preferred sequence:

`Local design → local schema → local migrations → local tests → CI → controlled staging → controlled production`

Remote runtime is introduced only when the corresponding verification stage requires it.

---

# 16. ARCHITECTURE CHANGE / EXPANSION RULE

The roadmap is not a fixed checklist of a predetermined number of files, contexts, services or phases.

When engineering evidence reveals a missing concern:

`DISCOVER → CLASSIFY → IMPACT ASSESS → ADD WORK → UPDATE BLUEPRINT/ROADMAP/PROMPT → ADR IF MATERIAL → VERIFY`

When a planned item becomes unnecessary:

`EVIDENCE → DEFER/REMOVE → RECORD REASON → UPDATE DEPENDENCIES`

No work is added merely for complexity, and no work is removed merely to make the roadmap look complete.

---

# 17. CURRENT EXECUTION QUEUE

### Q0 — Authority reconciliation
**CLOSED FOR CURRENT CONFLICT:** C2-001 is no longer treated as a binary 9-vs-15 founder choice. It is an open refinement of implementation module boundaries. Scheduling remains a separate reopening decision.

### Q1 — Aggregate/invariant boundary engineering
**ACTIVE:** Unit/Reservation logical consistency is contractually defined; Offer, Building, Finance and Scheduling boundaries remain open where evidence is incomplete.

### Q2 — Command/action contract engineering
**ACTIVE:** source-derived actions are captured. Offer now has a dedicated domain contract. Permission/state/event mappings remain to be closed.

### Q3 — Payment semantic closure
**ACTIVE:** reconcile payment fact, PaymentSchedule, Receipt/Allocation and Ledger without inventing a standalone Payment model merely from terminology.

### Q4 — Scheduling decision packet
**ACTIVE:** prepare explicit ADR confirmation/supersession. Do not silently change ownership.

### Q5 — Building boundary
**ACTIVE:** define Building ownership and invariants from source evidence before schema promotion.

### Q6 — State/permission/event traceability
**NEXT:** map critical commands to canonical state machines, permission keys and registered events.

### Q7 — Query/read-model contracts
**NEXT:** define read responsibilities for the commercial spine without giving projections mutation authority.

### Q8 — Task packet derivation
**GUARDED:** derive implementation packets only where ownership and contracts are proven.

### Q9 — Security/tenancy contract closure
**DEPENDENT:** Q6 + final ownership model.

### Q10 — Schema contract promotion
**BLOCKED:** dependent on Q3/Q5/Q6/Q9 and architecture gates.

### Q11 — Local database foundation
**BLOCKED:** dependent on Q10.

### Q12 — Design system engineering
**PARTIALLY READY:** may proceed where it does not assume unresolved domain ownership.

### Q13 — Application shell
**BLOCKED:** implementation authorization not granted.

### Q14 — First vertical slice
**BLOCKED:** dependent on Q13 + authorized task packets.

### Q15 — Runtime/cloud verification
**BLOCKED:** canonical runtime identity unresolved.

---

# 18. DEFINITION OF DONE FOR ARCHITECTURE

Architecture is not complete because the document is long.

A phase is complete only when:

`decision resolved + artifact updated + implementation constraint explicit + tests/evidence defined + references reconciled + no contradictory canonical artifact remains`

If the correct outcome is uncertainty, the phase remains explicitly `OPEN`, `CONFLICT`, or `BLOCKED`.

---

# 19. NEXT CHECKPOINT

**ARCH-2026-H1.4-COMMAND-QUERY-CONTRACT-CLOSURE**

Immediate sequence:

1. Offer ownership/invariant/state closure;
2. Payment/PaymentSchedule/Receipt/Ledger semantic closure;
3. Building ownership/invariants;
4. Scheduling ADR confirmation/supersession;
5. command/action → aggregate → permission → state → event traceability;
6. derived query/read-model contracts;
7. task packet mapping where ownership is proven;
8. update Source of Truth and checkpoint;
9. verify references and architecture consistency;
10. only then evaluate schema promotion.

No code/database implementation authorization is implied by this checkpoint.
