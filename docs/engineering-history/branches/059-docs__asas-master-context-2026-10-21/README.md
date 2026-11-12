# Full branch snapshot reference — order 059

- Original branch ref: `docs/asas-master-context-2026-10-21`
- Exact historical source commit: `80d21aad9474506757c168c046496333b298735f`
- Exact source root tree: `85933920c8fe46e978884bda04b258ef5418fbf6`
- Snapshot mechanism: `source-snapshot/` Git submodule gitlink (mode `160000`).
- Repository mapping: root `.gitmodules` maps this path to `https://github.com/asas-erp-saas-1/As.git`.

This numbered record preserves the complete tracked repository tree at the exact historical commit. The full tree is accessed through the pinned immutable Git commit; file paths, modes and blobs remain the original Git objects and are not regenerated or copied into this archive's parent tree.

To materialize the complete snapshot, clone the archive branch with:

```bash
git clone --recurse-submodules --branch archive/complete-branch-census-2026-11-12 https://github.com/asas-erp-saas-1/As.git
cd As/docs/engineering-history/branches/059-docs__asas-master-context-2026-10-21/source-snapshot
git rev-parse HEAD
```

The final command should print `80d21aad9474506757c168c046496333b298735f`.

The original source branch ref is retained. This record preserves a branch-tip commit, not every intermediate commit in its DAG; it does not approve historical architecture or close engineering gates.
