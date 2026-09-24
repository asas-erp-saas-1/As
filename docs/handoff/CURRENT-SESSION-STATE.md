# ASAS — CURRENT SESSION STATE

**Status:** CANONICAL ARCHITECTURE ENGINEERING CHECKPOINT  
**Version:** 3.15  
**Date:** 2026-09-24  
**Repository:** `asas-erp-saas-1/As`  
**Architecture branch:** `platform-architecture-2026`

## 1. Current phase

`ARCHITECTURE ENGINEERING — RESEARCH-FIRST + SOURCE-VALIDATION → Q1 BUILDING / DOMAIN AUTHORITY RECOVERY`

## 2. Current checkpoint

`ARCH-2026-H1.5.2-Q1-RESEARCH-FIRST-DOMAIN-AUTHORITY`

This file remains the sole active execution checkpoint. `SESSION_STATE.md` is legacy compatibility material and must not be used as the active checkpoint.

## 3. Current HEAD

`626397daa57dad46402c685bd30a7cbe4cb8e3e3`

Branch: `platform-architecture-2026`

The current HEAD contains the research-first decision method, proposed PRD baseline, roadmap/context/source-of-truth amendments and previous architecture reconciliation work.

**CI:** `NOT VERIFIED FOR CURRENT HEAD` until the existing workflow is rerun. The previously verified foundation run was `35879311233` and is not evidence for this HEAD.

## 4. Canonical control plane

- Blueprint: `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` — PROPOSED v1.5.1
- Roadmap: `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` — ACTIVE v2.0.1 + amendments
- Context Prompt: `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` — ACTIVE v2.0.2 + amendments
- Master Execution Path: `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`
- Source of Truth: `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md` — v1.5.6
- Research protocol: `docs/architecture/ASAS-ARCHITECTURE-RESEARCH-SOURCE-DISCOVERY-PROTOCOL-2026.md`
- Research-first method: `docs/architecture/ASAS-ARCHITECTURE-RESEARCH-FIRST-DECISION-METHOD-2026.md` — CANONICAL OPERATING METHOD v1.0.0
- Agent Operating Model: `docs/architecture/ASAS-AI-AGENT-ENGINEERING-OPERATING-MODEL-2026.md`
- Codex Skills Catalog: `docs/governance/ASAS-CODEX-SKILLS-CATALOG-2026.md`
- Repository skills: `.agents/skills/` — 9 repository-verified skills
- Design/code continuity: `docs/design/ASAS-DESIGN-TO-CODE-CONTINUITY-CONTRACT-2026.md`
- Evidence register: `docs/architecture/reconciliation/ASAS-EVIDENCE-PLACEMENT-REGISTER-2026-09-24.md`
- Context boundary framework: `docs/architecture/reconciliation/ASAS-CONTEXT-BOUNDARY-DECISION-FRAMEWORK-2026.md`
- Context authority reconciliation: `docs/architecture/reconciliation/ASAS-CONTEXT-AUTHORITY-RECONCILIATION-2026.md` — CONFLICT / OPEN
- Proposed PRD: `docs/product/ASAS-PRODUCT-REQUIREMENTS-BASELINE-2026.md` — PROPOSED / FOUNDER REVIEW REQUIRED

## 5. Method correction — effective now

The architecture process is explicitly:

`PROBLEM → RESEARCH → ALTERNATIVES / FAILURE MODES → HYPOTHESES → ASAS SOURCE VALIDATION → PROVENANCE / AUTHORITY → REJECT / ADAPT / DERIVE → CONTRACT / ADR / REGISTER → VERIFY → CHECKPOINT`

This is not source-first obedience and not web-first invention. Research expands the solution space; ASAS sources determine what is actually supported and authoritative.

For material questions, current official documentation, standards, primary engineering sources and authoritative research are preferred. High-risk decisions require adversarial analysis and explicit evidence.

## 6. Agent authority correction

`Codex = primary engineering executor` for authorized architecture implementation, code, schema/database work, tests, CI and controlled delivery.

`Claude + Figma = specialized design / UX / UI / design-system collaboration`.

Agents do not promote product or architecture decisions autonomously. They implement HOW only after WHAT is authorized.

## 7. Product requirements status

A consolidated PRD baseline now exists, but it is deliberately:

`PROPOSED — FOUNDER REVIEW REQUIRED`

It captures currently supported product intent, the commercial traceability spine, initial capability direction, quality requirements, explicit non-goals and open product decisions. It is not an implementation authorization.

