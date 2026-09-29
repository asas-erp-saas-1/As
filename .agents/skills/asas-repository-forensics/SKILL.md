---
name: asas-repository-forensics
description: Reconstruct ASAS repository truth across branches, commits, documents, contracts, implementation and evidence before any material engineering change.
---

# Repository Forensics

Use for architecture audits, continuation, reconciliation, stale-reference work and provenance questions.

## Procedure

1. Verify repository `asas-erp-saas-1/As`.
2. Verify branch and HEAD.
3. Read `AGENTS.md` and `docs/handoff/CURRENT-SESSION-STATE.md`.
4. Load the active control plane.
5. Inventory the target tree.
6. Enumerate branches, commits, PRs and workflow evidence.
7. Compare relevant divergent branches; extract unique evidence without granting authority.
8. Trace important artifacts with history/blame where available.
9. Search canonical and legacy names, IDs, versions and stale references.
10. Classify every material claim as verified, evidence, derived, conflict, open or blocked.
11. Update canonical routing only after provenance is established.

## Required distinctions

`current repository reality ≠ desired architecture ≠ historical source ≠ runtime reality ≠ inference`.

Never delete historical evidence merely to make the repository look clean.

## Closure

A finding closes only when root cause, corrective action, reference reconciliation, verification and evidence are present.
