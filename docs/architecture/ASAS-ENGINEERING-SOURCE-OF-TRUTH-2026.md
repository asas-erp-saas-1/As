# ASAS — ENGINEERING SOURCE OF TRUTH 2026

**Artifact ID:** ASAS-ARCH-SOT-2026-001  
**Status:** CANONICAL CONSOLIDATION / PROPOSED — EVIDENCE-BACKED  
**Version:** 1.5.7  
**Effective date:** 2026-09-24  
**Owner:** Lead Architecture / Founder authority boundary  
**Branch:** `platform-architecture-2026`  
**Role:** Single consolidation and routing resource for architecture engineering

> This resource consolidates verified repository facts, source-package facts, founder product direction, historical proposals, current engineering decisions, external engineering evidence, unresolved conflicts and implementation constraints. It preserves provenance and cannot silently override an A1 source.

## 0 — Operating rule

`REALITY → PROVENANCE → AUTHORITY → RECONCILIATION → MODEL → CONTRACT → VERIFICATION → IMPLEMENTATION`

For material architecture questions, the operating method is research-first:

`PROBLEM → RESEARCH → ALTERNATIVES / FAILURE MODES → HYPOTHESES → ASAS SOURCE VALIDATION → PROVENANCE / AUTHORITY → REJECT / ADAPT / DERIVE → CONTRACT / ADR / REGISTER → VERIFY → CHECKPOINT`

## 1 — Source hierarchy

### Brownfield
`LIVE DATABASE / LIVE RUNTIME > REPOSITORY IMPLEMENTATION > APPROVED CONTRACT/REGISTER > APPROVED ARCHITECTURE > HISTORICAL ARTIFACT > INFERENCE`

### Desired future behavior
`FOUNDER / PRODUCT DECISION > APPROVED ARCHITECTURE > APPROVED ADR > CANONICAL CONTRACT/REGISTER > IMPLEMENTATION`

### External engineering facts
`OFFICIAL DOCUMENTATION / STANDARD > PRIMARY ENGINEERING SOURCE > AUTHORITATIVE RESEARCH > REPUTABLE SECONDARY SOURCE > COMMUNITY`

## 2 — Canonical control plane

| Role | Canonical resource | Current state |
|---|---|---|
| Product requirements | `docs/product/ASAS-PRODUCT-REQUIREMENTS-BASELINE-2026.md` | PROPOSED v0.2.0 / FOUNDER REVIEW REQUIRED |
| Architecture target | `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` | PROPOSED v1.5.1 |
| Engineering route | `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` | ACTIVE v2.0.1 + amendments |
| AI operating context | `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` | ACTIVE v2.0.2 + amendments |
| Execution path | `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md` | CANONICAL v2.0.1 + amendments |
| AI agent operating model | `docs/architecture/ASAS-AI-AGENT-ENGINEERING-OPERATING-MODEL-2026.md` | CANONICAL v1.0.0 |
| Design/code continuity | `docs/design/ASAS-DESIGN-TO-CODE-CONTINUITY-CONTRACT-2026.md` | CANONICAL v1.0.0 |
| Agent skills catalog | `docs/governance/ASAS-CODEX-SKILLS-CATALOG-2026.md` | CANONICAL v1.0.0 |
| Repository skills | `.agents/skills/` | 9 registered skills |
| Current checkpoint | `docs/handoff/CURRENT-SESSION-STATE.md` | sole active checkpoint |
| Artifact authority | `docs/governance/CANONICAL-ARTIFACT-REGISTER.md` | governance register |
| Founder decisions | `docs/governance/FOUNDER-DECISIONS.md` | decision boundary |
| Research protocol | `docs/architecture/ASAS-ARCHITECTURE-RESEARCH-SOURCE-DISCOVERY-PROTOCOL-2026.md` | canonical procedure |
| Research-first method | `docs/architecture/ASAS-ARCHITECTURE-RESEARCH-FIRST-DECISION-METHOD-2026.md` | CANONICAL OPERATING METHOD v1.0.0 |
| Q1 research record | `docs/architecture/research/ASAS-RESEARCH-RECORD-Q1-BUILDING-2026-09-24.md` | ACTIVE / DECISION SUPPORT |
| Building domain contract | `docs/architecture/contracts/ASAS-BUILDING-DOMAIN-CONTRACT-2026.md` | PROPOSED / OPEN / IMPLEMENTATION BLOCKED |
| Building reconciliation | `docs/architecture/reconciliation/ASAS-BUILDING-SCHEMA-RECONCILIATION-2026.md` | OPEN / IMPLEMENTATION BLOCKED |
| Real-estate persistence trace | `docs/architecture/reconciliation/ASAS-REAL-ESTATE-PERSISTENCE-TRACE-2026.md` | VERIFIED REPOSITORY OBSERVATION / BROWNFIELD INCOMPLETE |
| Schema contract promotion | `docs/architecture/reconciliation/ASAS-SCHEMA-CONTRACT-PROMOTION-PROTOCOL-2026.md` | CANONICAL PROCEDURE / ACTIVE v1.0.1 |
| Evidence placement | `docs/architecture/reconciliation/ASAS-EVIDENCE-PLACEMENT-REGISTER-2026-09-24.md` | ACTIVE / EVIDENCE REGISTER |

