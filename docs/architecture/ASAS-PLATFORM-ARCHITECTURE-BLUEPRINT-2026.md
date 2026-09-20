# ASAS — PLATFORM ARCHITECTURE BLUEPRINT 2026

**Artifact ID:** ASAS-ARCH-PLATFORM-2026-001  
**Status:** PROPOSED — ENGINEERING BASELINE  
**Version:** 1.0.0  
**Effective date:** 2026-09-20  
**Owner:** Lead Architecture / Founder authority boundary  
**Canonical role:** Single architectural truth for the 2026 engineering program, subject to explicit ADR supersession  
**Branch:** `platform-architecture-2026`  
**Parent checkpoint:** `docs/handoff/CURRENT-SESSION-STATE.md` v1.3  

> This document is a reconstructed architectural blueprint. It is not a claim that the application, database, runtime, or infrastructure already exists. Existing repository/runtime facts remain evidence sources; this blueprint defines the desired engineering state.

---

## 0. NON-NEGOTIABLE ARCHITECTURAL PRINCIPLES

1. **Reality before intent.** Existing runtime/database state is never overwritten by documentation.
2. **Architecture before implementation.** Domain boundaries, contracts, invariants, state machines, data ownership, security model, and verification strategy precede application code and database programming.
3. **Contract before code.** An implementation task is authorized only when its contract, scope, ownership, dependencies, invariants, authorization, and evidence requirements are defined.
4. **Modular monolith first.** No microservices, Kafka, Kubernetes, service mesh, multi-region, data lake, or distributed architecture becomes mandatory without measured extraction/scaling evidence and an ADR.
5. **One concept, one canonical owner.** Derived artifacts may mirror authoritative sources but cannot silently redefine them.
6. **Server authority.** Client UI, AI, browser state, and external integrations never become authoritative for permissions, money, inventory, reservations, contracts, or tenancy.
7. **Database safety.** Schema evolution is forward-only, migration-controlled, locally reproducible, reversible where technically possible, and never destructive by default.
8. **Evidence over claims.** `VERIFIED` means executed and evidenced; otherwise use `PARTIAL`, `BLOCKED`, `NOT_EXECUTED`, or `OPEN`.
9. **Human authority boundaries.** Founder decisions, legal interpretation, destructive production operations, financial corrections, credential changes with outage risk, tenant deletion, and autonomous high-impact AI actions require human authorization.
10. **Local-first engineering.** Architecture, code, schema, migrations, tests, fixtures, and CI must be reproducible locally before cloud deployment. Remote systems are integration/runtime targets, not the primary authoring environment.

---

# 1. AUTHORITY AND PROVENANCE

## 1.1 Current authority model

### Existing/brownfield reality

`LIVE RUNTIME / LIVE DATABASE`  
`>` `REPOSITORY IMPLEMENTATION`  
`>` `APPROVED CONTRACT / REGISTER`  
`>` `APPROVED ARCHITECTURE`  
`>` `HISTORICAL ARTIFACT`  
`>` `INFERENCE`

### Desired future behavior

`FOUNDER / PRODUCT DECISION`  
`>` `APPROVED ARCHITECTURE`  
`>` `APPROVED ADR`  
`>` `CANONICAL CONTRACT / REGISTER`  
`>` `IMPLEMENTATION`

If authorities conflict, the state is **CONFLICT** until provenance resolves it. No silent reconciliation.

## 1.2 Source classes

- **AUTHORITATIVE SOURCE:** approved product decision, approved architecture, approved ADR, verified runtime/database evidence.
- **CANONICAL DERIVED:** machine-readable register generated from an authoritative source.
- **OPERATIONAL:** task/checkpoint/runbook material.
- **HISTORICAL:** preserved evidence from superseded states.
- **INFERENCE:** engineering interpretation; never sufficient to close a gate.

## 1.3 Current source baseline

The supplied v1.6.1 Blueprint/package remains the principal historical/source specification for the current foundation. Repository registers are derived shadows. The current repository checkpoint confirms the source contains:

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

These are **source observations**, not proof of runtime implementation.

---

# 2. PLATFORM DEFINITION

ASAS is architected as a **premium real-estate sales and marketing platform with an enterprise-grade operating core**.

