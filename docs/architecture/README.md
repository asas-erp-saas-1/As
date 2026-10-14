# ASAS Architecture Program Index

**Status:** NAVIGATION / ORGANIZATION CONTROL — NOT A SOURCE OF ARCHITECTURE AUTHORITY  
**Repository:** `asas-erp-saas-1/As`  
**Active Engineering Conference line:** `platform-architecture-2026`  
**Current index work:** `chore/engineering-corpus-index-2026-10-14`  
**Last indexed:** 2026-10-14

> This file is a navigation map. It does not approve an architecture decision, close a gate, promote an artifact, or authorize code/schema/database work. If this index conflicts with a canonical artifact or verified runtime evidence, the higher-authority source wins.

## 1. Start here — mandatory control plane

Load these in order when resuming architecture engineering:

| Order | Artifact | Purpose / authority |
|---:|---|---|
| 1 | [`AGENTS.md`](../../AGENTS.md) | Root engineering operating contract; stop conditions, source authority and executor rules. |
| 2 | [`CURRENT-SESSION-STATE.md`](../handoff/CURRENT-SESSION-STATE.md) | Sole active work checkpoint. Always re-read from the current branch; do not trust stale checkpoint SHAs. |
| 3 | [Engineering Conference Constitution](conference/ASAS-ENGINEERING-CONFERENCE-CONSTITUTION-2026.md) | Governance of the conference process. |
| 4 | [Engineering Conference Gate Model](conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md) | Sole owner of GATE-00…GATE-07 semantics. |
| 5 | [Engineering Closure Matrix](../governance/ENGINEERING-CLOSURE-MATRIX-2026.md) | Gate and track evidence/closure state. |
| 6 | [Domain Engineering Track Register](DOMAIN-ENGINEERING-TRACK-REGISTER-2026.md) | D01–D09 domain work packages and C01–C22 track routing. |
| 7 | [Engineering Source of Truth](ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md) | Consolidated routing, provenance, open conflicts and dependencies; not a replacement for A1/A2 sources. |
| 8 | [Canonical Artifact Register](../governance/CANONICAL-ARTIFACT-REGISTER.md) | Authority classes, canonical owners and promotion rules. |
| 9 | [Master Execution Path](../handoff/ASAS-MASTER-EXECUTION-PATH.md) | Ordered architecture and downstream execution route. |
| 10 | The affected ADR, contract, register, research record or task packet | Read dependencies named by the task before making a change. |

## 2. Canonical architecture and engineering baseline

| Artifact | Role | Caution |
|---|---|---|
| [Platform Architecture Blueprint 2026](ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md) | Proposed target architecture and principles. | A target-state document is not proof of implementation or runtime state. |
| [Architecture Engineering Roadmap 2026](ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md) | Ordered engineering and verification route. | Apply amendments only where they explicitly supersede the baseline. |
| [Architecture Context Prompt 2026](ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md) | AI/engineering context, discovery and evidence rules. | It cannot override product authority, ADRs, registers or runtime reality. |
| [Context / Domain / Module Evidence Matrix](ASAS-CONTEXT-DOMAIN-MODULE-EVIDENCE-MATRIX-2026.md) | Derived evidence for domain grouping and candidate module ownership. | Proposed mappings do not become implementation ownership merely by appearing here. |
| [Unit / Reservation Consistency Contract](ASAS-UNIT-RESERVATION-CONSISTENCY-CONTRACT-2026.md) | Reservation consistency baseline. | Its status remains partial / implementation unverified where stated. |
| [Commercial / Finance Semantic Reconciliation](ASAS-COMMERCIAL-FINANCE-SEMANTIC-RECONCILIATION-2026.md) | Sales/finance vocabulary and dependency reconciliation. | Not an executable finance contract. |
| [ADR Register](ASAS-ADR-REGISTER-2026.md) | Index across the two ADR directories. | The register is an index, not itself a decision. |

### Missing-reference alert — do not silently fill

Multiple artifacts refer to `docs/architecture/ASAS-ARCHITECTURE-V3.md` as an A1 architecture authority, but that file was not present at that path on the indexed base branch during this task. Its absence has also been recorded by the architecture-integrity review on another branch.

Treat the V3 source as **NOT PRESENT / OWNER RESOLUTION REQUIRED** until the authorized source is supplied or the canonical artifact register is formally corrected. Do not fabricate a replacement or infer that an amendment alone reproduces the missing source.

## 3. Architecture corpus map

The repository is organized by evidence role and engineering purpose. Existing historical artifacts remain in their current paths until ownership, references and provenance have been reconciled. Do not mass-move files for visual neatness.

### 3.1 Decisions and authority

- `docs/architecture/decisions/` — principal established ADR line (ADR-0021 onward in the current register).
- `docs/architecture/adr/` — later ADR line and reconciliation decisions.
- `docs/architecture/ASAS-ADR-REGISTER-2026.md` — searchable index of both locations and known numbering/provenance gaps.
- `docs/governance/FOUNDER-DECISIONS.md` — questions reserved to founder/security/legal/production authority.
- `docs/governance/OPEN-CONTRACT-CONFLICTS.md` — material unresolved source/contract conflicts.

**Rule:** do not renumber or move ADRs until references and history are checked. An ADR mentioned in a document but missing from the current branch remains a provenance gap, not an assumed decision.

### 3.2 Contracts, invariants and state models

