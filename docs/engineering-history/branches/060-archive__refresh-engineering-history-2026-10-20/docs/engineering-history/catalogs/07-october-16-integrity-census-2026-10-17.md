# Additional full-tree snapshots — second census, 2026-10-17

The first follow-up census contained 53 live refs and 54 numbered snapshots. A subsequent live read found one more live branch ref and the default branch at a newer tip: 54 refs and 26 distinct heads.

| Order | Branch ref | Head commit | Commit time (UTC) | Source tree SHA | Snapshot path | Verification |
|---:|---|---|---|---|---|---|
| 055 | `archive/engineering-history-integrity-2026-10-17` | `09a317253ce9abe473cc5915b2a00422febdd6a3` | 2026-10-16 23:44:05 | `a43a0d09d6c078264bbb3c3ef4bbf84dab9e7bd3` | `branches/055-archive__engineering-history-integrity-2026-10-17` | `PASS_TREE_SHA` |
| 056 | `platform-architecture-2026` | `5ecf8a74f622cfcdadb8d4883346f08dc9ae9453` | 2026-10-16 23:45:04 | `a43a0d09d6c078264bbb3c3ef4bbf84dab9e7bd3` | `branches/056-platform-architecture-2026` | `PASS_TREE_SHA` |

The root tree SHA is the same for both source refs and both snapshot subtrees. This is a complete tree-object copy; no source files are regenerated or omitted. Recursive enumeration of the whole source root is truncated because the root includes prior full-tree archives, so the file count is intentionally blank for these rows. The 54 earlier snapshots retain their previously recorded count/path/blob/mode verification.

Order 054 remains as the prior default-branch checkpoint; orders 055 and 056 are added rather than overwriting older archive evidence.
