# ASAS Source-of-Truth Amendment 014 — C02 Attribution Semantics

**Date:** 2026-09-25
**Status:** CANONICAL DERIVATION / IMPLEMENTATION BLOCKED
**Parent:** `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`

## Provenance

This amendment is derived from the C02 engineering conference, the existing ASAS lifecycle and permission evidence, and current external SaaS authorization research. It does not claim that the current repository/database already implements these semantics.

## Canonical semantic distinction

`Lead Ownership ≠ Operational Assignment ≠ Source Attribution ≠ Commercial Attribution ≠ Commission Entitlement`

## Authority model

- Lead ownership: CRM relationship-record responsibility.
- Assignment: current operational responsibility.
- Source attribution: original acquisition origin.
- Commercial attribution: credit for defined commercial outcomes.
- Commission entitlement: Finance-owned, rule-derived entitlement.

## Required behavior

Historical commercial attribution at reservation/sale milestones is preserved and cannot be silently rewritten by later lead reassignment.

Cross-agency collaboration does not merge private CRM records.

Developer performance projections may aggregate authorized commercial facts without exposing unrelated Agency-private data.

## Existing-source reconciliation

The current permission register already expresses scoped lead read/update/transfer/export and apartment assigned-access concepts. The canonical lifecycle already defines Lead → Qualification → Opportunity → Activity/Visit → Commercial action → Option/Reservation → Contract → Payment. The amendment clarifies semantics required to prevent an overloaded owner field from becoming the source of truth for all these concepts.

## Verification status

`SUPPORTED BY CURRENT DESIGN EVIDENCE + ENGINEERING DERIVATION / REPOSITORY IMPLEMENTATION UNVERIFIED / LIVE RUNTIME UNVERIFIED`

## Reopen triggers

Reopen if repository/runtime evidence shows an incompatible existing contract, if a domain invariant fails, or if approved product/legal/finance policy requires different ownership or attribution semantics.
