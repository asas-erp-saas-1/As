# ASAS — ARCHITECTURE ENGINEERING ROADMAP — AMENDMENT 003

**Date:** 2026-09-24
**Status:** ACTIVE AMENDMENT
**Parent:** `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md`
**Research record:** `docs/architecture/research/ASAS-ENGINEERING-RESEARCH-AND-DECISION-UPDATE-2026-09-24.md`

## 1. Research completion method

For every material engineering uncertainty:

`ASAS sources → branches/history → source package → official external research → corroboration → alternatives/failure modes → smallest defensible engineering derivation → provenance → contract/ADR/register → authorization → implementation → verification`

External research is method evidence, not ASAS product/runtime authority.

## 2. Agent-context optimization

Architecture/forensic tasks require broad provenance review. Routine implementation tasks should load only the canonical sources relevant to the task plus its focused skill and required contracts. Current Codex guidance explicitly favors task-relevant context over unnecessarily bloated always-read instruction stacks.

## 3. Quality-gate rule

Documentation edits never close an engineering gate by themselves. Closure requires objective evidence appropriate to the claim: source verification, runtime verification, test verification, external verification, or a clearly recorded engineering derivation followed by authorization.

## 4. Scope protection

External research may expose capabilities, patterns and risks. It cannot silently promote future capabilities into implementation requirements. Future capabilities remain architectural reservations until promoted through the ASAS control plane.
