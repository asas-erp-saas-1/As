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
