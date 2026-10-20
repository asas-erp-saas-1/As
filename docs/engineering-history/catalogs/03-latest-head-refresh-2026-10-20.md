# Latest branch-head delta overlays — 2026-10-20

The live census contains 54 branch refs and 26 distinct head commits. Every current branch name is already represented in the prior manifest; two refs advanced after snapshots 055–056. Because the archive tree is deeply nested, GitHub's tree API rejects another full recursive copy as too large. The latest states are therefore recorded as explicit, file-level delta overlays whose base and shared snapshot dependencies are declared below.

| Order | Branch head | Source commit | Base snapshot | Delta files | Overlay path | Result |
|---:|---|---|---:|---:|---|---|
| 057 | `platform-architecture-2026` | `2672247aab8ce830091db1df83d1b233aa88d17f` | 056 | 12 | `docs/engineering-history/branches/057-platform-architecture-2026-head-delta` | PASS_DELTA_OVERLAY |
| 058 | `archive/engineering-history-integrity-2026-10-17` | `e54e5726a09070fa91899c32cf6848b5cc728b36` | 055 | 21 | `docs/engineering-history/branches/058-archive__engineering-history-integrity-2026-10-17-head-delta` | PASS_DELTA_OVERLAY |

## Reconstruction rules

- Order 057: apply its 12 exact source-blob paths over full snapshot 056. Reuse archived orders 055 and 056 as shared archive dependencies rather than duplicating their large nested trees.
- Order 058: apply its 21 exact source-blob paths over full snapshot 055. The nested self-snapshot of order 055 is referenced through order 055 itself and is not copied recursively.
- The overlay folders contain only changed paths; they are not standalone full-tree snapshots. Their source commit SHAs and exact file blob SHAs are recorded in Git history and the verification manifest.
- Four historical blob versions in order 058 differ from the current active file at the same path. They are also available under `recovered-content/by-blob/` and listed in the unique historical blob manifest.

This method preserves the complete reconstructable branch state without inventing file counts or recursively duplicating an already large archive.
