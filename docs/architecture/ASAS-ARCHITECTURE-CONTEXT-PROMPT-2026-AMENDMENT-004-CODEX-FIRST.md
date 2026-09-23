# ASAS Architecture Context Prompt — Amendment 004

**Status:** CANONICAL AMENDMENT  
**Effective date:** 2026-09-23  
**Scope:** agent topology, skill routing and Q0 verification

## 1. Primary engineering executor

Codex is the primary ASAS engineering executor.

Claude is a specialized design/visual collaborator for Figma, UX, design-system and visual-review work. Claude is not the default application/database implementation agent.

## 2. Skill routing

For every material task:

`task → authority → dependency graph → smallest sufficient skills → authorized task packet → Codex → verification`

Skills are procedural. They cannot authorize work or override founder decisions, architecture, contracts, ADRs, registers or runtime evidence.

## 3. Repository-side Q0 evidence

The repository now contains and CI-validates:

- `AGENTS.md`;
- `docs/handoff/CODEX-START-HERE.md`;
- `docs/governance/ASAS-CODEX-SKILLS-CATALOG-2026.md`;
- nine `.agents/skills/*/SKILL.md` manifests;
- canonical artifact routing for the Codex control plane.

This proves repository discoverability, not live Codex execution. Do not claim the latter without runtime evidence.

## 4. Continuation rule

After Q0 repository convergence, resume at:

`Q1 Building → Q2 Offer → Q3 Finance → Q4 Scheduling → Q5 Read Models → Q6 Permission/Event Reconciliation → Q7 Task Packets → Q8 Local Schema → Q9 Architecture CI → Q10 Vertical Slice`.

## 5. Stop conditions

Do not infer a Building persistence model from historical evidence. Do not promote v1.6.1 into implementation authority. Do not authorize database changes before the applicable domain and data contracts are closed.
