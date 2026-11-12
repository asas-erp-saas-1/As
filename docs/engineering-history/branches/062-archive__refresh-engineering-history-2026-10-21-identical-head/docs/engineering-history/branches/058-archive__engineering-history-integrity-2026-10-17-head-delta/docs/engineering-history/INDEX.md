# ASAS Engineering History — Archive Index

## Census and archive state

This is a **point-in-time archive**, not a live branch list. The latest follow-up census reads the repository at default commit `5ecf8a74f622cfcdadb8d4883346f08dc9ae9453` (2026-10-16 23:45:04 UTC).

- Branch refs observed at the 2026-10-16 23:45 UTC census: **54**
- Distinct head commits observed at that census: **26**
- Numbered branch/checkpoint snapshots: **56**
- Full recursive path/blob/mode verification completed for orders **001–054**: **54 snapshots**
- Orders **055–056** are complete root-tree copies verified by an exact source-tree/snapshot-tree SHA match. GitHub's recursive response for source tree `a43a0d09d6c078264bbb3c3ef4bbf84dab9e7bd3` was truncated, so no file count is claimed for those two rows.
- The first 54 snapshots contain **57,563 file entries summed per snapshot** (intentionally repeated identical contents and nested historical archives are counted again).
- The earlier aggregate of 57,563 does **not** include expanded entries for orders 055–056; this index intentionally does not invent a total while the global recursive API enumeration is truncated.

The snapshot folders comprise 54 live-ref names plus two historical checkpoints of the default branch. Order 051 preserves the earlier default checkpoint `beaa42a95d947ae56379ae6fcab7850e3b60f50e`. Order 054 preserves the pre-archive default tip `39ead7b4123666b0c20f301b9d4066864d3c88f5`. Order 055 preserves the full tree for `archive/engineering-history-integrity-2026-10-17` at `09a317253ce9abe473cc5915b2a00422febdd6a3`; order 056 preserves the full default-branch tree at `5ecf8a74f622cfcdadb8d4883346f08dc9ae9453` before this corrective archive update. Orders 055 and 056 have the same source root tree SHA `a43a0d09d6c078264bbb3c3ef4bbf84dab9e7bd3`.

The archive-update commit created by this correction is not copied into itself. Use orders 055–056 to inspect the state immediately before this correction.
## Ordering and layout

Snapshot folders are numbered by source tip-commit committer time, oldest to newest; branch name breaks ties. This is not branch creation order.

- `branches/NNN-branch-name/` — full tracked-file snapshot at that source tip, retaining original relative paths.
- `catalogs/` — human-readable chronological inventories.
- `SNAPSHOT-MANIFEST-2026-10-17.csv` — authoritative mapping for the original 54 per-branch snapshot records. Supplemental root-tree checkpoints 055–056 are described in this index; they were verified by exact tree SHA and intentionally have no claimed expanded file count. The older `BRANCH-MANIFEST.csv` remains as the original 51-row inventory.
- `SNAPSHOT-VERIFICATION-2026-10-17.csv` — per-snapshot file count and integrity outcome.
- `VERIFICATION-REPORT-2026-10-17.md` — verification method, counts, scope, and limitations.
- `BRANCH-DELTA-AUDIT-2026-10-17.md` and `delta-audit/` — branch-to-root path and blob comparisons.
- `UNIQUE-CONTENT-REGISTER-2026-10-17.md`, `recovered-content/UNIQUE-HISTORICAL-BLOB-MANIFEST-2026-10-17.csv`, and `recovered-content/by-blob/` — all 222 distinct historical file blobs not found in the active non-archive root.

## Integrity methodology

Each snapshot's source tree was compared with its corresponding snapshot subtree by relative path, object type, file mode, and Git blob SHA. The per-snapshot recursive responses returned `truncated=false`. Because the total repository tree has grown large enough for a single global recursive-tree response to be truncated, it is **not** used as the source of truth for the per-snapshot checks.

Snapshots 052–056 contain finite nested copies of prior archives because their full source trees already included the archive. This is deliberate full-tree preservation. It can make a single global recursive-tree response truncate; each numbered snapshot's recorded root tree SHA or per-file verification record is the integrity evidence. File-entry totals are not unique-file or unique-blob totals.

