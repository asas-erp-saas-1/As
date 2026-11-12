# Engineering Task Packet — ARCH-ARCHIVE-012

- **Task ID:** ARCH-ARCHIVE-012
- **Outcome:** Reconcile the live branch census and preserve orders 057–062 as immutable full-tree Git commit pins; correct historical unique-content counts.
- **Request:** Founder instruction in the ASAS Platform project conversation, 2026-11-12.
- **Executor:** ChatGPT repository-support workflow using the connected GitHub integration.
- **Reviewer / approver:** Repository owner / Lead Architecture.
- **Risk lane:** R1 — DOCS.
- **Status:** IN REVIEW.
- **Architecture gate:** No GATE-00..GATE-07 or C-track is closed by this work.

## Objective

Preserve every historical branch-tip state in chronological numbered records. Orders 057–062 are converted from reconstructable delta folder layouts into per-order immutable Git commit pins, so each has a complete source tree accessible under its own numbered folder.

## Included
- Convert orders 057–060 to source-snapshot Git submodule gitlinks pinned to their exact historical commits:
  - 057: 2672247aab8ce830091db1df83d1b233aa88d17f → bc362b385189deb42618bb624c1a857b62c55c88.
  - 058: e54e5726a09070fa91899c32cf6848b5cc728b36 → 274493a3cceea1a8100d07ce8b2e4e6667643cd1.
  - 059: 80d21aad9474506757c168c046496333b298735f → 85933920c8fe46e978884bda04b258ef5418fbf6.
  - 060: c7db09bada487957c30608d1fde981f299eafe4a → 6b98bb39b2978438802d2f1748be7049a50ba947.
- Orders 061 and 062 remain separate branch-ref identities, both pinned to source commit 3c9785cadf08e71a1b8898c64439d1383c68e517 → root tree 6750ad77c18f8db696fb56374dd6885666b19b99.
- Each order has a separate numbered folder, README, and source-snapshot gitlink (mode 160000). Root .gitmodules maps all six paths to this repository.
- The commit pins represent each complete immutable tracked tree without copying or rewriting the source repository within itself. Recursive submodule checkout materializes all tracked files.
- Preserve the prior delta analyses in docs/engineering-history/delta-audit/ as forensic comparison evidence; they are no longer required to reconstruct orders 057–062.
- Publish the 2026-11-12 live-ref census and catalogue.
- Reconcile the unique-content register: 237 unique historical blob SHAs; 1,997 branch-file difference occurrences across 180 paths; 602 same-path content differences; 1,395 path/content absences.

## Excluded
- No application/runtime code, schema, migrations, RLS, Supabase, Vercel configuration, secrets or production data.
- No promotion of historical documents into approved architecture.
- No gate/C-track closure.
- No merge or closure of PRs #32 and #33.
- No deletion of source refs or tags.

## Authority and provenance
- Repository authority: AGENTS.md and docs/governance/ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md.
- Census cut: 2026-11-12T01:17:00Z.
- Historical source refs: 57; distinct heads: 28.
- Default branch at census: platform-architecture-2026.
- Machine-readable census: LIVE-REF-CENSUS-2026-11-12.csv.
- Unique-content manifest: recovered-content/UNIQUE-HISTORICAL-BLOB-MANIFEST-2026-10-17.csv.
- Delta evidence: delta-audit/SUMMARY-2026-10-17.csv and BRANCH-DELTA-AUDIT-2026-10-17.md.

## Acceptance criteria

| ID | Requirement | Verification |
|---|---|---|
| AC-01 | All 57 source ref names are in the live census | Live API versus CSV; zero name/head mismatches |
| AC-02 | Every order 057–062 folder has a separate full-tree source pin | Each source-snapshot gitlink uses mode 160000 and its exact historical commit SHA |
| AC-03 | Each pinned commit resolves to the recorded source root tree | Compare commit metadata root tree SHA with manifest |
| AC-04 | All six links are configured for recursive checkout | Root .gitmodules paths and URL match all six folder paths |
| AC-05 | Delta history remains available separately | Audit files and unique-content manifest remain present |
| AC-06 | Unique-content register agrees with machine evidence | 237 unique SHA rows/directories and corrected totals |
| AC-07 | No source refs deleted and no runtime/architecture authority changed | Live refs and PR file-scope review |

## Verification status
- Live source-ref census: VERIFIED — 57 refs / 28 distinct heads; all 57 names and heads match.
- Orders 057–062 commit pins: VERIFIED — exact commit and root tree SHA pairs listed above.
- .gitmodules: verified paths and repository URL for all six pins.
- Unique historical blobs: VERIFIED — 237 manifest rows, 237 unique SHA values, 237 by-blob directories.
- Prior delta audit: retained as independent forensic evidence; not used to reconstruct the six source trees.
- Final-head CI / Foundation Verify / Codacy: CHECK AFTER FINAL COMMIT.
- Independent owner review: PENDING.
- Vercel: separate provider status; not a pass/fail criterion for this docs-only archive task.

## Delivery
- Base: platform-architecture-2026.
- Work branch: archive/complete-branch-census-2026-11-12.
- Review: PR #35, draft.
- No implementation authorization is granted by this task.


## Commit-DAG reachability review — added 2026-11-12

- Compared all 28 distinct source head SHAs with the canonical default head.
- Proven ancestor heads: 4 refs across 4 heads.
- Same canonical tip: 2 refs across 1 head.
- Diverged: 19 refs across 19 heads; these contain commits outside the canonical default and require an independent DAG anchor before their refs can be removed.
- Unverified: 32 refs across 4 heads; GitHub compare returned 422 because diff generation was too large. Unknown does not mean safe.
- Full matrix: docs/engineering-history/HEAD-REACHABILITY-2026-11-12.csv; report: docs/engineering-history/BRANCH-HEAD-REACHABILITY-2026-11-12.md.
- **Disposition:** No source refs may be deleted under ARCH-ARCHIVE-012. The four ancestor refs and the same-tip pair are only potential later cleanup candidates subject to further checks. The divergent and unverified refs must remain until an approved, verifiable retention mechanism is in place.