Historical Blueprint Amendment 001 remains provenance and is not an active competing blueprint.

## 3 — Product truth reconciliation

The founder-confirmed product direction recovered from `foundation/reconcile-context-map-v2/docs/product/PRODUCT_TRUTH.md` establishes ASAS as a broad Real Estate Operating System combining public website/sales surface, Studio/CMS, inventory, CRM, sales, finance/ERP, marketing, analytics, communications, governance, workflows and future AI intelligence.

It establishes the portfolio hierarchy:

`Promoter / portfolio → Project → Building → Unit`

and the one-system-of-truth principle across public website, Studio, CRM and ERP. It also supports own-project/developer and third-party brokerage/resale tracks and future multi-company/workspace/branch growth.

The consolidated PRD now records this evidence at:
`docs/product/ASAS-PRODUCT-REQUIREMENTS-BASELINE-2026.md`.

The PRD remains `PROPOSED — FOUNDER REVIEW REQUIRED`; therefore it cannot authorize implementation expansion.

## 4 — Agent execution model

```text
Founder / Product Authority
→ Lead Architecture / Control Plane
→ Canonical decision + authorized task
→ Skill selection
→ Codex implementation
→ Independent verification
→ Evidence / gate
```

Claude is the specialized design/visual collaboration agent, primarily for Figma/UX/design-system work. It is not the default repository/database implementation writer.

Skills are procedural and cannot override architecture authority.

## 5 — Repository identity

Canonical repository: `asas-erp-saas-1/As`  
Architecture branch: `platform-architecture-2026`  
The active checkpoint remains the operational source for the current HEAD.  
Historical branches are provenance. Branch deletion is not implied by reconciliation.

## 6 — Structural source observations

Current source-package observations recorded by the repository include:

- 119 unique phase task IDs;
- 3 recurring ritual IDs;
- 122 `T-*` identifiers including rituals;
- 59 schema models;
- 17 enums;
- 56 indexes;
- 22 unique constraints;
- 19 relation annotations;
- 103 domain events / 11 emission groups;
- 50 permission keys / 8 persona columns;
- 11 state machines;
- 42 design primitives.

These are observations, not quotas and not runtime proof. The repository separately retains a historical declaration of 59 models / 16 enums / 15 indexes; this discrepancy is explicitly unresolved until complete source extraction and reconciliation.

## 7 — Architecture authority

Current target contexts:
`Core / CRM / Sales / Inventory / Finance / Studio / Marketing / Analytics / Documents`

