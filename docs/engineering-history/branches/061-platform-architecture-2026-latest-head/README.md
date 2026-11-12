# Full branch snapshot reference — order 061

- Original branch ref: `platform-architecture-2026`
- Exact source commit: `3c9785cadf08e71a1b8898c64439d1383c68e517`
- Exact source root tree: `6750ad77c18f8db696fb56374dd6885666b19b99`
- Snapshot mechanism: Git submodule gitlink at `source-snapshot/`, mode `160000`.
- Repository mapping: root `.gitmodules` maps this path to `https://github.com/asas-erp-saas-1/As.git`.

This is a complete immutable reference to the tracked repository tree at the source commit. The files remain in their original Git objects; the archive does not rewrite, regenerate or duplicate them inside itself. The pinned commit resolves to the exact root tree SHA above.

To materialize all source files from this archive branch:

```bash
git clone --recurse-submodules --branch archive/complete-branch-census-2026-11-12 https://github.com/asas-erp-saas-1/As.git
cd As/docs/engineering-history/branches/061-platform-architecture-2026-latest-head/source-snapshot
git rev-parse HEAD
```

The final command should print `3c9785cadf08e71a1b8898c64439d1383c68e517`.

This record preserves a branch-tip tree, not every intermediate commit in the branch DAG. Keep the original source ref until a separate history-retention decision has been approved. This evidence does not approve architecture or close engineering gates.
