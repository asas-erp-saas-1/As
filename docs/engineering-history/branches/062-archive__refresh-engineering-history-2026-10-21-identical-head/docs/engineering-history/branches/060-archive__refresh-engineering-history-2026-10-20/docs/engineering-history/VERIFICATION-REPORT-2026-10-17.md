# Engineering history archive verification — 2026-10-17

## Result

**Historical census result (2026-10-17): PASS — all 54 numbered snapshot folders checked at that census.** The census represents 53 branch refs and 25 distinct heads observed at that point in time, plus the older default-branch checkpoint retained at order 051. The current default branch has continued to advance since the census; a follow-up review branch was created after it and is not an original historical stage.

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

## Second live census and corrected delta audit (2026-10-17)

The repository changed after the 53-ref census: a new operational review branch, `archive/engineering-history-integrity-2026-10-17`, appeared at `09a317253ce9abe473cc5915b2a00422febdd6a3`, and the default branch advanced to `5ecf8a74f622cfcdadb8d4883346f08dc9ae9453`. The second live census contains 54 refs and 26 distinct head commits.

Two full snapshots were added:
- Order 055: `archive/engineering-history-integrity-2026-10-17`, source tree `a43a0d09d6c078264bbb3c3ef4bbf84dab9e7bd3`.
- Order 056: `platform-architecture-2026`, source tree `a43a0d09d6c078264bbb3c3ef4bbf84dab9e7bd3`.

Both snapshot folder tree roots are exactly the same Git tree object as the source root, so the full tracked tree is preserved without content rewriting. A global recursive tree request returned `truncated=true` (28,291 returned entries), so the source and snapshot blob totals are intentionally left blank in the manifest rather than inferred from an incomplete response. The verification rows record `PASS_TREE_SHA`, zero known path/blob/mode differences, and the truncation limitation.

The branch delta audit was corrected to exclude both legacy and current archive namespaces from the active baseline. The active canonical root has 417 tracked files; the one-way comparison yields 1,982 rows across 173 paths and 222 distinct historical blob versions absent from that active root. These 222 file blobs are exposed once under `recovered-content/by-blob/` and mapped by the unique-blob manifest. Use the corrected audit and summary files, not the initial 2026-10-17 audit figures.

This is still an archival integrity report, not approval of historical architectural decisions.


## Third live census and latest-head refresh — 2026-10-20

The current GitHub census contains 54 branch refs and 26 distinct head commits. A name-by-name comparison against the existing manifest found no unrepresented live branch names. Two branch refs had advanced beyond their previously archived heads:

- Order 057: `platform-architecture-2026` at `2672247aab8ce830091db1df83d1b233aa88d17f`; 12 changed non-nested paths over base snapshot 056.
- Order 058: `archive/engineering-history-integrity-2026-10-17` at `e54e5726a09070fa91899c32cf6848b5cc728b36`; 21 changed non-nested paths over base snapshot 055.

GitHub's recursive tree API rejects another complete nested copy of these already deeply nested archive trees as too large. The latest states are therefore preserved as exact file-level overlays on the previous full snapshots, rather than falsely reported as full-tree copies:

Order 057 records all 12 changed non-nested file paths by exact source blob SHA and reuses orders 055–056 as shared archive dependencies. Order 058 records all 21 changed non-nested file paths by exact source blob SHA and reuses order 055 as its base. The verification manifest marks both `PASS_DELTA_OVERLAY`; they are not standalone full-tree snapshots. Fifteen of order 058's non-archive paths contain historical blobs absent from or different from the active non-archive root; those exact blobs are also preserved under `recovered-content/by-blob/`. The updated audit totals are 1,997 delta rows, 180 source paths, and 237 distinct historical blobs. No historical statement is promoted to current architecture authority.
