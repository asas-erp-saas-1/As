# ASAS — Claude Project Context Pack

**Status:** FOUNDATION CONTEXT PACK — NON-AUTHORITATIVE CONVENIENCE LAYER  
**Canonical repository:** `asas-erp-saas-1/As`  
**Current foundation branch:** `foundation/repository-file-organization-v1`  
**Current integration branch:** `main`  
**Current work:** repository organization, naming, provenance, handoff and pre-implementation hardening

> This file gives Claude the full project context needed to start safely.
>
> It is **not** a replacement for canonical source artifacts.
> When this file conflicts with a canonical contract, current session state, approved domain decision, or verified repository reality, the higher-authority source wins.
>
> Never invent a missing artifact from this file.

---

## 1. Mission

ASAS is being built as a professional **Real Estate Operating System (Real Estate OS)**.

The long-term product combines:

- public real-estate digital experience;
- website publishing / Studio;
- real-estate project and inventory management;
- CRM;
- sales lifecycle;
- reservations and contracts;
- payment schedules and collections;
- finance/accounting controls;
- commissions and payouts;
- marketing and attribution;
- communications;
- documents and auditability;
- workflows and approvals;
- analytics and executive intelligence;
- future AI-assisted operational intelligence.

The target is a coherent operating system, not a collection of disconnected modules.

The central principle is:

**One system of truth.**

Property, project, building, unit, pricing, lead, campaign, reservation, contract and financial state must not become manually duplicated truths across website, Studio, CRM, ERP or integrations.

---

## 2. Canonical repository identity

The only canonical ASAS implementation repository is:

`asas-erp-saas-1/As`

Similarly named repositories or deployments are not implementation authority unless their linkage is explicitly proven in current governance records.

In particular:

`asas-erp-saas-1/Asas-website`

is a different project and must not be treated as the ASAS implementation source.

The current integration branch is:

`main`

Foundation work may use short-lived:

`foundation/*`

Application work later uses bounded:

`feat/*`, `fix/*`, `refactor/*`, `chore/*`, `hotfix/*`

Do not create long-lived branches without a documented reason.

---

## 3. Current engineering phase

The repository is currently:

**FOUNDATION HARDENING — BLUEPRINT DERIVATION / PRE-IMPLEMENTATION**

The project is deliberately **not** yet in unrestricted application implementation.

Foundation work has established:

- repository identity and boundary;
- Claude handoff/context loading;
- branch and PR governance;
- foundation verification contract;
- task graph and task packet model;
- contract reconciliation protocol;
- lifecycle/capability coverage;
- master execution path;
- foundation gate register and closure rules;
- canonical artifact register;
- Blueprint-derived event register;
- Blueprint-derived permission register;
- Blueprint-derived state-machine register;
- Blueprint-derived design-token shadow;
- component inventory;
- Blueprint source-observation manifest;
- Phase P task shard;
- declared-vs-observed reconciliation checkpoint;
- repository file organization and naming work.

Application code, production database changes, migrations and deployment are not authorized merely because these foundation documents exist.

---

## 4. Authority hierarchy

The source-of-truth hierarchy is:

1. verified live database reality for pre-existing production tables when the task is explicitly runtime/database related;
2. the authoritative Blueprint Chapter 39 schema contract;
3. Blueprint appendices and machine-readable registers;
4. Blueprint chapter prose;
5. existing repository patterns;
6. general best practice.

For product and architecture decisions, use the approved product/domain/architecture contracts and explicit decisions in the repository according to their stated authority.

The key rule is:

**Blueprint → validated registers/shadows → implementation**

Never:

**implementation → register**

Never edit a canonical register merely to make it agree with code.

---

## 5. Source package

The working source package is:

`ASAS-AI-PACKAGE-v1.6.1`

It contains the Enterprise Architecture Blueprint and its handoff material.

Important source areas include:

