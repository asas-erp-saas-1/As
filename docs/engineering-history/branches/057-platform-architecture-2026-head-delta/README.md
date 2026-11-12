# Full branch snapshot reference — order 057

- Original branch ref: `platform-architecture-2026`
- Exact historical source commit: `2672247aab8ce830091db1df83d1b233aa88d17f`
- Exact source root tree: `bc362b385189deb42618bb624c1a857b62c55c88`
- Snapshot mechanism: `source-snapshot/` Git submodule gitlink (mode `160000`).
- Repository mapping: root `.gitmodules` maps this path to `https://github.com/asas-erp-saas-1/As.git`.

This numbered record preserves the complete tracked repository tree at the exact historical commit. The full tree is accessed through the pinned immutable Git commit; file paths, modes and blobs remain the original Git objects and are not regenerated or copied into this archive's parent tree.

To materialize the complete snapshot, clone the archive branch with:

```bash
git clone --recurse-submodules --branch archive/complete-branch-census-2026-11-12 https://github.com/asas-erp-saas-1/As.git
cd As/docs/engineering-history/branches/057-platform-architecture-2026-head-delta/source-snapshot
git rev-parse HEAD
```

The final command should print `2672247aab8ce830091db1df83d1b233aa88d17f`.

The original source branch ref is retained. This record preserves a branch-tip commit, not every intermediate commit in its DAG; it does not approve historical architecture or close engineering gates.
