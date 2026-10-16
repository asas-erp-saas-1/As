# Unique historical content register — corrected 2026-10-17

The corrected file-level comparison excludes the contents of both archival roots from the active project baseline. The active canonical root contains 417 tracked files. The 54 branch snapshot records yield 1,982 difference records on 173 source paths. Those records map to 222 distinct historical file blobs absent from the active root by exact Git blob SHA.

## Preservation method

Each of the 222 unique file contents is exposed once at:

`recovered-content/by-blob/<blob-sha>/<original-path>`

The file is wired to the exact original Git blob object. This avoids rewriting or normalizing text. The numbered branch folders preserve the whole source tree per branch tip, including original paths and object modes; the by-blob view is an additional convenience for direct review. See [the machine-readable manifest](recovered-content/UNIQUE-HISTORICAL-BLOB-MANIFEST-2026-10-17.csv) for SHA, byte count, original path, branch refs, snapshot order, occurrence count, and preservation path for each version.

## Counts

- Unique historical blob versions absent from active root: **222**
- Distinct original paths with differences: **173**
- Difference records across branch snapshot entries: **1,982**
- Historical versions at a path whose canonical content differs: **589**
- Files whose path and exact content are absent from active root: **1,393**
- File types among the 222 representative versions: 205 Markdown, 6 JSON, 8 YAML, 2 shell scripts, 1 patch.

## Safety and architecture status

This register is archival evidence, not an approval list. Do not blindly move these files into active architecture paths; use the branch/snapshot chronology and compare sources, authority, status, and contradictions first. In particular, the older Foundation Verify workflow remains under the archive and must not replace the active workflow because it predates the archive-path exclusion.