- Blueprint;
- handoff `AGENTS.md`;
- machine-readable task/event/permission/state artifacts;
- schema contract;
- design tokens/component inventory;
- ADR material;
- skills/runbooks;
- diagrams/checksums/session bootstrap material.

The package is **input/source material**, not something to copy wholesale into the repository.

Only validated operational artifacts are promoted into `As`, with provenance.

---

## 6. Source observations currently verified

### Tasks

The source observation manifest records:

- declared tasks: **114**
- observed task entries: **119**
- recurring rituals: **3**

Phase observations:

- P: 9
- 0: 11
- 1: 9
- 1.5: 2
- 2: 14
- 3: 12
- 4: 9
- 5: 8
- 6: 12
- 7: 10
- 8: 5
- 9: 7
- 10: 5
- 11: 6

The discrepancy is deliberately preserved as OPEN.

Do not silently replace 114 with 119 or vice versa.

### Schema source observation

Current source traversal observes:

- models: **59**
- enums: **17**
- `@@index` declarations: **56**

Earlier repository declarations said:

- 59 models
- 16 enums
- 15 indexes

These differences are OPEN reconciliation items.

Do not normalize them silently.

---

## 7. Repository machine-readable state

Currently present:

- `registers/events.json`
- `registers/permissions.csv`
- `registers/state-machines.json`
- `registers/tasks.index.json`
- `registers/tasks/phase-P.json`
- `registers/BLUEPRINT-SOURCE-OBSERVATIONS.json`
- `schema/asas-contracts.index.json`
- `design/design-tokens.json`
- `design/component-inventory.md`

Currently not present as canonical executable artifacts:

- `registers/tasks.json`
- `schema/asas-contracts.prisma`

The task body remains controlled/sharded until complete reconciliation.

The structured schema body must not be fabricated from memory.

---

## 8. Product identity

ASAS is intentionally broader than a narrow CRM or narrow ERP.

The target is:

**Real Estate Operating System**

with the complete operating loop:

**Public discovery → project/unit evaluation → conversion → lead capture → qualification → visit → offer → reservation → contract → payment schedule → collection → accounting/financial intelligence → post-sale operations**

The public website and internal system should share the same canonical data.

---

## 9. Public website / Studio

The public product must support professional real-estate presentation and conversion:

- project pages;
- apartment/unit landing pages;
- rich property details;
- media, renders and floor plans;
- strong conversion CTAs;
- contextual WhatsApp/contact actions;
- lead forms;
- social-channel connectivity;
- SEO;
- structured public content;
- analytics and conversion tracking;
- an internal no-code/low-code publishing Studio for normal editorial operations;
- extensible integrations when justified.

A single apartment/unit record should ultimately drive its public page, inventory representation, cards, search, filters, SEO, admin and structured data rather than being manually duplicated.

---

## 10. Internal operating system

Long-term internal capabilities include:

### CRM
Leads, contacts, opportunities, activities, visits, qualification and follow-up.

### Sales
Offers, options, reservations, contracts and commercial lifecycle.

### Inventory
Developers/promoters, projects, buildings, units/apartments, pricing, availability and inventory allocation.

### Finance
Receivables, installment schedules, payment recording, allocations, accounting controls, commissions and financial auditability.

### Marketing
Campaigns, attribution, UTM/source context, conversion tracking and channel connectivity.

### Documents
Contracts, attachments, evidence, auditability and legal/business records.

### Scheduling
Visits, meetings and calendar-related operational scheduling.

### Workflow
Approvals, workflow orchestration and controlled state transitions.

### Analytics
Operational, commercial, financial and executive reporting.

### Administration
Users, roles, permissions, scope and governance.

### Integrations
Maps, calendar, communications, social channels and justified external identity/payment/document providers.

### AI
Future operational intelligence and decision assistance, always inside authorization, tenancy and audit boundaries.

---

## 11. Developer / promoter operating model

ASAS supports both:

- own-project / developer track;
- third-party brokerage / resale track.

A developer/promoter is a business entity whose portfolio can contain:

