# ASAS Engineering History — Branch Snapshot Index

## Purpose
This archive preserves a complete file-tree snapshot of every branch ref that existed at the consolidation census, including the default branch itself. It is an evidence corpus, not a statement that every historical decision was approved.

## Ordering
Folders are numbered by the committer timestamp of each branch's tip commit (oldest to newest); branches sharing the same commit are ordered by branch name. This is not the branch creation date.

## Layout
- `branches/NNN-branch-name/` — full snapshot of that branch's files at its recorded tip; original relative paths are preserved inside the folder.
- `catalogs/` — chronological branch lists with head commit, date, and file counts.
- `BRANCH-MANIFEST.csv` — machine-readable inventory of all branch refs and snapshot paths.

## Preservation semantics
- Files are copied by referencing their original Git blob objects, preserving bytes and executable/symlink modes where represented by blob entries.
- The archive commit will also retain each distinct branch-tip commit as an additional Git parent, preserving reachable commit ancestry rather than only the tip snapshots.
- Repeated branch refs pointing to the same commit remain separate folders intentionally; this preserves the branch-by-branch work log while avoiding mistaken claims that those refs contained distinct code.
- These snapshots are historical. Do not treat them as ratified architecture or overwrite current files from them without a separate review.

## Coverage at census
- Branch refs: 51
- Distinct head commits: 23
- Branch folders: 51
- File entries across snapshots: 8793 (sum across all branch snapshots, including repeated identical tips)
- Recursive Git trees checked were not truncated.

## Reading sequence
Start at `branches/001-...` and proceed in numeric order. Compare each branch folder with the current root and with its neighboring stages. Use the commit SHA in the CSV to inspect the original commit history on GitHub.
