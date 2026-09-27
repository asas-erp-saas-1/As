# ASAS — ENGINEERING SOURCE OF TRUTH 2026

**Artifact ID:** ASAS-ARCH-SOT-2026-001  
**Status:** CANONICAL CONSOLIDATION / PROPOSED — EVIDENCE-BACKED  
**Version:** 1.6.0  
**Effective date:** 2026-09-27  
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
| Architecture target | `docs/architecture/ASAS-ARCHITECTURE-V3-ENGINEERING-MASTER-2026.md` | INSTALLED v3.1 engineering master; substantive V3 source remains authoritative for architecture content |
| Legacy architecture blueprint | `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` | PROPOSED v1.5.1 / provenance-supporting; not a competing V3 authority |
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

V3 engineering baseline currently defines the target contexts:
`Core / CRM / Sales / Inventory / Finance / Studio / Marketing / Analytics / Documents`

The historical 15-module proposal is implementation evidence, not a competing bounded-context architecture.

`C2-001 = OPEN ARCHITECTURAL REFINEMENT`

Scheduling remains unresolved:
`C2-002 = FOUNDER-DECISION-REQUIRED`.

The historical `foundation/reconcile-context-map-v2` branch was re-inspected. Its 15-module candidate map and ADR-0001 remain explicitly proposed and awaiting founder acceptance. The final bounded-context authority is therefore now governed by the installed V3 engineering master while any remaining historical context-map conflict stays recorded until the relevant C-track reconciliation closes it.

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

## 10 — V3 engineering-control installation

The V3 engineering control companion is:

`docs/architecture/ASAS-ARCHITECTURE-V3-ENGINEERING-MASTER-2026.md`

It defines the engineering integration of the substantive V3 architecture with the single Engineering Conference route:

`GATE-00 → GATE-01 → GATE-02 → GATE-03 → GATE-04 → GATE-05 → GATE-06 → GATE-07`

C01–C22 remain research/decision inputs to this single route, not parallel authorization paths.

Implementation readiness, when a separate vocabulary is needed, uses `IG-00 → IG-07` and must not redefine the Engineering Conference gates.

The V3 engineering master does not authorize global implementation. GATE-07 is slice-specific and remains unavailable until its predecessor evidence is closed.

## 11 — Current foundation status

GATE-00 remains OPEN. Critical control-plane evidence includes repository identity, sole engineering line, Supabase identity, Vercel identity/mapping, environment semantics, context loading, and repository governance. The current GitHub branch is recorded as unprotected with required checks off; this remains a governance blocker until independently resolved or explicitly accepted with compensating controls.

GATE-01 and later gates remain pending/not authorized according to the current session checkpoint.

## 12 — Source-of-truth rules

The V3 engineering master is an A6 engineering-control artifact. It may consolidate and route V3 work, but it cannot silently override an A1 founder/product decision, a canonical domain contract, or verified runtime reality.

One concept → one canonical owner.

A source disagreement must be recorded as a conflict and reconciled; it must not be hidden by editing the register.

## 13 — Verification discipline

A claim is `VERIFIED` only when objective evidence exists.

The following are explicitly distinct:

- documentation vs runtime evidence;
- test definition vs test result;
- migration file vs live database state;
- integration existence vs successful production mapping;
- repository CI check vs live agent execution evidence.

This separation is mandatory for all future Continue/resume cycles.
