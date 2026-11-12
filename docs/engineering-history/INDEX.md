# ASAS Engineering History — Archive Index

## Latest source-branch census — 2026-11-12

The pre-delivery live GitHub census at `2026-11-12T01:17:00Z` contains **57 source branch refs** and **28 distinct head commits**. The current default remains `platform-architecture-2026`, at head `3c9785cadf08e71a1b8898c64439d1383c68e517` (source root tree `6750ad77c18f8db696fb56374dd6885666b19b99`). The separately created task-delivery branch `archive/complete-branch-census-2026-11-12` is excluded from this historical source-ref census and is the branch carrying the archive update for review.

- The archive contains **62 numbered records**: 57 source refs plus five retained earlier branch-head checkpoints. All 57 pre-delivery source ref names are represented in the manifest and `LIVE-REF-CENSUS-2026-11-12.csv`.
- Orders **061** and **062** preserve `platform-architecture-2026` and `archive/refresh-engineering-history-2026-10-21` as **separate full-tree source references**. Each numbered folder contains a README and a `source-snapshot/` Git submodule gitlink (mode `160000`) pinned to exact commit `3c9785cadf08e71a1b8898c64439d1383c68e517`; that commit's root tree is `6750ad77c18f8db696fb56374dd6885666b19b99`. `.gitmodules` maps both pointers to this repository. Clone with `--recurse-submodules` to materialize every tracked source file. The branch identities remain distinct while Git reuses the same immutable commit/tree/blob objects.
- As an audit cross-check, the latest source head differs from order 057 at **134 archive paths**: 124 additions, 10 modifications and zero deletions. All 134 changed paths were mapped to exact source blob SHAs and file modes. Orders 057–062 use commit-pinned Git submodule references, not delta overlays: each submodule points to a complete immutable source commit and its full tracked tree, so no delta base is required.
- The per-snapshot source listings used for the order-057 delta cross-check and the recovered-blob tree were complete (`truncated=false`). The whole repository-root recursive listing is truncated, so no global root file count is inferred. The full-tree integrity check for orders 057–062 verifies each gitlink target commit SHA and its source root-tree SHA; file counts are intentionally blank because contents are referenced through Git rather than duplicated in the parent tree. Orders 061/062 share the same source commit/root tree.
- The archive contains **237 distinct historical blob versions** under `recovered-content/by-blob/`; corrected delta totals are **1,997 branch-file difference records across 180 source paths** (602 same-path content differences and 1,395 path/content absences).
- Snapshot folders preserve tracked tree state at each recorded head, not every intermediate commit in branch history. Keep the source refs until a separate history-retention strategy is approved and verified; snapshot completeness is not authority to delete branches.
- Snapshotting preserves evidence only. It does not approve historical architecture, close gates, authorize implementation, or merge/close separate open PRs.

See [the live-ref census](LIVE-REF-CENSUS-2026-11-12.csv), [the corrected unique-content register](UNIQUE-CONTENT-REGISTER-2026-10-17.md), and [the verification report](VERIFICATION-REPORT-2026-10-17.md).


## Prior live census and archive state — 2026-10-21

This point-in-time archive was refreshed against canonical commit `2672247aab8ce830091db1df83d1b233aa88d17f` on `platform-architecture-2026`. The live GitHub census contains **56 branch refs** and **28 distinct head commits**.

- Numbered snapshot folders at that prior census: **60**. All 56 source refs then present were represented; four additional snapshot orders preserve superseded checkpoint heads.
- Orders **001–054** have detailed path/blob/mode verification. Their summed snapshot file-entry count is **57,563** (repeated contents and nested archives are intentionally counted per snapshot).
- Orders **055–056** are full root-tree copies verified by exact source-tree/snapshot-subtree SHA equality. Orders **057–058** now use commit-pinned full-tree references; the former 12- and 27-path delta records remain in the delta-audit evidence.
- Orders **059–060** now use commit-pinned full-tree references to their source commits; the former 1- and 66-path delta analyses remain preserved as separate forensic evidence. All orders 057–062 have standalone source commit pins, so no overlay reconstruction is required.
- Orders **055–056** preserve earlier heads of `archive/engineering-history-integrity-2026-10-17` and `platform-architecture-2026`; orders **057–058** preserve the later heads observed in the 2026-10-20 census.
- Order **059** preserves the single-file delta for `docs/asas-master-context-2026-10-21` at `80d21aad9474506757c168c046496333b298735f`; order **060** preserves the 66-path delta for `archive/refresh-engineering-history-2026-10-20` at `c7db09bada487957c30608d1fde981f299eafe4a`. Apply each over order 057 to reconstruct the branch tree.
- All 56 live branch names are represented in the manifest. The two branch refs added after the 2026-10-20 census are preserved by orders 059–060.
- The updated branch-delta audit remains scoped to the 2026-10-20 comparison: **1,997 delta rows across 180 source paths** and **237 distinct historical file blobs** absent from the active non-archive root. The 2026-10-21 master-context branch is preserved as a reconstructable overlay; it has not been promoted to canonical root authority.
- Snapshotting preserves evidence; it does not approve historical design decisions, close architecture gates, authorize implementation, or delete branch refs.


## Ordering and layout

Snapshot folders are numbered by source tip-commit committer time, oldest to newest; branch name breaks ties. This is not branch creation order.

