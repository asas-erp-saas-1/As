# ASAS — PLATFORM ARCHITECTURE BLUEPRINT 2026

**Artifact ID:** ASAS-ARCH-PLATFORM-2026-001  
**Status:** PROPOSED — ENGINEERING BASELINE  
**Version:** 1.5.0  
**Effective date:** 2026-09-20  
**Owner:** Lead Architecture / Founder authority boundary  
**Canonical role:** Single architectural truth for the 2026 engineering program, subject to explicit ADR supersession  
**Branch:** `platform-architecture-2026`  
**Parent checkpoint:** `docs/handoff/CURRENT-SESSION-STATE.md`  
**Evidence companion:** `docs/architecture/ASAS-CONTEXT-DOMAIN-MODULE-EVIDENCE-MATRIX-2026.md`  
**Amendment incorporated:** `ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026-AMENDMENT-001.md`  
**Research protocol:** `docs/architecture/ASAS-ARCHITECTURE-RESEARCH-SOURCE-DISCOVERY-PROTOCOL-2026.md`

> This document is the reconciled architectural target. It is not a claim that the application, database, runtime, or infrastructure already exists. Existing repository/runtime facts remain evidence sources; this blueprint defines the desired engineering state.

---

# 0. NON-NEGOTIABLE ARCHITECTURAL PRINCIPLES

1. **Reality before intent.** Existing runtime/database state is never overwritten by documentation.
2. **Architecture before implementation.** Domain boundaries, contracts, invariants, state machines, data ownership, security model, design system, and verification strategy precede application code and database programming.
3. **Contract before code.** An implementation task is authorized only when its contract, scope, ownership, dependencies, invariants, authorization, and evidence requirements are defined.
4. **Modular monolith first.** No microservices, Kafka, Kubernetes, service mesh, multi-region, data lake, or distributed architecture becomes mandatory without measured extraction/scaling evidence and an ADR.
5. **No architecture by counting.** Numbers of contexts, modules, tables, events, permissions, workers, services, or screens are observations or consequences—not design objectives.
6. **One concept, one canonical owner.** Derived artifacts may mirror authoritative sources but cannot silently redefine them.
7. **Server authority.** Client UI, AI, browser state, and external integrations never become authoritative for permissions, money, inventory, reservations, contracts, or tenancy.
8. **Database safety.** Schema evolution is forward-only, migration-controlled, locally reproducible, reversible where technically possible, and never destructive by default.
9. **Evidence over claims.** `VERIFIED` means executed and evidenced; otherwise use `PARTIAL`, `BLOCKED`, `NOT_EXECUTED`, `OPEN`, or `CONFLICT`.
10. **Human authority boundaries.** Founder decisions, legal interpretation, destructive production operations, financial corrections, credential changes with outage risk, tenant deletion, and autonomous high-impact AI actions require human authorization.
11. **Local-first engineering.** Architecture, code, schema, migrations, tests, fixtures, and CI must be reproducible locally before cloud deployment.
12. **Evolution is evidence-driven.** The architecture may change when new domain, runtime, security, performance, or product evidence justifies it.
13. **Cross-source research is mandatory for material uncertainty.** Relevant branches, source packages and current authoritative external engineering sources are evidence inputs; none silently overrides ASAS authority.

---

# 1. AUTHORITY AND PROVENANCE

## 1.1 Existing/brownfield reality

`LIVE RUNTIME / LIVE DATABASE`  
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

## 1.3 External engineering evidence

`OFFICIAL DOCUMENTATION / STANDARD`  
`>` `PRIMARY ENGINEERING SOURCE`  
`>` `AUTHORITATIVE RESEARCH`  
`>` `REPUTABLE SECONDARY SOURCE`  
`>` `COMMUNITY`

External research validates engineering technique; it does not override ASAS product authority or runtime facts.

## 1.4 Conflict rule

If authorities conflict, the state is **CONFLICT** until provenance and decision authority resolve it. No silent reconciliation.

