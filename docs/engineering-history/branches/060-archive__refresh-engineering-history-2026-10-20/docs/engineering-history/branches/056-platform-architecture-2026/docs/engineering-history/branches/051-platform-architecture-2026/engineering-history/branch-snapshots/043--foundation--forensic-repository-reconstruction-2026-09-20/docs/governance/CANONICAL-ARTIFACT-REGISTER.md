# ASAS Canonical Artifact Register

Status: CANONICAL FOUNDATION CONTROL
Version: 1.1
Date: 2026-09-20

## Purpose

This register defines which repository artifacts are authoritative, which are derived, and which are historical or not yet promoted. It prevents Claude or another implementation agent from assuming that a referenced artifact exists merely because an instruction mentions it.

## Authority classes

- **A1 — Source of record:** authoritative business/architecture decision.
- **A2 — Canonical executable shadow:** machine-readable artifact derived from A1 and consumed by tooling.
- **A3 — Operational state:** current verified repository/session state.
- **A4 — Procedure:** workflow/runbook/instruction; cannot override A1/A2.
- **A5 — Evidence:** proof of an observed condition; never a substitute for a contract.
- **H — Historical:** retained for provenance only; never a current source of truth.

## Canonical handoff chain

| Artifact | Authority | Required for Claude | Rule |
|---|---|---:|---|
| `AGENTS.md` | A4 | YES | Root operating contract |
| `docs/handoff/CLAUDE-START-HERE.md` | A4 | YES | Entry point; cannot override higher authority |
| `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md` | A4 | YES | Execution sequence |
| `docs/handoff/CURRENT-SESSION-STATE.md` | A3 | YES | Sole current checkpoint |
| `docs/handoff/CLAUDE-CONTEXT-INDEX.md` | A4 | YES | Context routing |
| `docs/governance/FOUNDATION-GATE-REGISTER.md` | A3 | YES | Gate status |
| `docs/governance/CONTRACT-RECONCILIATION-PROTOCOL.md` | A4 | YES | Conflict resolution |
| `docs/governance/RECONCILIATION-RECORD-TEMPLATE.md` | A4 | WHEN RECONCILING | Evidence format |
| `docs/governance/REPOSITORY-REALITY-MAP.md` | A5/A3-derived | YES for forensic state | Observed repository reality; never overrides contracts |
| `docs/audit/FORENSIC-REPOSITORY-RECONSTRUCTION-2026-09-20.md` | A5 | YES for audit continuation | Evidence-backed forensic findings |
| `docs/governance/FOUNDER-DECISIONS.md` | A1 decision boundary | WHEN BLOCKED | Escalation register; open items do not authorize implementation |

## Current machine-readable shadows

The following source-derived artifacts are now present on `main`/the current foundation line. Their presence does **not** mean they are fully reconciled or implementation-authoritative.

| Artifact | Authority | Current state | Verification state |
|---|---|---|---|
| `registers/events.json` | A2 derived from Blueprint Appendix C | PRESENT | PARTIAL — source/provenance recorded; runtime enforcement absent |
| `registers/permissions.csv` | A2 derived from Blueprint Appendix A | PRESENT | PARTIAL — source/provenance recorded; executable enforcement absent |
| `registers/state-machines.json` | A2 derived from Blueprint Appendix B | PRESENT | PARTIAL — source/provenance recorded; executable enforcement absent |
| `registers/tasks.index.json` | A2 reconciliation index | PRESENT | OPEN — 114 vs 119/121 discrepancy preserved |
| `registers/tasks/phase-P.json` | A2 derived task shard | PRESENT | VERIFIED for the nine Phase-P source tasks per checkpoint |
| `schema/asas-contracts.index.json` | A2 reconciliation index | PRESENT | OPEN — historical 59/16/15 vs observed 59/17/56 |
| `schema/asas-contracts.prisma` | A2 executable shadow | NOT PRESENT | BLOCKED pending complete source extraction/reconciliation |
| `registers/tasks.json` | A2 full task shadow | NOT PRESENT | BLOCKED pending full task reconciliation |
| `design/design-tokens.json` | A2 design shadow | PRESENT | SOURCE-DERIVED; promotion/validation status governed by foundation gates |
| `design/component-inventory.md` | A2 component contract | PRESENT | SOURCE-DERIVED; validation status governed by foundation gates |

## Critical rule

A reference to a missing canonical artifact is a foundation gap, not permission to invent a replacement. The correct action is to extract and reconcile the artifact from its authoritative source, record provenance, validate internal consistency, then promote it to canonical status.

## Historical material

Uploaded/source-package files remain research inputs unless explicitly promoted. Copies, generated summaries, and prior conversation artifacts do not become canonical merely by being committed.

`docs/handoff/SESSION_STATE.md` is retained as historical compatibility material and is not the current checkpoint.

## Promotion rule

An artifact may become canonical only when:

1. its authority source is identified;
2. provenance is recorded;
3. terminology and IDs are reconciled;
4. internal references resolve;
5. required validation passes;
6. the gate register is updated with evidence.

## Anti-drift rule

Never edit a canonical register merely to make it agree with implementation. If implementation conflicts with the register, stop, classify the conflict, and reconcile the contract first.

## Forensic correction

This version corrects the previous inventory statement that the event/permission/state-machine shadows were absent. They are present in the audited repository tree. Presence is not equivalent to full implementation verification.
