# ASAS Engineering Branch Consolidation Record — 2026-10-16

**Record ID:** ASAS-GOV-ENGINEERING-BRANCH-CONSOLIDATION-2026-10-16  
**Status:** LIVE EVIDENCE SNAPSHOT / CONSOLIDATION IN PROGRESS  
**Repository:** `asas-erp-saas-1/As`  
**Canonical engineering line:** `platform-architecture-2026`  
**Observed canonical SHA:** `fdb7e06fdc1818755440cdd72e21ad2b46fd3e48`  
**GitHub default branch:** `main` — migration pending administrator action in [Issue #24](https://github.com/asas-erp-saas-1/As/issues/24)

## 1. Decision: one engineering line

All architecture and engineering PRs should target `platform-architecture-2026`. It is the active line named by the current checkpoint, Engineering Closure Matrix and Canonical Artifact Register. `main` remains the GitHub default branch only until an administrator completes and verifies the default-branch migration; it is not a second engineering work line.

Do not converge the two histories with a wholesale merge, reset, rebase or force-push. The captured compare reports 521 commits unique to `platform-architecture-2026`, 3 commits unique to `main`, and 3 main-side paths. Two C03 source-control files are preserved in the PR #18 branch; the short main-side `Source/README.md` is intentionally not copied over the richer active-line index. Recheck this comparison before the default-branch change.

## 2. Live census

The GitHub refs endpoint returned **48 branch refs and 20 distinct commit heads** on 2026-10-16. Three exact-head groups account for 31 refs: 17 command/contract/closure refs, 10 platform-identity-gate refs, and 4 event-permission/IAM/x refs. The remaining 17 refs have distinct heads. Exact SHA equality proves duplicate branch tips, not permission to delete a ref.

| Unique head SHA | Branch refs | Evidence / classification | Disposition |
|---|---|---|---|
| `52b2bd870764e90896f9e43466bbd7f74b57d9ef` | `chore/engineering-corpus-index-2026-10-14` | PR #18; index/source-promotion work; retire only after PR disposition | HOLD — PR #18 review branch |
| `6e3af3e3452f79dc00337d1a9c45ada10da9706d` | `cline/hp1c6fdq` | PR #23; 14 commits ahead / 57 paths; semantic package under review | HOLD — PR #23 review branch |
| `425fe168f98f54f8c055a2d8995c8f975c3946e6` | `feat/engineering-workflow-2026-10-16` | PR #20; PR #19 duplicate to main closed; Vercel blocker remains | HOLD — PR #20 review branch |
| `2ce6b00536b83615f134998c57e191f51211036f` | `feat/foundation-closure-pass-2`<br>`feat/foundation-command-contract-final`<br>`feat/foundation-command-contract-final-2`<br>`feat/foundation-command-contract-final-3`<br>`feat/foundation-command-contract-final-4`<br>`feat/foundation-command-contract-final-5`<br>`feat/foundation-command-contract-final-6`<br>`feat/foundation-command-contract-final-7`<br>`feat/foundation-command-contract-final-8`<br>`feat/foundation-command-contract-pass`<br>`feat/foundation-command-contract-pass-2`<br>`feat/foundation-command-contract-pass-3`<br>`feat/foundation-command-contract-pass-4`<br>`feat/foundation-command-contract-pass-5`<br>`feat/foundation-command-registry-2`<br>`feat/foundation-command-registry-3`<br>`feat/foundation-command-registry-4` | Exact duplicate ref group (17 names). | RETIRE CANDIDATE — identical head group; first verify open PRs, refs, deployments and unique content |
| `affab220ff27d51f360061e5d66fa6b4396dd168` | `feat/foundation-command-registry` | 38 commits ahead of identical command-contract family; 98 ahead / 557 behind platform; inspect unique command-registry work | HOLD — unique 38-commit delta; review before retirement |
| `5c2021eaf5402e6316687b5bd99a6047d40387b9` | `feat/foundation-event-permission-command-closure`<br>`feat/phase-1-iam-foundation`<br>`x`<br>`x2` | Exact duplicate ref group (4 names). | RETIRE CANDIDATE — identical head group; first verify open PRs, refs, deployments and unique content |
| `1a21a311bd27eb0e4c16415a7de6ee1a9e040389` | `feat/foundation-platform-identity-gate`<br>`feat/foundation-platform-identity-gate-10`<br>`feat/foundation-platform-identity-gate-2`<br>`feat/foundation-platform-identity-gate-3`<br>`feat/foundation-platform-identity-gate-4`<br>`feat/foundation-platform-identity-gate-5`<br>`feat/foundation-platform-identity-gate-6`<br>`feat/foundation-platform-identity-gate-7`<br>`feat/foundation-platform-identity-gate-8`<br>`feat/foundation-platform-identity-gate-9` | Exact duplicate ref group (10 names). | RETIRE CANDIDATE — identical head group; first verify open PRs, refs, deployments and unique content |
| `1a4cd48ca48506b5dc8f94acf768cdf07c3f7476` | `foundation/architecture-lineage-reconciliation-v1` | PR #12; retargeted to platform; review single lineage contract | HOLD — PR #12 review |
| `a2a917faac6feee717e43366e687ac7b2b18f6b3` | `foundation/blueprint-canonical-shadows` | PR #5; retargeted to platform; overlaps checkpoint/register candidates | HOLD — PR #5 overlaps checkpoint |
| `fb3afedfd5ee5070e0a89961976be8c7f9133b38` | `foundation/blueprint-register-ingestion` | No open PR observed; review register/task-index artifacts before promotion | REVIEW — unique ingestion artifacts |
| `3bbadf385bcb1c63b5c6af73a9a2b6b4469729be` | `foundation/c2-001-traceability-v1` | No open PR observed; review traceability matrix before promotion | REVIEW — unique traceability artifact |
| `bfd5f2504790debd5b04d81e4b1873dd755cd3fb` | `foundation/claude-agent-operating-protocol-v1` | PR #9; retargeted to platform; review one operating protocol | HOLD — PR #9 review |
| `41ec1ea3e5df70011aec89e36483f730a7f921e0` | `foundation/external-audit-integration-v1` | PR #14; retargeted to platform; review audit evidence/procedure | HOLD — PR #14 review |
| `c8d3d7e23095ba6e169f1aae9c00b796f878217f` | `foundation/forensic-repository-reconstruction-2026-09-20` | PR #16 closed; head is already contained in platform (0 ahead / 0 changed files) | RETIRE CANDIDATE — PR #16 closed; head contained in platform; verify refs before delete |
| `c5dea5731b14224c72d2f02423ead54e2433d815` | `foundation/reconcile-context-map-v2` | PR #6; retargeted to platform; review context map and open conflicts | HOLD — PR #6 review |
| `99a0f9481237baf603e463c0e0a9067e7d960ca4` | `foundation/repository-file-organization-v1` | PR #13; retargeted to platform; broad overlapping diff; do not merge wholesale | HOLD — PR #13 broad diff |
| `af3a17de9377dbe8310a0bda4372e9d8412fb8ef` | `foundation/repository-governance` | No open PR observed; 34 ahead / 548 behind platform; historical provenance, review per file | REVIEW — unique governance docs; no wholesale merge |
| `52a0c7359304ccc8f69ad0b6c1f1905f38e81c0a` | `foundation/source-authority-ledger-v1` | PR #8; retargeted to platform; review source authority ledger | HOLD — PR #8 review |
| `9ae5cc1b2b395cee31760fb46cd578f1d3509bd6` | `main` | GitHub default branch; not engineering canonical; preserve until Issue #24 admin migration and verification | HOLD — default branch; do not delete before admin migration |
| `fdb7e06fdc1818755440cdd72e21ad2b46fd3e48` | `platform-architecture-2026` | CANONICAL ACTIVE ENGINEERING LINE; keep | KEEP — sole canonical engineering line |

## 3. Open pull requests — current routing

| PR | Head | Base / status | Disposition |
|---|---|---|---|
| [#18](https://github.com/asas-erp-saas-1/As/pull/18) | `chore/engineering-corpus-index-2026-10-14` | `platform-architecture-2026`, Draft | Contains branch/corpus index, the two selected C03 source-control files and the CI route/checkpoint repairs; Foundation Verify passed on prior head `a721286b09527123d833f2f676568323335527d7`. Subsequent commits added dated promotion-review and consolidation-ledger updates. The exact latest-head CI/Vercel state must be read from PR #18 before merge; earlier Vercel failures are tracked in Issue #21. |
| [#20](https://github.com/asas-erp-saas-1/As/pull/20) | `feat/engineering-workflow-2026-10-16` | `platform-architecture-2026`, Draft | Workflow/CI change; Foundation Verify passed on recorded head `425fe168f98f54f8c055a2d8995c8f975c3946e6`, Vercel preview still fails (Issue #21). |
| [#23](https://github.com/asas-erp-saas-1/As/pull/23) | `cline/hp1c6fdq` | `platform-architecture-2026`, Draft | 14-commit / 58-path architecture-integrity package; latest Foundation Verify run `38879545899` passed on head `e866cd4aa07c8a89ee146cb9dc83f28db71911fa`, including the architecture-integrity script; Vercel preview still fails. Owner-review each semantic decision and checkpoint diff. |
| [#5](https://github.com/asas-erp-saas-1/As/pull/5) | `foundation/blueprint-canonical-shadows` | Retargeted to `platform-architecture-2026`, Draft; GitHub currently reports `mergeable=false` | Review checkpoint/register overlap; do not merge wholesale. |
| [#6](https://github.com/asas-erp-saas-1/As/pull/6) | `foundation/reconcile-context-map-v2` | Retargeted to `platform-architecture-2026`, Draft; GitHub currently reports `mergeable=false` | Review context-map and contract-conflict artifact. |
| [#8](https://github.com/asas-erp-saas-1/As/pull/8) | `foundation/source-authority-ledger-v1` | Retargeted to `platform-architecture-2026`, Draft | Review source-authority ledger. |
| [#9](https://github.com/asas-erp-saas-1/As/pull/9) | `foundation/claude-agent-operating-protocol-v1` | Retargeted to `platform-architecture-2026`, Draft | Review operating protocol. |
| [#12](https://github.com/asas-erp-saas-1/As/pull/12) | `foundation/architecture-lineage-reconciliation-v1` | Retargeted to `platform-architecture-2026`, Draft | Review lineage contract. |
| [#13](https://github.com/asas-erp-saas-1/As/pull/13) | `foundation/repository-file-organization-v1` | Retargeted to `platform-architecture-2026`, Draft; GitHub currently reports `mergeable=false` | Broad 35-path diff; reconcile overlap with #18/#20/#23 before merge. |
| [#14](https://github.com/asas-erp-saas-1/As/pull/14) | `foundation/external-audit-integration-v1` | Retargeted to `platform-architecture-2026`, Draft | Review audit evidence and procedure. |

**Closed as redundant / unsafe as a direct merge:** PR #16 (head is already contained in the active line; zero commits ahead and zero changed files against it), PR #19 (duplicate workflow head targeting divergent `main`), and PR #17 (521-commit whole-line convergence into `main` is not a safe feature merge). Closing these PRs did not delete any branch or commit.

## 4. Promotion decisions — evidence before deletion

### Promoted to the PR #18 review branch from `main`

- `docs/architecture/reconciliation/phase-c/C03/02-SOURCE-RECONCILIATION-QUEUE.md` — source blob `b34dec77273adb5b680d64c0d2ed46ea46bc060b`; keeps C03 open and identifies source-reconciliation/red-team/independent-review work.
- `docs/architecture/reconciliation/phase-c/Source/C03/00-SOURCE-REGISTER.md` — source blob `8a548b5b0b891a00dba71fe3f6cf159660e9ed7c`; explicitly classifies sources and does not create a second authority.

Both are present on the PR #18 branch but are **not yet present on the canonical base** until that PR is accepted and merged. The divergent main-side `Source/README.md` was not overlaid; the active-line file is richer and already occupies the canonical path. See [the file-level promotion review](../architecture/reconciliation/ASAS-UNMERGED-BRANCH-PROMOTION-REVIEW-2026-10-15.md).

### Candidate package from `cline/hp1c6fdq`

PR #23 isolates ADR-0038–0041, Hold/edge contracts, the integrity review, register delta, C-track recovery/disposition, checkpoint/closure edits, and CI integrity tooling. This is valuable, but not all of it is ready to promote as a unit. Before merging:

Its first Foundation Verify run (`38878920659`) failed on the known literal gate-route assertion. Commit `0487906dfe55feb7db3013728bff76a2add699f7` replaced that assertion with semantic checks and added `scripts/verify-architecture-integrity.sh`. The next run exposed a false-positive reference to the documented placeholder `phase-c/CNN/README.md`; commit `cb85c656ed6faff785ab34345c0cd29d08e21884` allowlisted that exact placeholder. The verifier then passed, but the checkpoint guard exposed historical/prohibition references as false positives; commit `e866cd4aa07c8a89ee146cb9dc83f28db71911fa` narrowed that check. Foundation Verify run `38879545899` completed successfully on that head, including architecture-integrity and the checkpoint guard. The workflow hunk overlaps the related fix in PR #20 and PR #18 and must be reconciled before any merge.
1. Verify decision-owner/delegation claims and reconcile the ADRs with canonical machine-readable state/event/permission registers.
2. Resolve the candidate checkpoint's same-file contradiction between listed unresolved findings and later "resolved" statuses.
3. Keep register deltas proposed until register owners approve them; preserve F-08/security-permission blockers.
4. Ensure the integrity script passes on the final PR head and its claims remain structural-only.
5. Reconcile C-track dispositions with the Closure Matrix; do not infer gate/track closure from an index or file existing.

### Unique foundation branches

Single-file branches for source authority, architecture lineage, agent protocol, context-map and external-audit material are retained as Draft PRs against the canonical line for separate review. Broad repository organization, blueprint shadowing, command registry, governance and ingestion branches remain evidence sources until path-level overlap and unique content are reconciled.

## 5. Branch retirement policy

A branch is deletable only when all conditions hold:

1. Its accepted unique content is in `platform-architecture-2026` or deliberately classified as historical/unneeded with a recorded rationale.
2. No open PR uses it as head or base; any relevant review discussion and approvals are preserved.
3. No Vercel deployment, release, workflow, webhook or automation still references it.
4. No canonical document, checkpoint or operating instruction treats it as an active line.
5. The exact current SHA is re-read immediately before deletion; no concurrent change occurred.
6. It is not the GitHub default branch and not the canonical engineering line.

Delete exact-head duplicates first, after checking the PR/deployment conditions. Retain `main` until Issue #24 completes the admin-controlled default-branch migration and a defined observation/rollback period. Retain each task branch until its PR is merged/closed and its content disposition is recorded. The administrative retirement queue is tracked in [Issue #25](https://github.com/asas-erp-saas-1/As/issues/25).

## 6. Actions taken and not taken

**Taken:** retargeted PRs #5, #6, #8, #9, #12, #13 and #14 to the canonical engineering line; closed redundant PR #16, duplicate-to-main PR #19, and unsafe whole-line PR #17 with explanatory comments; opened PR #23 to isolate the materially advanced `cline` package; opened [Issue #24](https://github.com/asas-erp-saas-1/As/issues/24) for default-branch migration and [Issue #25](https://github.com/asas-erp-saas-1/As/issues/25) for staged retirement of non-canonical refs; added the CI repairs to PR #18 and verified Foundation Verify on its latest inspected head.

**Not taken:** no branch refs deleted; no commit history rewritten; no branch force-pushed or reset; no pull request merged; no architecture gate or C-track closed; no app/schema/migration/RLS/production changes.

The available GitHub integration exposes branch creation/ref updates but not a branch-delete action, and its generic fetch interface is read-only. Therefore deletion must be performed through repository-admin controls after the evidence gates above; this is an execution limitation, not a reason to skip reconciliation.

## 7. Verification caveats

- Current branch protection remains unverified due the integration's 403 response; see [Issue #22](https://github.com/asas-erp-saas-1/As/issues/22).
- Vercel preview resource provisioning failures remain open; see [Issue #21](https://github.com/asas-erp-saas-1/As/issues/21). Do not treat Vercel as green or silently waive it.
- The branch count and SHAs are a dated live snapshot; re-fetch immediately before each delete or default-branch mutation.