**developer → project → building → unit**

Commercial/legal representation must ultimately follow the validated domain contract, not assumptions written directly into UI code.

---

## 12. Data ownership / tenancy

Operational data belongs to the agency/tenant that owns it.

Agency/workspace/branch/company/project scopes must be designed through the validated domain and authorization model.

Tenant isolation must be enforced at the **data layer**, not only in UI or API code.

Future ASAS Group / multi-company growth is part of the long-term architectural direction, but it does not authorize speculative implementation now.

Do not implement cross-tenant capabilities by assumption.

---

## 13. Engineering invariants

These are non-negotiable engineering principles unless an explicit higher-authority decision supersedes them.

### Mutations
Every mutation is authorization-gated and deny-by-default.

### State
Lifecycle state changes use canonical state-machine transitions.

Never add arbitrary status setters when a state machine governs the lifecycle.

### Money
Money is represented as integer DZD centimes.

Posted financial records are immutable.

Corrections use compensating/reversal mechanics rather than silent mutation.

### Tenancy
Tenant isolation is a data-layer concern.

### Audit
Material state changes must be auditable.

### Integrations
External effects must be idempotent/replay-safe where applicable.

### Repository safety
Never:

- force-push;
- rewrite shared history;
- reset shared branches;
- destructively mutate production data;
- create migrations merely to make a gate appear green.

---

## 14. Standard mutation pipeline

For a state-changing business operation, reason through:

**Command → Identity → Tenant → Authorization → Idempotency → Validation → Invariants → Transaction → State transition → Audit + Outbox → Response**

Not every task requires every stage mechanically, but a stage must not be omitted when the domain requires it.

---

## 15. Architecture direction

The intended implementation style is:

**Modular monolith first.**

Do not introduce microservices merely because the conceptual model is large.

Use clear bounded modules and contracts inside a coherent deployable system until evidence justifies a boundary change.

Avoid speculative:

- microservice proliferation;
- Kafka/event-bus complexity without a demonstrated need;
- Kubernetes;
- premature distributed-system infrastructure.

The scalability direction is designed for eventual growth, but complexity must be justified by evidence.

---

## 16. Critical architecture distinction

Never assume:

**Bounded Context = Implementation Module = Database Schema**

They are different concepts.

Also:

**Worker != Bounded Context**

**Read Model != Business-rule owner**

**Event consumer != Event owner**

**Database schema != domain ownership by itself**

The current architecture reconciliation has specifically identified this distinction as critical.

---

## 17. Known architecture reconciliation issue

The source set contains architectural layers that must not be silently flattened.

Known layers include:

- broader/older Blueprint decomposition;
- an available Enterprise Domain Model marked Draft;
- a Roadmap claim that Phase 1.5 approved v2 contains 15 bounded contexts + Context Map v2;
- an implementation specification containing 15 implementation modules/schemas;
- projections/read models/workers that are not automatically bounded contexts.

The exact approved v2 Domain Model and Context Map must be treated according to provenance/authority.

Do not invent missing bounded contexts simply to make the count equal 15.

Current blocker:

**C2-001 — bounded-context/module decomposition conflict**

Required before implementation:

- verified approved Domain Model v2;
- verified Context Map v2;
- canonical Context → Module map;
- aggregate ownership;
- event ownership;
- permission impact;
- state-machine impact;
- task traceability;
- schema impact;
- explicit treatment of split/merge/rename/addition history.

---

## 18. Product-scope discipline

The enterprise target is broad, but MVP and implementation order must remain controlled.

Do not let the existence of an Enterprise Blueprint force implementation of every capability at once.

Where the source specifies MVP boundaries, respect them.

The engineering goal is:

**broad long-term product vision + narrow verified implementation slices**

not:

**build everything because it exists in the blueprint.**

---

## 19. Claude autonomy model

### A0 — Read/analyze
Research, inspect, map, detect contradictions, propose plans.

No mutation.

