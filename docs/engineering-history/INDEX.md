# ASAS Engineering History — Archive Index

## Archive census state (captured 2026-10-17)

The census was captured from GitHub on 2026-10-17 and committed to the then-current default branch `platform-architecture-2026` in commit `1aeb0907ae544caafb5160bd90d0e21488024c53`. This is a point-in-time inventory, not a live branch-list endpoint.

- **Branch refs represented by the census:** 53
- **Distinct live head commits at census time:** 25
- **Numbered top-level snapshot folders:** 54
- **File entries summed across top-level snapshots:** 57,563
- **Verification result for snapshot folders 001–054:** 0 missing paths, 0 blob-SHA/mode mismatches, 0 unexpected paths

The 54 snapshots comprise the original 51-folder census, the two live archive/CI support branches, and a second snapshot of the default branch at its pre-archive tip. Folder 051 preserves the earlier default-branch checkpoint. Folder 054 captures the default branch at `39ead7b4123666b0c20f301b9d4066864d3c88f5`, immediately before the archive-completion commit. The completion commit itself is not recursively snapshotted; doing so would make the archive self-referential. The later review branch `archive/engineering-history-integrity-2026-10-17` was created after that census to correct the inventory documentation; it is an operational review branch, not a missing historical architecture stage.

## Ordering

Folders are numbered by the committer timestamp of the source tip commit, oldest to newest. When timestamps tie, branch names are ordered lexicographically. These are tip-commit timestamps, not branch-creation dates.

## Layout and source of truth

- `branches/NNN-branch-name/` — a complete tracked-file-tree snapshot at the recorded source commit, preserving original relative paths.
- `catalogs/` — human-readable chronological inventories.
- `SNAPSHOT-MANIFEST-2026-10-17.csv` — **authoritative inventory** mapping all 54 snapshots to branch names, head SHAs, dates, counts, paths, and status.
- `SNAPSHOT-VERIFICATION-2026-10-17.csv` — per-snapshot integrity results.
- `VERIFICATION-REPORT-2026-10-17.md` — methodology, aggregate counts, and caveats.
- `BRANCH-MANIFEST.csv` — preserved original 51-row census from before the follow-up; it is historical provenance, not the latest inventory.

## Verification methodology

Each source branch tree and each corresponding snapshot subtree was examined without a per-snapshot GitHub truncation flag. The exact relative file paths, object types, file modes, and blob SHAs were compared. The checks found no missing, unexpected, or altered file entries.

The complete repository tree is now large enough that one repository-wide recursive tree request can be truncated by GitHub. That response is **not** the verification source of truth. Validation is performed against each snapshot subtree separately, with individual subtree responses checked for truncation.

## Preservation and architecture guardrails

- Snapshots reuse the original Git blob objects; text or code is not rewritten during preservation.
- Each branch ref has its own folder even when multiple refs point to the same commit.
- Folders 052 and 053 preserve the archive and CI-support branches as they existed. Folder 054 preserves the pre-completion default-branch tree. These three complete snapshots contain a finite nested copy of the earlier archive because it was already present in their source trees.
- The file-entry total deliberately counts repeated content once per snapshot. It is not a count of unique Git blobs.
- Historical presence does not mean that an architecture decision is approved, internally consistent, or ready for implementation. Contradictions, unresolved source authority, missing domain decisions, and open architecture gates still require a separate reconciliation pass.

## Recommended reading path

Start with `catalogs/01-earliest-branches.md`, then continue by the numeric catalog/folder order through `catalogs/06-october-16-follow-up-census-2026-10-17.md`. Use the snapshot manifest for exact SHA-to-folder mapping and compare neighboring snapshots to identify when a concept, constraint, or contradiction first appeared.
