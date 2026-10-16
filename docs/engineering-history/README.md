# ASAS Engineering History Archive

This directory preserves full tracked-file-tree snapshots of the repository branches captured during the engineering consolidation. It exists so the architecture can be reconstructed from the earliest recorded work to the current consolidation without deleting, overwriting, or silently promoting historical material.

**Archived content is evidence, not automatically approved design.** A document being present here does not mean that its claims are authoritative or that the relevant architecture gates are closed.

Start here:

1. [`INDEX.md`](INDEX.md) — current archive state, reading order, semantics, and verification methodology.
2. [`SNAPSHOT-MANIFEST-2026-10-17.csv`](SNAPSHOT-MANIFEST-2026-10-17.csv) — the authoritative mapping of the 54 snapshot folders to branch refs, source SHAs, commit dates, file counts, and snapshot status.
3. [`SNAPSHOT-VERIFICATION-2026-10-17.csv`](SNAPSHOT-VERIFICATION-2026-10-17.csv) — per-snapshot integrity results.
4. [`VERIFICATION-REPORT-2026-10-17.md`](VERIFICATION-REPORT-2026-10-17.md) — verification method and aggregate results.
5. [`catalogs/`](catalogs/) — human-readable chronology, including the follow-up census in [`06-october-16-follow-up-census-2026-10-17.md`](catalogs/06-october-16-follow-up-census-2026-10-17.md).
6. [`branches/`](branches/) — each numbered branch-tip snapshot, preserving its original relative paths.

The original [`BRANCH-MANIFEST.csv`](BRANCH-MANIFEST.csv) is retained as an immutable historical artifact from the first 51-ref census; use the newer snapshot manifest for current archival navigation.

The numbering uses each source tip commit's committer timestamp, not branch creation time. Duplicate head commits are intentionally represented in separate folders because the branches are separate historical refs. Nested archive copies in snapshots 052–054 are intentional: those source branch trees already contained the earlier archive.
