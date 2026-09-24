# ASAS — CURRENT SESSION STATE

**Status:** CANONICAL ARCHITECTURE ENGINEERING CHECKPOINT  
**Version:** 3.16  
**Date:** 2026-09-24  
**Repository:** `asas-erp-saas-1/As`  
**Architecture branch:** `platform-architecture-2026`

## 1. Current phase

`ARCHITECTURE ENGINEERING — RESEARCH-FIRST + SOURCE-VALIDATION → Q1 BUILDING / DOMAIN AUTHORITY RECOVERY`

## 2. Current checkpoint

`ARCH-2026-H1.5.3-Q1-BUILDING-RESEARCH-RECONCILIATION`

This file remains the sole active execution checkpoint. `SESSION_STATE.md` is legacy compatibility material and must not be used as the active checkpoint.

## 3. Current HEAD

The current branch HEAD is the commit produced by this checkpoint sequence. It contains the reconciled PRD, Q1 research record, evidence-register update, Source-of-Truth update and previous architecture-control artifacts.

**CI:** `NOT VERIFIED FOR CURRENT HEAD` until the existing workflow is rerun. The previously verified foundation run was `35879311233` and is not evidence for the current HEAD.

## 4. Canonical control plane

- Product requirements: `docs/product/ASAS-PRODUCT-REQUIREMENTS-BASELINE-2026.md` — PROPOSED v0.2.0 / FOUNDER REVIEW REQUIRED
- Blueprint: `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` — PROPOSED v1.5.1
- Roadmap: `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` — ACTIVE v2.0.1 + amendments
- Context Prompt: `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` — ACTIVE v2.0.2 + amendments
- Master Execution Path: `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`
- Source of Truth: `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md` — v1.5.7
- Research protocol: `docs/architecture/ASAS-ARCHITECTURE-RESEARCH-SOURCE-DISCOVERY-PROTOCOL-2026.md`
- Research-first method: `docs/architecture/ASAS-ARCHITECTURE-RESEARCH-FIRST-DECISION-METHOD-2026.md` — CANONICAL OPERATING METHOD v1.0.0
- Q1 research record: `docs/architecture/research/ASAS-RESEARCH-RECORD-Q1-BUILDING-2026-09-24.md`
- Agent Operating Model: `docs/architecture/ASAS-AI-AGENT-ENGINEERING-OPERATING-MODEL-2026.md`
- Codex Skills Catalog: `docs/governance/ASAS-CODEX-SKILLS-CATALOG-2026.md`
- Repository skills: `.agents/skills/` — 9 repository-verified skills
- Design/code continuity: `docs/design/ASAS-DESIGN-TO-CODE-CONTINUITY-CONTRACT-2026.md`
- Evidence register: `docs/architecture/reconciliation/ASAS-EVIDENCE-PLACEMENT-REGISTER-2026-09-24.md`
- Context boundary framework: `docs/architecture/reconciliation/ASAS-CONTEXT-BOUNDARY-DECISION-FRAMEWORK-2026.md`
- Context authority reconciliation: `docs/architecture/reconciliation/ASAS-CONTEXT-AUTHORITY-RECONCILIATION-2026.md` — CONFLICT / OPEN
- Building trace plan: `docs/architecture/reconciliation/ASAS-Q1-BUILDING-PERSISTENCE-TRACE-PLAN-2026.md`
- Proposed PRD: `docs/product/ASAS-PRODUCT-REQUIREMENTS-BASELINE-2026.md` — PROPOSED / FOUNDER REVIEW REQUIRED

## 5. Method — effective now

The architecture process is:

`PROBLEM → RESEARCH → ALTERNATIVES / FAILURE MODES → HYPOTHESES → ASAS SOURCE VALIDATION → PROVENANCE / AUTHORITY → REJECT / ADAPT / DERIVE → CONTRACT / ADR / REGISTER → VERIFY → CHECKPOINT`

Research expands the solution space; ASAS sources determine what is supported and authoritative. No source is blindly obeyed and no external research is promoted to ASAS truth without reconciliation.

## 6. Product truth reconciliation

Historical founder-confirmed product truth on `foundation/reconcile-context-map-v2` was re-inspected.

It establishes ASAS as a broad Real Estate Operating System combining public digital sales surface, Studio/CMS, inventory, CRM, sales, finance/ERP, marketing, analytics, communications, governance, workflows and future AI intelligence. It also establishes the hierarchy `Promoter/portfolio → Project → Building → Unit` and a one-system-of-truth principle across public and internal surfaces.

The consolidated PRD now records this evidence. It remains `PROPOSED — FOUNDER REVIEW REQUIRED` and does not authorize implementation expansion.

## 7. Agent authority

`Codex = primary engineering executor` for authorized architecture implementation, code, schema/database work, tests, CI and controlled delivery.

`Claude + Figma = specialized design / UX / UI / design-system collaboration`.

Agents implement HOW only after WHAT is authorized.

## 8. Context authority — C2-001

`OPEN / CONFLICT / IMPLEMENTATION BLOCKED`

The exact approved Phase 1.5 Domain Model v2 and Context Map v2 remain unlocated. The historical 15-module candidate remains proposed pending explicit acceptance. Do not equate module count with bounded-context count.

## 9. Scheduling — C2-002

`FOUNDER-DECISION-REQUIRED`

