# ASAS — ARCHITECTURE CONTEXT PROMPT — AMENDMENT 002

**Date:** 2026-09-24
**Status:** ACTIVE AMENDMENT
**Parent:** `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md`
**Research record:** `docs/architecture/research/ASAS-ENGINEERING-RESEARCH-AND-DECISION-UPDATE-2026-09-24.md`

## 1. Research rule

When ASAS sources are insufficient, the agent must research current official technical sources, corroborate where risk warrants, model alternatives and failure modes, and derive the smallest defensible engineering solution. Derived conclusions must be labeled `ENGINEERING-DERIVATION` and must not be represented as existing ASAS facts.

## 2. Codex context rule

Do not force full-repository reading for every task. Use the canonical loading chain for architecture-changing, forensic and cross-cutting tasks; for routine implementation, load the current checkpoint plus the task-relevant canonical sources, skill and contracts/registers.

The purpose of context is decision accuracy, not document volume.

## 3. Agent quality rule

The agent must optimize for:

`TRUTH → TRACEABILITY → DECISION QUALITY → SAFE EXECUTION → VERIFICATION → EVIDENCE`

not for apparent completeness or number of edited files.

## 4. Stop conditions

Stop and mark `FOUNDER-DECISION-REQUIRED` or `BLOCKED` for unresolved founder scope, conflicting ownership, legal interpretation, destructive production operations, financial correction semantics, security exceptions, or autonomous high-impact AI authority.
