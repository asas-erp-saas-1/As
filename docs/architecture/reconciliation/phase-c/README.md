# ASAS — Phase C Engineering Conference Reconciliation

**Status:** ACTIVE CANONICAL WORKSPACE
**Scope:** C01–C22 Engineering Conference tracks
**Active branch:** `platform-architecture-2026`

## Purpose

This directory is the canonical organizational home for the deep-reconciliation records of C01–C22. It does not replace the Gate Model, Architecture V3, the Canonical Artifact Register, or the active session checkpoint.

## Rule

One C-track → one canonical directory:

`docs/architecture/reconciliation/phase-c/CNN/`

All future C-track reconciliation records, closure reviews, evidence indexes, red-team reviews, and track-specific decision summaries belong under the corresponding directory.

Existing historical artifacts are **not moved automatically**. They remain in place until their canonical ownership is explicitly reconciled. Each C directory must contain an index that points to the authoritative existing artifacts and identifies historical/provenance material separately.

## Source corpus

The historical/current filename-identified C-track corpus is collected through:

`docs/architecture/reconciliation/phase-c/Source/`

The Source Corpus is an **index/discovery layer**, not a second source of truth. It groups C01–C22 material by track while preserving each artifact's existing canonical owner until an explicit ownership/move decision is made. This avoids creating two competing copies of a contract, ADR, research record, checkpoint, or gate artifact.

See [`Source/README.md`](Source/README.md) for the branch inventory and provenance map.

## Required C-track lifecycle

```text
L0 Reality Lock
→ L1 Locate
→ L2 Load
→ L3 Scope / Questions
→ L4 Research & Verify
→ L5 Model / Decide
→ L6 Prove / Cross-check
→ L6.5 Reconcile
→ Independent Red Team
→ Closure Review
→ Evidence Lock
```

A C-track remains OPEN until its closure evidence is complete. `SEMANTICALLY CLOSED` and `IMPLEMENTATION BLOCKED` do not mean final C-track closure.

## Naming convention

- `README.md` — track index and canonical routing
- `DECISIONS.md` — consolidated decisions and supersessions
- `EVIDENCE.md` — evidence ledger
- `OPEN-QUESTIONS.md` — unresolved questions
- `RED-TEAM.md` — adversarial review
- `CLOSURE-REVIEW.md` — final closure review

Additional files may be added only when their ownership and purpose are explicit.

## Relationship to gates

```text
C01–C22
  ↓
GATE-02 topology / ontology
  ↓
GATE-03 contracts / invariants / behavior
  ↓
GATE-04 security / tenancy / data governance
  ↓
GATE-05 / GATE-06 where applicable
  ↓
GATE-07 slice-specific implementation authorization
```

This directory is architecture/conference evidence only. It does not authorize implementation.