The platform must support the commercial reality of property development and sales without prematurely becoming a generic ERP, construction suite, accounting package, marketplace, or global data platform.

## 2.1 Core business loop

`Project → Building → Unit → Lead → Assignment → Activity → Visit → Offer → Reservation → Contract → Payment Plan → Payment → Receipt → Audit → Reporting`

## 2.2 Product layers

### MVP / first controlled implementation

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

### Architectural reservations — not implementation requirements

- global multi-country packs;
- multi-region active-active infrastructure;
- marketplace;
- autonomous finance;
- autonomous AI actions;
- construction ERP;
- property-management suite;
- developer platform;
- ontology/data lake at global scale;
- microservice decomposition.

---

# 3. ARCHITECTURAL SHAPE

## 3.1 Five planes

```text
EXPERIENCE PLANE
  Public Web / Operations / Mobile / Customer & Partner surfaces / AI Workspace / API

APPLICATION & DECISION PLANE
  Commands / Queries / Policies / Approvals / Workflows / Jobs / Calculations / Simulations

DOMAIN PLANE
  Core / CRM / Sales / Inventory / Finance / Studio / Marketing / Analytics / Documents

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

---

# 4. DOMAIN MODEL

## 4.1 Nine bounded contexts

The current canonical DDD decomposition remains:

1. **Core** — platform identity-adjacent domain primitives and cross-domain business foundations.
2. **CRM** — people, organizations, leads, ownership, activities and relationship history.
3. **Sales** — commercial progression from qualified opportunity through offer/reservation/contract boundary.
4. **Inventory** — project/building/unit availability and concurrency-sensitive inventory state.
5. **Finance** — controlled money, payment plans, postings, allocations, receipts and financial invariants.
6. **Website Studio** — public property presentation, content composition and publishing.
7. **Marketing** — campaigns, attribution, acquisition and marketing operations.
8. **Analytics** — reporting, metrics, projections and analytical read models.
9. **Documents** — controlled document metadata, versions, access and lifecycle.

These are semantic ownership boundaries, not necessarily nine database schemas or nine deployables.

## 4.2 Platform capabilities are not automatically bounded contexts

The following remain platform capabilities unless a future ADR establishes independent domain ownership and transaction boundaries:

- Identity
- Tenancy
- Authorization
- Audit
- Events
- Workflow
- Scheduling
- Search
- Media
- Notifications
- Integrations
- Configuration
- AI
- SaaS control
- Developer platform

## 4.3 Context/module distinction

`Bounded Context ≠ Implementation Module ≠ Aggregate ≠ Database Schema ≠ Read Model ≠ Worker ≠ Event Consumer`

No count-matching exercise is permitted.

---

# 5. AGGREGATE AND TRANSACTION RULES

Every aggregate must have:

- explicit identity;
- ownership context;
- invariants;
- commands that can mutate it;
- legal state transitions;
- authorization requirements;
- audit requirements;
- event semantics;
- concurrency policy;
- persistence boundary.

Cross-context writes are prohibited as an implicit convenience pattern. They must be mediated by explicit application/domain contracts and, where asynchronous, events/outbox.

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

The exact persistence mechanism is an implementation decision to be proven against the chosen PostgreSQL design; this blueprint does not invent a specific SQL locking primitive before the schema contract is promoted.

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

The existence of 103 registered events does not imply that 103 events are implemented.

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

The development architecture shall support:

`schema contract → local PostgreSQL/Supabase stack → migrations → tests → CI → controlled remote deployment`

Supabase officially supports local development, versioned migrations, local resets, schema pull/diff, and reproducible local environments. cite-reference-placeholder

No remote database is required for authoring the initial architecture or building the first migration set.

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

## 14.1 Action classes

### Read-only
Allowed within caller scope.

### Draft/reversible
May prepare changes but requires controlled execution.

### Approval-required
Human approval required before commit.

### Prohibited autonomous
- destructive production changes;
- financial corrections;
- tenant deletion;
- security bypass;
- credential rotation with outage risk;
- legal interpretation or contract-signature decisions;
- unauthorized mass communication.

AI tools inherit caller authority and must not widen it.

---

# 15. OBSERVABILITY AND RELIABILITY

Define measurable SLI/SLO targets before production authorization.

At minimum measure:

- request latency;
- error rate;
- availability;
- queue lag;
- event lag;
- database saturation;
- reservation latency;
- financial posting latency;
- background-job failure rate;
- external integration failure rate.

Recovery readiness requires tested restoration, data integrity verification, RPO and RTO evidence. A backup declaration alone is not recovery proof.

---

# 16. DOCUMENT / MEDIA GOVERNANCE

Documents/media require:

- tenant ownership;
- metadata;
- versioning;
- authorization;
- signed access where appropriate;
- malware/file validation;
- retention;
- deletion policy;
- audit;
- legal hold capability where legally required;
- storage lifecycle management.

---

# 17. UX / DESIGN SYSTEM ARCHITECTURE

Design engineering is contract-first.

Required layers:

```text
Design Tokens
 → Primitives
 → Components
 → Patterns
 → Page/Workspace Templates
 → Product Surfaces
