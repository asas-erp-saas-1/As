# ASAS — ENGINEERING SOURCE OF TRUTH 2026

**Artifact ID:** ASAS-ARCH-SOT-2026-001  
**Status:** CANONICAL CONSOLIDATION / PROPOSED — EVIDENCE-BACKED  
**Version:** 1.5.3  
**Effective date:** 2026-09-24  
**Owner:** Lead Architecture / Founder authority boundary  
**Branch:** `platform-architecture-2026`  
**Role:** Single consolidation and routing resource for architecture engineering

> This resource consolidates verified repository facts, source-package facts, historical proposals, current engineering decisions, external engineering evidence, unresolved conflicts and implementation constraints. It preserves provenance and cannot silently override an A1 source.

## 0 — Operating rule

`REALITY → PROVENANCE → AUTHORITY → RECONCILIATION → MODEL → CONTRACT → VERIFICATION → IMPLEMENTATION`

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
| Building domain contract | `docs/architecture/contracts/ASAS-BUILDING-DOMAIN-CONTRACT-2026.md` | PROPOSED / OPEN / IMPLEMENTATION BLOCKED |
| Building reconciliation | `docs/architecture/reconciliation/ASAS-BUILDING-SCHEMA-RECONCILIATION-2026.md` | OPEN / IMPLEMENTATION BLOCKED |
| Schema contract promotion | `docs/architecture/reconciliation/ASAS-SCHEMA-CONTRACT-PROMOTION-PROTOCOL-2026.md` | CANONICAL PROCEDURE / ACTIVE v1.0.1 |

Historical Blueprint Amendment 001 remains provenance and is not an active competing blueprint.

## 3 — Agent execution model

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

## 4 — Repository identity

Canonical repository: `asas-erp-saas-1/As`  
Architecture branch: `platform-architecture-2026`  
Current branch HEAD is maintained in the session checkpoint.

Historical branches are provenance. Branch deletion is not implied by reconciliation.

## 5 — Structural source observations

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

## 6 — Architecture authority

Current target contexts:
`Core / CRM / Sales / Inventory / Finance / Studio / Marketing / Analytics / Documents`

The historical 15-module proposal is implementation evidence, not a competing bounded-context architecture.

`C2-001 = OPEN ARCHITECTURAL REFINEMENT`

Scheduling remains unresolved:
`C2-002 = FOUNDER-DECISION-REQUIRED`.

## 7 — Current contract state

### Unit / Reservation
`PARTIALLY CLOSED / IMPLEMENTATION UNVERIFIED`

### Building
`Q1 ACTIVE / OPEN / IMPLEMENTATION BLOCKED`

Canonical working contract:
`docs/architecture/contracts/ASAS-BUILDING-DOMAIN-CONTRACT-2026.md`

Current supported conclusion:
`BUILDING = REAL-ESTATE STRUCTURAL DOMAIN CONCEPT`

The contract intentionally does not authorize a persistence representation. Aggregate/entity/reference classification, relationship cardinality, identity/uniqueness, lifecycle operations, tenant ownership, current repository representation and live persistence remain open until evidenced.

### Offer
`PARTIAL / IMPLEMENTATION BLOCKED`

### Finance
`PARTIALLY CLOSED / EXECUTABLE FINANCE CONTRACT OPEN`

Current source semantics support:
`Contract → PaymentPlan / schedule items → Receipt → ReceiptAllocation → Finance/Ledger where authorized`.

### Scheduling
`FOUNDER-DECISION-REQUIRED`.

## 8 — Core invariants

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

## 9 — State machine doctrine

`Command → Authentication → Authorization → Tenant Scope → Aggregate Load → Preconditions → Legal Transition → Invariants → State Mutation → Audit → Domain Event → Transactional Outbox → Commit`

No arbitrary governed status setter.

## 10 — Event doctrine

The registered 103-event / 11-group count is source observation. Each implemented event requires producer, aggregate, trigger, version, tenant, causation/correlation, consumers, idempotency, ordering, replay, DLQ, retention, reconciliation and evidence.

## 11 — Permission / tenancy

Target hierarchy:
`Platform → Organization → Workspace → Branch → Membership → Role → Permission → Scope → Resource`.

Deny-by-default, server-side authorization and tenant-aware data access are mandatory. RLS is defense-in-depth, not the only authorization layer.

## 12 — Database truth

Separate:
`Target Domain Model ≠ Schema Contract ≠ Prisma Contract ≠ Migration History ≠ Live Database`.

Required reconciliation:
`Introspect → Capture → Drift Inventory → Compare → ADR → Migration Plan → Backup Verification → Rehearsal → Forward-only Migration → Verification → Evidence`.

The active procedure for promotion of an executable target schema is:
`docs/architecture/reconciliation/ASAS-SCHEMA-CONTRACT-PROMOTION-PROTOCOL-2026.md`.

No destructive production shortcut.

## 13 — AI safety

`Intent → Proposal → Tool Request → Policy → Caller Authorization → Domain/Application Service → Transaction → Audit → Event`.

AI is not direct database authority and cannot bypass domain authorization.

## 14 — Design

Design precedes page implementation:
`tokens → primitives → components → patterns → templates → surfaces`.

Figma MCP/Code Connect are optional design-to-code mechanisms; accepted design contracts, not Figma itself, authorize implementation.

Arabic/RTL, French/English, accessibility, responsive behavior, mobile operations and failure states are engineering requirements.

## 15 — Task truth

Implementation packets must identify scope, owner, dependencies, contracts, commands, permissions, invariants, states, events, concurrency, security, UX, tests, DoD, evidence and authorization. Missing information remains open.

## 16 — Current gates

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

## 17 — Current roadmap

`H0 Reality → H1 Architecture → H2 Domain Contracts → H3 Events/Integrations → H4 Security/Tenancy → H5 Data → H6 Design → H7 Platform Foundation → H8 Vertical Slice → H9 Operations/Recovery → H10 Runtime Integration → H11 Production`.
