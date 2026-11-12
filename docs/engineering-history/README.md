# ASAS Engineering History Archive

This directory preserves full tracked-file-tree snapshots of the branch tips captured during engineering consolidation. It is designed to help reconstruct the platform's engineering history from the earliest available work to the consolidation checkpoint without overwriting older decisions or silently promoting them to approved architecture.

**Archive contents are evidence, not automatically approved design.** Presence in this archive does not establish authority, consistency, or closure of an architecture gate.

Start with:

1. [`INDEX.md`](INDEX.md) — chronology, scope, and reading guidance.
2. [`SNAPSHOT-MANIFEST-2026-10-17.csv`](SNAPSHOT-MANIFEST-2026-10-17.csv) — the authoritative 62-record inventory (57 source refs, five retained checkpoints): branch ref, source SHA, commit time, file count, and folder.
3. [`SNAPSHOT-VERIFICATION-2026-10-17.csv`](SNAPSHOT-VERIFICATION-2026-10-17.csv) — per-snapshot file and integrity checks.
4. [`VERIFICATION-REPORT-2026-10-17.md`](VERIFICATION-REPORT-2026-10-17.md) — verification methodology and limitations.
5. [`BRANCH-DELTA-AUDIT-2026-10-17.md`](BRANCH-DELTA-AUDIT-2026-10-17.md), [`delta-audit/`](delta-audit/), and [`UNIQUE-CONTENT-REGISTER-2026-10-17.md`](UNIQUE-CONTENT-REGISTER-2026-10-17.md) — file-level differences and unique historical content.
6. [`catalogs/`](catalogs/) — human-readable chronology.
7. [`branches/`](branches/) — the original relative file paths under numbered folders; orders 001–056 are full snapshots or exact root-tree copies; orders 057–062 are separate full-tree commit references. Each numbered folder contains a README and a Git submodule gitlink pinned to its exact historical source commit. The root `.gitmodules` maps all six links to this repository; clone with `--recurse-submodules` to materialize the full tracked source tree. This avoids duplicating the repository inside its own historical archive.

The old [`BRANCH-MANIFEST.csv`](BRANCH-MANIFEST.csv) is preserved as the original 51-row census. Use the dated snapshot manifest for the follow-up census. Branches with identical commit heads remain separate folders because each branch ref is separately represented.

Nested copies of the earlier archive in snapshots 052–054 are intentional: their source branch trees already included the archive at those historical tips. The historical version of `.github/workflows/foundation-verify.yml` must remain archived and must not replace the current workflow.


## Latest refresh — 2026-10-21

The pre-maintenance census contains 56 source branch refs and 28 distinct head commits. The 60 snapshot records preserve those refs plus four earlier checkpoints. Orders 057–060 are delta overlays, each preserving exact changed blob SHAs over a declared base. Orders 059–060 record their source root tree SHAs and are reconstructable from order 057 plus the overlay. This avoids repeatedly expanding the nested archive in every checkout. No branch refs are deleted by this archive update.


## Overlay scope note

Order 057 contains 12 changed archive/index paths over order 056. Order 058 contains 27 changed non-nested paths over the shared base. Order 059 contains one added file over order 057. Order 060 contains 66 changed paths over order 057 (56 added and 10 modified, with no deletions). These are reconstructable delta overlays, not standalone full-tree copies; source root tree SHAs are retained as provenance.


## Live-ref census — 2026-11-12

The pre-delivery source-branch census contains 57 refs and 28 distinct heads. Orders 061–062 preserve the latest default-branch head and its same-head alias in separate folders backed by one shared verified overlay tree. The temporary task-delivery branch used to submit the archive update is deliberately excluded from historical source-ref snapshots. See [`LIVE-REF-CENSUS-2026-11-12.csv`](LIVE-REF-CENSUS-2026-11-12.csv) and [`catalogs/08-live-census-2026-11-12.md`](catalogs/08-live-census-2026-11-12.md).


## Full-tree references for orders 061–062

Orders 057–062 each have their own numbered folder and README. Inside each folder, `source-snapshot/` is a Git submodule gitlink pinned to the exact source commit for that snapshot order. The root `.gitmodules` maps all six paths to this repository. Run `git clone --recurse-submodules --branch archive/complete-branch-census-2026-11-12 https://github.com/asas-erp-saas-1/As.git` to materialize all six complete source trees. Orders 061 and 062 are separate branch-ref identities but share the exact same Git objects; the other four orders preserve earlier branch-tip commits. No file content is rewritten or duplicated.


## Commit-DAG reachability and retention — 2026-11-12

A comparison of all 28 distinct live source head commits against the canonical default head produced: **4 ancestor heads / 4 refs**, **1 identical head / 2 refs**, **19 diverged heads / 19 refs**, and **4 unverified heads / 32 refs** (GitHub compare returned 422 because diff generation was too large). All 57 source refs are accounted for. See [the reachability report](BRANCH-HEAD-REACHABILITY-2026-11-12.md) and [the machine-readable matrix](HEAD-REACHABILITY-2026-11-12.csv).

The 19 diverged refs contain commits not in the canonical default and must not be removed without an equivalent verified commit-DAG anchor. The 32 refs whose reachability could not be resolved are also not retirement candidates. Only four refs are proven ancestors and two are the identical canonical tip; even those are merely candidates for later cleanup after PR, CI, deployment, workflow, and branch-protection checks. Current branch protection is reported as `protected=false`. No refs are deleted by this work.
