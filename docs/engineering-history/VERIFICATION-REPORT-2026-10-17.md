# Engineering history archive verification — 2026-10-17

## Latest branch-census and full-tree reference verification — 2026-11-12

**Archive inventory result: PASS_COMMIT_PIN for orders 057–062; historical-source census reconciled.**

- Census cut: 2026-11-12T01:17:00Z, before creating the temporary task-delivery branch archive/complete-branch-census-2026-11-12.
- Source refs in census: **57**.
- Distinct source head commits: **28**.
- Delivery branch excluded from the source-history census: **1**, documented separately as a task-scoped review branch.
- All 57 source branch names are represented in the snapshot manifest and live-ref census CSV; a post-commit comparison found zero branch-name or head-SHA mismatches.
- Orders **057–062** each have a separate numbered folder with README plus a `source-snapshot/` Git submodule gitlink (mode `160000`) pinned to the exact historical source commit. The root `.gitmodules` maps all six paths to this repository.
- Source commit/root-tree pairs:
  - 057 `2672247aab8ce830091db1df83d1b233aa88d17f` → `bc362b385189deb42618bb624c1a857b62c55c88`
  - 058 `e54e5726a09070fa91899c32cf6848b5cc728b36` → `274493a3cceea1a8100d07ce8b2e4e6667643cd1`
  - 059 `80d21aad9474506757c168c046496333b298735f` → `85933920c8fe46e978884bda04b258ef5418fbf6`
  - 060 `c7db09bada487957c30608d1fde981f299eafe4a` → `6b98bb39b2978438802d2f1748be7049a50ba947`
  - 061 `3c9785cadf08e71a1b8898c64439d1383c68e517` → `6750ad77c18f8db696fb56374dd6885666b19b99`
  - 062 `3c9785cadf08e71a1b8898c64439d1383c68e517` → `6750ad77c18f8db696fb56374dd6885666b19b99`
- This is a full immutable reference to each commit's tracked repository tree; the original blobs and modes are not regenerated or duplicated in the parent archive. Clone with `git clone --recurse-submodules --branch archive/complete-branch-census-2026-11-12 https://github.com/asas-erp-saas-1/As.git` to materialize all six full source trees.
- As an independent audit cross-check, the source head in order 061 differs from order 057 at **134 archive paths: 124 added, 10 modified, 0 removed**. All 134 paths were mapped to exact source blob SHAs and modes. The former order 057–060 delta records remain in `delta-audit/` as forensic evidence; they are not required to reconstruct the full pinned source trees.
- The historic unique-content manifest contains **237 rows / 237 unique SHA values**, matching the **237** immediate child blob directories under `recovered-content/by-blob/`.
- Verification for orders 057–062 is based on exact gitlink commit SHA equality plus source commit/root-tree metadata. File counts and path-by-path differences are intentionally blank in the parent tree because source contents are referenced, not duplicated.

## Scope and limitations

This verification establishes the source-ref census, immutable full-tree commit references, order-057 comparison cross-check, and unique-blob counts. It does **not** prove semantic completeness, approve historical architecture, close any GATE or C-track, establish application build/test coverage, verify deployments or database runtime state, or authorize implementation.

Snapshot records preserve branch-tip commit/tree states, not every intermediate commit in their branch DAG. Do not delete source refs on the basis of this archive alone. A separate, approved history-retention decision must preserve and verify all required commit ancestry before any branch cleanup.

The temporary task-delivery branch is operational and is intentionally not counted as an engineering source stage. The separate open PRs #32 and #33 were not merged or closed by this work. PR #35 remains a draft pending final-head checks and independent owner review.
