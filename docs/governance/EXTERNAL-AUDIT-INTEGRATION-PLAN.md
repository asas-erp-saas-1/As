# External Audit Integration Plan

**Status:** Active foundation work plan
**Input:** `docs/audit/FOUNDATION-EXTERNAL-DEEP-AUDIT-2026-09-18.md`

## Objective

Convert the independent Claude repository audit into controlled, evidence-backed work without allowing the audit to override canonical authority or trigger unsafe changes.

## Workstream Mapping

| Finding | Workstream | Gate | Action | Closure evidence |
|---|---|---|---|---|
| FEA-01 | Artifact integrity | R5 | Reconcile canonical artifact register + CI | register diff + passing CI |
| FEA-02 | Claude loading | R2/R5 | Repo-wide deprecated-reference scan | zero active forbidden refs + CI |
| FEA-03 | Platform identity | GATE-00 | Verify actual Supabase/Vercel identity + technical guard | live identity evidence + preflight |
| FEA-04 | Git hygiene | R6 | Inventory branches; safely remove only verified stale branches; verify protection | branch report + GitHub settings evidence |
| FEA-05 | Repository visibility | Founder decision | Confirm intentional visibility; do not change automatically | explicit disposition |
| FEA-06 | Architecture | C2-001 | ADR + canonical Context→Module map | approved ADR + traceability |
| FEA-07 | Readiness docs | R2/R4 | Select canonical readiness owner and consolidate/pointerize duplicates | loading-chain audit |
| FEA-08 | Structural hygiene | R3/R4 | Add `.gitignore` / `LICENSE` where appropriate | repository inspection |
| FEA-09 | Blueprint provenance | R4 | Preserve v1.6.1 provenance or controlled reference | hash/source evidence |

## Execution Rules

### Rule 1 — Verify before mutate

Every finding is first reproduced against current repository state. Historical audit claims are not treated as current facts without verification.

### Rule 2 — No destructive resolution of ambiguity

Do not delete branches, documents, database objects, or source material merely because the audit recommends cleanup. First establish ownership, references, unique commits/content, and recovery path.

### Rule 3 — Canonical authority remains explicit

The audit is subordinate to the repository's canonical governance hierarchy. A conflict becomes a reconciliation task, not a silent overwrite.

### Rule 4 — One concept, one canonical owner

Where multiple artifacts describe the same concept, identify the canonical owner and turn valid secondary artifacts into explicit derived views, pointers, historical records, or archives.

### Rule 5 — Closure requires evidence

No finding is marked closed from a prose assertion. Closure requires the evidence appropriate to the finding and an updated checkpoint/register.

## Recommended Waves

### Wave A — Mechanical integrity

- artifact-register reconciliation;
- repo-wide stale-reference scan;
- repository structure/naming audit;
- `.gitignore`/license disposition.

### Wave B — Canonical consolidation

- readiness-document ownership;
- context-loading chain normalization;
- Blueprint provenance treatment.

### Wave C — High-risk identity

- GATE-00 live platform identity;
- technical project-reference preflight guard;
- no schema mutation until verified.

### Wave D — Architecture authority

- C2-001 ADR;
- Context→Module→Aggregate→Event→Permission→Task traceability;
- task/schema reconciliation only after canonical boundaries exist.

### Wave E — Git hygiene

- branch inventory;
- zero-unique-commit branch classification;
- divergent-branch review;
- main branch protection verification.

### Wave F — Final foundation closure

Re-run independent audit checks and update the current session state. Only then reassess Claude implementation authorization.

## Explicit Non-Goals

This plan does not authorize:

- production deployment;
- database reset or deletion;
- migration execution;
- switching Supabase projects;
- changing repository visibility;
- broad branch deletion;
- application implementation.
