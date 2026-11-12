# Branch delta audit versus the active canonical root (corrected 2026-10-17)

## Comparison baseline and correction

Baseline commit: `39ead7b4123666b0c20f301b9d4066864d3c88f5`, tree `41ca2f90e3a616ba721d7af4de1d99767ec41d9b`. The current default branch preserves the same 417 active tracked files outside the two archive namespaces.

**Correction:** an earlier 2026-10-17 comparison incorrectly counted the legacy archive under `engineering-history/branch-snapshots/**` as part of active root content. That made old texts look like they were still active merely because their blobs were present in a previous archive. This revised audit excludes both `engineering-history/**` and `docs/engineering-history/**` from the current-root comparison and excludes those archive paths from source snapshots too. Use only the figures and CSV files linked here; the initial audit figures are superseded.

## Verified results

- Live branch census: 53 refs, 25 unique live head commits at the census.
- Snapshot records: 54 numbered folders (53 live ref names plus the superseded default checkpoint at order 051).
- Active canonical root used for content comparison: 417 tracked files, 417 unique file blobs.
- Branch-tip trees examined: all 25 unique trees, each fetched without the GitHub `truncated` flag.
- Difference records: **1,982 branch-file instances** across **173 original paths**.
- **589** records are historical content versions whose path exists in the active root but whose full-file blob differs.
- **1,393** records are files whose original path is absent from the active root and whose exact blob is also absent from all other active-root paths.
- **0** records were explained by the exact historical blob being found at a different active-root path.
- Those 1,982 difference records resolve to **222 distinct historical file blobs** absent from the active root by exact Git blob SHA. Repeated branch tips intentionally yield repeated rows.

All 222 distinct blobs have been added to `recovered-content/by-blob/<blob-sha>/<original-path>` by reference to their original Git blob IDs; their contents have not been regenerated. The full branch snapshots remain the source of truth for complete tree state and original file modes.

## Detailed registers

- [Updated per-snapshot summary](delta-audit/SUMMARY-2026-10-17.csv)
- [222-blob unique historical-content manifest](recovered-content/UNIQUE-HISTORICAL-BLOB-MANIFEST-2026-10-17.csv)
- [Unique historical content register](UNIQUE-CONTENT-REGISTER-2026-10-17.md)

| Detail part | Snapshot order range | Difference records | CSV |
|---|---|---:|---|
| 1 | 001–033 | 1,642 | [part-01-sept15.csv](delta-audit/part-01-sept15.csv) |
| 2 | 034–038 | 103 | [part-02-sept16-17.csv](delta-audit/part-02-sept16-17.csv) |
| 3 | 039–043 | 122 | [part-03-sept18-20.csv](delta-audit/part-03-sept18-20.csv) |
| 4 | 044–048 | 105 | [part-04-sept29-oct16.csv](delta-audit/part-04-sept29-oct16.csv) |
| 5 | 049–054 | 10 | [part-05-follow-up-census.csv](delta-audit/part-05-follow-up-census.csv) |

Every detailed row records the snapshot order, branch ref, head commit SHA, original source path, delta classification, source blob SHA, active-root blob SHA at the same path (if any), exact-blob match count/path list outside that path, and file sizes. The unique-blob manifest maps each distinct historical version back to original branches and snapshot folders.

## Known historical workflow version

One of the 222 unique blobs is the older `.github/workflows/foundation-verify.yml` (blob `baaae4cde9dbb357ac968239e921930559e7b51e`, 8,649 bytes), before the active-state scan excluded `docs/engineering-history/**`. It remains preserved as [a standalone historical reference](recovered-content/pre-archive-exclusion-foundation-verify.yml) and in snapshots 051/052. Do **not** copy it over the current workflow: the current version contains the exclusion needed so archived texts are not interpreted as active session instructions.

## Interpretation and limits

This is a full-file path/blob comparison, not a semantic verdict. A source file can differ from the canonical path and still be well-designed, superseded, incomplete, or contradictory. These files are preserved for review; none of the 222 historical versions is automatically promoted into approved architecture. This audit also does not inventory files deleted from a historical branch, because the complete branch snapshots already preserve them and the legacy archive's path-level manifests record earlier add/modify/delete comparisons against commit `3009312dc803ca63dc32695d9deedcdcd3f91423`.

The next architectural pass should review these 222 content versions in chronological order, especially source-authority, domain invariants, authorization, state-machine behavior, tenant isolation, integration contracts, and readiness/closure gates before implementation.


## Third live census and latest-head delta — 2026-10-20

The 2026-10-20 census found 54 live refs and 26 distinct head commits; all current ref names already exist in the manifest. Only the default branch and the integrity-review branch had advanced beyond their previously snapshotted heads. Snapshot 057 records the 12 changed non-nested paths from the current default head over base snapshot 056; these changes are archival and add zero non-archive content deltas. Snapshot 058 records 27 changed non-nested paths over base snapshot 055, including 15 non-archive paths and 12 archive-index/metadata paths. Fifteen of those paths contain historical blob versions absent from or different from the active root, recorded in `delta-audit/part-06-oct20-latest-heads.csv`.

The four blob versions from the final task-count correction are listed below; the other 11 newly preserved versions from the earlier rebase/reconciliation commits are enumerated in part 06 and the unique-content manifest:
- `aac1d164cb586cbd46f6ba08266a448310970192` — `docs/audit/FORENSIC-REPOSITORY-RECONSTRUCTION-2026-09-20.md`
- `20dd4bdc149b4e12cbca5d39897ebe397fe7683d` — `docs/governance/BLUEPRINT-TO-CLAUDE-EXECUTION-CONTRACT.md`
- `89ac440e995b70303d581a6b7acdf3e757d1a2ce` — `docs/governance/FOUNDER-DECISIONS.md`
- `8d46ef9ce5aa4e37a375fe6e77785723030cca13` — `docs/governance/SOURCE-REGISTER-RECONCILIATION-REPORT.md`

All 15 source blob SHAs are absent from the prior 222-blob unique-content manifest; 13 differ from the active blob at the same path and two paths are absent from the active root. The current non-archive baseline remains 417 files. Reconciled totals: 1,997 delta rows, 180 paths, 602 same-path historical differences, 1,395 missing-path differences, and 237 distinct historical blobs absent from the active root.
