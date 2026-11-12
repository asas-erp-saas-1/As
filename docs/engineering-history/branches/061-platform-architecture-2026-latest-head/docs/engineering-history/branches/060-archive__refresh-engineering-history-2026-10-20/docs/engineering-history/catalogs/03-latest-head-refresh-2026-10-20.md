# Latest branch-head delta overlays — 2026-10-20

The live census contains 54 branch refs and 26 distinct head commits. Every current branch name is represented by the previous full-snapshot inventory. Two refs advanced after the archived heads at orders 055–056. GitHub's tree API rejects another full copy of the deeply nested archive as too large, so these updates are recorded as exact file-level delta overlays with explicit base and source-tree references.

| Order | Branch head | Source commit | Source root tree | Base snapshot | Overlay files | Overlay path | Result |
|---:|---|---|---|---:|---:|---|---|
| 057 | `platform-architecture-2026` | `2672247aab8ce830091db1df83d1b233aa88d17f` | `bc362b385189deb42618bb624c1a857b62c55c88` | 056 | 12 | `docs/engineering-history/branches/057-platform-architecture-2026-head-delta` | PASS_DELTA_OVERLAY |
| 058 | `archive/engineering-history-integrity-2026-10-17` | `e54e5726a09070fa91899c32cf6848b5cc728b36` | `274493a3cceea1a8100d07ce8b2e4e6667643cd1` | 055 | 27 | `docs/engineering-history/branches/058-archive__engineering-history-integrity-2026-10-17-head-delta` | PASS_DELTA_OVERLAY |

## Reconstruction and scope

- Order 057 preserves 12 changed archive/index paths relative to order 056. Orders 055–056 remain separate shared archive dependencies.
- Order 058 preserves 27 changed non-nested paths identified across the source commit history: 15 architecture/governance/audit/handoff paths and 12 archive-index/metadata paths. The nested copy of order 055 is not duplicated.
- The source commit and source root-tree SHAs above identify the exact complete Git trees. The overlay folders themselves contain only the listed changed paths; they are not standalone full-tree snapshots.
- Fifteen distinct historical file blobs in order 058 are absent from the active non-archive root by exact SHA. Thirteen are different versions at existing paths; two source paths are absent from the active root. All 15 are preserved under `recovered-content/by-blob/` and listed in the unique-content manifest.
- The refreshed content audit totals 1,997 delta rows across 180 paths and 237 distinct historical blob versions absent from the active non-archive root.

No historical candidate is automatically promoted to canonical architecture by this archive update.
