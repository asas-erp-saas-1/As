# Branch-head reachability and retention decision — 2026-11-12

## Scope

This report compares each distinct head SHA among the 57 source branch refs captured at `2026-11-12T01:17:00Z` with the canonical default head `3c9785cadf08e71a1b8898c64439d1383c68e517` on `platform-architecture-2026`.

The machine-readable inventory is [`HEAD-REACHABILITY-2026-11-12.csv`](HEAD-REACHABILITY-2026-11-12.csv). Duplicate branch refs are grouped by exact head SHA, but their names remain explicitly listed.

## Results

| Classification | Distinct heads | Source refs | Interpretation |
|---|---:|---:|---|
| `ahead` — source head is an ancestor of default | 4 | 4 | Its complete commit ancestry is already reachable from the default head |
| `identical` — same as default head | 1 | 2 | Two refs point to the same canonical tip |
| `diverged` — contains commits not in default | 19 | 19 | Preserve this head via its live branch ref or another verified DAG anchor |
| `unverified_diff_too_large` | 4 | 32 | GitHub compare returned HTTP 422 because diff generation was too large; do not retire |

The counts reconcile to **28 distinct heads / 57 source refs**.

## Proven branch heads already reachable from default

- `806cd2fd9982cc8951504f53aad3432d57753364` — `archive/engineering-history-2026-10-16`; 24 commits ahead on default, zero source-only commits.
- `c7db09bada487957c30608d1fde981f299eafe4a` — `archive/refresh-engineering-history-2026-10-20`; 6 commits ahead on default, zero source-only commits.
- `5e7dff8f5900373b395ac04cab66b0173a80c954` — `fix/archive-snapshot-ci-exclusion-2026-10-16`; 22 commits ahead on default, zero source-only commits.
- `c8d3d7e23095ba6e169f1aae9c00b796f878217f` — `foundation/forensic-repository-reconstruction-2026-09-20`; 545 commits ahead on default, zero source-only commits.

The two refs at the canonical SHA are:
- `3c9785cadf08e71a1b8898c64439d1383c68e517` — `archive/refresh-engineering-history-2026-10-21`, `platform-architecture-2026`.

## Diverged heads: retain

The following heads are proven to contain source-only commits not present in the default branch. The final numeric column is GitHub's `behind_by` count, i.e. commits in the source head side that are not in the current default comparison side:

| Head SHA | Branch refs | Source-only commits |
|---|---|---:|
| `e54e5726a09070fa91899c32cf6848b5cc728b36` | `archive/engineering-history-integrity-2026-10-17` | 5 |
| `2558eb651eeeaeb10141b5f1dcb032f3963229cd` | `chore/archive-candidate-architecture-evidence-2026-10-16` | 60 |
| `c3a719124134e2736f49512de8a864cecda97650` | `chore/consolidation-promotion-2026-10-16` | 20 |
| `4393ac9aa35dc0b12de8cf755dff351f93c1aeb6` | `chore/engineering-corpus-index-2026-10-14` | 34 |
| `874487494955877091da5038da310bed85f5544a` | `chore/promote-final-legacy-candidates-2026-10-16` | 32 |
| `e866cd4aa07c8a89ee146cb9dc83f28db71911fa` | `cline/hp1c6fdq` | 17 |
| `80d21aad9474506757c168c046496333b298735f` | `docs/asas-master-context-2026-10-21` | 1 |
| `425fe168f98f54f8c055a2d8995c8f975c3946e6` | `feat/engineering-workflow-2026-10-16` | 15 |
| `1a4cd48ca48506b5dc8f94acf768cdf07c3f7476` | `foundation/architecture-lineage-reconciliation-v1` | 1 |
| `a2a917faac6feee717e43366e687ac7b2b18f6b3` | `foundation/blueprint-canonical-shadows` | 6 |
| `fb3afedfd5ee5070e0a89961976be8c7f9133b38` | `foundation/blueprint-register-ingestion` | 9 |
| `3bbadf385bcb1c63b5c6af73a9a2b6b4469729be` | `foundation/c2-001-traceability-v1` | 2 |
| `bfd5f2504790debd5b04d81e4b1873dd755cd3fb` | `foundation/claude-agent-operating-protocol-v1` | 1 |
| `41ec1ea3e5df70011aec89e36483f730a7f921e0` | `foundation/external-audit-integration-v1` | 2 |
| `c5dea5731b14224c72d2f02423ead54e2433d815` | `foundation/reconcile-context-map-v2` | 4 |
| `99a0f9481237baf603e463c0e0a9067e7d960ca4` | `foundation/repository-file-organization-v1` | 72 |
| `af3a17de9377dbe8310a0bda4372e9d8412fb8ef` | `foundation/repository-governance` | 34 |
| `52a0c7359304ccc8f69ad0b6c1f1905f38e81c0a` | `foundation/source-authority-ledger-v1` | 1 |
| `9ae5cc1b2b395cee31760fb46cd578f1d3509bd6` | `main` | 3 |