## 8. Context authority — C2-001

`OPEN / CONFLICT / IMPLEMENTATION BLOCKED`

Verified evidence from historical branches establishes:

- nine-context model: current candidate artifact;
- 13-context model: historical draft;
- 15-module implementation design: historical implementation source;
- 15-context/15-module candidate map: historical proposal;
- ADR-0001 acceptance: not established / founder decision required if adopted;
- exact approved Phase 1.5 Domain Model v2 and Context Map v2: still unlocated.

Do not resolve the conflict by counting contexts or equating modules with bounded contexts.

## 9. Scheduling — C2-002

`FOUNDER-DECISION-REQUIRED`

Historical ADR-0018 and current architecture materials conflict. No persistence, event, permission or dependency ownership may be silently reassigned.

## 10. Building — Q1

`OPEN / IMPLEMENTATION BLOCKED`

Supported conclusions:

- Building is a first-class real-estate hierarchy concept;
- target ownership direction is Real Estate / Inventory;
- Building is an Entity candidate with durable identity;
- Unit remains the commercial/inventory consistency boundary;
- Building is not promoted to independent aggregate root;
- tenant scope, identity, uniqueness, cardinality and rename/move/archive semantics remain open;
- no Building table/model/migration is authorized.

Controlled evidence artifacts:

`ASAS-BUILDING-DOMAIN-CONTRACT-2026.md`  
`ASAS-BUILDING-SCHEMA-RECONCILIATION-2026.md`  
`ASAS-BUILDING-PERSISTENCE-IDENTITY-DECISION-2026.md`  
`ASAS-REAL-ESTATE-PERSISTENCE-TRACE-2026.md`  
`ASAS-BROWNFIELD-PERSISTENCE-TRACE-2026.md`

## 11. Schema truth

Keep separate:

`Domain Model ≠ Target Schema ≠ Schema Contract ≠ Prisma Contract ≠ Migration History ≠ Live Database`

Measured v1.6.1 source observations: 59 models, 17 enums, 56 indexes, 22 unique constraints and 19 relation annotations.

These are source observations, not runtime proof.

Schema promotion remains BLOCKED pending complete brownfield/runtime reconciliation, domain closure, security alignment and executable verification.

## 12. Current invariants / architectural doctrine

- no double-sale / one active reservation winner under concurrency;
- governed state transitions only through command → authorization → invariant → mutation → audit → event/outbox;
- tenant isolation and server-side authorization;
- immutable posted financial facts with reversal semantics;
- explicit currency and integer minor units where applicable;
- durable events require reliable publication semantics and idempotent consumers;
- AI cannot widen caller authority or directly mutate authoritative finance/reservation/contract data;
- database changes are forward-controlled and non-destructive by default.

Runtime enforcement is not claimed without evidence.

## 13. External engineering evidence incorporated

Current research used to improve the method includes:

- DDD bounded-context guidance from Martin Fowler;
- PostgreSQL official explicit-locking/concurrency documentation;
- OWASP ASVS 5.0.0 security-verification guidance;
- NIST SSDF material, with drafts explicitly distinguished from final normative publications.

External evidence validates engineering technique only. It does not prove ASAS runtime state.

## 14. Next execution queue

### Q1-A — Recover exact approved Domain Model v2 / Context Map v2

Search branches, commit history, source packages and canonical references. Preserve all historical candidates. Do not synthesize an approved artifact if none is found.

### Q1-B — Exhaust real-estate persistence trace

Trace `project_id`, `building_id`, `floor_number`, `floor_plan_id` and alternate names through current source, historical commits, seeds, fixtures, tests, APIs, adapters and migration artifacts.

### Q1-C — Reconcile schema inventories

Reconcile measured `59/17/56/22/19` source observations against historical declarations and the current schema index. Determine the cause of every discrepancy.

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

## 15. Non-authorizations

No authorization exists for:

- production database changes;
- Prisma/schema promotion;
- migrations;
- destructive operations;
- Building-specific events/permissions/state machine;
- autonomous financial correction;
- autonomous high-impact AI mutation;
- broad implementation before contract gates close.

## 16. Closure rule

A finding is CLOSED only when:

`root cause + corrective action + canonical owner + reference reconciliation + verification + evidence`

Otherwise it remains `OPEN`, `PARTIAL`, `BLOCKED`, `CONFLICT`, `NOT_EXECUTED` or `FOUNDER-DECISION-REQUIRED`.

## 17. Resume rule

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
