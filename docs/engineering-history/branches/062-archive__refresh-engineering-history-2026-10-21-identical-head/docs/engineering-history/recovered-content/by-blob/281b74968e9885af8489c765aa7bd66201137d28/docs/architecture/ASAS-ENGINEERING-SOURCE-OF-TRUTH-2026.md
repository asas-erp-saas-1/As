# ASAS — ENGINEERING SOURCE OF TRUTH 2026

**Artifact ID:** ASAS-ARCH-SOT-2026-001  
**Status:** CANONICAL CONSOLIDATION / PROPOSED — EVIDENCE-BACKED  
**Version:** 1.6.1  
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
| Product requirements | `docs/product/ASAS-PRODUCT-REQUIREMENTS-BASELINE-2026.md` | PROPOSED v0.3.0 / FOUNDER REVIEW REQUIRED |
| Architecture source | `docs/architecture/ASAS-ARCHITECTURE-V3.md` | V3 architecture reference; substantive architecture authority when installed and verified |
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

The control plane records nine canonical high-level bounded contexts by **FD-001 — accepted architecture decision, 2026-09-26**:

`Core / CRM / Sales / Inventory / Finance / Website Studio / Marketing / Analytics / Documents`

FD-001 settles the high-level domain grouping. It does not authorize implementation, recover the exact historical Phase 1.5 Domain Model v2 / Context Map v2, or close detailed ownership of modules, aggregates, persistence, events, permissions or integration contracts.

The historical 15-module proposal remains implementation-decomposition evidence. It is not a competing bounded-context model, and mappings are not required to be one-to-one.

**Source restoration / provenance (2026-10-17):** the exact full `ASAS-ARCHITECTURE-V3.md` source was located in the existing Library item `ASAS-ARCHITECTURE-V3.md` (version 3.0, dated 2026-09-20; 52,114 bytes). Its Git blob SHA `f2dbbc83489f0ded270fafdbcbea4d19739b1954` matches the byte-exact read-back of that item; SHA-256 `385ff27e5d62eda1b14cef216a4e596345b3fd4a4ad511f4c6f56d2a72722ce6`. This change restores that exact source at the referenced repository path. Git history also contains a 13,200-byte earlier object `d55c89a9e4a7be9a901f73ab5c84fbabf2f7cebb`, explicitly reverted as a non-literal placeholder; do not restore that object. V3 presence is architecture source availability, not proof of runtime implementation and not implementation authorization. FD-001 remains the explicit decision record for high-level grouping.

Scheduling ownership is **CLOSED BY FD-002 and accepted ADR-0021 (2026-09-26)**: Scheduling is a Core-hosted platform capability, not a standalone bounded context or CRM-owned persistence boundary. Calendar/provider integrations belong to Integrations. The decision does not authorize a Scheduling schema or close the downstream persistence, permission, event, access-control and contract verification tasks.

The historical `foundation/reconcile-context-map-v2` branch contains a proposed module map / ADR-0001, not an accepted competing decision. Preserve it as historical evidence. Continue reconciling the detailed context/module/aggregate/event/permission ownership map through the applicable C-tracks.

**Identifier discipline:** do not cite a `C2-00x` identifier without its owning document and title. The Source of Truth and Roadmap previously used `C2-002` for Scheduling, while `docs/governance/OPEN-CONTRACT-CONFLICTS.md` uses `C2-002` for runtime/database identity. Use `FD-002 / ADR-0021` for Scheduling and the full path/title for the runtime-identity conflict.

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
`OWNER DECISION CLOSED BY FD-002 / ADR-0021; CONTRACT + PERSISTENCE TRACE OPEN`.

## 9 — Core invariants

Current source-supported/target invariants include:

1. Lead has one current owner.
2. Lead stage follows a legal state machine.
3. Tenant-owned records remain tenant-scoped.
4. Unit commercial availability and construction state remain separate dimensions.
5. One active Reservation winner per Unit under concurrency.
6. Contract requires an approved Reservation.
7. Governed Track A collection is milestone-gated according to source rules; legal applicability requires qualified legal verification.

## 10 — Engineering Conference control

The Engineering Conference is the sole engineering-control route:

`GATE-00 → GATE-01 → GATE-02 → GATE-03 → GATE-04 → GATE-05 → GATE-06 → GATE-07`

C01–C22 remain research/decision inputs to this single route, not parallel authorization paths.

GATE-07 remains slice-specific and unavailable until predecessor evidence is closed.

Architecture V3 is referenced by the conference as an architecture source. It does not create a second control plane.

## 11 — Current foundation status

GATE-00 remains OPEN. Repository records identify `Asas platform` (`oliiumegstqujwexikhr`) as an inspected/designated ASAS platform project, but that does not independently prove that the actual Vercel Production environment of this repository is bound to that project.

Remaining closure evidence includes the exact Vercel project/repository linkage, Production branch and deployment, Production environment scope, non-secret Supabase `PROJECT_REF` mapping, and GitHub protection/control evidence. The branch endpoint returned `protected: false` during the 2026-10-17 inspection. Do not infer runtime binding from project existence, naming or a healthy project status.

GATE-01 and later gates remain pending/not authorized according to the current session checkpoint.

## 12 — Source-of-truth rules

The Architecture V3 source is an architecture reference. Engineering Conference artifacts own engineering sequencing, gate state, evidence rules and implementation authorization.

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