Do not delete these refs until their commit DAG is anchored somewhere else. A Gitlink in the superproject preserves a pointer to the tip commit but is not itself an independent retention ref in the source repository.

## Unresolved heads: do not retire

The following heads could not be reliably classified because the compare endpoint returned HTTP 422 (“diff is taking too long to generate”):

- `2ce6b00536b83615f134998c57e191f51211036f` — `feat/foundation-closure-pass-2`, `feat/foundation-command-contract-final`, `feat/foundation-command-contract-final-2`, `feat/foundation-command-contract-final-3`, `feat/foundation-command-contract-final-4`, `feat/foundation-command-contract-final-5`, `feat/foundation-command-contract-final-6`, `feat/foundation-command-contract-final-7`, `feat/foundation-command-contract-final-8`, `feat/foundation-command-contract-pass`, `feat/foundation-command-contract-pass-2`, `feat/foundation-command-contract-pass-3`, `feat/foundation-command-contract-pass-4`, `feat/foundation-command-contract-pass-5`, `feat/foundation-command-registry-2`, `feat/foundation-command-registry-3`, `feat/foundation-command-registry-4` (17 refs).
- `affab220ff27d51f360061e5d66fa6b4396dd168` — `feat/foundation-command-registry` (1 refs).
- `5c2021eaf5402e6316687b5bd99a6047d40387b9` — `feat/foundation-event-permission-command-closure`, `feat/phase-1-iam-foundation`, `x`, `x2` (4 refs).
- `1a21a311bd27eb0e4c16415a7de6ee1a9e040389` — `feat/foundation-platform-identity-gate`, `feat/foundation-platform-identity-gate-2`, `feat/foundation-platform-identity-gate-3`, `feat/foundation-platform-identity-gate-4`, `feat/foundation-platform-identity-gate-5`, `feat/foundation-platform-identity-gate-6`, `feat/foundation-platform-identity-gate-7`, `feat/foundation-platform-identity-gate-8`, `feat/foundation-platform-identity-gate-9`, `feat/foundation-platform-identity-gate-10` (10 refs).

These comparisons require a different ancestry-only method or a verified Git mirror before any retirement decision.

## Snapshot orders 057–062: ancestry implications

- Order 057 commit `2672247aab8ce830091db1df83d1b233aa88d17f` is an ancestor of the current default: 11 commits ahead on default, zero source-only commits.
- Order 058 commit `e54e5726a09070fa91899c32cf6848b5cc728b36` is diverged: 5 source-only commits.
- Order 059 commit `80d21aad9474506757c168c046496333b298735f` is diverged: 1 source-only commit.
- Order 060 commit `c7db09bada487957c30608d1fde981f299eafe4a` is an ancestor of the current default.
- Orders 061 and 062 are identical to the current default tip.

## Retention decision

1. Keep all divergent and unresolved source refs.
2. The four proven ancestor refs and the one same-head duplicate ref group are candidates for later branch cleanup **only after** PR usage, open PRs, workflow references, deployment references and branch-protection rules have also been checked.
3. To achieve a one-branch policy without losing unique history, an equivalent DAG anchor is required for each diverged head, such as verified immutable tags or an external mirror/bundle. The connected GitHub toolset currently exposes no tag-creation or branch-deletion action, so this report does not execute cleanup.
4. Canonical branch protection is currently reported as `protected=false`; enable and verify protection before any cleanup.
5. Do not merge or close unrelated PRs #32/#33 as part of this archival task.

## Limitations

This is a commit-graph reachability comparison, not an architecture approval. It does not decide which historical documents are semantically correct, resolve contradictions, close architecture gates, or authorize implementation. GitHub comparison results for the four unresolved groups are explicitly unknown, not inferred.