```

The system must support:

- Arabic-first RTL;
- French and English;
- mobile field workflows;
- responsive layouts;
- accessibility;
- keyboard navigation;
- reduced motion where appropriate;
- consistent validation/error states;
- loading/empty/offline states.

Design contracts must remain separate from business/domain contracts.

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

Cloud services are introduced only when required by the specific verification stage.

This is not anti-cloud; it is anti-dependency on an unverified remote environment during architecture construction.

---

# 19. QUALITY MODEL

Every implementation-critical requirement must be traceable:

`Requirement → ADR → Context → Module → Aggregate → Invariant → Command → Permission → Event → Schema → Task → Implementation → Test → Evidence`

Unresolved nodes remain explicitly marked `OPEN`, `CONFLICT`, or `BLOCKED`.

---

# 20. ARCHITECTURE GATES

| Gate | Meaning | Required evidence |
|---|---|---|
| ARCH-00 | Identity | Repo/branch/commit/environment identity |
| ARCH-01 | Authority | Canonical artifact map + provenance |
| ARCH-02 | Contexts | Context/module ownership decision |
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

# 21. IMPLEMENTATION AUTHORIZATION RULE

No application implementation begins merely because the architecture document exists.

The first authorized implementation slice must have:

- resolved context ownership;
- approved scope;
- complete task packet;
- contract;
- schema impact;
- permissions;
- invariants;
- state transitions;
- tests;
- evidence plan;
- definition of done;
- rollback/recovery consideration.

---

# 22. CURRENT OPEN DECISIONS

1. C2-001 — bounded-context/module decomposition reconciliation.
2. Scheduling ownership — CRM vs platform/Core-hosted placement.
3. Canonical ASAS live database/project identity.
4. Complete task-packet derivation.
5. Promotion of executable schema contract.
6. Security/tenancy closure against final domain decomposition.

These remain open unless an approved ADR closes them.

---

# 23. RESEARCH BASELINE

External engineering principles used to validate this blueprint were checked against current official/authoritative sources including:

- Next.js documentation: App Router/full-stack application model.
- Supabase Local Development, migration, declarative schema and RLS documentation.
- PostgreSQL documentation for transactional/database primitives.
- OWASP security guidance/ASVS for application security controls.
- W3C WCAG for accessibility.
- Cloud architecture reliability guidance for tested recovery, RPO/RTO and resilience.

The external sources validate engineering patterns; they do not override ASAS product decisions or repository authority.

---

# 24. CHANGE PROTOCOL

Any architectural change must:

1. identify the affected decision;
2. cite the source/evidence;
3. state whether it changes desired architecture or records runtime reality;
4. update this blueprint if canonical architecture changes;
5. update the roadmap if sequencing changes;
6. update the context prompt if agent behavior changes;
7. create/update an ADR when the decision is material;
8. update the current checkpoint;
9. verify references and CI;
10. preserve historical evidence.

This three-document set is the controlled architecture navigation layer:

- **Blueprint** = what the architecture is.
- **Roadmap** = how architecture is engineered and verified in sequence.
- **Context Prompt** = how an AI engineering agent must operate without losing context.

No fourth competing architecture blueprint should be created without an explicit supersession decision.