## 1.5 Source classes

- **AUTHORITATIVE SOURCE:** approved product decision, approved architecture, approved ADR, verified runtime/database evidence.
- **CANONICAL DERIVED:** machine-readable register generated from an authoritative source.
- **OPERATIONAL:** task/checkpoint/runbook material.
- **HISTORICAL:** preserved evidence from superseded states.
- **EXTERNAL RESEARCH:** current official documentation, standards, regulator material, primary engineering research, and reputable technical analysis.
- **INFERENCE:** engineering interpretation; never sufficient to close a gate.

## 1.6 Current source observations

The supplied v1.6.1 Blueprint/package remains the principal historical/source specification for foundation facts. Current structural observations include:

- 119 unique phase task IDs;
- 3 recurring ritual IDs;
- 122 `T-*` identifiers including recurring rituals;
- 59 schema models;
- 17 enums;
- 56 `@@index` declarations;
- 22 `@@unique` declarations;
- 19 `@relation(...)` annotations;
- 103 domain events across 11 emission modules;
- 50 permission keys across eight persona columns;
- 11 state machines.

These are source observations, not architectural quotas and not proof of runtime implementation.

---

# 2. PLATFORM DEFINITION

ASAS is architected as a **premium real-estate sales and marketing platform with an enterprise-grade operating core**.

The long-term ambition may extend into a broader enterprise platform, but future breadth is an architectural reservation until separately authorized.

## 2.1 Core business loop

`Project → Building → Unit → Lead → Assignment → Activity → Visit → Offer → Reservation → Contract → Payment Plan → Payment → Receipt → Audit → Reporting`

This is a traceability spine, not a requirement that all stages belong to one transaction or one bounded context.

## 2.2 Controlled initial implementation

- property/project presentation;
- inventory visibility;
- lead capture and qualification;
- assignment and commercial activities;
- visits;
- offers/reservations with correctness controls;
- contract lifecycle foundations;
- payment-plan visibility and controlled financial recording where explicitly authorized;
- audit trail;
- reporting for the commercial loop;
- Arabic/RTL, French and English support;
- mobile-first operational experience.

## 2.3 Architectural reservations — not implementation requirements

- global multi-country packs;
- multi-region active-active infrastructure;
- marketplace;
- autonomous finance;
- autonomous AI actions;
- construction ERP;
- property-management suite;
- developer platform;
- ontology/data lake at global scale;
- microservice decomposition;
- separate deployables for every module or context.

---

# 3. ARCHITECTURAL SHAPE

## 3.1 Five planes

```text
EXPERIENCE PLANE
  Public Web / Operations / Mobile / Customer & Partner surfaces / AI Workspace / API

APPLICATION & DECISION PLANE
  Commands / Queries / Policies / Approvals / Workflows / Jobs / Calculations / Simulations

DOMAIN PLANE
  Business contexts and implementation modules, with ownership explicitly reconciled

PLATFORM KERNEL
  Identity / Tenancy / Authorization / Audit / Events / Search / Media / Notifications /
  Scheduling / Integrations / Configuration

DATA & OPERATIONS PLANE
  PostgreSQL / Object Storage / Read Models / Outbox / Search / Analytics / Observability /
  Backups / DR / Secrets / CI
```

The planes are architectural responsibilities, not automatically separate deployables.

## 3.2 Deployment rule

The initial deployment unit is a **modular monolith**. Internal module boundaries must be explicit so future extraction is possible without designing distributed infrastructure prematurely.

## 3.3 Dependency direction

```text
Experience
   ↓
Application / Decision
   ↓
Domain
   ↓
Ports / Contracts
   ↓
Infrastructure adapters
```

Infrastructure must not become the owner of business semantics.

---

# 4. DOMAIN / MODULE RECONCILIATION — CURRENT STATUS

The repository contains two materially different architectural descriptions:

### A. Nine-context condensed domain view

