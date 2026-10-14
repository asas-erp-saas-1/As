# ASAS Branch Inventory and Reconciliation Record

**Record ID:** ASAS-GOV-BRANCH-INVENTORY-2026-10-14  
**Status:** EVIDENCE SNAPSHOT — REVIEW REQUIRED BEFORE CLEANUP  
**Repository:** `asas-erp-saas-1/As`  
**Inventory date:** 2026-10-14  
**Active Engineering Conference line (per canonical governance):** `platform-architecture-2026`  
**GitHub default branch:** `main` (not the active Engineering Conference work line)  
**Task branch creating this record:** `chore/engineering-corpus-index-2026-10-14`

## 1. Purpose and safety boundary

This inventory records remote branch names, verified comparison results, likely duplicate refs, open-PR associations surfaced during discovery, and the next safe reconciliation actions.

It is a dated snapshot, not live branch protection or deployment evidence. Branch names are not authority. A newer-looking branch does not become canonical automatically, and a branch's existence does not mean its changes were merged or deployed.

**No branch was deleted, renamed, reset, rebased, force-pushed, or merged to create this inventory.** Cleanup must be a separate, reviewed operation after the unique commits, open PRs, deployment references and unmerged evidence have been checked.

## 2. Control refs — keep these distinctions explicit

| Ref | Role in current governance | Evidence / action |
|---|---|---|
| `main` | GitHub default branch; not the active Engineering Conference work line. PR target is task-specific. | Compare reports divergence from `platform-architecture-2026`: 3 commits unique to `main`, 521 commits unique to the architecture line, 292 files in the compare response. Review the three main-only commits before any convergence. |
| `platform-architecture-2026` | Canonical active Engineering Conference line according to `ENGINEERING-CLOSURE-MATRIX-2026.md` and `CURRENT-SESSION-STATE.md` | Preserve as the base for architecture-control work unless governance explicitly changes. Do not treat its old checkpoint text as fresh runtime evidence. |
| `cline/hp1c6fdq` | Material unmerged architecture-reconciliation work | Compare reports 14 commits ahead and 0 behind the architecture line, with 57 changed files. Contains ADR-0038–0041, hold/edge contracts, integrity findings and a CI repair proposal. These changes are not assumed canonical until reviewed and promoted through a PR. |
| `chore/engineering-corpus-index-2026-10-14` | This task-scoped inventory/index branch | Created from `platform-architecture-2026`; contains only branch/corpus indexing changes in this workstream. |
| `foundation/repository-governance` | Historical foundation/governance line; not the active conference line | Compared as 34 commits ahead and 548 behind `platform-architecture-2026`, with 33 files in the compare response. Preserve as provenance; do not select as an implementation base. |
| `foundation/repository-file-organization-v1` | Historical repository-organization work / open PR #13 | Compared as 72 commits ahead and 521 behind the architecture line, with 35 files in its compare response. Review unique governance improvements; avoid wholesale cherry-picking. |
| `foundation/forensic-repository-reconstruction-2026-09-20` | Dated forensic remediation branch / open PR #16 | Compared as 0 commits ahead and 506 behind the architecture line. Historical evidence remains useful; it is not a current base. |

## 3. Branch census

The remote branch-search endpoint returned **46 existing branch refs before this task branch was created**. The new task branch brings the observed total to 47, assuming no concurrent ref changes. Names are grouped below to keep the inventory readable while preserving every discovered ref.

### 3.1 Foundation branches

- `foundation/architecture-lineage-reconciliation-v1`
- `foundation/blueprint-canonical-shadows`
- `foundation/blueprint-register-ingestion`
- `foundation/c2-001-traceability-v1`
- `foundation/claude-agent-operating-protocol-v1`
- `foundation/external-audit-integration-v1`
- `foundation/forensic-repository-reconstruction-2026-09-20`
- `foundation/reconcile-context-map-v2`
- `foundation/repository-file-organization-v1`
- `foundation/repository-governance`
- `foundation/source-authority-ledger-v1`

These branches contain source-lineage, task/schema extraction, governance, context-map and audit artifacts. Treat their contents as provenance until each item is reconciled against the current canonical branch. Do not merge these branches wholesale.

### 3.2 Command-contract / registry family

