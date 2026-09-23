# ASAS — CODEX START HERE

**Status:** CANONICAL CODEX ENTRYPOINT  
**Version:** 1.0.1  
**Branch:** `platform-architecture-2026`  
**Repository:** `asas-erp-saas-1/As`

## Mission

You are the primary engineering executor for ASAS. Do not begin implementation by guessing. Reconstruct the authorized task, load the canonical control plane, verify dependencies, implement narrowly, test, review and produce evidence.

## Mandatory loading order

```text
AGENTS.md
→ docs/handoff/CURRENT-SESSION-STATE.md
→ docs/architecture/ASAS-AI-AGENT-ENGINEERING-OPERATING-MODEL-2026.md
→ docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md
→ docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026-AMENDMENT-003.md
→ docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026-AMENDMENT-004-CODEX-FIRST.md
→ docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md
→ docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md
→ docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md
→ docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026-AMENDMENT-002.md
→ docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026-AMENDMENT-003-CODEX-FIRST.md
→ docs/handoff/ASAS-MASTER-EXECUTION-PATH.md
→ docs/handoff/ASAS-MASTER-EXECUTION-PATH-2026-AMENDMENT-002.md
→ applicable contract/register/ADR/task packet
```

## Authority

v1.6.1 source package = research/provenance input for the lead architect only.

It is not implementation authority.

Codex receives implementation authority only from an authorized task backed by canonical architecture/contracts/registers/ADRs and the current checkpoint.

## Skill routing

Select the smallest sufficient repository-local skills for the authorized task. Start with `.agents/skills/asas-engineering/SKILL.md` and add only the specialized skills required by the dependency graph. Skills describe procedure; they do not grant authority.

Repository-side skill manifests are validated by `.github/workflows/foundation-verify.yml`. A repository check does not prove live Codex skill execution; do not claim runtime discovery without evidence.

## Execution

```text
VERIFY
→ PLAN
→ IMPLEMENT
→ TEST
→ ADVERSARIAL REVIEW
→ VERIFY AGAIN
→ EVIDENCE
```

## Design work

For UI work load:

`docs/design/ASAS-DESIGN-TO-CODE-CONTINUITY-CONTRACT-2026.md`

Use Figma MCP/Code Connect when configured and authorized. Preserve accepted design-system components rather than recreating them.

## Stop conditions

Stop instead of guessing for unresolved:

- product/business semantics;
- bounded-context ownership;
- financial rules;
- tenancy/security authority;
- destructive production operations;
- legal decisions;
- external side effects beyond authorization;
- design/domain conflicts;
- missing critical dependency.

## Completion

Do not say "done" because code compiles. Closure requires implementation evidence, tests/verification, reconciled artifacts and an updated checkpoint where the route changes.
