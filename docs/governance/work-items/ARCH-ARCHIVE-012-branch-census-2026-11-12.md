# Engineering Task Packet — ARCH-ARCHIVE-012

- **Task ID:** ARCH-ARCHIVE-012
- **Outcome:** Complete the live source-branch census, preserve the newest branch tips as full tracked-tree snapshots, and correct historical unique-content counts.
- **Request:** Founder instruction in the ASAS Platform project conversation, 2026-11-12.
- **Executor:** ChatGPT repository-support workflow through the connected GitHub integration. Documentation and source-control metadata only; no application implementation.
- **Reviewer / approver:** Repository owner / Lead Architecture (required before merge).
- **Risk lane:** R1 — DOCS.
- **Status:** IN REVIEW.
- **Architecture gate:** No GATE-00..GATE-07 or C-track is closed by this work.

## Objective

Preserve the 57 historical/source branch refs visible at the census cut (28 distinct head commits), in chronological numbered folders in the canonical branch archive. Each numbered folder must be either a full tree snapshot or an explicitly declared, reconstructable delta overlay; no delta may be described as a full standalone snapshot.

## Scope

### Included
- Add orders 061 and 062 for the two live refs with the same head commit and exact source root-tree SHA.
- Make orders 061 and 062 **full, standalone tracked-tree snapshots** by pointing each branch folder directly to the source root-tree object SHA 6750ad77c18f8db696fb56374dd6885666b19b99. The two branch refs remain separate manifest rows and folders; Git reuses the same immutable tree/blob objects.
- Publish the 2026-11-12 live source-ref census CSV and catalogue.
- Correct the unique-content register to agree with its machine-readable source: 237 unique historical blob SHAs; 1,997 branch-file difference occurrences across 180 paths; 602 same-path content differences; 1,395 missing path/content records.
- Update the archive index, README, verification report, task packet and evidence record.
- Keep the 134-path comparison against order 057 as an independent audit cross-check (124 additions, 10 modifications, zero deletions); it is not the preservation format for 061/062.

### Excluded
- No application/runtime code, executable configuration, database schema, migrations, RLS, Supabase, Vercel configuration, secrets, or production data.
- No promotion of historical documents into approved architecture.
- No closure of architecture gates or C-tracks.
- No merge or closure of unrelated PRs #32 and #33.
- No deletion of historical branch refs or tags.

## Authority and provenance
- Repository-level AGENTS.md and docs/governance/ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md.
- Task/evidence templates in docs/governance/.
- Census timestamp: 2026-11-12T01:17:00Z (before this task's delivery branch was created).
- Source branch census: 57 source refs / 28 distinct head commits.
- Default branch at census: platform-architecture-2026, source commit 3c9785cadf08e71a1b8898c64439d1383c68e517.
- Source root tree SHA: 6750ad77c18f8db696fb56374dd6885666b19b99.
- Order-057 comparison base: 2672247aab8ce830091db1df83d1b233aa88d17f.
- Unique-blob manifest: docs/engineering-history/recovered-content/UNIQUE-HISTORICAL-BLOB-MANIFEST-2026-10-17.csv.
- Delta audit: docs/engineering-history/delta-audit/SUMMARY-2026-10-17.csv and BRANCH-DELTA-AUDIT-2026-10-17.md.

## Acceptance criteria

| ID | Requirement | Verification |
|---|---|---|
| AC-01 | All 57 source ref names are represented in the live census and snapshot inventory | Live refs compared to CSV and manifest; zero name/head mismatches |
| AC-02 | Orders 061 and 062 are two distinct full snapshot folders | Both folder tree SHAs exactly equal source root tree SHA 6750ad77... |
| AC-03 | Identical-head refs are separate inventory identities without redundant Git objects | Separate folder/manifest rows, same immutable root-tree object SHA |
| AC-04 | Order-057 comparison has complete path/blob/mode reconciliation | 134/134 changed paths mapped; 124 added, 10 modified, zero removed |
| AC-05 | Unique-content register agrees with the evidence sources | 237 unique SHAs / 237 by-blob directories; corrected delta totals add up |
| AC-06 | No historical refs are deleted and no runtime/architecture authority is changed | Live branch census and PR file-scope review |

## Risk / authorization boundaries
- Security/tenant isolation: no runtime security-policy changes.
- Finance/legal: not modified.
- Data/schema/migrations: none.
- External effects: GitHub branch, tree, commit and PR only.
- Recovery: source refs remain; all archive changes are reviewable through PR #35.
- Implementation authorization: **NO**.
- Schema/migration/RLS/runtime authorization: **NO**.

## Verification status
- Live source-ref census: VERIFIED — 57 refs / 28 distinct heads; the task-scoped delivery branch is excluded from this historical census.
- 134-path comparison cross-check: VERIFIED — 134 paths; 124 added, 10 modified, zero deleted; exact SHA/mode mappings found for all 134.
- Unique historical content: VERIFIED — 237 manifest rows / 237 distinct SHAs / 237 by-blob directories.
- Full root-tree snapshot equality for 061/062: verify against source and snapshot folder tree SHA after tree update.
- Foundation Verify and CI on the final PR head: must be confirmed after the final tree commit.
- Codacy Security Scan on the final PR head: must be confirmed after the final tree commit.
- Independent owner review: PENDING.
- Vercel deployment: NOT APPLICABLE to this docs-only archival change; Vercel's status is recorded separately.

## Delivery
- Base branch: platform-architecture-2026.
- Baseline source commit: 3c9785cadf08e71a1b8898c64439d1383c68e517.
- Working branch: archive/complete-branch-census-2026-11-12.
- Review request: PR #35.
- Status: DRAFT / IN REVIEW; not merged.
