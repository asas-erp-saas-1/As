# ASAS Engineering History — Branch Snapshot Index

## Purpose
This archive preserves a full file-tree snapshot of every branch ref in the consolidation census, including the default branch itself. It is historical evidence, not an assertion that every old decision was approved.

## Ordering
Folders are numbered by the committer timestamp of each branch's tip commit, oldest to newest. Branches with the same timestamp are ordered by branch name. This is not the branch creation date.

## Layout
- `branches/NNN-branch-name/` — snapshot of that branch at its recorded tip, with original relative paths.
- `catalogs/` — chronological branch lists with commit IDs, dates, and file counts.
- `BRANCH-MANIFEST.csv` — machine-readable inventory of all branch refs and snapshot paths.

## Preservation notes
- Snapshot files reuse original Git blob objects.
- Every branch has a separate numbered folder, including branches that point to the same commit.
- Historical material must be reviewed before being promoted into current architecture.

## Coverage at census
- Branch refs: 51
- Distinct head commits: 23
- Branch folders: 51
- File entries across snapshots: 10,232, including repeated identical tips
- All recursive Git trees used for these snapshots were not truncated.

## Reading sequence
Start at `branches/001-...` and proceed in numeric order. Compare each snapshot with the current root and neighboring stages. Use the head SHA in `BRANCH-MANIFEST.csv` to inspect the original commit history on GitHub.

## Follow-up census and completeness verification (2026-10-17)

The original census recorded in `BRANCH-MANIFEST.csv` captured 51 branch refs and 51 numbered snapshots as of 2026-10-16. A fresh read of GitHub on 2026-10-17 found 53 live branch refs and 25 distinct head commits. Two branch refs were created after the original census: `archive/engineering-history-2026-10-16` and `fix/archive-snapshot-ci-exclusion-2026-10-16`. The default branch also advanced from the earlier archived tip.

Three complete tip snapshots were added:
- `052-archive__engineering-history-2026-10-16` — archival-work branch tip.
- `053-fix__archive-snapshot-ci-exclusion-2026-10-16` — CI-exclusion fix branch tip.
- `054-platform-architecture-2026` — current default branch tip at the follow-up census.

There are now 54 numbered snapshot folders: one for each of the 53 live refs plus the superseded default-branch checkpoint at order 051. The original 51 snapshots contain 10,232 file entries. The three new snapshots contain 15,777 files each, so the archive contains 57,563 file entries across snapshots, including intentionally repeated entries.

The two operational branches and the refreshed default-branch tip already contain the original archive. Their snapshots therefore include a finite nested copy of that archive exactly as it existed at those branch tips. These are nested contents of those three branch snapshots, not extra branch-census rows. For the canonical chronology, use the numbered folders and the new `SNAPSHOT-MANIFEST-2026-10-17.csv`; do not promote historical content into current architecture without reconciliation.
