# ASAS — CURRENT SESSION STATE

**Status:** CANONICAL FOUNDATION / ARCHITECTURE ENGINEERING CHECKPOINT  
**Version:** 2.9  
**Date:** 2026-09-23  
**Repository:** `asas-erp-saas-1/As`  
**Architecture branch:** `platform-architecture-2026`

## 1. Current phase

`ARCHITECTURE ENGINEERING — CODEX-FIRST AGENT TOPOLOGY + MODULAR SKILL SYSTEM → H1.4 BUILDING PROVENANCE RECONCILIATION`

## 2. Current checkpoint

`ARCH-2026-H1.4.6-CODEX-SKILLS-SYSTEM`

This checkpoint remains the sole active execution state. Do not use `SESSION_STATE.md` as the current checkpoint.

## 3. Canonical control plane

| Role | Artifact | Current version/state |
|---|---|---|
| Architecture target | `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` | PROPOSED v1.5.1 |
| Engineering route | `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` | ACTIVE v2.0.1 + A002 + Skills A001 |
| AI operating context | `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` | ACTIVE v2.0.2 + A003 + Skills A004 |
| Execution path | `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md` | CANONICAL v2.0.1 + A002 + Skills A003 |
| AI agent operating model | `docs/architecture/ASAS-AI-AGENT-ENGINEERING-OPERATING-MODEL-2026.md` | CANONICAL v1.0.0 |
| Design/code continuity | `docs/design/ASAS-DESIGN-TO-CODE-CONTINUITY-CONTRACT-2026.md` | CANONICAL v1.0.0 |
| Agent skills catalog | `docs/governance/ASAS-CODEX-SKILLS-CATALOG-2026.md` | CANONICAL v1.0.0 |
| Repository skills | `.agents/skills/` | 9 skills / active |
| Consolidated engineering truth | `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md` | CANONICAL v1.4.0 |
| Research protocol | `docs/architecture/ASAS-ARCHITECTURE-RESEARCH-SOURCE-DISCOVERY-PROTOCOL-2026.md` | canonical procedure |
| Building provenance evidence | `docs/architecture/ASAS-BUILDING-SCHEMA-PROVENANCE-RECONCILIATION-2026.md` | EVIDENCE / OPEN |
| Current checkpoint | this file | sole active checkpoint |

## 4. Agent capability system

ASAS now has a repository-local modular Codex skill system under `.agents/skills/`. The catalog is the routing resource; individual `SKILL.md` files are task-specific procedures.

Registered skills:

1. `asas-engineering`
2. `asas-repository-forensics`
3. `asas-architecture-governance`
4. `asas-domain-contracts`
5. `asas-database-engineering`
6. `asas-security-ai-safety`
7. `asas-design-fidelity`
8. `asas-testing-verification`
9. `asas-observability-reliability`

The skills are procedural and cannot override canonical architecture, ADRs, contracts, founder decisions or task authorization.

## 5. Source discipline

The source package/Blueprint v1.6.1 is a research/provenance source for the lead architect. It is not implementation authority for Claude Code or Codex. Repository artifacts are derived shadows unless explicitly promoted. Runtime/database facts require runtime evidence. Architecture defines desired future behavior. External research validates engineering technique but does not override ASAS authority.

## 6. Important reconciliations

### Contexts / modules

Nine target contexts remain supported:
`Core / CRM / Sales / Inventory / Finance / Studio / Marketing / Analytics / Documents`

The historical 15-module proposal is implementation evidence, not equal-authority bounded-context architecture.

`C2-001 = OPEN ARCHITECTURAL REFINEMENT`

### Scheduling

Historical ADR-0018 and current architecture materials conflict on Scheduling ownership.

`C2-002 = FOUNDER-DECISION-REQUIRED`

### Building

`OPEN / IMPLEMENTATION BLOCKED`.

Building is supported as a real-estate hierarchy concept. Historical schema evidence confirms prior existence of a Building model with Project and Apartment/Unit relationships, but current executable/live representation remains unresolved.

