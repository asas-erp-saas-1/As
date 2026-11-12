# Full branch snapshot reference — order 058

- Original branch ref: `archive/engineering-history-integrity-2026-10-17`
- Exact historical source commit: `e54e5726a09070fa91899c32cf6848b5cc728b36`
- Exact source root tree: `274493a3cceea1a8100d07ce8b2e4e6667643cd1`
- Snapshot mechanism: `source-snapshot/` Git submodule gitlink (mode `160000`).
- Repository mapping: root `.gitmodules` maps this path to `https://github.com/asas-erp-saas-1/As.git`.

This numbered record preserves the complete tracked repository tree at the exact historical commit. The full tree is accessed through the pinned immutable Git commit; file paths, modes and blobs remain the original Git objects and are not regenerated or copied into this archive's parent tree.

To materialize the complete snapshot, clone the archive branch with:

```bash
git clone --recurse-submodules --branch archive/complete-branch-census-2026-11-12 https://github.com/asas-erp-saas-1/As.git
cd As/docs/engineering-history/branches/058-archive__engineering-history-integrity-2026-10-17-head-delta/source-snapshot
git rev-parse HEAD
```

The final command should print `e54e5726a09070fa91899c32cf6848b5cc728b36`.

The original source branch ref is retained. This record preserves a branch-tip commit, not every intermediate commit in its DAG; it does not approve historical architecture or close engineering gates.
