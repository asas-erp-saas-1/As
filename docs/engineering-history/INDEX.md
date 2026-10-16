# ASAS Engineering History — Branch Snapshot Index

## Purpose
This archive preserves a full file-tree snapshot of every branch ref in the consolidation census, including the default branch itself. It is historical evidence, not an assertion that every old decision was approved.

## Ordering
Folders are numbered by the committer timestamp of each branch's tip commit, oldest to newest. Branches with the same timestamp are ordered by branch name. This is not the branch creation date.

## Layout
- `branches/NNN-branch-name/` — snapshot of that branch at its recorded tip, with original relative paths.
- `catalogs/` — chronological branch lists with commit IDs, dates, and file counts.
- `BRANCH-MANIFEST.csv` — the original point-in-time inventory of the first 51 refs.
- `SNAPSHOT-MANIFEST-2026-10-17.csv` — the updated 54-snapshot inventory, with statuses for current refs and superseded checkpoints.
- `delta-audit/` — CSV comparisons of branch files against the current default-branch root.
- `recovered-content/` — standalone copies of historical file blobs that are absent from the current root.

## Preservation notes
- Snapshot files reuse original Git blob/tree objects; file contents are not rewritten.
- Every branch ref in the captured census has a separate numbered folder, including branches pointing to the same commit.
- Historical material must be reviewed before being promoted into current architecture.
- The original default-branch tip remains preserved at order 051. The updated default-branch tip at the follow-up census is preserved at order 054.
- Three follow-up snapshots (052–054) contain finite nested copies of the previously existing archive because those branch-tip trees already included it.

## Original census (2026-10-16)
- Branch refs: 51
- Distinct head commits: 23
- Branch folders: 51
- File entries across snapshots: 10,232, including repeated identical tips
- Every recursive Git tree used for the original snapshot corpus was not truncated.

## Follow-up census and completeness verification (2026-10-17)
A fresh GitHub read found 53 live branch refs and 25 distinct head commits. Two refs were added after the original census: `archive/engineering-history-2026-10-16` and `fix/archive-snapshot-ci-exclusion-2026-10-16`. The default branch also advanced from its earlier archived tip.

Three complete tip snapshots were added:
- `052-archive__engineering-history-2026-10-16` — archival-work branch tip.
- `053-fix__archive-snapshot-ci-exclusion-2026-10-16` — CI-exclusion fix branch tip.
- `054-platform-architecture-2026` — current default branch tip at the follow-up census.

There are 54 numbered snapshot folders: one for each of the 53 live refs plus the superseded default-branch checkpoint at order 051. The original 51 snapshots contain 10,232 file entries. The three new snapshots contain 15,777 files each, so the archive contains 57,563 file entries across snapshots, including intentionally repeated entries.

All three added recursive source trees returned `truncated=false`. Orders 052–054 contain a finite nested copy of the original archive because those branch tips already included it. These nested copies are part of those branch snapshots; they are not additional top-level census rows.

## Branch delta and unique-content audit
Use the [branch delta audit](BRANCH-DELTA-AUDIT-2026-10-17.md) for the path/blob comparison against the current default-branch root. The [per-snapshot totals](delta-audit/SUMMARY-2026-10-17.csv) and [five chronological detail files](delta-audit/) identify file paths that differ by location or exact content hash.

The content-addressed scan identified one distinct historical file blob absent from the current root: the prior version of `.github/workflows/foundation-verify.yml` before the archive exclusion. It is preserved in [the historical-content register](UNIQUE-CONTENT-REGISTER-2026-10-17.md) and as a [standalone recovered copy](recovered-content/pre-archive-exclusion-foundation-verify.yml). This historical file is evidence only and must not replace the active workflow.
