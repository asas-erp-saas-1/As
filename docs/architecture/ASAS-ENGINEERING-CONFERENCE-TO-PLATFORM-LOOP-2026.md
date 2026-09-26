# ASAS — ENGINEERING CONFERENCE TO PLATFORM ENGINEERING LOOP 2026

**Status:** CANONICAL OPERATING AMENDMENT  
**Version:** 1.0.0  
**Branch:** `platform-architecture-2026`

## Purpose

Engineering Conference and Platform Engineering are one controlled system with different responsibilities.

Conference answers domain truth, ownership, invariants, boundaries and allowed behavior. Platform Engineering answers where truth lives, how it is enforced, tested, observed and migrated safely.

## Controlled loop

`QUESTION → RESEARCH → SOURCE/RUNTIME RECONCILIATION → DECISION → ADR/CONTRACT → REGISTER IMPACT → TASK PACKET → CODEX → TEST/RED TEAM → EVIDENCE → ARTIFACT RECONCILIATION → CHECKPOINT`

A decision without implementation evidence remains semantic. An implementation without contract provenance is unauthorized drift.

## Current position

C03.1 through C03.12 are semantically closed. C03.13 is open and evidence-gated. The immediate engineering activity is brownfield persistence forensics and control-plane hardening, not speculative schema authoring.

## Work packages

- **WP-00 Control Plane:** checkpoint, conference path, platform track, source-of-truth, artifact ownership, task routing.
- **WP-01 Brownfield Persistence:** repository schema/migration inventory, runtime identity, live introspection when authorized, drift matrix.
- **WP-02 Executable Contract:** promote/revise schema contract only after WP-01; align tenant/security/state/event/permission constraints.
- **WP-03 Reservation Proof:** choose DB invariant mechanism, transaction boundary, idempotency, expiration protection, outbox and race tests.
- **WP-04 Vertical Slice:** command → authorization → domain → persistence → event/outbox → read projection → evidence.
- **WP-05 Platform Hardening:** CI architecture gates, tenant/RLS gates, register drift checks, observability, recovery and deployment evidence.

## Evidence rule

Distinguish `TARGET | SOURCE | RUNTIME | TEST | DERIVATION | PROPOSED | BLOCKED`. A target model is not a runtime model; a migration file is not proof of live DB state; a test definition is not a passing test.

## Current next checkpoint

`ARCH-2026-H1.20-C03.13-BROWNFIELD-PERSISTENCE-RECONCILIATION-OPEN-01`

Next evidence-producing action: `Q1-SCHEMA-03/04`. No executable Prisma contract or production migration is authorized yet.