- `feat/foundation-closure-pass-2`
- `feat/foundation-command-contract-final`
- `feat/foundation-command-contract-final-2`
- `feat/foundation-command-contract-final-3`
- `feat/foundation-command-contract-final-4`
- `feat/foundation-command-contract-final-5`
- `feat/foundation-command-contract-final-6`
- `feat/foundation-command-contract-final-7`
- `feat/foundation-command-contract-final-8`
- `feat/foundation-command-contract-pass`
- `feat/foundation-command-contract-pass-2`
- `feat/foundation-command-contract-pass-3`
- `feat/foundation-command-contract-pass-4`
- `feat/foundation-command-contract-pass-5`
- `feat/foundation-command-registry`
- `feat/foundation-command-registry-2`
- `feat/foundation-command-registry-3`
- `feat/foundation-command-registry-4`

Verified ref comparisons show the eight `command-contract-final` variants and five `command-contract-pass` variants are identical to one another. The `command-registry-2/-3/-4` refs are identical to one another and to `foundation/closure-pass-2`; the `command-registry` ref itself is 38 commits ahead of that older snapshot in the comparison performed. The command-contract snapshot compares as 60 commits ahead / 557 behind the active architecture line, with 44 changed files; `command-registry` compares as 98 ahead / 557 behind, with 67 files. These are historical proposal lines, not safe merge units.

**Disposition:** retain for provenance now; do not open additional PRs for identical heads. Resolve open-PR association and preserve any unique commit/evidence before administrative cleanup.

### 3.3 Platform-identity / IAM family

- `feat/foundation-platform-identity-gate`
- `feat/foundation-platform-identity-gate-2`
- `feat/foundation-platform-identity-gate-3`
- `feat/foundation-platform-identity-gate-4`
- `feat/foundation-platform-identity-gate-5`
- `feat/foundation-platform-identity-gate-6`
- `feat/foundation-platform-identity-gate-7`
- `feat/foundation-platform-identity-gate-8`
- `feat/foundation-platform-identity-gate-9`
- `feat/foundation-platform-identity-gate-10`
- `feat/phase-1-iam-foundation`

The ten `foundation-platform-identity-gate` refs were verified identical to each other. Their exact divergence from the active architecture line was not independently captured in this inventory. The IAM branch is an older feature ref and must not be treated as authorization to begin IAM implementation: the canonical checkpoint still marks implementation and schema work unauthorized.

### 3.4 Event/permission closure and temporary refs

- `feat/foundation-event-permission-command-closure`
- `x`
- `x2`

Comparison shows `feat/foundation-event-permission-command-closure`, `feat/phase-1-iam-foundation`, `x` and `x2` have identical heads. The event/permission branch compares as 55 commits ahead / 557 behind the active architecture line, with 40 files. Keep the temporary names only until open-PR and unique-content checks are complete; do not delete on name alone.

### 3.5 Other refs

- `cline/hp1c6fdq` — significant 14-commit reconciliation line; see §2.
- `main` — default/integration branch; see §2.
- `platform-architecture-2026` — active Engineering Conference line; see §2.

## 4. Open pull requests observed

The GitHub PR fetch endpoint confirmed these surfaced PRs were open and marked draft at the time of inspection:

| PR | Head branch | Purpose | Disposition |
|---|---|---|---|
| [#17](https://github.com/asas-erp-saas-1/As/pull/17) | `platform-architecture-2026` | Platform architecture control plane | Existing large umbrella PR; do not merge wholesale as part of branch cleanup. |
| [#16](https://github.com/asas-erp-saas-1/As/pull/16) | `foundation/forensic-repository-reconstruction-2026-09-20` | Forensic repository reconstruction | Keep as historical review record; recheck whether any unique remediation remains unpromoted. |
| [#14](https://github.com/asas-erp-saas-1/As/pull/14) | `foundation/external-audit-integration-v1` | External audit integration | Review/close explicitly after mapping findings to current canonical artifacts. |
| [#13](https://github.com/asas-erp-saas-1/As/pull/13) | `foundation/repository-file-organization-v1` | Repository organization and naming | Reuse accepted governance changes selectively; do not merge stale control-plane copies without reconciliation. |
| [#12](https://github.com/asas-erp-saas-1/As/pull/12) | `foundation/architecture-lineage-reconciliation-v1` | Architecture lineage reconciliation | Check unique provenance and links. |
| [#9](https://github.com/asas-erp-saas-1/As/pull/9) | `foundation/claude-agent-operating-protocol-v1` | Agent operating protocol | Compare with current `AGENTS.md` and context prompt before disposition. |
| [#8](https://github.com/asas-erp-saas-1/As/pull/8) | `foundation/source-authority-ledger-v1` | Source authority ledger | Reconcile its useful provenance into the current owner rather than creating a parallel authority. |
| [#6](https://github.com/asas-erp-saas-1/As/pull/6) | `foundation/reconcile-context-map-v2` | Proposed 15-context/module map | Keep proposal status explicit; do not promote without evidence and proper authority. |
| [#5](https://github.com/asas-erp-saas-1/As/pull/5) | `foundation/blueprint-canonical-shadows` | Blueprint extraction/register controls | Reconcile source-derived registers and count differences. |

This is the set surfaced and explicitly fetched during this inspection, not a claim that GitHub contains no other PRs. Recheck current PR state before any cleanup or closure action.

## 5. Evidence-backed comparison summary

| Comparison | Result captured | Interpretation |
|---|---|---|
| `main` vs `platform-architecture-2026` | Diverged; architecture line +521; main +3; 292 files | Three main-only commits need disposition; no blind merge/reset. |
| `platform-architecture-2026` vs `cline/hp1c6fdq` | Cline +14, base +0; 57 files | Useful recent work not yet promoted to the declared active line. |
| `platform-architecture-2026` vs `foundation/repository-governance` | Governance +34, base +548; 33 files | Old line with unique history and high divergence. |
| `platform-architecture-2026` vs `foundation/repository-file-organization-v1` | Organization +72, base +521; 35 files | Review unique organization/CI changes separately. |
| `platform-architecture-2026` vs `foundation/forensic-repository-reconstruction-2026-09-20` | Forensic +0, base +506 | Ancestor/history reference, not a current work base. |
| Command-contract family | 13 named branches resolve to identical head(s) | Name multiplicity overstates independent work. |
| Platform-identity family | 10 named branches identical to each other | Consolidation candidate after PR/deployment/unique-evidence checks. |
| Event/permission/IAM/temp family | Four refs identical | Consolidation candidate after the same checks. |

Compare API file lists can be truncated for very large differences. Counts are comparison-response observations, not a substitute for inspecting the exact patch or a tree-level SHA audit before a destructive action.

## 6. Canonical policy and cleanup order

1. **Inventory first.** Maintain this record and update it whenever a branch is promoted, abandoned or archived.
2. **Protect active references.** Before any delete, check open PR base/head, branch protection, Vercel deployment/ref usage, Actions workflows and release automation.
3. **Resolve unique commits.** Compare candidate branch against its proposed retained ref; inspect files and commit messages; preserve unique evidence in a canonical file or reviewed PR.
4. **Promote by topic.** Use small PRs against `platform-architecture-2026` for active conference changes. Do not merge a historical branch wholesale just to reduce branch count.
5. **No destructive Git operation by default.** Branch deletion/renaming, force-push, reset and rebase require separate explicit authorization and evidence.
6. **Reconcile PRs.** An identical branch head does not mean the associated PR is safe to close: verify its base branch, comments, review state and unique PR-only discussion.
7. **Verify after every promotion.** Record the resulting head SHA, compare result, changed files, CI result and canonical index updates.

## 7. Immediate next steps

- **Completed 2026-10-15 — `main` file-level review:** selected the C03 source register and reconciliation queue for documentation-only promotion; retained the active-line `Source/README.md` because the `main` version conflicts at the same path. Details and source blob SHAs: [promotion review](../architecture/reconciliation/ASAS-UNMERGED-BRANCH-PROMOTION-REVIEW-2026-10-15.md).
- **Completed 2026-10-15 — `cline/hp1c6fdq` first-pass grouping:** separated the semantic ADR/contract bundle, C-track disposition/provenance controls, checkpoint contradiction, index collision, and CI-repair proposal. No wholesale promotion is recommended.
- **Next:** prepare a task-scoped owner review for ADR-0038…0041, the Hold contract and edge matrix after reconciling the candidate checkpoint's stale unresolved list; keep permission deltas unratified until Security/Tenancy approval.
- **Separate control-plane task:** validate the integrity script and CI patch; do not claim CI repaired until workflow permissions are available and fresh checks pass.
- Verify PR and deployment references for identical branch families before any deletion proposal. Update this inventory after each accepted PR; do not mark a ref “cleaned” from a name comparison alone.

## 8. Non-authorizations

This record authorizes no branch deletion, PR merge/closure, force-push, reset/rebase, production change, database/schema work, or application implementation. It records a safe basis for those decisions to be made separately.