### Offer

`PARTIAL / IMPLEMENTATION BLOCKED`.

### Finance

`PARTIALLY CLOSED / EXECUTABLE CONTRACT OPEN`.

## 7. Agent topology

```text
Founder / Product Authority
→ Lead Architecture / Control Plane
→ Canonical decision + authorized task
→ Skill selection
→ Codex implementation
→ Independent verification
→ Evidence / gate
```

Claude remains the specialized design/visual collaborator, primarily through Figma and design-system workflows. Codex is the primary engineering executor.

## 8. Current blockers

- canonical live DB/project identity not verified;
- executable schema promotion incomplete;
- full implementation task packets not yet derived;
- Offer closure incomplete;
- Building ownership/structural semantics incomplete;
- Scheduling ownership unresolved;
- runtime security/RLS evidence absent;
- implementation authorization absent;
- architecture CI requires final control-plane verification;
- design acceptance pipeline is defined but not yet evidenced against a production-quality screen;
- skill workflows are structurally created but require Codex discovery/execution verification.

## 9. Gate state

`G0 GREEN` — repository identity/checkpoint  
`G1 AMBER` — control-plane/skill routing convergence  
`G2 AMBER` — domain grouping/Scheduling open  
`G3 AMBER` — aggregate/invariant contracts active  
`G4 AMBER` — executable invariants absent  
`G5 AMBER` — runtime state-machine enforcement absent  
`G6 BLOCKED` — runtime event implementation absent  
`G7 BLOCKED` — implementation authorization absent  
`G8 BLOCKED` — live tenancy/RLS evidence absent  
`G9 AMBER` — security doctrine exists, executable evidence absent  
`G10 BLOCKED` — live DB identity/executable schema absent  
`G11 AMBER` — CI/control-plane verification required  
`G12 BLOCKED` — observability/recovery evidence absent  
`G13 BLOCKED` — restore evidence absent  
`G14 AMBER` — AI safety/agent tooling defined; execution evidence pending  
`G15 BLOCKED` — implementation authorization absent

## 10. Next execution queue

### Q0 — Verify control plane and skill discovery

Verify the latest routing artifacts, `.agents/skills/` manifests, AGENTS routing and current HEAD. Do not claim skill discovery works until Codex-side evidence exists.

### Q1 — Building

Reconcile historical schema evidence with current schema contract and, once runtime identity is verified, live database reality. Close entity/aggregate/relationship semantics without inventing persistence.

### Q2 — Offer

Close commands, states, permissions, approvals, events, idempotency and concurrency.

### Q3 — Finance

Close PaymentPlan/schedule → Receipt → Allocation → Ledger and commission semantics.

### Q4 — Scheduling

Founder decision / explicit ADR confirmation or supersession.

### Q5 — Query/read models

Close read ownership, consistency and tenant-safe projections.

### Q6 — Permission/event reconciliation

Map critical commands to canonical permission/event registers.

### Q7 — Task packets

Derive implementation-ready packets with explicit Codex skill selection and verification boundaries.

### Q8 — Local executable schema

Only after applicable contracts close.

### Q9 — Architecture CI

Machine-check control plane, contracts, agent routing and design-contract references.

### Q10 — First vertical slice

Authorize only after applicable gates are GREEN. Codex is the default implementation executor.

## 11. Continuation rule

When the operator says `Continue / أكمل العمل على المسار`:

1. load this checkpoint;
2. load Roadmap, Context Prompt, Source of Truth, Master Execution Path, Agent Operating Model, Skills Catalog and applicable amendments;
3. inspect current branch/HEAD;
4. resume from the first unresolved dependency;
5. select only the necessary skills;
6. research material gaps using authoritative external sources;
7. make the smallest authorized correction;
8. verify independently where material;
9. update affected routing artifacts and this checkpoint;
10. report exact evidence and next dependency.

Never restart from conversation memory. Never mark a gate green because documentation exists. Never let an agent convert research material into implementation authority by itself.
