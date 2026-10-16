# ASAS Canonical Artifact Register

Status: CANONICAL FOUNDATION CONTROL
Version: 1.0

## Purpose

This register defines which repository artifacts are authoritative, which are derived, and which are not yet present. It prevents Claude or another implementation agent from assuming that a referenced artifact exists merely because an instruction mentions it.

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

## Canonical machine registers

The architecture package specifies the following as required executable shadows. They are **NOT yet present on the canonical `main` branch** and therefore must not be fabricated from memory:

| Artifact | Intended authority | Current repository state | Unlock condition |
|---|---|---|---|
| `registers/tasks.json` | A2 | NOT PRESENT | Extract/reconcile from approved Blueprint |
| `registers/events.json` | A2 | NOT PRESENT | Extract/reconcile from approved Blueprint |
| `registers/permissions.csv` | A2 | NOT PRESENT | Extract/reconcile from approved Blueprint |
| `registers/state-machines.json` | A2 | NOT PRESENT | Extract/reconcile from approved Blueprint |
| `schema/asas-contracts.prisma` | A2 | NOT PRESENT | Reconcile complete target schema from approved source |
| `design/design-tokens.json` | A2 | NOT PRESENT | Reconcile design-system source |
| `design/component-inventory.md` | A2 | NOT PRESENT | Reconcile component contract |

## Critical rule

A reference to a missing canonical artifact is a **foundation gap**, not permission to invent a replacement. The correct action is to extract and reconcile the artifact from its authoritative source, record provenance, validate internal consistency, then promote it to canonical status.

## Historical material

Uploaded/source-package files remain research inputs unless explicitly promoted. Copies, generated summaries, and prior conversation artifacts do not become canonical merely by being committed.

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
