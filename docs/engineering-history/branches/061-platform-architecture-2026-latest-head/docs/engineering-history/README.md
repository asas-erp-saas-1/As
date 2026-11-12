# ASAS Engineering History Archive

This directory preserves full tracked-file-tree snapshots of the branch tips captured during engineering consolidation. It is designed to help reconstruct the platform's engineering history from the earliest available work to the consolidation checkpoint without overwriting older decisions or silently promoting them to approved architecture.

**Archive contents are evidence, not automatically approved design.** Presence in this archive does not establish authority, consistency, or closure of an architecture gate.

Start with:

1. [`INDEX.md`](INDEX.md) — chronology, scope, and reading guidance.
2. [`SNAPSHOT-MANIFEST-2026-10-17.csv`](SNAPSHOT-MANIFEST-2026-10-17.csv) — the authoritative 60-record inventory (56 live refs, four retained checkpoints): branch ref, source SHA, commit time, file count, and folder.
3. [`SNAPSHOT-VERIFICATION-2026-10-17.csv`](SNAPSHOT-VERIFICATION-2026-10-17.csv) — per-snapshot file and integrity checks.
4. [`VERIFICATION-REPORT-2026-10-17.md`](VERIFICATION-REPORT-2026-10-17.md) — verification methodology and limitations.
5. [`BRANCH-DELTA-AUDIT-2026-10-17.md`](BRANCH-DELTA-AUDIT-2026-10-17.md), [`delta-audit/`](delta-audit/), and [`UNIQUE-CONTENT-REGISTER-2026-10-17.md`](UNIQUE-CONTENT-REGISTER-2026-10-17.md) — file-level differences and unique historical content.
6. [`catalogs/`](catalogs/) — human-readable chronology.
7. [`branches/`](branches/) — the original relative file paths under numbered folders; orders 001–056 are full snapshots or exact root-tree copies, and orders 057–060 are explicit delta overlays; each overlay's base and exact changed blobs are recorded in the manifest.

The old [`BRANCH-MANIFEST.csv`](BRANCH-MANIFEST.csv) is preserved as the original 51-row census. Use the dated snapshot manifest for the follow-up census. Branches with identical commit heads remain separate folders because each branch ref is separately represented.

Nested copies of the earlier archive in snapshots 052–054 are intentional: their source branch trees already included the archive at those historical tips. The historical version of `.github/workflows/foundation-verify.yml` must remain archived and must not replace the current workflow.


## Latest refresh — 2026-10-21

The pre-maintenance census contains 56 source branch refs and 28 distinct head commits. The 60 snapshot records preserve those refs plus four earlier checkpoints. Orders 057–060 are delta overlays, each preserving exact changed blob SHAs over a declared base. Orders 059–060 record their source root tree SHAs and are reconstructable from order 057 plus the overlay. This avoids repeatedly expanding the nested archive in every checkout. No branch refs are deleted by this archive update.


## Overlay scope note

Order 057 contains 12 changed archive/index paths over order 056. Order 058 contains 27 changed non-nested paths over the shared base. Order 059 contains one added file over order 057. Order 060 contains 66 changed paths over order 057 (56 added and 10 modified, with no deletions). These are reconstructable delta overlays, not standalone full-tree copies; source root tree SHAs are retained as provenance.
