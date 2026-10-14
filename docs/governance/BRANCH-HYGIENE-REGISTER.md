# ASAS Branch Hygiene Register

**Status:** ACTIVE REPOSITORY CONTROL  
**Repository:** `asas-erp-saas-1/As`  
**Last reconciled:** 2026-10-14  
**Detailed snapshot:** [Branch Inventory and Reconciliation Record](BRANCH-INVENTORY-AND-RECONCILIATION-2026-10-14.md)

## 1. Branch roles — do not conflate them

- `main` — GitHub default branch. It is not the active Engineering Conference work line and does not authorize architecture or implementation work by itself. Each PR target must follow its task/governance route.
- `platform-architecture-2026` — active Engineering Conference work line under the current closure-matrix and checkpoint policy.
- `chore/engineering-corpus-index-2026-10-14` — task-scoped branch for the branch census and engineering corpus index. Merge only after review and verification.
- `cline/hp1c6fdq` — unmerged, materially advanced architecture-reconciliation branch with 14 commits ahead of the active line in the 2026-10-14 compare snapshot. It includes potentially useful ADR, contract, integrity and CI-repair work, but its content is not canonical until promoted by reviewed changes.

The current project doctrine has one active Engineering Conference line. Other feature/foundation refs are historical, task-scoped or unreviewed candidates until an explicit disposition is recorded.

## 2. Redundant branch-ref families detected

Verified comparisons found identical heads within these groups:

- `feat/foundation-command-contract-final` and `feat/foundation-command-contract-final-2` through `-8`.
- `feat/foundation-command-contract-pass` and `feat/foundation-command-contract-pass-2` through `-5`.
- `feat/foundation-platform-identity-gate` and its numbered variants `-2` through `-10`.
- `feat/foundation-command-registry-2`, `-3`, `-4` and `feat/foundation-closure-pass-2`.
- `feat/foundation-event-permission-command-closure`, `feat/phase-1-iam-foundation`, `x` and `x2`.

The unnumbered `feat/foundation-command-registry` is **not** the same head as its numbered descendants; the compare snapshot shows it 38 commits ahead of the `-4` ref. Do not treat similarly named refs as identical without checking the actual commit comparison.

These duplicate heads are repository-hygiene debt. They do not represent independent product work merely because the branch names differ.

## 3. Historical provenance branches

The inventory also contains foundation-era refs for source lineage, package ingestion, context maps, agent protocols, external audits, repository governance, file organization and forensic reconstruction. The full census, PR associations and captured ahead/behind comparisons are in the linked inventory.

Use historical refs to recover provenance and unique evidence, not as default implementation bases. A stale branch can still contain valuable material, while a newer branch can still be non-canonical.

## 4. Mandatory checks before cleanup

Before proposing to delete, rename, close or merge any branch:

1. Recheck current branch head and compare against the proposed retained ref.
2. Check every open PR where the branch is base or head, including review comments and draft state.
3. Check deployment configuration, Vercel Git refs, release automation and workflow triggers.
4. Find unique commits and unique file content; preserve accepted evidence in a canonical path or reviewed PR.
5. Check whether the branch is referenced by governance documents or automation.
6. Record the disposition and exact verification evidence.

An identical head is necessary evidence for redundancy but is not sufficient permission to delete a ref; PR discussion, base branch, deployment and governance references may still matter.

## 5. Safe cleanup sequence

1. Maintain the branch inventory as a dated snapshot.
2. Reconcile unmerged work by topic through small PRs into `platform-architecture-2026`.
3. Recheck and disposition the three `main`-only commits before any branch convergence.
4. Review the 57-file `cline/hp1c6fdq` delta by topic; promote only accepted changes.
5. Only after these checks, prepare a separate cleanup proposal for redundant refs.
6. Do not reset, rebase, force-push, or delete refs as a side effect of documentation cleanup.

## 6. Authority and non-authorization

This register is an organizational control, not authority to change architecture. The Canonical Artifact Register, Engineering Closure Matrix and current session checkpoint remain governing records.

This update authorizes **no** branch deletion, PR merge/closure, force-push, reset/rebase, production change, database/schema operation or application implementation.