- `docs/architecture/contracts/` — domain contracts and lifecycle/consistency contracts.
- `docs/architecture/` (root) — older contracts, registers and reconciliation documents preserved in their historical paths.
- `docs/architecture/ASAS-COMMAND-ACTION-CONTRACT-REGISTER-2026.md` — command/action inventory and contract fields.
- `docs/architecture/ASAS-AGGREGATE-INVARIANT-BOUNDARY-REGISTER-2026.md` — aggregate and invariant boundary evidence.
- `docs/architecture/ASAS-CONTEXT-MODULE-OWNERSHIP-MAP-2026.md` — context/module ownership map where present on the selected branch.
- `registers/state-machines.json` — canonical machine-readable state-machine register.
- `registers/events.json` — canonical machine-readable event register.
- `registers/permissions.csv` — canonical machine-readable permission register.

**Rule:** contract terminology must reconcile with the machine-readable registers. Do not create new state values, event names or permission keys merely to make a contract appear complete. Register deltas require owner ratification and synchronized validation.

### 3.3 Engineering Conference and domain workspaces

- `docs/architecture/conference/` — conference constitution, Gate Model and decision process.
- `docs/architecture/reconciliation/phase-c/C01/` … `C22/` — stable per-track reconciliation workspaces.
- `docs/architecture/reconciliation/phase-c/Source/` — source/provenance corpus and source registers; not an alternative source of truth.
- `docs/architecture/task-packets/` — scoped engineering packets and dependency definitions.

The C-tracks are conference workstreams. They are not bounded contexts and are not a second authorization route. Each `CNN/README.md` must route to canonical decisions, supporting/historical sources, open questions, evidence and current disposition. A folder or populated README does not prove closure.

### 3.4 Research, reconciliation and evidence

- `docs/architecture/research/` — research records that inform decisions.
- `docs/architecture/reconciliation/` — provenance, source conflicts, brownfield/schema reconciliation and control findings.
- `docs/architecture/amendments/` — one amendment lineage; use each document's supersession statement rather than assuming numeric order alone determines authority.
- `docs/architecture/` root amendments — older amendment lineage retained in place for provenance.
- `docs/audit/` and `docs/audits/` — both directories exist as separate evidence collections; do not collapse them until their ownership and references are reconciled.

Research supports decisions; it is not a product decision. An audit finding records evidence; it does not itself authorize destructive remediation.

### 3.5 Product, handoff and governance

- `docs/product/` — requirements baseline and product amendments.
- `docs/handoff/` — execution route, active checkpoint and agent entry points.
- `docs/governance/` — artifact authority, closure matrices, branch hygiene, founder-decision and reconciliation controls.
- `AGENTS.md` — root operating contract.
- `docs/handoff/CODEX-START-HERE.md` — Codex entry point.
- `docs/handoff/CLAUDE-START-HERE.md` — specialized design/visual collaboration entry point; it does not override `AGENTS.md`.

### 3.6 Machine-readable engineering inputs

| Path | Purpose | Current known caveat |
|---|---|---|
| `registers/events.json` | Domain event vocabulary and emission groups | Structural inventory does not by itself prove every contract is aligned. |
| `registers/permissions.csv` | Permission keys and persona matrix | System-principal authority may need representation beyond persona columns. |
| `registers/state-machines.json` | Canonical state machines | Contracts must reconcile to this source through an approved decision. |
| `registers/tasks.index.json` and `registers/tasks/` | Task shards and index | Task count/source edition reconciliation remains required. |
| `schema/asas-contracts.index.json` | Schema source/contract inventory | Not an executable schema. |
| `schema/asas-contracts.prisma` | Intended executable schema path | Not present on the indexed base snapshot; no schema promotion is implied. |
| `design/design-tokens.json` | Design tokens | Source-derived; preserve provenance. |
| `design/component-inventory.md` | Component inventory | Inventory is not proof of implemented UI coverage. |
| `config/platform-identity.json` | Declared platform identity contract | Does not replace provider-side/runtime evidence. |
| `scripts/` | Safe identity and engineering-integrity guards | A guard must be executed, and results tied to a commit, before it counts as verification. |
| `.github/workflows/` | CI verification definitions | Workflow presence is not a successful workflow run. |
| `.agents/skills/` | Task-routed procedural skills for Codex | Skills are procedures; they cannot override architecture authority. |

## 4. Source-of-truth and provenance rules

1. **Reality → provenance → authority → reconciliation → model → contract → verification → implementation.**
2. For existing systems, verified live runtime/database evidence outranks repository assumptions. For desired future behavior, founder/product decisions outrank proposals.
3. A1 decisions and A2 machine-readable registers must have one canonical owner each.
4. Derived indexes and summaries point to their source; they must not introduce a second authority.
5. A file with `PROPOSED`, `OPEN`, `PARTIAL`, `BLOCKED` or `NOT EXECUTED` status must remain so until the relevant evidence and authority requirements are met.
6. Keep the evidence needed to explain why a previous decision was superseded. Do not erase contradictions by editing only the summary.
7. A source package is research/provenance input unless its role is explicitly promoted by an authorized decision.
8. No mass rename/delete/move of historical architecture files. Inventory, resolve links, mark canonical owner, and preserve provenance first.
9. Branch content does not become canonical because it is newer, longer, or located in the most recently created branch.
10. No schema, migration, RLS, application feature or production work is authorized by this index.

## 5. Branch and corpus inventory links

- [Branch inventory and safe reconciliation plan](../governance/BRANCH-INVENTORY-AND-RECONCILIATION-2026-10-14.md)
- [Unmerged-branch promotion review (2026-10-15)](reconciliation/ASAS-UNMERGED-BRANCH-PROMOTION-REVIEW-2026-10-15.md)
- [Branch hygiene register](../governance/BRANCH-HYGIENE-REGISTER.md)
- [Canonical artifact register](../governance/CANONICAL-ARTIFACT-REGISTER.md)
- [Engineering closure matrix](../governance/ENGINEERING-CLOSURE-MATRIX-2026.md)

The branch inventory is a dated evidence snapshot. Recheck GitHub PR state, branch heads, deployment references, protection rules and unique commits before cleanup.
