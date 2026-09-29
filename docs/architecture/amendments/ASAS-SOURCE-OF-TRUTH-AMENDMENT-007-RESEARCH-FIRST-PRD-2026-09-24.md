# ASAS — SOURCE OF TRUTH AMENDMENT 007

**Date:** 2026-09-24  
**Status:** ACTIVE  
**Parent:** `ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md` v1.5.6

## 1. New canonical operating method

`docs/architecture/ASAS-ARCHITECTURE-RESEARCH-FIRST-DECISION-METHOD-2026.md`

Status: `CANONICAL OPERATING METHOD`.

Purpose: ensure material architecture work expands the engineering solution space through current research before returning to ASAS sources for authority/provenance reconciliation.

## 2. Product requirements artifact

`docs/product/ASAS-PRODUCT-REQUIREMENTS-BASELINE-2026.md`

Status: `PROPOSED — FOUNDER REVIEW REQUIRED`.

This artifact consolidates currently supported product intent and explicit non-goals. It does not become product authority until accepted by the founder/product authority.

## 3. Agent operating authority

Current execution decision:

`Codex = primary engineering executor`

`Claude + Figma = specialized design/UX/UI/design-system collaboration`

The architecture control plane remains responsible for deciding WHAT is authorized. Agents decide HOW only inside an authorized task boundary.

## 4. Method hierarchy

For material uncertainty:

`Research-first expansion → ASAS source validation → authority reconciliation → engineering derivation → canonical contract/ADR/register → verification → implementation authorization`

This method is subordinate to founder/product decisions, approved architecture, approved ADRs and verified runtime reality.

## 5. Evidence baseline

The current external research baseline includes DDD bounded-context guidance, PostgreSQL concurrency/locking guidance, OWASP ASVS 5.0.0, and NIST SSDF material. External research is evidence about engineering practice, not evidence about ASAS runtime state.

## 6. Required synchronization

The following artifacts must reference this method when their route changes:

- Blueprint;
- Roadmap;
- Context Prompt;
- Master Execution Path;
- Current Session State;
- relevant contracts/registers.

Historical artifacts remain historical and are not rewritten merely to remove old methodology.