### A1 — Safe foundation
Documentation, tests, deterministic tooling and non-production scaffolding inside an approved task.

### A2 — Scoped implementation
Application implementation inside closed contracts.

No unilateral semantic changes.

### A3 — Sensitive operations
Migrations, production configuration, deployment, secrets, destructive actions and irreversible external effects.

Explicit authorization + evidence required.

Default = STOP.

---

## 20. Claude context loading order

Claude must begin with:

1. `AGENTS.md`
2. `docs/handoff/CLAUDE-START-HERE.md`
3. `docs/handoff/CLAUDE-IMPLEMENTATION-BOUNDARY.md`
4. `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`
5. `docs/handoff/CURRENT-SESSION-STATE.md`
6. `docs/governance/CANONICAL-ARTIFACT-REGISTER.md`
7. current task packet
8. task graph / predecessor evidence
9. relevant gate definitions
10. relevant ADR/reconciliation records
11. relevant domain contract
12. relevant command/event/state/permission/data registers
13. UX/Figma/integration contracts as needed
14. actual repository implementation
15. tests/fixtures
16. schema/migration artifacts only when authorized
17. runtime/provider configuration only when required.

Claude should load only the context necessary for the current task plus explicitly named dependencies.

---

## 21. Current-session checkpoint

The sole current execution checkpoint is:

`docs/handoff/CURRENT-SESSION-STATE.md`

`docs/handoff/SESSION_STATE.md`

is compatibility-only.

Historical session material is not current state.

Do not resume from conversation memory when repository state is available.

---

## 22. Current gate state

Current foundation checkpoint:

- G0 GREEN
- G1 AMBER
- G2 GREEN
- G3 AMBER
- G4 AMBER
- G5 AMBER
- G6 BLOCKED
- G7 BLOCKED
- G8 AMBER
- G9 AMBER
- G10 NOT STARTED
- G11 NOT STARTED
- G12 BLOCKED
- G13 AMBER

Do not convert AMBER/BLOCKED into GREEN because documentation exists.

---

## 23. Current unresolved dependencies

### C2-001
Bounded-context/module decomposition.

### C2-002
Live database/runtime reality is not accepted until live evidence is captured.

### Task register
114 declared vs 119 observed remains OPEN.

### Schema contract
59/16/15 older declaration vs 59/17/56 current source observation remains OPEN.

### Full task catalog
Phases 0–11 and recurring rituals remain under controlled canonical promotion/reconciliation.

### Structured schema contract
The executable Prisma contract body is not currently present as a canonical artifact.

### Security/tenancy
The doctrine exists, but implementation evidence is not yet sufficient for global implementation authorization.

---

## 24. Current branch / PR context

Current foundation work is on:

`foundation/repository-file-organization-v1`

under:

**PR #13**

PR #13 is:

**OPEN / DRAFT / NOT MERGED**

Do not say it is merged until GitHub confirms the merge.

This branch contains the current organization/naming work, including:

- repository current inventory;
- naming/organization standard;
- canonical artifact register reconciliation;
- Claude loading fixes;
- explicit compatibility/historical session-state separation;
- schema index discrepancy preservation;
- gate-matrix ownership correction;
- README alignment;
- foundation verification improvements.

---

## 25. Repository organization model

Canonical locations:

| Concern | Location |
|---|---|
| Root agent operating contract | `AGENTS.md` |
| Claude handoff/current state | `docs/handoff/` |
| Repository governance | `docs/governance/` |
| Architecture | `docs/architecture/` |
| Product/business truth | `docs/product/` |
| Domains/bounded contexts | `docs/domains/` |
| Cross-cutting contracts | `docs/contracts/` |
| Decisions/ADRs | `docs/decisions/` |
| Research | `docs/research/` |
| Audit/evidence | `docs/audit/` |
| Machine-readable derived registries | `registers/` |
| Database contract | `schema/` |
| Design system | `design/` |
| Application implementation | `src/` |
| Database implementation/migrations | `prisma/` |
| Tests | `tests/` |
| Deterministic tools | `scripts/` |

