# Full branch snapshot reference — order 062

- Original branch ref: `archive/refresh-engineering-history-2026-10-21`
- Exact source commit: `3c9785cadf08e71a1b8898c64439d1383c68e517`
- Exact source root tree: `6750ad77c18f8db696fb56374dd6885666b19b99`
- Snapshot mechanism: separate Git submodule gitlink at `source-snapshot/`, mode `160000`.
- Repository mapping: root `.gitmodules` maps this path to `https://github.com/asas-erp-saas-1/As.git`.

This is a separate branch-ref identity but its exact commit and root tree are identical to order 061. Its own gitlink pins the complete immutable source commit. Git shares the underlying commit/tree/blob objects rather than storing duplicate copies.

To materialize this snapshot, clone the archive with `git clone --recurse-submodules --branch archive/complete-branch-census-2026-11-12 https://github.com/asas-erp-saas-1/As.git`, then open `docs/engineering-history/branches/062-archive__refresh-engineering-history-2026-10-21-identical-head/source-snapshot/`. The pinned source commit is `3c9785cadf08e71a1b8898c64439d1383c68e517`.

This record preserves a branch-tip tree, not every intermediate commit in the branch DAG. Keep the original source ref until a separate history-retention decision has been approved. This evidence does not approve architecture or close engineering gates.
