# ASAS — CODEX SKILLS CATALOG 2026

**Artifact ID:** ASAS-AGENT-SKILLS-CATALOG-2026-001  
**Status:** CANONICAL AGENT CAPABILITY CATALOG  
**Version:** 1.0.0  
**Effective date:** 2026-09-23  
**Repository:** `asas-erp-saas-1/As`  
**Branch:** `platform-architecture-2026`

## Purpose

Define the reusable engineering capabilities that Codex and cooperating agents should apply during ASAS architecture, design, implementation, database engineering, security, testing and delivery.

This catalog complements `AGENTS.md`, the AI Agent Engineering Operating Model and canonical task packets. It does not override architecture authority.

## Skill discovery

Codex skills are stored under `.agents/skills/`. Each skill has a `SKILL.md` manifest and should contain only workflow-specific instructions. This follows the current OpenAI skill model: reusable task workflows belong in skills, while persistent repository rules belong in `AGENTS.md`. Official OpenAI guidance also recommends keeping skills modular so the agent loads detailed instructions only when the workflow is relevant.

## Skill inventory

| Skill | Purpose | Primary phase |
|---|---|---|
| `asas-engineering` | Master contract-first engineering loop and safety boundary | All |
| `asas-repository-forensics` | Repository/branch/provenance reconstruction | H0/Q0 |
| `asas-architecture-governance` | ADRs, canonical artifacts, traceability and gates | H1–H2/Q0–Q9 |
| `asas-domain-contracts` | DDD, aggregates, invariants, state machines, commands/events | H1–H3/Q1–Q6 |
| `asas-database-engineering` | PostgreSQL/schema/migrations/RLS/concurrency | H5/Q8 |
| `asas-security-ai-safety` | Threat modeling, tenancy, authorization and AI boundaries | H4/Q6 |
| `asas-design-fidelity` | Figma/design-system/design-to-code/visual QA | H6/Q10 |
| `asas-testing-verification` | Independent verification and adversarial QA | All implementation phases |
| `asas-observability-reliability` | SLOs, performance, recovery and operational evidence | H9–H11/Q11–Q13 |

## Capability matrix

### 1. Repository / context engineering

- repository identity verification;
- branch/commit/merge-base analysis;
- complete tree inventory;
- provenance tracing;
- canonical-vs-historical classification;
- stale-reference detection;
- duplicate authority detection;
- task-context loading;
- evidence ledger maintenance.

### 2. Architecture / DDD

- bounded-context discovery;
- context mapping;
- module ownership;
- aggregate boundary design;
- entity/value-object modeling;
- invariant catalogs;
- consistency boundaries;
- command/query separation;
- state-machine design;
- event taxonomy;
- cross-context contracts;
- modular-monolith dependency design;
- architecture fitness rules.

### 3. Application engineering

- TypeScript type-safe design;
- React/Next.js architecture;
- server/client boundary discipline;
- input validation;
- domain/application/infrastructure separation;
- error taxonomy;
- transaction boundaries;
- idempotent command handling;
- dependency hygiene;
- refactoring without semantic drift.

### 4. Database engineering

- PostgreSQL relational modeling;
- normalization/denormalization decisions;
- indexes and query planning;
- unique/foreign/check constraints;
- transaction isolation;
- locking and concurrency;
- idempotency keys;
- outbox/inbox patterns;
- RLS;
- migration design/replay;
- schema drift analysis;
- backup/restore rehearsal;
- financial immutability;
- integer minor-unit money.

### 5. Security engineering

- threat modeling;
- authentication/session boundaries;
- RBAC/ABAC/scope authorization;
- tenant isolation;
- IDOR/mass-assignment defense;
- injection/XSS/CSRF defense;
- webhook signature/replay defense;
- secrets management;
- PII/data classification;
- audit trails;
- abuse/rate-limit analysis;
- dependency/supply-chain risk;
- AI prompt/tool injection defense.

### 6. AI-agent safety

- least-privilege tool access;
- caller-authority inheritance;
- policy gates;
- approval-required actions;
- reversible actions;
- prohibited actions;
- dry-run/simulation;
- auditability;
- prompt-injection resistance;
- tool-output validation;
- external side-effect control;
- agent stop/escalation behavior.

### 7. Design / UX

- information architecture;
- design tokens;
- component contracts;
- variants/state modeling;
- Figma variables and components;
- Figma MCP;
- Code Connect;
- design-system governance;
- responsive behavior;
- RTL/LTR;
- Arabic/French/English localization;
- accessibility/WCAG-oriented implementation;
- empty/loading/error/offline states;
- real-data density;
- visual regression.

### 8. Testing / QA

- unit tests;
- integration tests;
- contract tests;
- database tests;
- RLS tests;
- authorization tests;
- state-machine legal/illegal transition tests;
- concurrency/race tests;
- event/outbox/idempotency tests;
- API/webhook tests;
- E2E/browser tests;
- accessibility tests;
- visual regression;
- migration replay tests;
- failure/retry tests;
- performance tests;
- recovery tests.

### 9. DevOps / CI

- reproducible local setup;
- deterministic scripts;
- architecture-as-code;
- stale-reference checks;
- contract/register consistency checks;
- type/lint/test pipelines;
- dependency auditing;
- migration validation;
- artifact/evidence generation;
- protected branch/release controls;
- deployment gates.

### 10. Reliability / operations

- SLI/SLO/error-budget design;
- structured logs;
- metrics/tracing;
- queue/event lag;
- DB saturation;
- API saturation;
- incident diagnostics;
- backup/restore;
- RPO/RTO;
- rollback;
- disaster recovery;
- capacity/performance analysis.

## Agent role model

### Lead Architect

Owns source reconciliation, architecture decisions within delegated authority, research synthesis, contract promotion, gate interpretation and escalation.

### Codex

Primary engineering executor. Implements authorized application/database/CI/test/integration work and produces evidence.

### Claude + Figma

Specialized design collaborator. Produces/refines UX, design-system and visual artifacts; feeds accepted design contracts to Codex.

### Verification pass

Independent review role. Challenges implementation and evidence rather than assuming the implementing agent is correct.

### Founder

Owns founder-level product scope, protected financial/legal/security decisions, commercial commitments and irreversible business choices.

## Skill selection rule

Do not load every skill into every task. Select the smallest sufficient skill set, then load additional skills when the dependency graph requires them. Avoid bloated context.

A typical feature may use:

`repository-forensics → architecture-governance → domain-contracts → design-fidelity → database-engineering → testing-verification → security-ai-safety`.

A documentation-only task may need only `repository-forensics + architecture-governance`.

## Skill authoring rules

Each skill must:

1. have a stable lowercase-hyphenated name;
2. contain a concise `SKILL.md` manifest;
3. state when it should be used;
4. define required inputs and authority;
5. define procedure and stop conditions;
6. avoid duplicating `AGENTS.md` unnecessarily;
7. avoid embedding stale version numbers unless required;
8. preserve source/derived/evidence distinctions;
9. produce explicit verification/evidence outputs;
10. remain composable with other skills.

## Evidence rule

A skill can guide an agent, but it cannot make an unverified fact true. Every implementation claim still requires objective verification.

## External basis

The skill architecture is aligned with current OpenAI guidance that skills are reusable workflow instructions with optional supporting references/scripts, and with Figma's current MCP guidance for design context, writing to Figma and Code Connect. External documentation informs the method; ASAS canonical artifacts remain the project authority.
