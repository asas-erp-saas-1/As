# ASAS — Roadmap Foundation Sequencing Amendment

**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Status:** ACTIVE / CANONICAL AMENDMENT
**Applies to:** `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md`

## Reason

The current roadmap contains useful engineering stages, but its older Q1–Q10 queue and historical Scheduling wording can be read as feature-first execution pressure. ASAS V3 explicitly requires GATE-00 through GATE-06 before implementation authorization. This amendment is the current sequencing overlay until the roadmap receives its next full canonical revision.

## Authority

V3 §69 and §82 are the governing architectural source for implementation sequencing. The current branch Conference Path and CURRENT-SESSION-STATE now route execution through the same foundation sequence.

## Current sequencing

```text
GATE-00 Platform Identity
→ GATE-01 Canonical Artifacts
→ GATE-02 Architecture Conflict
→ GATE-03 Database Reality
→ GATE-04 Security Baseline
→ GATE-05 Architecture CI
→ GATE-06 Repository Hygiene
→ GATE-07 Implementation Authorization
→ authorized contract/schema work
→ controlled vertical implementation
```

## Scheduling correction

The current conference decision is that Scheduling is a Core-hosted platform capability. Historical `FOUNDER-DECISION-REQUIRED` wording is provenance only and must not be treated as an unresolved current decision unless stronger current evidence explicitly reopens it.

## C03 relationship

C03.1–C03.12 semantic decisions remain retained. C03.13 remains brownfield/schema reconciliation and is evidence-gated. Foundation convergence is a prerequisite for its executable implementation path; this does not invalidate the semantic decisions.

## Canonical update requirement

At the next roadmap maintenance pass, update sections H0/H1/current execution queue so this amendment is absorbed into the main roadmap rather than remaining a permanent overlay.

## Non-authorizations

This amendment authorizes no production migration, RLS change, destructive operation, reservation implementation, finance mutation or deployment.