One concept should have one canonical owner.

Do not solve duplication by writing a third summary.

---

## 26. Naming policy

Canonical governance and handoff Markdown:

**UPPERCASE-KEBAB-CASE**

Machine artifacts use stable consumer-required extensions:

- JSON
- CSV
- Prisma
- YAML

Do not create canonical filenames such as:

- FINAL
- FINAL2
- NEW
- OLD
- TEMP
- COPY
- MISC
- vague NOTES/TODO files where a real owner can be named

Dates belong in evidence snapshots, not canonical contract filenames, unless the date itself is the identity of the snapshot.

---

## 27. Safe file-consolidation workflow

Before renaming or deleting a repository file:

1. inventory it;
2. identify its authority;
3. search all references;
4. classify references as active/historical/stale;
5. identify the canonical owner;
6. compare content;
7. update active references;
8. run CI/reference verification;
9. update the canonical artifact register;
10. update current session state;
11. only then delete/rename if safe.

Never perform mass rename/delete simply because files look repetitive.

---

## 28. Current governance clusters that require content reconciliation

Potential overlap exists between:

### Foundation closure
- FOUNDATION-CLOSURE-PROTOCOL
- FOUNDATION-CLOSURE-CHECKLIST
- FOUNDATION-GATE-REGISTER
- FOUNDATION-GATE-MATRIX
- FOUNDATION-READINESS-REPORT
- FOUNDATION-ENVIRONMENT-STATUS
- FOUNDATION-HANDOFF-READINESS
- FOUNDATION-SESSION-CLOSURE
- FOUNDATION-PR-CHECKLIST
- FOUNDATION-PR-BOUNDARY

They are not automatically duplicates.

### Claude operation
- CLAUDE-CONTEXT-LOADING-PROTOCOL
- CLAUDE-ENGINEERING-OPERATING-MODE
- CLAUDE-READY-REPOSITORY-CLOSURE
- CLAUDE-READY-IMPLEMENTATION-GATE
- CLAUDE-TASK-PACKET-SPEC
- CLAUDE-TASK-PACKET-TEMPLATE
- CLAUDE-WORKSPACE-PROTOCOL
- BLUEPRINT-TO-CLAUDE-EXECUTION-CONTRACT

Keep them separate only when their jobs are genuinely different.

### Repository identity
- CANONICAL-REPO-OPERATING-MODE
- REPOSITORY-HANDOFF-MAP
- REPOSITORY-STRUCTURE-CONTRACT
- CANONICAL-ARTIFACT-REGISTER

Recommended ownership:

- Structure Contract = directory semantics;
- Handoff Map = navigation;
- Operating Mode = work/branch/PR behavior;
- Artifact Register = authority/status inventory.

---

## 29. Engineering working loop

Use:

**Locate task → load context → inspect reality → plan → contract-first design → smallest coherent change → test/verify → adversarial review → evidence → PR → merge → checkpoint update**

A task is not DONE merely because code exists.

A task reaches CLOSED only when:

- declared scope implemented;
- applicable tests pass;
- negative/adversarial tests pass where relevant;
- authorization/tenant isolation verified;
- migration/data safety verified where relevant;
- idempotency/concurrency assessed where relevant;
- UX/accessibility/localization checked where relevant;
- evidence recorded;
- residual risk recorded;
- task state updated;
- session checkpoint updated;
- PR is reviewable.

---

## 30. Stop conditions

STOP and record BLOCKED when:

- product meaning is ambiguous;
- authoritative sources conflict;
- required dependency is unresolved;
- tenant isolation cannot be proven;
- authorization semantics are undefined;
- canonical state edge is missing;
- financial mutation can duplicate/unbalance;
- reservation/inventory concurrency is unsafe;
- destructive migration lacks approved strategy;
- external side effect lacks authenticity/replay/idempotency/reconciliation;
- a referenced canonical artifact is missing;
- repository reality contradicts declared architecture.

