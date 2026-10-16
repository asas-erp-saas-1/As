# ASAS Engineering History — Archive Index

## Census and archive state

This is a **point-in-time archive**, not a live branch list. The follow-up census was captured on 2026-10-17 from the then-current GitHub repository state and completed on the default branch `platform-architecture-2026`.

- Branch refs represented at census: **53**
- Distinct head commits at census: **25**
- Numbered full-tree snapshots: **54**
- File entries summed across snapshots: **57,563** (repeated files and nested archives are intentionally counted again per snapshot)
- Snapshot folders independently validated: **54**
- Integrity result: **0 missing paths, 0 unexpected paths, 0 blob-SHA or file-mode mismatches**

The 54 folders comprise the 53 refs observed at census time plus the older default-branch checkpoint retained at order 051. Folder 051 preserves `platform-architecture-2026` at `beaa42a95d947ae56379ae6fcab7850e3b60f50e`. Folder 054 preserves its pre-archive tip at `39ead7b4123666b0c20f301b9d4066864d3c88f5`. The archive-completion commit `1aeb0907ae544caafb5160bd90d0e21488024c53` is intentionally not recursively copied into itself.

The review branch `archive/engineering-history-integrity-2026-10-17` was created after the census to improve verification documentation. It is an operational review branch, not a missing original architecture stage, and is not included in the 2026-10-17 source census.

## Ordering and layout

Snapshot folders are numbered by source tip-commit committer time, oldest to newest; branch name breaks ties. This is not branch creation order.

- `branches/NNN-branch-name/` — full tracked-file snapshot at that source tip, retaining original relative paths.
- `catalogs/` — human-readable chronological inventories.
- `SNAPSHOT-MANIFEST-2026-10-17.csv` — authoritative mapping for the 54 snapshots. The older `BRANCH-MANIFEST.csv` remains as the original 51-row inventory.
- `SNAPSHOT-VERIFICATION-2026-10-17.csv` — per-snapshot file count and integrity outcome.
- `VERIFICATION-REPORT-2026-10-17.md` — verification method, counts, scope, and limitations.
- `BRANCH-DELTA-AUDIT-2026-10-17.md` and `delta-audit/` — branch-to-root path and blob comparisons.
- `UNIQUE-CONTENT-REGISTER-2026-10-17.md` and `recovered-content/` — unique historical full-file blob not found in the canonical non-archive root.

## Integrity methodology

Each snapshot's source tree was compared with its corresponding snapshot subtree by relative path, object type, file mode, and Git blob SHA. The per-snapshot recursive responses returned `truncated=false`. Because the total repository tree has grown large enough for a single global recursive-tree response to be truncated, it is **not** used as the source of truth for the per-snapshot checks.

Snapshots 052–054 each contain a finite nested copy of the earlier archive because that content already existed in their source branch trees. These copies are deliberate, not extra top-level snapshots. File-entry totals are therefore not unique-file or unique-blob totals.

## Branch-delta findings

The path/blob audit against the canonical non-archive root baseline at commit `39ead7b4123666b0c20f301b9d4066864d3c88f5` records 1,982 delta rows: 589 same-path content differences and 1,393 path differences where the exact blob exists elsewhere in the root. It found one distinct historical blob absent from that baseline root, repeated in orders 051 and 052: the pre-exclusion version of `.github/workflows/foundation-verify.yml` (8,649 bytes; blob `baaae4cde9dbb357ac968239e921930559e7b51e`). It is preserved in the numbered snapshots and `recovered-content/pre-archive-exclusion-foundation-verify.yml`. **Do not replace the active workflow with this historical copy**; the active workflow excludes the archive from its state scan.

## Architecture guardrails

Snapshots preserve evidence; they do not ratify old design claims, resolve source-authority conflicts, prove semantic completeness, or close architecture gates. The next review should reconcile historical decisions, unresolved domain requirements, invariants, tenancy/security assumptions, state transitions, integration contracts, and open gates before implementation begins.
