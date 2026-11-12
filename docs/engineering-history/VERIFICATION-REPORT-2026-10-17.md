# Engineering history archive verification — 2026-10-17

## Latest branch-census and full-tree reference verification — 2026-11-12

**Archive inventory result: PASS_COMMIT_PIN for orders 061 and 062; historical-source census reconciled.**

- Census cut: 2026-11-12T01:17:00Z, before creating the temporary task-delivery branch archive/complete-branch-census-2026-11-12.
- Source refs in census: **57**.
- Distinct source head commits: **28**.
- Delivery branch excluded from the source-history census: **1**, documented separately as a task-scoped review branch.
- All 57 source branch names are represented in the updated snapshot manifest and live-ref census CSV; a post-commit comparison found zero branch-name or head-SHA mismatches.
- New archive records: **061** for platform-architecture-2026 and **062** for archive/refresh-engineering-history-2026-10-21.
- Both refs resolve to the exact same source commit `3c9785cadf08e71a1b8898c64439d1383c68e517` and root tree `6750ad77c18f8db696fb56374dd6885666b19b99`.
- Each numbered folder contains a README and a Git submodule gitlink at `source-snapshot/` (mode `160000`) pinned to that exact source commit. The root `.gitmodules` file maps both paths to this repository. This is a full immutable source-tree reference; no file contents are regenerated, altered, or copied into the parent tree.
- Clone the archive branch with `git clone --recurse-submodules --branch archive/complete-branch-census-2026-11-12 https://github.com/asas-erp-saas-1/As.git` to materialize both complete source trees under their numbered folders. Git reuses the same commit/tree/blob objects for both refs because their heads are identical.
- As an independent audit cross-check, the source head differs from order 057 at **134 archive paths: 124 added, 10 modified, 0 removed**. All 134 paths were mapped to exact source blob SHAs and modes. This comparison does not define the preservation format for orders 061/062; those are commit-pinned full-tree references, not overlays.
- The relevant source subtrees used for the 134-path cross-check returned `truncated=false`: orders 057 (12 blobs), 058 (27), 059 (1), 060 (66), and recovered by-blob (237). The global repository-root recursive tree is truncated; no global source file count is claimed.
- The historic unique-content manifest contains **237 rows / 237 unique SHA values**, matching the **237** immediate child blob directories under `recovered-content/by-blob/`.
- Verification for 061/062 is based on exact gitlink commit SHA equality plus resolution of that commit to root tree `6750ad77c18f8db696fb56374dd6885666b19b99`. Counts are intentionally blank because tracked source files are referenced, not duplicated.

## Scope and limitations

This verification establishes the source-ref census, immutable full-tree commit references, order-057 comparison cross-check, and unique-blob counts. It does **not** prove semantic completeness, approve historical architecture, close any GATE or C-track, establish application build/test coverage, verify deployments or database runtime state, or authorize implementation.

Snapshot records preserve branch-tip source states. The gitlinks preserve the exact branch-tip commit objects; they do not replace or consolidate intermediate branch history. Do not delete source refs on the basis of this archive alone. A separate, approved history-retention decision must preserve and verify the needed commit ancestry before any branch cleanup.

The temporary task-delivery branch is operational and is intentionally not counted as an engineering source stage. The separate open PRs #32 and #33 were not merged or closed by this work. PR #35 remains a draft pending final-head checks and independent owner review.