The historical 15-module proposal is implementation evidence, not a competing bounded-context architecture.

`C2-001 = OPEN ARCHITECTURAL REFINEMENT`

Scheduling remains unresolved:
`C2-002 = FOUNDER-DECISION-REQUIRED`.

The historical `foundation/reconcile-context-map-v2` branch was re-inspected. Its 15-module candidate map and ADR-0001 remain explicitly proposed and awaiting founder acceptance. The historical `foundation/source-authority-ledger-v1` independently records that the exact approved Phase 1.5 Domain Model v2 and Context Map v2 are still unlocated. Therefore the final bounded-context authority remains OPEN / CONFLICT.

## 8 — Current contract state

### Unit / Reservation
`PARTIALLY CLOSED / IMPLEMENTATION UNVERIFIED`

### Building
`Q1 ACTIVE / OPEN / IMPLEMENTATION BLOCKED`

Canonical working contract:
`docs/architecture/contracts/ASAS-BUILDING-DOMAIN-CONTRACT-2026.md`

Current supported conclusion:
`BUILDING = REAL-ESTATE STRUCTURAL DOMAIN CONCEPT`

Research-first Q1 conclusion currently supports the following provisional model:

`Real Estate / Inventory → Project → Building (structural Entity candidate) → Floor (structural level if required) → Unit aggregate`

This does not authorize a Building table, aggregate root, natural key, event stream or independent service.

The controlled persistence trace is:
`docs/architecture/reconciliation/ASAS-REAL-ESTATE-PERSISTENCE-TRACE-2026.md`

The Q1 research record is:
`docs/architecture/research/ASAS-RESEARCH-RECORD-Q1-BUILDING-2026-09-24.md`

Repository evidence currently includes Building-adjacent references such as `ProjectMilestone.building_id` and `LedgerEntry.building_id`, while the measured 59-model source contract has no standalone Building model. `Apartment` carries project/floor-related fields and construction state; `FloorPlan` carries project ownership. These remain source observations, not live-database proof.

### Offer
`PARTIAL / IMPLEMENTATION BLOCKED`

### Finance
`PARTIALLY CLOSED / EXECUTABLE FINANCE CONTRACT OPEN`

Current source semantics support:
`Contract → PaymentPlan / schedule items → Receipt → ReceiptAllocation → Finance/Ledger where authorized`.

### Scheduling
`FOUNDER-DECISION-REQUIRED`.

## 9 — Core invariants

Current source-supported/target invariants include:

1. Lead has one current owner.
2. Lead stage follows a legal state machine.
3. Tenant-owned records remain tenant-scoped.
4. Unit commercial availability and construction state remain separate dimensions.
5. One active Reservation winner per Unit under concurrency.
6. Contract requires an approved Reservation.
7. Governed Track A collection is milestone-gated according to source rules; legal applicability requires qualified legal verification.
8. Money uses explicit currency and integer minor units where applicable.
9. Posted financial facts are immutable and corrected through reversal/new facts.
10. Balanced double-entry posting applies where ledger functionality is authorized.
11. Durable domain events use transactional publication semantics; outbox is the default architecture.
12. Event consumers are idempotent.
13. AI cannot widen caller authority.

Runtime enforcement is unverified unless objective evidence exists.

## 10 — State machine doctrine

`Command → Authentication → Authorization → Tenant Scope → Aggregate Load → Preconditions → Legal Transition → Invariants → State Mutation → Audit → Domain Event → Transactional Outbox → Commit`

No arbitrary governed status setter.

## 11 — Event doctrine

The registered 103-event / 11-group count is source observation. The current `registers/events.json` identifies 11 emission modules and explicitly states that emission groups are routing lanes rather than bounded contexts. Each implemented event requires producer, aggregate, trigger, version, tenant, causation/correlation, consumers, idempotency, ordering, replay, DLQ, retention, reconciliation and evidence.

