# ASAS Canonical Artifact Register

Status: CANONICAL FOUNDATION CONTROL
Version: 1.2

## Purpose

This register identifies the repository's authoritative, derived, operational, evidence, compatibility, and historical artifacts. It must describe the repository as it actually exists at the current ref; it must not describe an ideal future tree as if it were present.

## Authority classes

- **A1 — Source of record:** authoritative business/architecture decision.
- **A2 — Canonical executable shadow:** machine-readable artifact derived from A1 and consumed by tooling.
- **A3 — Operational state:** current verified repository/session state.
- **A4 — Procedure:** workflow/runbook/instruction; cannot override A1/A2.
- **A5 — Evidence:** proof of an observed condition; never a substitute for a contract.
- **H — Historical:** retained for provenance only; never current source of truth.
- **C — Compatibility:** retained only to preserve an explicit legacy path/reference.

## Canonical handoff chain

| Artifact | Authority | Required for Claude | Rule |
|---|---|---:|---|
| `AGENTS.md` | A4 | YES | Root operating contract |
| `docs/handoff/CLAUDE-START-HERE.md` | A4 | YES | Entry point |
| `docs/handoff/CLAUDE-IMPLEMENTATION-BOUNDARY.md` | A4 | YES | Implementation boundary |
| `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md` | A4 | YES | Execution sequence |
| `docs/handoff/CURRENT-SESSION-STATE.md` | A3 | YES | Sole current checkpoint |
| `docs/handoff/CLAUDE-CONTEXT-INDEX.md` | A4 | YES | Context routing |
| `docs/governance/FOUNDATION-GATE-REGISTER.md` | A3 | YES | Operational gate status |
| `docs/governance/CANONICAL-ARTIFACT-REGISTER.md` | A3 | YES | Artifact authority/status |
| `docs/governance/CONTRACT-RECONCILIATION-PROTOCOL.md` | A4 | YES | Conflict resolution |
| `docs/governance/RECONCILIATION-RECORD-TEMPLATE.md` | A4 | WHEN RECONCILING | Evidence format |
| `docs/governance/FOUNDATION-READINESS-AUTHORITY.md` | A4 | WHEN EVALUATING READINESS | Single readiness ownership contract |

## Machine-readable artifacts actually present

| Artifact | Authority | Current state | Notes |
|---|---|---|---|
| `registers/events.json` | A2 | INGESTED / DERIVED | Blueprint Appendix C; 103 events |
| `registers/permissions.csv` | A2 | INGESTED / DERIVED | Blueprint Appendix A; 50 permission rows |
| `registers/state-machines.json` | A2 | INGESTED / DERIVED | Blueprint Appendix B; 11 machines |
| `registers/tasks.index.json` | A2 | DERIVATION CONTROL | Declared 114 vs observed 119 top-level tasks remains open |
| `registers/tasks/phase-P.json` | A2 | INGESTED / SHARD | Phase P source shard; 9 tasks |
| `schema/asas-contracts.index.json` | A2 | DERIVATION CONTROL | Target schema index only; contract body is not present |
| `design/design-tokens.json` | A2 | INGESTED / DERIVED | Blueprint Appendix U |
| `design/component-inventory.md` | A2 | INGESTED / DERIVED | Blueprint Appendix U.5/U.6 |
| `registers/BLUEPRINT-SOURCE-OBSERVATIONS.json` | A5 | OBSERVATION MANIFEST | Source/package observations |

## Machine-readable artifacts referenced by specifications but NOT currently present

| Artifact | Intended authority | State | Required action |
|---|---|---|---|
| `registers/tasks.json` | A2 | NOT PRESENT | Preserve sharded/indexed form until complete reconciliation; do not fabricate |
| `schema/asas-contracts.prisma` | A2 | NOT PRESENT | Extract/reconcile before schema implementation |

## Repository organization artifacts

| Artifact | Role |
|---|---|
| `docs/governance/REPOSITORY-STRUCTURE-CONTRACT.md` | Canonical directory semantics |
| `docs/governance/REPOSITORY-HANDOFF-MAP.md` | Navigation and handoff routing |
| `docs/governance/REPOSITORY-FILE-ORGANIZATION-AND-NAMING-STANDARD.md` | Proposed naming/organization standard; review gate before promotion |
| `docs/governance/FOUNDATION-CANONICAL-ARTIFACTS.md` | Foundation navigation index |
| `docs/governance/FOUNDATION-GATE-MATRIX.md` | Gate definitions/dependencies; status authority remains the Gate Register |
| `docs/governance/FOUNDATION-GATE-REGISTER.md` | Current gate status |

## Foundation safety controls

| Artifact | Classification | Purpose |
|---|---|---|
| `docs/audit/PLATFORM-IDENTITY-VERIFICATION-CONTRACT.md` | A4 | Fail-closed platform identity requirements before schema-affecting work |
| `scripts/foundation/verify-platform-identity.sh` | A4 / operational guard | Runtime Supabase project identity pre-flight check |
| `docs/governance/FOUNDATION-READINESS-AUTHORITY.md` | A4 | Prevent competing readiness authorities |

## Handoff compatibility artifact

`docs/handoff/SESSION_STATE.md` is retained as a compatibility/history stub. It is not a current checkpoint. New automation and documentation must use `docs/handoff/CURRENT-SESSION-STATE.md`.

## Source and provenance controls

`docs/governance/BLUEPRINT-DERIVATION-PROVENANCE.md` records the source-to-shadow derivation policy. `docs/governance/SOURCE-REGISTER-RECONCILIATION-REPORT.md` records the verified source-package baseline and must be read as a dated reconciliation snapshot, not as a live inventory of the repository.

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
