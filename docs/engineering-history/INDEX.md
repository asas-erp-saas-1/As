# ASAS Engineering History — Archive Index

## Latest live census and archive state — 2026-10-21

This point-in-time archive was refreshed against canonical commit `2672247aab8ce830091db1df83d1b233aa88d17f` on `platform-architecture-2026`. The live GitHub census contains **56 branch refs** and **28 distinct head commits**.

- Numbered snapshot folders: **60**. All 56 live branch refs are represented; four additional snapshot orders preserve superseded checkpoint heads.
- Orders **001–054** have detailed path/blob/mode verification. Their summed snapshot file-entry count is **57,563** (repeated contents and nested archives are intentionally counted per snapshot).
- Orders **055–056** are full root-tree copies verified by exact source-tree/snapshot-subtree SHA equality. Orders **057–058** are verified delta overlays: 12 and 27 changed tracked paths respectively.
- Orders **059–060** are full root-tree snapshots, verified by exact source-root-tree/snapshot-subtree SHA equality. Their recursive listings are too large to count reliably, so file counts are intentionally blank rather than estimated.
- Orders **055–056** preserve earlier heads of `archive/engineering-history-integrity-2026-10-17` and `platform-architecture-2026`; orders **057–058** preserve the later heads observed in the 2026-10-20 census.
- Order **059** preserves `docs/asas-master-context-2026-10-21` at `80d21aad9474506757c168c046496333b298735f`; order **060** preserves `archive/refresh-engineering-history-2026-10-20` at `c7db09bada487957c30608d1fde981f299eafe4a`.
- All 56 live branch names are represented in the manifest. The two branch refs added after the 2026-10-20 census are preserved by orders 059–060.
- The updated branch-delta audit remains scoped to the 2026-10-20 comparison: **1,997 delta rows across 180 source paths** and **237 distinct historical file blobs** absent from the active non-archive root. The 2026-10-21 master-context branch is preserved as a full snapshot; it has not been promoted to canonical root authority.
- Snapshotting preserves evidence; it does not approve historical design decisions, close architecture gates, authorize implementation, or delete branch refs.


## Ordering and layout

Snapshot folders are numbered by source tip-commit committer time, oldest to newest; branch name breaks ties. This is not branch creation order.

- `branches/NNN-branch-name/` — full tracked-file snapshots or explicitly labelled delta overlays; overlay base/dependencies and exact changed paths are recorded in the manifest and verification report.
- `catalogs/` — human-readable chronological inventories.
- `SNAPSHOT-MANIFEST-2026-10-17.csv` — authoritative mapping for the 58 snapshot records. The older `BRANCH-MANIFEST.csv` remains as the original 51-row inventory.
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

The census above records the 56 source refs observed before this archive refresh branch was created. The delivery branch `archive/refresh-engineering-history-2026-10-21` was created only to submit this archive update; it is not a historical source stage and is intentionally not self-snapshotted. After the archival PR is merged, this delivery branch should be removed during branch cleanup if the repository is to return to a single-branch operating model.
