# ASAS Real Estate OS — Claude Session Bootstrap

**Status:** DESIGN / HANDOFF ONLY.
**Purpose:** deterministic startup protocol for future Claude implementation sessions.

## 1. First instruction

Do not write application code, database schema, migrations, infrastructure changes or production changes until the Founder explicitly changes the execution boundary to authorized implementation.

## 2. Read order

Read these in order before accepting a task:

1. `AGENTS.md`
2. `docs/product/PRODUCT_TRUTH.md`
3. `docs/product/PRODUCT_ARCHITECTURE_DIRECTION.md`
4. `docs/handoff/SESSION_STATE.md`
5. `docs/handoff/CLAUDE-EXECUTION-MASTER.md`
6. `docs/architecture/FOUNDATION-ENGINEERING-MAP.md`
7. `docs/architecture/DOMAIN-CONTRACTS-MAP.md`
8. `docs/architecture/API-CONTRACT-MAP.md`
9. `docs/design/FIGMA-UX-UI-ENGINEERING-CONTRACT.md`
10. `docs/ux/GOLDEN-JOURNEYS-UX-SPEC.md`
11. `docs/security/THREAT-MODEL-AND-SECURITY-BASELINE.md`
12. `docs/integrations/INTEGRATION-AND-PLUGIN-CONTRACT.md`
13. `docs/ai/AI-COPILOT-GOVERNANCE.md`
14. `docs/quality/QUALITY-GATES-AND-EVIDENCE-MATRIX.md`
15. relevant Blueprint chapter, register entry, ADR and skill file for the requested task.

## 3. Before implementation

Return a compact execution packet containing:

- exact task ID;
- authoritative sources;
- current repository state;
- production/schema reality inspected if relevant;
- assumptions and unresolved contradictions;
- affected bounded contexts;
- domain command/event/invariant impact;
- authorization and tenant impact;
- API/data/migration impact;
- UX/UI/Figma impact;
- accessibility/i18n/RTL impact;
- security/threat impact;
- observability/performance impact;
- tests and evidence to be produced;
- rollback/recovery plan.

If a required foundation gate is not proven, stop rather than implementing around it.

## 4. For UI tasks

Use this chain:

`Task → Persona/job → Golden journey → Figma node/context → tokens/components → screen states → permission → command → event → implementation → accessibility → responsive/RTL → visual validation`

Never start from a screenshot alone.

## 5. For database tasks

Use this chain:

`Blueprint contract → live production introspection → schema diff → ADR/divergence decision → migration plan → shadow validation → migration tests → backup/restore evidence → implementation`

Never use `db push` or destructive reset as a shortcut.

## 6. For domain tasks

Identify aggregate, command, invariant, state machine and event before writing persistence/UI code. If a new domain event, bounded context or money/legal behavior is required, stop for Founder decision.

## 7. After implementation

Return exact evidence:

- changed files;
- tests and results;
- seeded-defect gate proof where relevant;
- migration/drift proof;
- authorization/tenant proof;
- accessibility and visual proof for UI;
- performance measurements;
- security review;
- observability proof;
- residual risks;
- documentation/ADR updates;
- rollback/recovery instructions.

## 8. Mandatory stop conditions

Stop and ask the Founder for any material contradiction, destructive migration, production-data transformation, security exception, new module/event, product-scope change, money/legal behavior change, mandatory unapproved provider, canonical token/component conflict, or evidence gap.

## 9. Session close

Update `docs/handoff/SESSION_STATE.md` with:

`Current phase → completed task → evidence → open risks → next exact task → execution boundary`

Never claim a gate is passed without durable evidence.
