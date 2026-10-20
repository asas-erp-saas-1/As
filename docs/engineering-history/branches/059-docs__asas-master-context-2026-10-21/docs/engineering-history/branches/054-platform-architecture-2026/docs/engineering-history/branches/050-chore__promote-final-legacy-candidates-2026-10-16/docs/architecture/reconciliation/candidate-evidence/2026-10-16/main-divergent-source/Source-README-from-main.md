# Historical main-branch Source README (candidate, not promoted)

> **Provenance:** Source branch `main`; original blob SHA `d6cc00adfdf781f0a52b9c5bb0ac559dd9882601`. Preserved before any potential retirement of the legacy branch.
>
> This shorter index was not overlaid onto the canonical `platform-architecture-2026` Source Corpus README because the canonical version contains the current branch lock, navigation rules and reconciled source policy. This file is retained for history only and creates no competing authority.

---

# Phase C — Source Corpus

This directory is the controlled source/provenance layer for the C-track engineering conference.

## Rule

`Source/` contains material discovered during repository and research forensics. It is not a second source of truth.

Canonical decisions remain in:

- the C-track reconciliation directories;
- canonical architecture/contracts/registers;
- project-wide governance and closure artifacts.

## Operating sequence

```text
Discover
  ↓
Classify
  ↓
Provenance
  ↓
Assign canonical owner
  ↓
Reconcile
  ↓
Record decision / conflict
  ↓
Closure evidence
```

## C-track directories

`C01` through `C22` are reserved for source indexing. A directory does not imply that its C-track is closed, verified, or implementation-authorized.

## Classification vocabulary

- `CANONICAL-SOURCE`
- `SUPPORTING-EVIDENCE`
- `CROSS-DOMAIN-SOURCE`
- `HISTORICAL-SOURCE`
- `SUPERSEDED-SOURCE`
- `CONFLICTING-SOURCE`
- `UNVERIFIED-SOURCE`

## Important

Do not copy an artifact into `Source/` merely to make the tree look complete. Prefer a source index/pointer when the artifact already has a canonical location. Physical relocation is permitted only when ownership, references, history, and governance are reconciled.
