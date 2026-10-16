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
