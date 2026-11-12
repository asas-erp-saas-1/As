# Full branch snapshot reference — order 060

- Original branch ref: `archive/refresh-engineering-history-2026-10-20`
- Exact historical source commit: `c7db09bada487957c30608d1fde981f299eafe4a`
- Exact source root tree: `6b98bb39b2978438802d2f1748be7049a50ba947`
- Snapshot mechanism: `source-snapshot/` Git submodule gitlink (mode `160000`).
- Repository mapping: root `.gitmodules` maps this path to `https://github.com/asas-erp-saas-1/As.git`.

This numbered record preserves the complete tracked repository tree at the exact historical commit. The full tree is accessed through the pinned immutable Git commit; file paths, modes and blobs remain the original Git objects and are not regenerated or copied into this archive's parent tree.

To materialize the complete snapshot, clone the archive branch with:

```bash
git clone --recurse-submodules --branch archive/complete-branch-census-2026-11-12 https://github.com/asas-erp-saas-1/As.git
cd As/docs/engineering-history/branches/060-archive__refresh-engineering-history-2026-10-20/source-snapshot
git rev-parse HEAD
```

The final command should print `c7db09bada487957c30608d1fde981f299eafe4a`.

The original source branch ref is retained. This record preserves a branch-tip commit, not every intermediate commit in its DAG; it does not approve historical architecture or close engineering gates.
