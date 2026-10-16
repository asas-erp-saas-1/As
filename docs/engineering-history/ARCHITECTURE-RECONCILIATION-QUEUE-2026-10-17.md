# Architecture reconciliation queue — 2026-10-17

## Why this register exists

The branch snapshots and exact blob preservation are now in the default branch. The next risk is no longer loss of old text; it is accidentally treating a historical draft as approved architecture or missing a requirement because a file disappeared from the active root. This queue converts the file-level audit into a controlled review list. It deliberately does not auto-promote any historical artifact.

## Evidence boundary

- Current default branch at queue generation: `platform-architecture-2026`, commit `fa39236b9ea12c5c45a7583d2c8cf2a20cbaec40`.
- Comparison baseline for this queue: active non-archive root at commit `39ead7b4123666b0c20f301b9d4066864d3c88f5`, excluding both `engineering-history/**` and `docs/engineering-history/**`.
- Active baseline: 417 tracked files and 417 unique blob SHAs.
- Historical snapshots examined: 56 snapshot records, covering 54 branch refs at the census and two retained default-branch checkpoints.
- Source-path delta records: 1,982 rows across 173 original paths; 222 unique historical file blobs.
- This is a full-file/path SHA inventory, not a semantic truth judgment.

## Prioritization

| Priority | Paths | How to handle |
|---|---:|---|
| P0 — control and execution | 11 | Start here: active instructions/CI/session state, code/schema/register and check scripts. Do not restore old control files over current ones without a direct contract and test review. |
| P1 — architecture and controls | 143 | Review domain concepts, architecture, authorization, gates, contracts, security, audit and governance. Reconcile against canonical source authority. |
| P2 — context and supporting material | 19 | Review within the timeline; determine whether each source contributes a requirement, evidence, superseded proposal, or duplicate. |

## Current-state classification

| State | Paths | Meaning |
|---|---:|---|
| Absent from the active root | 88 | The original path is not currently present outside the archive. This is a candidate for missing-requirement review, not a command to restore it. |
| Present, but content differs | 85 | The path exists in the active root, but at least one historical full-file version differs. Compare version lineage and identify meaningful changes. |

Every row remains `PENDING_SEMANTIC_REVIEW`. The CSV records source branch refs, source head SHAs, snapshot order, historical blob IDs, current canonical blob ID where present, delta occurrences, and a concrete next action. Row order follows the earliest snapshot in which that path differs, then path name.

## Recommended review sequence

1. **P0 controls first** — compare active routing, workflow/state files, schema/register artifacts, and scripts. Preserve the active archive-exclusion logic in `.github/workflows/foundation-verify.yml`; the older copy predates the archive exclusion and is not suitable to reactivate.
2. **P1 architecture/governance second** — cross-check requirements against source-authority ledgers, domain contracts, authorization/state-machine invariants, tenancy/security assumptions, integration boundaries, decision/conflict registers, and readiness gates.
3. **P2 context last** — decide which historical narratives, research notes, UX materials, README/handoff drafts are still informative and where their information should live canonically.

For each row, the reviewer should record one final disposition outside this generated inventory: `PROMOTE`, `MERGE_INTO_CANONICAL`, `SUPERSEDED`, `DUPLICATE`, or `RETAIN_AS_EVIDENCE`, with rationale and approving source. Until such a decision is recorded, no row is considered resolved.

## Scope limits

This queue inventories files that differ or are absent relative to the active baseline. It does not read each historical file line-by-line for semantic contradictions and does not infer that absence equals a design flaw. The full-tree snapshots retain the original file content and modes; the 222-by-blob view is only a convenience for locating unique historical contents.