## Architecture reconciliation queue

The corrected file-level audit is distilled into [the 173-path architecture reconciliation queue](ARCHITECTURE-RECONCILIATION-QUEUE-2026-10-17.csv) and its [triage guide](ARCHITECTURE-RECONCILIATION-QUEUE-2026-10-17.md). The queue prioritizes active control surfaces first, architecture/governance second, and contextual material third. Every row remains pending review; no old design decision was automatically promoted.

## Legacy closure-to-gate crosswalk (proposed)

The [proposed crosswalk from 14 legacy closure dimensions to current Engineering Conference gates](GATE-CROSSWALK-CANDIDATE-2026-10-17.md) is explicitly unapproved and closes no gates. It prevents confusing G00–G13 closure dimensions with GATE-00–GATE-07 serial authority gates.

## Early-stage semantic reconciliation

The [initial semantic review of foundational 2026-09 artifacts](EARLY-STAGE-SEMANTIC-RECONCILIATION-2026-10-17.md) distinguishes superseded agent instructions from partial/missing contracts and records critical unresolved ordering, authorization, state-machine, gate-crosswalk and adversarial-closure work. Its dated status correction records that FD-001 and FD-002/ADR-0021 have since closed the high-level context grouping and Scheduling owner selection; detailed contracts remain open. The [machine-readable disposition table](EARLY-STAGE-SEMANTIC-RECONCILIATION-2026-10-17.csv) records source SHAs and next actions. This is a targeted first pass, not closure of all 173 queue entries.

## Branch-delta findings

The corrected path/blob comparison uses the active canonical root from commit `39ead7b4123666b0c20f301b9d4066864d3c88f5`, excluding both `engineering-history/**` and `docs/engineering-history/**` from the baseline and source snapshots. This avoids counting a prior archive copy as active engineering content. The active root contains **417 tracked files and 417 unique blob SHAs**.

Across the 56 snapshot records, the one-way comparison finds **1,982 path/blob delta rows** over **173 source paths**: **589** older full-file versions differ from content at the same active path, and **1,393** branch files have paths absent from the active root. Those delta rows refer to **222 distinct historical file blobs** absent from the active root by exact Git blob SHA. No source blob in the delta set is found at a different active-root path.

All 222 historical blob versions are available in `recovered-content/by-blob/<blob-sha>/<original-path>`, with source branch/snapshot provenance in `recovered-content/UNIQUE-HISTORICAL-BLOB-MANIFEST-2026-10-17.csv`. The detailed CSV rows are split across `delta-audit/part-01-sept15.csv` through `part-05-follow-up-census.csv`, and the per-snapshot summary is `delta-audit/SUMMARY-2026-10-17.csv`.

A prior version of `.github/workflows/foundation-verify.yml` remains preserved in the archive as historical evidence. It predates the active-state scan's exclusion of `docs/engineering-history/**`; do **not** restore it over the active workflow.
## Architecture source restoration and decision-status update

The exact full `docs/architecture/ASAS-ARCHITECTURE-V3.md` source has been restored byte-for-byte in the current review branch from the Library item: 52,114 bytes; Git blob `f2dbbc83489f0ded270fafdbcbea4d19739b1954`; SHA-256 `385ff27e5d62eda1b14cef216a4e596345b3fd4a4ad511f4c6f56d2a72722ce6`. It is architecture source, not proof of runtime implementation. Source identity checks are recorded in `docs/architecture/README.md` and `docs/governance/CANONICAL-ARTIFACT-REGISTER.md`.

The initial semantic review's “C2-001/C2-001-S open” text is a dated observation superseded by FD-001 and FD-002/ADR-0021 for the two owner questions only. Detailed mappings and the runtime/database identity gate remain open.

## Architecture guardrails

Snapshots preserve evidence; they do not ratify old design claims, resolve source-authority conflicts, prove semantic completeness, or close architecture gates. The next review should reconcile historical decisions, unresolved domain requirements, invariants, tenancy/security assumptions, state transitions, integration contracts, and open gates before implementation begins.
