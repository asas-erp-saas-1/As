# ASAS — ROADMAP AMENDMENT 005

**Date:** 2026-09-24  
**Status:** ACTIVE  
**Parent:** `ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` v2.0.1  
**Method:** `ASAS-ARCHITECTURE-RESEARCH-FIRST-DECISION-METHOD-2026.md`

## 1. Change

The engineering method is explicitly upgraded from a source-first gap protocol to a **research-first expansion + source-validation cycle**.

For material architecture questions:

```text
PROBLEM
→ INDEPENDENT RESEARCH
→ ALTERNATIVES / FAILURE MODES
→ ENGINEERING HYPOTHESES
→ ASAS SOURCE VALIDATION
→ PROVENANCE / AUTHORITY RECONCILIATION
→ DERIVATION OR REJECTION
→ CONTRACT / ADR / REGISTER
→ VERIFICATION
```

This does not weaken source authority. It prevents incomplete ASAS documents from artificially limiting the engineering solution space.

## 2. Codex executor correction

The parent roadmap contains an outdated sentence describing Claude Code as the default implementation executor. The current operating decision is:

- **Codex:** primary engineering executor for architecture implementation, code, database/schema work, tests, CI and controlled delivery.
- **Claude + Figma:** specialized design/UX/UI/design-system collaboration and visual exploration; implementation authority remains the accepted design/code contract.

This amendment supersedes the outdated executor wording without rewriting historical artifacts.

## 3. Product requirements control

A proposed PRD baseline now exists at:

`docs/product/ASAS-PRODUCT-REQUIREMENTS-BASELINE-2026.md`

Status is `PROPOSED — FOUNDER REVIEW REQUIRED`. It is a consolidation artifact, not implementation authorization.

## 4. Route impact

The active route remains:

`H0 Reality → H1 Architecture → H2 Domain Contracts → H3 Events/Integrations → H4 Security/Tenancy → H5 Data → H6 Design → H7 Platform Foundation → H8 Vertical Slice → H9 Operations/Recovery → H10 Runtime → H11 Production`

Research may open new dependencies at any horizon. It may not silently reorder authority or promote future scope.

## 5. Verification

Required after this amendment:

- canonical routing check;
- stale executor-reference search;
- PRD/Blueprint consistency check;
- Context Prompt alignment;
- Source of Truth alignment;
- checkpoint update;
- CI rerun on current HEAD.
