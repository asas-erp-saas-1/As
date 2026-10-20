# Engineering Branch Archive — 2026-10-16

## Purpose

This is a loss-minimizing, read-only historical archive of the **complete tracked tree at the HEAD of every branch** that existed when the archive was captured. It preserves each branch under its own numbered directory so the earlier engineering stages can be read independently before the architecture is reconciled.

## Capture boundary

- Repository: `asas-erp-saas-1/As`
- Default branch: `platform-architecture-2026`
- Exact baseline commit captured: `3009312dc803ca63dc32695d9deedcdcd3f91423`
- Baseline tracked entries: **417**
- Branch refs captured: **51**
- Unique HEAD commits across those refs: **23**
- Snapshot entries across all 51 folders: **5,112**
- Archive is stored in `engineering-history/branch-snapshots/`; per-group machine-readable comparison manifests are in [`_manifests/`](./_manifests/).

## Ordering and directory naming

Directories are ordered by each branch HEAD commit's author timestamp, oldest first. Branch refs do not expose a dependable creation timestamp through the API, so this ordering is **by the timestamp of the branch's current HEAD commit**, not by inferred branch creation time. Branches with the same HEAD timestamp are ordered by branch name. A prefix such as `001--` is the chronological ordinal; slashes in original branch names become `--` in the folder name. The table below preserves each exact branch name and its matching directory.

## How to read the differences

Each manifest contains the complete path lists for that unique HEAD compared with the baseline tree above:
- **+ added**: path exists in that branch but not in the baseline.
- **~ modified**: path exists in both, but the Git blob, file mode, or object type differs.
- **− deleted**: path exists in the baseline but not in that branch.

Those are path-level structural comparisons, not a semantic decision about which design is correct. The complete branch folder holds the original file content for its HEAD; manifests tell you which paths to inspect. Many similarly named branches intentionally share one HEAD commit. Each has still received its own full snapshot directory.

## Branch-by-branch index

