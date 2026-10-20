# Unique historical content register — refreshed 2026-10-20

The file-level comparison excludes both archival roots from the active project baseline. The active canonical non-archive root contains 417 tracked files. The 2026-10-17 baseline audit recorded 1,982 difference rows on 173 paths; the 2026-10-20 latest-head follow-up adds four historical blob versions from snapshot 058, yielding 1,986 rows on 174 paths and 237 distinct historical file blobs absent from the active root by exact Git blob SHA.

## Preservation method

Each of the 222 unique file contents is exposed once at:

`recovered-content/by-blob/<blob-sha>/<original-path>`

The file is wired to the exact original Git blob object. This avoids rewriting or normalizing text. The numbered branch folders preserve the whole source tree per branch tip, including original paths and object modes; the by-blob view is an additional convenience for direct review. See [the machine-readable manifest](recovered-content/UNIQUE-HISTORICAL-BLOB-MANIFEST-2026-10-17.csv) for SHA, byte count, original path, branch refs, snapshot order, occurrence count, and preservation path for each version.

## Counts

- Unique historical blob versions absent from active root: **226**
- Distinct original paths with differences: **174**
- Difference records across branch snapshot entries: **1,986**
- Historical versions at a path whose canonical content differs: **593**
- Files whose path and exact content are absent from active root: **1,393**
- File types among the 226 representative versions: 209 Markdown, 6 JSON, 8 YAML, 2 shell scripts, 1 patch.

## Safety and architecture status

This register is archival evidence, not an approval list. Do not blindly move these files into active architecture paths; use the branch/snapshot chronology and compare sources, authority, status, and contradictions first. In particular, the older Foundation Verify workflow remains under the archive and must not replace the active workflow because it predates the archive-path exclusion.


## Latest-head follow-up — 2026-10-20

Fifteen additional historical blob versions were identified in the updated `archive/engineering-history-integrity-2026-10-17` head (snapshot 058). They affect 15 non-archive paths, including seven paths not represented in the earlier delta rows; two of those paths are absent from the active root and 13 have different content at an existing path. All four exact blob SHAs are preserved in `recovered-content/by-blob/` and are listed in the updated manifest. Snapshot 057 preserves the current default head's 12-file archive delta and adds no non-archive content delta. Full snapshots plus the explicitly declared delta overlays and shared snapshot dependencies are the authoritative reconstructable record.
