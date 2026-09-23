# ASAS — AGENT SKILLS ENGINEERING ROADMAP AMENDMENT 001

**Status:** CANONICAL AMENDMENT  
**Effective date:** 2026-09-23  
**Applies to:** Architecture Roadmap v2.0.1, AI Agent Operating Model v1.0.0, Context Prompt v2.0.2, Master Execution Path v2.0.1

## Decision

ASAS will use a repository-local, modular Codex skill system under `.agents/skills/`.

The skill system is a capability layer, not a second architecture authority.

## Engineering order

```text
Architecture / domain truth
→ canonical contracts
→ design contracts
→ authorized task packet
→ selected skills
→ Codex implementation
→ independent verification
→ evidence
```

## Required skill families

1. repository forensics;
2. architecture governance;
3. DDD/domain contracts;
4. database engineering;
5. security and AI safety;
6. design fidelity/Figma;
7. testing/verification;
8. observability/reliability;
9. master ASAS engineering workflow.

## Selection rule

Skills are selected per task rather than all injected into every context. This follows progressive disclosure and reduces context pollution. The master skill routes to specialized skills.

## Design integration

Figma MCP and Code Connect are optional integration mechanisms. They become part of an implementation task only when the design contract is accepted and the repository component mapping is verified.

## Codex boundary

Codex is the primary engineering executor. It receives only authorized tasks and canonical contracts. It must not derive implementation authority from v1.6.1, historical branches, screenshots or unaccepted Figma frames.

## Research basis

Current OpenAI guidance describes skills as reusable workflow instructions with optional supporting resources and recommends keeping them modular. Figma's current official MCP guidance describes design-context extraction, writing to Figma and Code Connect as design-to-code mechanisms. These external facts inform the operating method but do not override ASAS authority.

## Verification

This amendment is considered active when:

- `.agents/skills/` exists on the canonical branch;
- each registered skill has a valid `SKILL.md`;
- AGENTS routes Codex to the skill catalog;
- the roadmap/context/execution path reference the catalog;
- no skill grants authority beyond the task/architecture control plane.