| # | Original branch | HEAD commit date (UTC) | HEAD SHA | Tracked entries | Delta vs baseline (+ / ~ / −) | Full snapshot |
|---:|---|---|---|---:|---|---|
| 001 | `feat/foundation-event-permission-command-closure` | 2026-09-15 05:23:16 UTC | `5c2021e` | 43 | +37 / ~5 / −411 | [001--feat--foundation-event-permission-command-closure](./001--feat--foundation-event-permission-command-closure/) |
| 002 | `feat/phase-1-iam-foundation` | 2026-09-15 05:23:16 UTC | `5c2021e` | 43 | +37 / ~5 / −411 | [002--feat--phase-1-iam-foundation](./002--feat--phase-1-iam-foundation/) |
| 003 | `x` | 2026-09-15 05:23:16 UTC | `5c2021e` | 43 | +37 / ~5 / −411 | [003--x](./003--x/) |
| 004 | `x2` | 2026-09-15 05:23:16 UTC | `5c2021e` | 43 | +37 / ~5 / −411 | [004--x2](./004--x2/) |
| 005 | `feat/foundation-closure-pass-2` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [005--feat--foundation-closure-pass-2](./005--feat--foundation-closure-pass-2/) |
| 006 | `feat/foundation-command-contract-final` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [006--feat--foundation-command-contract-final](./006--feat--foundation-command-contract-final/) |
| 007 | `feat/foundation-command-contract-final-2` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [007--feat--foundation-command-contract-final-2](./007--feat--foundation-command-contract-final-2/) |
| 008 | `feat/foundation-command-contract-final-3` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [008--feat--foundation-command-contract-final-3](./008--feat--foundation-command-contract-final-3/) |
| 009 | `feat/foundation-command-contract-final-4` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [009--feat--foundation-command-contract-final-4](./009--feat--foundation-command-contract-final-4/) |
| 010 | `feat/foundation-command-contract-final-5` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [010--feat--foundation-command-contract-final-5](./010--feat--foundation-command-contract-final-5/) |
| 011 | `feat/foundation-command-contract-final-6` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [011--feat--foundation-command-contract-final-6](./011--feat--foundation-command-contract-final-6/) |
| 012 | `feat/foundation-command-contract-final-7` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [012--feat--foundation-command-contract-final-7](./012--feat--foundation-command-contract-final-7/) |
| 013 | `feat/foundation-command-contract-final-8` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [013--feat--foundation-command-contract-final-8](./013--feat--foundation-command-contract-final-8/) |
| 014 | `feat/foundation-command-contract-pass` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [014--feat--foundation-command-contract-pass](./014--feat--foundation-command-contract-pass/) |
| 015 | `feat/foundation-command-contract-pass-2` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [015--feat--foundation-command-contract-pass-2](./015--feat--foundation-command-contract-pass-2/) |
| 016 | `feat/foundation-command-contract-pass-3` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [016--feat--foundation-command-contract-pass-3](./016--feat--foundation-command-contract-pass-3/) |
| 017 | `feat/foundation-command-contract-pass-4` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [017--feat--foundation-command-contract-pass-4](./017--feat--foundation-command-contract-pass-4/) |
| 018 | `feat/foundation-command-contract-pass-5` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [018--feat--foundation-command-contract-pass-5](./018--feat--foundation-command-contract-pass-5/) |
| 019 | `feat/foundation-command-registry-2` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [019--feat--foundation-command-registry-2](./019--feat--foundation-command-registry-2/) |
| 020 | `feat/foundation-command-registry-3` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [020--feat--foundation-command-registry-3](./020--feat--foundation-command-registry-3/) |
| 021 | `feat/foundation-command-registry-4` | 2026-09-15 08:25:31 UTC | `2ce6b00` | 47 | +41 / ~5 / −411 | [021--feat--foundation-command-registry-4](./021--feat--foundation-command-registry-4/) |
| 022 | `feat/foundation-platform-identity-gate` | 2026-09-15 16:47:34 UTC | `1a21a31` | 62 | +46 / ~15 / −401 | [022--feat--foundation-platform-identity-gate](./022--feat--foundation-platform-identity-gate/) |
| 023 | `feat/foundation-platform-identity-gate-10` | 2026-09-15 16:47:34 UTC | `1a21a31` | 62 | +46 / ~15 / −401 | [023--feat--foundation-platform-identity-gate-10](./023--feat--foundation-platform-identity-gate-10/) |
| 024 | `feat/foundation-platform-identity-gate-2` | 2026-09-15 16:47:34 UTC | `1a21a31` | 62 | +46 / ~15 / −401 | [024--feat--foundation-platform-identity-gate-2](./024--feat--foundation-platform-identity-gate-2/) |
| 025 | `feat/foundation-platform-identity-gate-3` | 2026-09-15 16:47:34 UTC | `1a21a31` | 62 | +46 / ~15 / −401 | [025--feat--foundation-platform-identity-gate-3](./025--feat--foundation-platform-identity-gate-3/) |
| 026 | `feat/foundation-platform-identity-gate-4` | 2026-09-15 16:47:34 UTC | `1a21a31` | 62 | +46 / ~15 / −401 | [026--feat--foundation-platform-identity-gate-4](./026--feat--foundation-platform-identity-gate-4/) |
| 027 | `feat/foundation-platform-identity-gate-5` | 2026-09-15 16:47:34 UTC | `1a21a31` | 62 | +46 / ~15 / −401 | [027--feat--foundation-platform-identity-gate-5](./027--feat--foundation-platform-identity-gate-5/) |
| 028 | `feat/foundation-platform-identity-gate-6` | 2026-09-15 16:47:34 UTC | `1a21a31` | 62 | +46 / ~15 / −401 | [028--feat--foundation-platform-identity-gate-6](./028--feat--foundation-platform-identity-gate-6/) |
| 029 | `feat/foundation-platform-identity-gate-7` | 2026-09-15 16:47:34 UTC | `1a21a31` | 62 | +46 / ~15 / −401 | [029--feat--foundation-platform-identity-gate-7](./029--feat--foundation-platform-identity-gate-7/) |
| 030 | `feat/foundation-platform-identity-gate-8` | 2026-09-15 16:47:34 UTC | `1a21a31` | 62 | +46 / ~15 / −401 | [030--feat--foundation-platform-identity-gate-8](./030--feat--foundation-platform-identity-gate-8/) |
| 031 | `feat/foundation-platform-identity-gate-9` | 2026-09-15 16:47:34 UTC | `1a21a31` | 62 | +46 / ~15 / −401 | [031--feat--foundation-platform-identity-gate-9](./031--feat--foundation-platform-identity-gate-9/) |
| 032 | `feat/foundation-command-registry` | 2026-09-15 23:21:39 UTC | `affab22` | 70 | +53 / ~15 / −400 | [032--feat--foundation-command-registry](./032--feat--foundation-command-registry/) |
| 033 | `foundation/repository-governance` | 2026-09-16 10:57:01 UTC | `af3a17d` | 44 | +0 / ~14 / −373 | [033--foundation--repository-governance](./033--foundation--repository-governance/) |
| 034 | `foundation/blueprint-register-ingestion` | 2026-09-17 05:13:13 UTC | `fb3afed` | 61 | +0 / ~19 / −356 | [034--foundation--blueprint-register-ingestion](./034--foundation--blueprint-register-ingestion/) |
| 035 | `foundation/blueprint-canonical-shadows` | 2026-09-17 05:26:37 UTC | `a2a917f` | 67 | +0 / ~20 / −350 | [035--foundation--blueprint-canonical-shadows](./035--foundation--blueprint-canonical-shadows/) |
| 036 | `foundation/reconcile-context-map-v2` | 2026-09-17 12:59:26 UTC | `c5dea57` | 68 | +3 / ~20 / −352 | [036--foundation--reconcile-context-map-v2](./036--foundation--reconcile-context-map-v2/) |
| 037 | `foundation/c2-001-traceability-v1` | 2026-09-17 13:56:39 UTC | `3bbadf3` | 66 | +1 / ~20 / −352 | [037--foundation--c2-001-traceability-v1](./037--foundation--c2-001-traceability-v1/) |
| 038 | `foundation/source-authority-ledger-v1` | 2026-09-17 14:02:31 UTC | `52a0c73` | 66 | +0 / ~20 / −351 | [038--foundation--source-authority-ledger-v1](./038--foundation--source-authority-ledger-v1/) |
| 039 | `foundation/claude-agent-operating-protocol-v1` | 2026-09-18 00:12:51 UTC | `bfd5f25` | 66 | +0 / ~20 / −351 | [039--foundation--claude-agent-operating-protocol-v1](./039--foundation--claude-agent-operating-protocol-v1/) |
| 040 | `foundation/architecture-lineage-reconciliation-v1` | 2026-09-18 06:30:57 UTC | `1a4cd48` | 66 | +0 / ~20 / −351 | [040--foundation--architecture-lineage-reconciliation-v1](./040--foundation--architecture-lineage-reconciliation-v1/) |
| 041 | `foundation/external-audit-integration-v1` | 2026-09-18 22:00:21 UTC | `41ec1ea` | 67 | +0 / ~20 / −350 | [041--foundation--external-audit-integration-v1](./041--foundation--external-audit-integration-v1/) |
| 042 | `foundation/repository-file-organization-v1` | 2026-09-19 23:46:18 UTC | `99a0f94` | 88 | +17 / ~28 / −346 | [042--foundation--repository-file-organization-v1](./042--foundation--repository-file-organization-v1/) |
| 043 | `foundation/forensic-repository-reconstruction-2026-09-20` | 2026-09-20 05:53:29 UTC | `c8d3d7e` | 69 | +0 / ~17 / −348 | [043--foundation--forensic-repository-reconstruction-2026-09-20](./043--foundation--forensic-repository-reconstruction-2026-09-20/) |
| 044 | `main` | 2026-09-29 13:09:41 UTC | `9ae5cc1` | 68 | +0 / ~21 / −349 | [044--main](./044--main/) |
| 045 | `feat/engineering-workflow-2026-10-16` | 2026-10-16 08:52:11 UTC | `425fe16` | 347 | +0 / ~5 / −70 | [045--feat--engineering-workflow-2026-10-16](./045--feat--engineering-workflow-2026-10-16/) |
| 046 | `cline/hp1c6fdq` | 2026-10-16 09:18:17 UTC | `e866cd4` | 356 | +14 / ~50 / −75 | [046--cline--hp1c6fdq](./046--cline--hp1c6fdq/) |
| 047 | `chore/engineering-corpus-index-2026-10-14` | 2026-10-16 10:03:51 UTC | `4393ac9` | 347 | +0 / ~9 / −70 | [047--chore--engineering-corpus-index-2026-10-14](./047--chore--engineering-corpus-index-2026-10-14/) |
| 048 | `chore/consolidation-promotion-2026-10-16` | 2026-10-16 10:09:09 UTC | `c3a7191` | 360 | +0 / ~4 / −57 | [048--chore--consolidation-promotion-2026-10-16](./048--chore--consolidation-promotion-2026-10-16/) |
| 049 | `chore/archive-candidate-architecture-evidence-2026-10-16` | 2026-10-16 10:28:42 UTC | `2558eb6` | 414 | +0 / ~3 / −3 | [049--chore--archive-candidate-architecture-evidence-2026-10-16](./049--chore--archive-candidate-architecture-evidence-2026-10-16/) |
| 050 | `chore/promote-final-legacy-candidates-2026-10-16` | 2026-10-16 10:33:37 UTC | `8744874` | 414 | +0 / ~3 / −3 | [050--chore--promote-final-legacy-candidates-2026-10-16](./050--chore--promote-final-legacy-candidates-2026-10-16/) |
| 051 | `platform-architecture-2026` | 2026-10-16 12:33:17 UTC | `3009312` | 417 | +0 / ~0 / −0 | [051--platform-architecture-2026](./051--platform-architecture-2026/) |

## Machine-readable manifests

- [Batch 01 — earliest branch heads](./_manifests/batch-01.json)
- [Batch 02](./_manifests/batch-02.json)
- [Batch 03](./_manifests/batch-03.json)
- [Batch 04](./_manifests/batch-04.json)
- [Batch 05](./_manifests/batch-05.json)
- [Batch 06 — latest branch heads](./_manifests/batch-06.json)

## Scope and safety notes

The archive copies the Git tree objects' blob references and preserves the file paths, object modes, and tracked content rather than reconciling, renaming, or overwriting the live application files. Identical blobs can be shared by Git internally, but every branch still has a separate navigable directory.

This captures each branch's **current HEAD tree**, not a separate directory for every intermediate commit within that branch. The repository's existing commit history remains the source for inspecting intermediate commits. Untracked local files and content never committed to any branch are outside the scope of a Git-branch snapshot.

Do not treat archived documents as approved architecture merely because they are preserved here. Older branches can contain superseded, conflicting, or incomplete design decisions. The next review should build the architecture's master timeline, source-authority map, decision ledger, and gap register from these snapshots before implementation work begins.