Never resolve these by intuition.

---

## 31. User's engineering expectations

The project expects expert/professional engineering behavior:

- current official/authoritative documentation for non-trivial technical decisions;
- evidence before claims;
- challenge architecture when justified;
- no invented facts;
- explicit uncertainty;
- measurable verification;
- small reviewable changes;
- strong security/tenancy discipline;
- finance-safe mutation design;
- no premature infrastructure;
- no unnecessary microservices;
- no speculative code.

The preferred working style is direct, precise, implementation-oriented, and critical rather than motivational.

---

## 32. Business operating context

ASAS began from a real-estate commercialization/agency operating model and is intended to evolve into the software platform that systematizes that operation.

The operating experience includes:

- developer/promoter relationships;
- property/project commercialization;
- lead generation;
- ads and attribution;
- WhatsApp follow-up;
- appointments and visits;
- unit/inventory information;
- commercial pipeline;
- reservation/contract flow;
- installment/collection tracking;
- eventual finance and post-sale operations.

The real-world operating model is a source of product requirements, but software contracts must be reconciled and recorded before implementation.

---

## 33. Strategic product targets

Founder-stated long-term targets:

- 10 companies;
- 1,000 users;
- 100,000 leads;
- 10,000 reservations;
- 1B DZD GMV;
- 10M DZD ARR.

These are strategic targets, not current production-scale claims.

---

## 34. Design philosophy

Target experience combines patterns associated with:

- Palantir;
- Bloomberg;
- Oracle Fusion;
- Salesforce;
- Procore;
- Stripe;

while remaining an original ASAS product.

Desired experience:

- executive clarity;
- operational density without clutter;
- trust;
- dark luxury / premium visual language where appropriate;
- responsive professional UX;
- Arabic / French / English;
- RTL / LTR;
- strong information hierarchy;
- real-estate-specific workflows;
- phone and desktop usability.

Do not copy another product literally.

---

## 35. Scope of repository work right now

The present goal is to make the repository and development environment professionally ready for Claude.

Current priorities are:

1. repository organization;
2. file naming;
3. canonical ownership;
4. provenance;
5. handoff loading;
6. source-derived register reconciliation;
7. architecture reconciliation;
8. task graph;
9. schema contract reconciliation;
10. CI / verification;
11. only then bounded implementation.

Do not jump to application code simply because the context pack is available.

---

## 36. What Claude should do on a new session

Start with:

1. read this file for orientation;
2. read `AGENTS.md`;
3. read `CLAUDE-START-HERE.md`;
4. read `ASAS-MASTER-EXECUTION-PATH.md`;
5. read `CURRENT-SESSION-STATE.md`;
6. read `CANONICAL-ARTIFACT-REGISTER.md`;
7. inspect current Git ref and worktree;
8. read the current active gate/status;
9. read the highest-priority unresolved task/dependency;
10. continue from the first incomplete gate.

Do not restart work simply because a new Claude session began.

---

## 37. Final operating rule

The objective is not to make Claude "know everything" from one prompt.

The objective is to make Claude:

**oriented by this pack, governed by AGENTS, constrained by the master execution path, grounded in canonical contracts/registers, and verified against actual repository/runtime evidence.**

When uncertain:

**inspect → trace authority → record contradiction → STOP affected work → reconcile → continue**

Do not guess.

---

## 38. Immediate next work

The next work sequence at the current checkpoint is:

1. verify the updated Foundation CI and record the result;
2. finish repository reference/ownership audit;
3. reconcile and close C2-001 into a canonical Context-to-Module map;
4. complete source-derived task catalog promotion/reconciliation;
5. complete the non-executable schema contract;
6. reconcile task/schema/event/permission/state IDs and counts;
7. close security/tenancy doctrine against canonical domain boundaries;
8. complete foundation handoff verification;
9. authorize implementation only for the first bounded verified slice.

**Do not skip steps.**