No persistence, event, permission or dependency ownership may be silently reassigned.

## 10. Building — Q1

`OPEN / IMPLEMENTATION BLOCKED`

### Research-first conclusion

The strongest current model is:

`Real Estate / Inventory → Project → Building (structural Entity candidate) → Floor (structural level if required) → Unit aggregate`

This is a provisional architecture conclusion, not schema authorization.

### Supported

- Building is a first-class real-estate hierarchy concept;
- product direction uses `projects → buildings → units`;
- ownership direction is Real Estate / Inventory;
- Building should not currently be a bounded context;
- Building should not currently be an independent aggregate root;
- Unit remains the commercial/reservation consistency boundary;
- no independent Building state machine is justified by current evidence;
- no Building microservice or independent event stream is authorized.

### Open

- Project → Building cardinality;
- Building → Floor → Unit persistence semantics;
- durable identity and uniqueness;
- rename semantics;
- move semantics;
- archive semantics;
- tenant-key representation;
- permission mapping;
- historical reconstruction requirements;
- actual brownfield persistence representation;
- live DB representation.

### New research record

`docs/architecture/research/ASAS-RESEARCH-RECORD-Q1-BUILDING-2026-09-24.md`

### Execution procedure

`docs/architecture/reconciliation/ASAS-Q1-BUILDING-PERSISTENCE-TRACE-PLAN-2026.md`

## 11. Historical branch evidence

`foundation/reconcile-context-map-v2` contains a proposed 15-module map. Its Property & Inventory module owns Projects and Units, while its aggregate baseline does not establish Building as an independent aggregate. This supports the conservative direction but remains historical proposal evidence, not current authority.

## 12. Schema truth

Keep separate:

`Domain Model ≠ Target Schema ≠ Schema Contract ≠ Prisma Contract ≠ Migration History ≠ Live Database`

Measured v1.6.1 source observations: 59 models, 17 enums, 56 indexes, 22 unique constraints and 19 relation annotations. These are source observations, not runtime proof.

Schema promotion remains BLOCKED pending complete brownfield/runtime reconciliation, domain closure, security alignment and executable verification.

## 13. Current invariants / architectural doctrine

- no double-sale / one active reservation winner under concurrency;
- governed state transitions only through command → authorization → invariant → mutation → audit → event/outbox;
- tenant isolation and server-side authorization;
- immutable posted financial facts with reversal semantics;
- explicit currency and integer minor units where applicable;
- durable events require reliable publication semantics and idempotent consumers;
- AI cannot widen caller authority or directly mutate authoritative finance/reservation/contract data;
- database changes are forward-controlled and non-destructive by default.

Runtime enforcement is not claimed without evidence.

## 14. External engineering evidence incorporated

Current research includes:

- DDD bounded-context and aggregate guidance;
- PostgreSQL constraints, identity, referential-integrity and locking guidance;
- OWASP ASVS 5.0.0 security-verification guidance;
- Prisma brownfield schema-diff/baselining guidance.

External evidence validates engineering technique only. It does not prove ASAS runtime state.

## 15. Next execution queue

### Q1-A — Recover exact approved Domain Model v2 / Context Map v2

Search remaining historical branches, commit history, source packages and canonical references. Preserve all historical candidates. Do not synthesize an approved artifact if none is found.

### Q1-B — Execute Building persistence trace

Trace `project_id`, `building_id`, `floor_number`, `floor_plan_id`, `buildingId`, `projectId`, `floorId` and legacy equivalents through repository schema, migration history, seeds, fixtures, tests, APIs, adapters and historical branches.

### Q1-C — Reconcile schema inventories

Reconcile measured `59/17/56/22/19` source observations against historical declarations and current schema index. Determine the cause of every discrepancy.

### Q1-D — Close Building semantics

Close cardinality, identity, uniqueness, tenant inheritance and rename/move/archive behavior before any schema authorization.

### Q1-E — Retest current HEAD

Run the existing CI workflow. Do not invent a new command merely to create a green status.

### Q2 — Offer contract

Only after Q1 dependencies that affect Offer are closed.

### Q3 — Finance contract

PaymentSchedule → Receipt → Allocation → Ledger semantics.

### Q4 — Scheduling ADR

Founder decision / explicit supersession only.

## 16. Non-authorizations

No authorization exists for:

- production database changes;
- Prisma/schema promotion;
- migrations;
- destructive operations;
- Building-specific events/permissions/state machine;
- autonomous financial correction;
- autonomous high-impact AI mutation;
- broad implementation before contract gates close.

## 17. Closure rule

A finding is CLOSED only when:

`root cause + corrective action + canonical owner + reference reconciliation + verification + evidence`

Otherwise it remains `OPEN`, `PARTIAL`, `BLOCKED`, `CONFLICT`, `NOT_EXECUTED` or `FOUNDER-DECISION-REQUIRED`.

## 18. Resume rule

When the operator says `Continue / أكمل العمل على المسار`:

1. load this checkpoint;
2. inspect current branch/HEAD;
3. load Source of Truth, Roadmap, Context Prompt and Research-First Method;
4. identify the first unresolved dependency;
5. research it independently when material;
6. return to ASAS sources and reconcile;
7. make only authorized changes;
8. verify;
9. update canonical routing/checkpoint;
10. report evidence and exact next dependency.
