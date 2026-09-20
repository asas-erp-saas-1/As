# ASAS Canonical Artifact Register

Status: CANONICAL FOUNDATION CONTROL
Version: 1.2
Date: 2026-09-20

## Purpose

This register defines which repository artifacts are authoritative, derived, operational, evidence, or historical. It prevents Claude or another implementation agent from assuming that a referenced artifact exists merely because an instruction mentions it.

## Authority classes

- **A1 — Source of record:** authoritative business/architecture decision.
- **A2 — Canonical executable shadow:** machine-readable artifact derived from A1 and consumed by tooling.
- **A3 — Operational state:** current verified repository/session state.
- **A4 — Procedure:** workflow/runbook/instruction; cannot override A1/A2.
- **A5 — Evidence:** proof of an observed condition; never a substitute for a contract.
- **A6 — Consolidated engineering control:** cross-source synthesis used for routing, reconciliation and context; cannot silently override an A1 source.
- **H — Historical:** retained for provenance only; never a current source of truth.

## Single consolidation resource

`docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`

This is the canonical consolidation/routing resource for the 2026 architecture program. It records provenance, reconciled facts, conflicts, current statuses and next checkpoints. It does **not** erase source authority. Domain-specific canonical artifacts remain authoritative for their own concepts.

## Canonical handoff chain

| Artifact | Authority | Required for Claude | Rule |
|---|---|---:|---|
| `AGENTS.md` | A4 | YES | Root operating contract |
| `docs/handoff/CLAUDE-START-HERE.md` | A4 | YES | Entry point; cannot override higher authority |
| `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md` | A4 | YES | Execution sequence |
| `docs/handoff/CURRENT-SESSION-STATE.md` | A3 | YES | Sole current checkpoint |
| `docs/handoff/CLAUDE-CONTEXT-INDEX.md` | A4 | YES | Context routing |
| `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md` | A6 | YES | Consolidated architecture-engineering truth/routing resource |
| `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` | A1 candidate | YES | Desired architecture; unresolved items remain blocked |
| `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` | A4/A6 | YES | Ordered engineering route |
| `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` | A4/A6 | YES | AI engineering operating context |
| `docs/governance/FOUNDATION-GATE-REGISTER.md` | A3 | YES | Gate status |
| `docs/governance/CONTRACT-RECONCILIATION-PROTOCOL.md` | A4 | YES | Conflict resolution |
| `docs/governance/RECONCILIATION-RECORD-TEMPLATE.md` | A4 | WHEN RECONCILING | Evidence format |
| `docs/governance/REPOSITORY-REALITY-MAP.md` | A5/A3-derived | YES for forensic state | Observed repository reality; never overrides contracts |
| `docs/audit/FORENSIC-REPOSITORY-RECONSTRUCTION-2026-09-20.md` | A5 | YES for audit continuation | Evidence-backed forensic findings |
| `docs/governance/FOUNDER-DECISIONS.md` | A1 decision boundary | WHEN BLOCKED | Escalation register; open items do not authorize implementation |

## Current machine-readable shadows

| Artifact | Authority | Current state | Verification state |
|---|---|---|---|
| `registers/events.json` | A2 derived from source Blueprint | PRESENT | VERIFIED structurally — 103 events / 11 groups |
| `registers/permissions.csv` | A2 derived from source Blueprint | PRESENT | VERIFIED structurally — 50 keys / 8 persona columns |
| `registers/state-machines.json` | A2 derived from source Blueprint | PRESENT | VERIFIED structurally — 11 machines |
| `registers/tasks.index.json` | A2 reconciliation index | PRESENT | OPEN/RECONCILED — historical counts preserved |
| `registers/tasks/phase-P.json` | A2 derived task shard | PRESENT | VERIFIED for its declared source slice |
| `schema/asas-contracts.index.json` | A2 reconciliation index | PRESENT | OPEN — source schema requires promotion/reconciliation |
| `schema/asas-contracts.prisma` | A2 executable shadow | NOT PRESENT | BLOCKED pending complete source extraction/reconciliation |
| `registers/tasks.json` | A2 full task shadow | NOT PRESENT | BLOCKED; source semantics currently represented by shards/indexes |
| `design/design-tokens.json` | A2 design shadow | PRESENT | SOURCE-DERIVED / validation governed by gates |
| `design/component-inventory.md` | A2 component contract | PRESENT | VERIFIED structurally — 42 primitives |

## Canonicality rules

1. One concept has one canonical owner.
2. A derived artifact cannot silently redefine its source.
3. Historical artifacts remain available for provenance.
4. Runtime facts are not replaced by target architecture.
5. Missing canonical artifacts are foundation gaps, not permission to invent replacements.
6. Conflicts remain `CONFLICT` until authority resolves them.
7. A status is `VERIFIED` only with objective evidence.
8. Branch content does not become canonical merely because it is newer or more detailed.
9. The consolidated Source of Truth is a routing/control resource, not a license to flatten provenance.

## Branch consolidation rule

Historical branches may be reviewed and their unique evidence incorporated into the consolidation resource. They must not be treated as active architecture authority afterward. Branch deletion requires a GitHub branch-delete capability and provenance verification. The current engineering connector exposes branch discovery and ref movement but not branch deletion; therefore branch deletion is **NOT_EXECUTED** and must not be simulated by force-moving refs.

## Promotion rule

An artifact may become canonical only when:

1. authority source is identified;
2. provenance is recorded;
3. terminology and IDs are reconciled;
4. internal references resolve;
5. required validation passes;
6. gate status is updated with evidence.

## Anti-drift rule

Never edit a canonical register merely to make it agree with implementation. If implementation conflicts with a register, stop, classify the conflict, and reconcile the contract first.

## Forensic correction

This version retains the corrected finding that event/permission/state-machine/design shadows are present. Presence is not equivalent to runtime enforcement.