- `branches/NNN-branch-name/` — full tracked-file snapshots or explicitly labelled delta overlays; overlay base/dependencies and exact changed paths are recorded in the manifest and verification report.
- `catalogs/` — human-readable chronological inventories.
- `SNAPSHOT-MANIFEST-2026-10-17.csv` — authoritative mapping for the 62 snapshot records. The older `BRANCH-MANIFEST.csv` remains as the original 51-row inventory.
- `SNAPSHOT-VERIFICATION-2026-10-17.csv` — per-snapshot file count and integrity outcome.
- `VERIFICATION-REPORT-2026-10-17.md` — verification method, counts, scope, and limitations.
- `BRANCH-DELTA-AUDIT-2026-10-17.md` and `delta-audit/` — branch-to-root path and blob comparisons.
- `UNIQUE-CONTENT-REGISTER-2026-10-17.md`, `recovered-content/UNIQUE-HISTORICAL-BLOB-MANIFEST-2026-10-17.csv`, and `recovered-content/by-blob/` — all 237 distinct historical file blobs not found in the active non-archive root.

## Integrity methodology

For orders 001–054, each source tree was compared with its snapshot subtree by relative path, object type, file mode, and Git blob SHA; the per-snapshot recursive responses returned `truncated=false`. Orders 055–056 are verified by exact equality between source root-tree SHA and snapshot subtree-root SHA. Orders 057–058 are delta overlays: every changed non-nested file path is preserved using its exact source blob SHA, compared with the declared base snapshot, and verified with zero missing, unexpected, or mismatched paths. A global recursive-tree response is not used as the source of truth.

Snapshots 052–056 contain finite nested copies of prior archives because their full source trees already included the archive. This is deliberate full-tree preservation. It can make a single global recursive-tree response truncate; each numbered snapshot's recorded root tree SHA or per-file verification record is the integrity evidence. File-entry totals are not unique-file or unique-blob totals.

## Architecture reconciliation queue

The corrected file-level audit is distilled into [the 173-path architecture reconciliation queue](ARCHITECTURE-RECONCILIATION-QUEUE-2026-10-17.csv) and its [triage guide](ARCHITECTURE-RECONCILIATION-QUEUE-2026-10-17.md). The queue prioritizes active control surfaces first, architecture/governance second, and contextual material third. Every row remains pending review; no old design decision was automatically promoted.

## Legacy closure-to-gate crosswalk (proposed)

The [proposed crosswalk from 14 legacy closure dimensions to current Engineering Conference gates](GATE-CROSSWALK-CANDIDATE-2026-10-17.md) is explicitly unapproved and closes no gates. It prevents confusing G00–G13 closure dimensions with GATE-00–GATE-07 serial authority gates.

## Early-stage semantic reconciliation

The [initial semantic review of foundational 2026-09 artifacts](EARLY-STAGE-SEMANTIC-RECONCILIATION-2026-10-17.md) distinguishes superseded agent instructions from partial/missing contracts and records critical unresolved ordering, authorization, domain-boundary, state-machine, gate-crosswalk and adversarial-closure work. The [machine-readable disposition table](EARLY-STAGE-SEMANTIC-RECONCILIATION-2026-10-17.csv) records source SHAs and next actions. This is a targeted first pass, not closure of all 173 queue entries.

## Branch-delta findings — refreshed 2026-10-20

The comparison baseline remains the active canonical root at commit `39ead7b4123666b0c20f301b9d4066864d3c88f5`, excluding both `engineering-history/**` and `docs/engineering-history/**`. That non-archive baseline contains **417 tracked files and 417 unique blob SHAs**.

The earlier audit for snapshot orders 001–056 found 1,982 delta rows across 173 paths. The latest-head reconciliation adds four historical file versions from order 058 that differ from current content at the same paths; order 057 is the current default-root snapshot and adds no non-archive delta. The reconciled total is **1,997 delta rows across 180 source paths**: **602** same-path historical content versions and **1,395** source files whose path and exact blob are absent from the active root. The 1,986 rows resolve to **237 distinct historical file blobs** absent from the active root by exact Git blob SHA.

All 237 distinct blobs are exposed at `recovered-content/by-blob/<blob-sha>/<original-path>` using their original Git blob objects. See the updated unique-blob manifest and [the latest-head delta rows](delta-audit/part-06-oct20-latest-heads.csv). The detailed parts 01–05 retain the earlier audit evidence; part 06 records the 15 newly reconciled differences.

## Architecture guardrails

Snapshots preserve evidence; they do not ratify old design claims, resolve source-authority conflicts, prove semantic completeness, or close architecture gates. The next review should reconcile historical decisions, unresolved domain requirements, invariants, tenancy/security assumptions, state transitions, integration contracts, and open gates before implementation begins.


## Archive maintenance branch note

The census above records the 56 source refs observed before this archive refresh delivery branch was created. The delivery branch `archive/refresh-engineering-history-2026-10-21` was created only to submit this archive update; it is not a historical source stage and is intentionally not self-snapshotted. After the archival PR is merged, this delivery branch should be removed during branch cleanup if the repository is to return to a single-branch operating model.


## Commit-DAG reachability and retention — 2026-11-12

A comparison of all 28 distinct live source head commits against the canonical default head produced: **4 ancestor heads / 4 refs**, **1 identical head / 2 refs**, **19 diverged heads / 19 refs**, and **4 unverified heads / 32 refs** (GitHub compare returned 422 because diff generation was too large). All 57 source refs are accounted for. See [the reachability report](BRANCH-HEAD-REACHABILITY-2026-11-12.md) and [the machine-readable matrix](HEAD-REACHABILITY-2026-11-12.csv).

The 19 diverged refs contain commits not in the canonical default and must not be removed without an equivalent verified commit-DAG anchor. The 32 refs whose reachability could not be resolved are also not retirement candidates. Only four refs are proven ancestors and two are the identical canonical tip; even those are merely candidates for later cleanup after PR, CI, deployment, workflow, and branch-protection checks. Current branch protection is reported as `protected=false`. No refs are deleted by this work.