## 12 — Permission / tenancy

Target hierarchy:
`Platform → Organization → Workspace → Branch → Membership → Role → Permission → Scope → Resource`.

Deny-by-default, server-side authorization and tenant-aware data access are mandatory. RLS is defense-in-depth, not the only authorization layer.

The current permission register directly contains commercial permissions including `offer.create`, `offer.discount.request`, and `reservation.create`. Their presence proves registered authorization vocabulary only; it does not prove runtime enforcement.

## 13 — Database truth

Separate:
`Target Domain Model ≠ Schema Contract ≠ Prisma Contract ≠ Migration History ≠ Live Database`.

Required reconciliation:
`Introspect → Capture → Drift Inventory → Compare → ADR → Migration Plan → Backup Verification → Rehearsal → Forward-only Migration → Verification → Evidence`.

The active procedure for promotion of an executable target schema is:
`docs/architecture/reconciliation/ASAS-SCHEMA-CONTRACT-PROMOTION-PROTOCOL-2026.md`.

No destructive production shortcut.

## 14 — AI safety

`Intent → Proposal → Tool Request → Policy → Caller Authorization → Domain/Application Service → Transaction → Audit → Event`.

AI is not direct database authority and cannot bypass domain authorization.

## 15 — Design

Design precedes page implementation:
`tokens → primitives → components → patterns → templates → surfaces`.

Figma MCP/Code Connect are optional design-to-code mechanisms; accepted design contracts, not Figma itself, authorize implementation.

Arabic/RTL, French/English, accessibility, responsive behavior, mobile operations and failure states are engineering requirements.

## 16 — Task truth

Implementation packets must identify scope, owner, dependencies, contracts, commands, permissions, invariants, states, events, concurrency, security, UX, tests, DoD, evidence and authorization. Missing information remains open.

## 17 — Current gates

- G0 repository identity/checkpoint — GREEN
- G1 authority/control-plane — GREEN (repository-side CI verified; live Codex execution evidence pending)
- G2 domain/module authority — AMBER / Scheduling open
- G3 aggregate/invariant contracts — AMBER / Building Q1 active
- G4 executable invariants — AMBER / implementation absent
- G5 state machines — AMBER / runtime absent
- G6 events — BLOCKED
- G7 implementation authorization — BLOCKED
- G8 tenancy/RLS — BLOCKED
- G9 security evidence — AMBER
- G10 live DB/schema — BLOCKED
- G11 CI — GREEN at verified run `35879311233`; latest HEAD requires retest after contract/checkpoint updates
- G12 observability/recovery — BLOCKED
- G13 backup/restore evidence — BLOCKED
- G14 AI tooling evidence — AMBER / repository skills verified; live Codex discovery not executed
- G15 implementation authorization — BLOCKED

## 18 — Current roadmap

`H0 Reality → H1 Architecture → H2 Domain Contracts → H3 Events/Integrations → H4 Security/Tenancy → H5 Data → H6 Design → H7 Platform Foundation → H8 Vertical Slice → H9 Operations/Recovery → H10 Runtime Integration → H11 Production`.

## 19 — Evidence placement and research records

Evidence register:
`docs/architecture/reconciliation/ASAS-EVIDENCE-PLACEMENT-REGISTER-2026-09-24.md`

Q1 research record:
`docs/architecture/research/ASAS-RESEARCH-RECORD-Q1-BUILDING-2026-09-24.md`

Q1 forensic trace plan:
`docs/architecture/reconciliation/ASAS-Q1-BUILDING-PERSISTENCE-TRACE-PLAN-2026.md`

These artifacts record source provenance, independent engineering research, alternatives, current conclusions and explicit non-authorizations.

External research currently incorporated includes DDD bounded-context/aggregate guidance, PostgreSQL identity/constraint/locking guidance and OWASP ASVS security-verification guidance. These sources support engineering method and verification design; they do not prove ASAS runtime state.
