# Engineering Task Packet — ARCH-ARCHIVE-012

- **Task ID:** ARCH-ARCHIVE-012
- **Outcome:** Reconcile the live branch census, preserve the latest branch-tip trees as immutable Git commit pins, and correct historical unique-content counts.
- **Request:** Founder instruction in the ASAS Platform project conversation, 2026-11-12.
- **Executor:** ChatGPT repository-support workflow using the connected GitHub integration.
- **Reviewer / approver:** Repository owner / Lead Architecture.
- **Risk lane:** R1 — DOCS.
- **Status:** IN REVIEW.
- **Architecture gate:** No GATE-00..GATE-07 or C-track is closed by this work.

## Objective

Preserve the 57 historical/source branch refs visible at census cut (28 distinct head commits) in chronological numbered records. Full branch-tip content is retained using exact Git source objects, with a clear distinction between copied snapshots and commit-pinned references.

## Included
- Add archive records 061 and 062 for the refs platform-architecture-2026 and archive/refresh-engineering-history-2026-10-21.
- Both refs share the exact source commit 3c9785cadf08e71a1b8898c64439d1383c68e517 and root tree 6750ad77c18f8db696fb56374dd6885666b19b99.
- Each numbered folder contains a README and a source-snapshot Git submodule gitlink (mode 160000) pinned to that exact source commit. Root .gitmodules maps both paths to this repository.
- The gitlinks reference the complete immutable tracked tree without duplicating the repository's archive/history inside itself. A recursive submodule checkout materializes all source files.
- Publish the 2026-11-12 live-ref census and catalogue.
- Reconcile the unique-content register with its machine-readable evidence: 237 unique historical blob SHAs; 1,997 branch-file difference occurrences across 180 paths; 602 same-path content differences; 1,395 path/content absences.
- Retain the 134-path comparison against order 057 as an independent audit cross-check (124 additions, 10 modifications, zero deletions).

## Excluded
- No application/runtime code, schema, migrations, RLS, Supabase, Vercel configuration, secrets or production data.
- No promotion of historical documents into approved architecture.
- No gate/C-track closure.
- No merge or closure of PRs #32 or #33.
- No deletion of source refs or tags.

## Authority and provenance
- Repository authority: AGENTS.md and docs/governance/ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md.
- Census cut: 2026-11-12T01:17:00Z, before creation of the task-delivery branch.
- Historical source refs: 57; distinct heads: 28.
- Default branch at census: platform-architecture-2026.
- Source commit/root tree: 3c9785cadf08e71a1b8898c64439d1383c68e517 / 6750ad77c18f8db696fb56374dd6885666b19b99.
- Unique-content manifest: docs/engineering-history/recovered-content/UNIQUE-HISTORICAL-BLOB-MANIFEST-2026-10-17.csv.
- Delta evidence: docs/engineering-history/delta-audit/SUMMARY-2026-10-17.csv and BRANCH-DELTA-AUDIT-2026-10-17.md.

## Acceptance criteria

| ID | Requirement | Verification |
|---|---|---|
| AC-01 | All 57 source ref names are in census and snapshot manifest | Live API versus CSV/manifest; zero mismatches |
| AC-02 | Orders 061 and 062 are distinct branch folders with full source-tree pins | Each source-snapshot gitlink uses mode 160000 and exact source commit SHA |
| AC-03 | Full root tree is resolvable from each pin | Source commit resolves to exact root-tree SHA 6750ad77... |
| AC-04 | Both gitlinks are configured for recursive checkout | Root .gitmodules path+URL matches folder paths |
| AC-05 | Historical unique-content register matches CSV evidence | 237 unique SHA rows/directories and corrected totals |
| AC-06 | No source refs deleted and no runtime/architecture authority changed | Live refs and PR file-scope review |

## Verification status

- Live source-ref census: VERIFIED — 57 refs / 28 distinct heads; the task-scoped delivery branch is excluded.
- 134-path comparison cross-check: VERIFIED — 124 additions, 10 modifications, zero deletions; 134/134 exact blob/mode mappings.
- Unique historical blobs: VERIFIED — 237 manifest rows, 237 unique SHA values and 237 by-blob directories.
- Orders 061/062 commit pins: VERIFIED — both gitlinks point to 3c9785cadf08e71a1b8898c64439d1383c68e517; source commit root tree is 6750ad77c18f8db696fb56374dd6885666b19b99.
- .gitmodules path/URL mapping: VERIFIED — both submodule paths map to this repository.
- Final-head CI / Foundation Verify / Codacy: CHECK AFTER FINAL COMMIT.
- Independent owner review: PENDING.
- Vercel: separate provider status, not a pass/fail criterion for this documentation-only archive task.

## Delivery
- Base: platform-architecture-2026.
- Work branch: archive/complete-branch-census-2026-11-12.
- Review: PR #35, draft.
- No implementation authorization is granted by this task.
