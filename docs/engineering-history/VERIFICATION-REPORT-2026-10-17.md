# Engineering history archive verification — 2026-10-17

## Result

**PASS — 54 snapshot folders validated.** Across the recorded snapshots, there are 57,563 tracked-file entries counted per folder, including repeated files and nested copies. The current default branch is `platform-architecture-2026` at `1aeb0907ae544caafb5160bd90d0e21488024c53`.

## Live census and archive coverage

- Live branch refs at the follow-up census: 53.
- Distinct live head commits at the follow-up census: 25.
- Numbered snapshot folders: 54.
- Original folders 001–051: 10,232 blob-file entries.
- Follow-up folders 052–054: 15,777 blob-file entries each, 47,331 in total.
- Total recorded blob-file entries across all top-level snapshots: 57,563.
- Current authoritative inventory: `SNAPSHOT-MANIFEST-2026-10-17.csv` (54 rows, excluding its header).

Folder 051 is the earlier default-branch checkpoint at `beaa42a95d947ae56379ae6fcab7850e3b60f50e`. Folder 052 preserves `archive/engineering-history-2026-10-16` at `806cd2fd9982cc8951504f53aad3432d57753364`. Folder 053 preserves `fix/archive-snapshot-ci-exclusion-2026-10-16` at `5e7dff8f5900373b395ac04cab66b0173a80c954`. Folder 054 preserves the default branch at `39ead7b4123666b0c20f301b9d4066864d3c88f5`, immediately before the archive-completion commit. The completion commit itself is not recursively copied into a snapshot, to avoid a self-referential archive.

## Integrity methodology and results

For each of folders 001–051, the snapshot file paths, blob SHAs, modes, and counts were compared against the recorded source tip. For folders 052–054, a separate recursive source-tree response and a separate snapshot-subtree response were fetched for each folder, then the relative paths, object types, file modes, and blob SHAs were compared exactly.

| Check | Result |
|---|---:|
| Snapshot folders inspected | 54 |
| File entries counted across folders | 57,563 |
| Missing source paths | 0 |
| Unexpected snapshot paths | 0 |
| Blob-SHA or file-mode mismatches | 0 |
| Per-snapshot tree responses with `truncated=true` | 0 |

The individual recursive tree responses for folders 001–054 were not truncated. However, the full repository-wide recursive tree request is now too large to serve as a reliable single response and can return with GitHub's `truncated` flag. Therefore, the archive was not validated by relying on one global recursive response; each snapshot subtree was fetched and checked independently. The machine-readable per-folder results are in `SNAPSHOT-VERIFICATION-2026-10-17.csv`.

## Inventory interpretation

- `SNAPSHOT-MANIFEST-2026-10-17.csv` is the latest inventory. The older `BRANCH-MANIFEST.csv` is retained unchanged as the original 51-row census.
- The 54 snapshots represent the 53 refs observed at the follow-up census plus the superseded default-branch checkpoint at order 051. The default branch name appears twice: order 051 is its older checkpoint; order 054 is the pre-completion tip from which the archive extension was produced.
- Orders 052–054 already contained the original archive in their source trees. Their full snapshots intentionally preserve that finite nested copy.
- The aggregate 57,563 is a per-snapshot file-entry count, not a unique-blob count. Repeated tips, shared blobs, and nested archive copies are expected.
- Historical branch snapshots preserve files and texts; they do not approve historical architectural claims or establish that architecture gates are closed.

## Scope and CI status

This change concerns historical repository archival and its documentation. It does not modify application runtime behavior, database schemas, migrations, or RLS policies. Snapshot integrity is separate from whole-repository CI: do not interpret this report as asserting that every external deployment/security check is green.
