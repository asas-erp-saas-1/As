# Engineering Task Packet — ARCH-ARCHIVE-012

- **Task ID:** ARCH-ARCHIVE-012
- **Title / outcome:** Reconcile the latest source-branch census, preserve new branch-tip archive overlays, and correct conflicting unique-content counts.
- **Request:** Founder instruction in the ASAS Platform project conversation, 2026-11-12.
- **Executor:** ChatGPT repository-support workflow through the connected GitHub integration. This is a documentation-only archival preparation; it is not application implementation.
- **Reviewer / approver:** Repository owner / Lead Architecture (required before merge).
- **Risk lane:** R1 — DOCS.
- **Work-item status:** IN REVIEW.
- **Current gate / controlling workstream:** Repository history preservation and engineering-corpus reconciliation. No architecture gate is closed by this task.

## Objective and boundary

Preserve the current 57 source branch refs (28 distinct source head commits) in the chronological branch-history archive, while leaving the live branch refs intact. Correct the prose register so its counts agree with the machine-readable unique-blob manifest and branch-delta summary.

### In scope
- Add snapshot records 061 and 062 for two live refs sharing the same exact head and root tree.
- Store the 134-path delta from order 057 to the current source head as one exact-blob overlay tree; create two separate branch folders referencing the same tree.
- Publish the 2026-11-12 source-ref census CSV and catalogue.
- Reconcile the unique-content register to the 237-row / 237-SHA manifest and the delta totals (1,997 records, 180 paths, 602 same-path variants, 1,395 missing path/content records).
- Update archive index, README and verification report with the new census, overlay dependencies and limitations.

### Explicit non-goals
- No app code, runtime configuration, database schema, migrations, RLS, Supabase, Vercel, secrets or production mutations.
- No promotion of historical architecture into approved architecture.
- No closure of GATE-00..GATE-07 or any C-track.
- No merging or closing existing PRs #32 and #33.
- No deletion of source refs or tags.

## Authority and provenance

- AGENTS.md: repository authority model, historical-source reservation and evidence classifications.
- docs/governance/ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md: bounded change / task packet / verification / review workflow.
- docs/governance/ENGINEERING-TASK-PACKET-TEMPLATE-2026.md and ENGINEERING-EVIDENCE-RECORD-TEMPLATE-2026.md: task and evidence structure.
- Source branch census: GitHub branch refs at 2026-11-12T01:17:00Z.
- Baseline default head: 3c9785cadf08e71a1b8898c64439d1383c68e517; order-057 delta base: 2672247aab8ce830091db1df83d1b233aa88d17f.
- Unique blob evidence: docs/engineering-history/recovered-content/UNIQUE-HISTORICAL-BLOB-MANIFEST-2026-10-17.csv.
- Delta evidence: docs/engineering-history/delta-audit/SUMMARY-2026-10-17.csv and BRANCH-DELTA-AUDIT-2026-10-17.md.

## Acceptance criteria

| ID | Observable outcome | Verification |
|---|---|---|
| AC-01 | Every one of the 57 source refs has a census row | Compare current source-ref names with CSV and snapshot manifest |
| AC-02 | Two same-head refs are represented by separate numbered folders without duplicate blob storage | Exact commit/tree SHA equality and shared overlay-tree reference |
| AC-03 | All 134 changed paths are mapped to exact source blob SHA and mode | Git compare file list reconciled to complete per-snapshot subtree listings/direct listings |
| AC-04 | Snapshot manifest and verification ledger contain records 061–062 | CSV parse/count and exact row inspection |
| AC-05 | Unique content register agrees with 237 unique manifest SHAs/directories and documented delta totals | CSV parse, unique SHA count, directory count and arithmetic |
| AC-06 | No live source refs are deleted and no architecture/runtime authority is changed | Post-update live ref census and PR diff review |

## Risk and authorization boundaries

- Security / tenancy / privacy: no runtime/security policy changes; archive only.
- Financial/legal semantics: not modified.
- Data/schema/migration: none.
- External side effects: GitHub branch, blob, tree, commit and PR creation only.
- Recovery: source branch refs remain present; archive updates are reviewable and reversible via PR.
- Implementation authorized: **NO**.
- Schema/migration/RLS/runtime changes authorized: **NO**.

## Verification plan and actual status

| Check | Result |
|---|---|
| Live-ref census at stated timestamp | VERIFIED: 57 source refs, 28 distinct heads; one delivery branch excluded by name |
| Compare order-057 base to current source head | VERIFIED: 134 paths; 124 added, 10 modified, zero removed |
| Source blob/mode mapping | VERIFIED: 134/134 mapped, zero missing |
| Per-source-subtree enumeration | VERIFIED: five relevant trees returned truncated=false |
| Unique historical blobs | VERIFIED: 237 rows and 237 unique SHA values |
| by-blob directory count | VERIFIED: 237 directories |
| Foundation Verify CI on the new PR head | NOT EXECUTED at packet creation; must be checked after PR creation |
| Vercel deployment | NOT APPLICABLE to archive-only documentation; no deployment requested |
| Independent owner review | PENDING |

## Delivery and handoff

- **Base branch:** platform-architecture-2026
- **Baseline SHA:** 3c9785cadf08e71a1b8898c64439d1383c68e517
- **Working branch:** archive/complete-branch-census-2026-11-12
- **Final commit / PR:** to be recorded after commit and PR creation.
- **Final evidence status:** IN REVIEW / NOT YET MERGE-VERIFIED.