`Core / CRM / Sales / Inventory / Finance / Website Studio / Marketing / Analytics / Documents`

### B. Fifteen-module implementation candidate

The historical `ADR-0001-CANONICAL-CONTEXT-MODULE-DECOMPOSITION.md` and `CANONICAL-CONTEXT-TO-MODULE-MAP.md` propose:

`Lead & CRM / Property & Inventory / Visit Management / Reservation & Contract / Payment & Finance / Commission & Payout / Communication / Identity, Access & Workspace / Notification / Collaboration & Extensibility / Calendar & Scheduling / Activity, Timeline & Audit / Search / Reporting & Analytics / Workflow & Automation Engine`

The historical ADR explicitly states that this 15-module proposal is **PROPOSED — awaiting explicit founder acceptance**.

### Current architectural truth

**C2-001 = OPEN ARCHITECTURAL REFINEMENT.**

The current evidence does not establish two equal-authority bounded-context architectures. The nine-context view remains the current target domain grouping. The 15-module artifact remains historical/proposed implementation evidence. The engineering task is to derive implementation module boundaries from ownership, consistency, authorization, data ownership, failure isolation, scaling and integration evidence. No founder decision is required merely to choose between the numbers 9 and 15.

The canonical evidence matrix is:

`docs/architecture/ASAS-CONTEXT-DOMAIN-MODULE-EVIDENCE-MATRIX-2026.md`

It records candidate mappings, candidate aggregate ownership, platform capability classification, dependency evidence and unresolved boundaries without authorizing implementation.

## 4.1 Boundary decision criteria

The accepted model must be evaluated against:

- semantic cohesion;
- ubiquitous language;
- business capability ownership;
- aggregate and transaction boundaries;
- authorization boundary;
- data ownership;
- change cadence;
- failure isolation;
- scaling characteristics;
- team/agent ownership;
- synchronous coupling;
- event coupling;
- operational complexity.

## 4.2 Platform capabilities

Identity, Tenancy, Authorization, Audit, Events, Workflow, Scheduling, Search, Media, Notifications, Integrations, Configuration, AI and SaaS control remain platform capabilities/candidate modules until ownership is explicitly accepted.

Scheduling remains **OPEN / PROPOSED SUPERSESSION** under C2-002. Historical ADR-0018 remains evidence until explicitly superseded or reaffirmed. No implementation ownership changes solely because the question was reopened.

---

# 5. AGGREGATE AND TRANSACTION RULES

Every aggregate must have:

- explicit identity;
- ownership context/module;
- invariants;
- commands that can mutate it;
- legal state transitions;
- authorization requirements;
- audit requirements;
- event semantics;
- concurrency policy;
- persistence boundary.

An entity does not automatically become an aggregate. An aggregate does not automatically become a table. A table does not automatically become a context.

Cross-context writes are prohibited as an implicit convenience pattern.

The derived boundary register is:

`docs/architecture/ASAS-AGGREGATE-INVARIANT-BOUNDARY-REGISTER-2026.md`

The command/action contract register is:

`docs/architecture/ASAS-COMMAND-ACTION-CONTRACT-REGISTER-2026.md`

---

# 6. STATE MACHINE CONTRACT

Every authoritative lifecycle mutation follows:

```text
Command
 → Authentication
 → Authorization
 → Tenant Scope
 → Aggregate Load
 → Preconditions
 → Legal Transition
 → Domain Invariants
 → State Mutation
 → Audit
 → Domain Event
 → Transactional Outbox
 → Commit
```

Direct status mutation is prohibited for governed state machines.

Every transition must specify:

`from / to / command / actor / permission / preconditions / invariants / event / audit / failure / test`

Both legal and illegal transitions must be tested.

---

# 7. INVENTORY AND RESERVATION CORRECTNESS

Inventory is concurrency-sensitive and cannot depend on UI checks.

Required properties:

- no double sale;
- explicit availability states;
- reservation ownership;
- hold expiry;
- deterministic conflict handling;
- database-level uniqueness/locking strategy where required;
- idempotent reservation commands;
- audit of reservation creation, extension, conversion, expiry and cancellation;
- reconciliation path for failed/partial transactions.

The approved historical reservation protocol is preserved as source evidence; the 2026 consistency contract records the logical outcome and test requirements. The concrete persistence mechanism is not promoted until schema/workload validation is complete.

---

# 8. FINANCIAL MODEL

Financial semantics are high-risk and must be contract-first.

Required invariants:

- integer minor-unit money representation where applicable;
- explicit currency;
- deterministic rounding;
- immutable posted ledger entries;
- double-entry balance invariant where ledger functionality is authorized;
- reversal rather than mutation of posted financial facts;
- controlled refunds;
- payment-plan allocation reconciliation;
- commission calculation traceability;
- idempotency for financial commands;
- complete audit trail.

No financial correction is autonomous or destructive.

The current semantic reconciliation is recorded in:

`docs/architecture/ASAS-COMMERCIAL-FINANCE-SEMANTIC-RECONCILIATION-2026.md`

Do not create a standalone Payment aggregate/table solely to reconcile naming until the authoritative payment fact and its relationship to PaymentSchedule, Receipt and Ledger are closed.

---

# 9. TENANCY AND AUTHORIZATION

Target hierarchy:

```text
Platform
 → Organization
 → Workspace
 → Branch
 → Membership
 → Role
 → Permission
 → Scope
 → Resource
```

Required properties:

- deny by default;
- server-side authorization;
- tenant-aware queries;
- tenant-aware events;
- tenant-aware cache keys;
- tenant-aware search and analytics;
- explicit support/admin access model;
- worker/service-account scope;
- RLS as defense-in-depth, not the sole application authorization layer.

No client-side permission check is authoritative.

---

# 10. EVENT ARCHITECTURE

Events are integration contracts, not a substitute for domain logic.

Each event contract must define:

`event ID / name / version / producer context / producer module / aggregate / trigger / invariant / transaction boundary / tenant identity / causation ID / correlation ID / consumers / idempotency / ordering scope / replay / dead-letter / retention / reconciliation / evidence`

The transactional outbox is the default reliability boundary for durable domain events.

The existence of a registered event catalog does not imply implementation completeness.

---

# 11. API AND INTEGRATION ARCHITECTURE

All external APIs must define:

- authentication;
- authorization;
- tenant scope;
- versioning;
- idempotency;
- pagination;
- validation;
- rate limits;
- error model;
- retries;
- webhook signature verification;
- replay protection;
- compatibility/deprecation policy;
- auditability.

No microservice boundary is required merely because an API exists.

---

# 12. DATA ARCHITECTURE

Separate four realities:

```text
TARGET DOMAIN MODEL
        ≠
CANONICAL SCHEMA CONTRACT
        ≠
VERSIONED MIGRATION HISTORY
        ≠
LIVE DATABASE
```

## 12.1 Local-first database workflow

`schema contract → local PostgreSQL/Supabase stack → migrations → tests → CI → controlled remote deployment`

## 12.2 Migration rules

- forward-only migration history;
- no blind destructive migration;
- no `DROP/TRUNCATE/RESET` against production;
- no `db push` until target identity and rehearsal gates pass;
- schema changes are committed and reviewable;
- local reset/replay validates migration consistency;
- brownfield runtime is captured before reconciliation.

## 12.3 Database promotion sequence

```text
Source schema contract
 → Structural validation
 → Canonical executable schema
 → Local database
 → Migration generation
 → Local migration replay
 → Constraint/index/RLS tests
 → CI
 → Runtime identity verification
 → Remote pull/introspection
 → Drift classification
 → Approved migration plan
 → Backup/restore evidence
 → Controlled deployment
```

---

# 13. SECURITY ARCHITECTURE

