# Full branch snapshot reference — 061

- Original branch ref: `platform-architecture-2026`
- Exact source commit: `3c9785cadf08e71a1b8898c64439d1383c68e517`
- Exact source root tree: `6750ad77c18f8db696fb56374dd6885666b19b99`
- Snapshot method: Git submodule gitlink pinned to the exact source commit.
- Snapshot path: `source-snapshot/`

This folder represents the **complete tracked repository tree** at the exact source commit. The nested `source-snapshot/` gitlink points to the original immutable commit, rather than copying the repository into itself. The Git object graph preserves every tracked file, directory, path and file mode at that commit.

To check out the full snapshot locally:

```bash
git clone https://github.com/asas-erp-saas-1/As.git
cd As
git checkout 3c9785cadf08e71a1b8898c64439d1383c68e517
```

When cloning this archive branch, use `git clone --recurse-submodules` to populate the pinned `source-snapshot/` directory. The source commit predates this archive reference, so the nested snapshot does not recurse into itself.

The source ref must remain available until commit-DAG retention is separately approved. This record does not promote historical architecture or close any engineering gate.
