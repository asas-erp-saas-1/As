# Engineering history archive verification — 2026-10-17

## Result

**PASS — all 54 numbered snapshot folders checked.** The census represents 53 branch refs and 25 distinct heads observed at that point in time, plus the older default-branch checkpoint retained at order 051. The current default branch has continued to advance since the census; a follow-up review branch was created after it and is not an original historical stage.

## Inventory

- Original snapshot folders 001–051: 10,232 blob-file entries.
- Follow-up folders 052–054: 15,777 blobs each, 47,331 combined.
- Total recorded file entries across all numbered snapshots: 57,563.
- Current source-of-truth inventory: `SNAPSHOT-MANIFEST-2026-10-17.csv` (54 rows).
- Per-snapshot results: `SNAPSHOT-VERIFICATION-2026-10-17.csv` (54 rows).

Folder 051 preserves the default branch at `beaa42a95d947ae56379ae6fcab7850e3b60f50e`. Folder 052 preserves `archive/engineering-history-2026-10-16` at `806cd2fd9982cc8951504f53aad3432d57753364`. Folder 053 preserves `fix/archive-snapshot-ci-exclusion-2026-10-16` at `5e7dff8f5900373b395ac04cab66b0173a80c954`. Folder 054 preserves the default branch's pre-archive tip at `39ead7b4123666b0c20f301b9d4066864d3c88f5`. The archive-completion commit `1aeb0907ae544caafb5160bd90d0e21488024c53` is not recursively snapshotted into itself.

## Integrity method and outcome

For each snapshot folder, its source tree and snapshot subtree were compared by exact relative paths, object types, file modes, and Git blob SHAs. Folders 001–051 were checked against the original branch-tip tree and manifest; folders 052–054 were fetched and compared independently. Every per-snapshot recursive response used for validation returned `truncated=false`.

| Check | Result |
|---|---:|
| Snapshot folders checked | 54 |
| File entries counted across snapshots | 57,563 |
| Missing paths | 0 |
| Unexpected paths | 0 |
| Blob-SHA or file-mode mismatches | 0 |
| Per-snapshot source/snapshot trees truncated | 0 |

A whole-repository recursive-tree request can now be truncated because the archive substantially increases repository size. That does not invalidate these checks: the verification was performed per snapshot, not by trusting one global recursive response.

## Branch-delta / unique-content review

The companion [branch delta audit](BRANCH-DELTA-AUDIT-2026-10-17.md) compares branch files against the canonical non-archive root baseline at commit `39ead7b4123666b0c20f301b9d4066864d3c88f5`, excluding the archive itself from both sides. It reports 1,982 file-path delta rows: 589 same-path content differences and 1,393 path differences whose exact blob is present elsewhere in the root.

The scan identified one distinct historical blob absent from that baseline root, repeated in snapshots 051 and 052: the old `.github/workflows/foundation-verify.yml` (8,649 bytes; blob `baaae4cde9dbb357ac968239e921930559e7b51e`). It remains preserved in the full snapshots and standalone at `recovered-content/pre-archive-exclusion-foundation-verify.yml`. Do not restore it over the active workflow: it predates the exclusion that prevents archival files from being treated as active session-state instructions.

## Scope and limitations

This procedure verifies tracked file trees; it does not by itself prove semantic completeness, establish architecture authority, resolve contradictions, or close architecture gates. The current archive completion and delta-audit commits also have independent CI/deployment status. This report is not a claim that every external deployment or security check is green.

The archival changes affect historical documentation and inventory only; they do not modify application runtime behavior, schemas, migrations, or RLS policies.