Threat model must cover at minimum:

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
- reservation race conditions;
- API abuse/rate-limit bypass;
- AI prompt injection;
- AI excessive agency;
- AI tool abuse;
- cross-tenant analytics leakage;
- storage access violations.

Each threat requires:

`attack path / control / enforcement layer / test / evidence / residual risk / owner`

Security is not closed by prose.

---

# 14. AI ARCHITECTURE

AI operates below the same authority model as humans:

```text
User Intent
 → AI Interpretation
 → Proposed Action
 → Tool Request
 → Policy Evaluation
 → Caller Authorization
 → Domain/Application Service
 → Transaction
 → Audit
 → Event
```

AI must not directly mutate authoritative business data.

### Action classes

- **Read-only:** allowed within caller scope.
- **Draft/reversible:** may prepare changes but requires controlled execution.
- **Approval-required:** human approval before commit.
- **Prohibited autonomous:** destructive production changes, financial corrections, tenant deletion, security bypass, risky credential rotation, legal/contract-signature decisions, unauthorized mass communication.

---

# 15. OBSERVABILITY AND RELIABILITY

Define measurable SLI/SLO targets before production authorization.

At minimum measure request latency, error rate, availability, queue/event lag, database saturation, reservation latency, financial posting latency, background-job failure rate and integration failure rate.

Recovery readiness requires tested restoration, data integrity verification, RPO and RTO evidence. A backup declaration alone is not recovery proof.

---

# 16. DOCUMENT / MEDIA GOVERNANCE

Documents/media require tenant ownership, metadata, versioning, authorization, signed access where appropriate, malware/file validation, retention, deletion policy, audit and storage lifecycle management.

---

# 17. UX / DESIGN SYSTEM ARCHITECTURE

```text
Design Tokens
 → Primitives
 → Components
 → Patterns
 → Page/Workspace Templates
 → Product Surfaces
```

The system must support Arabic-first RTL, French/English, mobile field workflows, responsive layouts, accessibility, keyboard navigation, reduced motion where appropriate, and consistent loading/empty/error/offline states.

---

# 18. LOCAL ENGINEERING ENVIRONMENT

The first complete engineering environment should be reproducible on a developer workstation:

```text
Git
Node/TypeScript toolchain
Application runtime
Local PostgreSQL/Supabase stack where selected
Migration runner
Seed/fixtures
Unit/integration tests
Contract tests
RLS/security tests
Browser/E2E tests
Architecture CI
```

Cloud services are introduced only when the corresponding verification stage requires them.

---

# 19. SCALABILITY AND EXTRACTION POLICY

Scalability is an evidence problem, not a technology shopping list.

```text
Modular Monolith
 → measure
 → diagnose
 → optimize
 → isolate
 → extraction assessment
 → ADR
 → independent deployable only if justified
```

Extraction evidence may include materially different scaling profiles, independent availability requirements, security isolation, deployment cadence conflicts, team ownership boundaries, technology incompatibility, or measured operational benefit greater than distributed-system cost.

Microservices, Kafka, Kubernetes, service mesh and multi-region are options, not milestones.

---

# 20. QUALITY MODEL

Every implementation-critical requirement must be traceable:

`Requirement → ADR → Context/Module → Aggregate → Invariant → Command → Permission → Event → Schema → Task → Implementation → Test → Evidence`

Unresolved nodes remain explicitly `OPEN`, `CONFLICT`, or `BLOCKED`.

---

# 21. ARCHITECTURE GATES

| Gate | Meaning | Required evidence |
|---|---|---|
| ARCH-00 | Identity | Repo/branch/commit/environment identity |
| ARCH-01 | Authority | Canonical artifact map + provenance |
| ARCH-02 | Contexts/modules | Accepted ownership and dependency model |
| ARCH-03 | Scope | MVP/non-goal authorization |
| ARCH-04 | Invariants | Executable invariant catalog/tests |
| ARCH-05 | State | Transition matrix + tests |
| ARCH-06 | Events | Event contract + outbox/idempotency evidence |
| ARCH-07 | Permissions | Server-side authorization tests |
| ARCH-08 | Tenancy | Isolation/RLS evidence |
| ARCH-09 | Security | Threat controls + adversarial tests |
| ARCH-10 | Database | Schema/migration/reconciliation evidence |
| ARCH-11 | CI | Reproducible architecture checks |
| ARCH-12 | Observability | Metrics/logging/alert evidence |
| ARCH-13 | Recovery | Restore/RPO/RTO evidence |
| ARCH-14 | AI safety | Tool authorization/evaluation evidence |
| ARCH-15 | Implementation | Explicit task authorization |

Allowed states: `VERIFIED / PARTIAL / BLOCKED / NOT_EXECUTED / OPEN`.

---

# 22. IMPLEMENTATION AUTHORIZATION RULE

No application implementation begins merely because the architecture document exists.

The first authorized implementation slice must have resolved ownership, approved scope, complete task packet, contract, schema impact, permissions, invariants, state transitions, tests, evidence plan, definition of done, and rollback/recovery consideration.

---

# 23. CURRENT OPEN DECISIONS

1. **C2-001 — context/module decomposition:** OPEN ARCHITECTURAL REFINEMENT. Nine contexts remain the current target domain grouping; the historical 15-module decomposition remains proposed implementation evidence. Derive module boundaries from evidence rather than counting. No founder decision is required merely to choose 9 versus 15.
2. **C2-002 — Scheduling ownership:** OPEN / PROPOSED SUPERSESSION. Historical ADR-0018 remains evidence until a new ADR explicitly supersedes it or the baseline reaffirms it.
3. **Canonical ASAS live database/project identity:** BLOCKED / UNVERIFIED.
4. **Complete task-packet derivation:** OPEN.
5. **Promotion of executable schema contract:** OPEN.
6. **Security/tenancy closure against final domain/module decomposition:** BLOCKED.
7. **Offer ownership/invariant contract:** OPEN.
8. **Payment/PaymentSchedule/Receipt semantic closure:** PARTIAL.
9. **Building ownership/invariant contract:** OPEN.

---

# 24. RESEARCH BASELINE

External engineering principles are to be validated before material implementation decisions through the dedicated research protocol:

`docs/architecture/ASAS-ARCHITECTURE-RESEARCH-SOURCE-DISCOVERY-PROTOCOL-2026.md`

Current verification work has specifically included GitHub repository governance documentation. GitHub supports required pull requests, required status checks, force-push restrictions, code scanning/quality rules and path restrictions through rulesets; rulesets can layer with branch protection and the most restrictive applicable rule applies. The existence of these capabilities does not prove that ASAS `main` currently has them enabled; repository configuration remains a fact to verify. citeturn0search0turn0search1turn0search8

The research protocol also requires current official documentation/standards and, where risk warrants, independent corroboration for technology, security, database, accessibility and platform decisions. External research validates technique; ASAS authority and runtime evidence remain controlling.

---

# 25. CHANGE PROTOCOL

Any architectural change must:

1. identify the affected decision;
2. cite the source/evidence;
3. state whether it changes desired architecture or records runtime reality;
4. update this blueprint if canonical architecture changes;
5. update the roadmap if sequencing changes;
6. update the context prompt if agent behavior changes;
7. create/update an ADR when material;
8. update registers when their canonical concept changes;
9. update the current checkpoint;
10. verify references and CI;
11. preserve historical evidence.

The architecture control plane is:

- **Blueprint** = what the architecture is.
- **Roadmap** = how architecture is engineered and verified.
- **Context Prompt** = how the AI engineering agent operates.
- **Research Protocol** = how cross-branch, source-package and external evidence is discovered and qualified.
- **Source of Truth** = consolidated provenance and routing; it does not silently supersede domain-specific authority.

No competing architecture blueprint should be created without explicit supersession.
