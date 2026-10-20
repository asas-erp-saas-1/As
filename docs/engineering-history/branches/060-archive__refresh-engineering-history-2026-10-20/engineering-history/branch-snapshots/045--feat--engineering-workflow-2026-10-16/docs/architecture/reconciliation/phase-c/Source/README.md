# Phase C Source Corpus

**Canonical path:** `docs/architecture/reconciliation/phase-c/Source/`

## Purpose

This directory is the controlled discovery/index layer for the historical and current Engineering Conference C-track source material found in the `platform-architecture-2026` branch.

It is **not** a second source of truth. Canonical artifacts remain owned by their established directories (`conference/`, `contracts/`, `decisions/`, `research/`, `task-packets/`, `handoff/`, `docs/research/`, etc.). This Source Corpus records and groups those artifacts by C-track so that Conference work can be performed from one navigable corpus without silently creating duplicate authorities.

This follows the single-source-of-truth principle: the repository may have multiple documentation views, but a concept must retain one canonical owner.

## Branch lock

- Repository: `asas-erp-saas-1/As`
- Active branch: `platform-architecture-2026`
- No alternate working branch is introduced by this organization step.

## Discovery rule

A file is included when its **filename explicitly identifies a C-track (`C01` ... `C22`) or a combined C-track scope** such as `C03-C06` or `C02-03`. Files whose content merely mentions a C-track are not duplicated here; they remain indexed through their canonical owner.

## C-track corpus currently found

### C02
- `docs/architecture/amendments/ASAS-C02-INVENTORY-AUTHORITY-AMENDMENT-015-2026-09-25.md`
- `docs/architecture/amendments/ASAS-ROADMAP-AMENDMENT-011-C02-ATTRIBUTION-SEMANTICS-2026-09-25.md`
- `docs/architecture/amendments/ASAS-ROADMAP-AMENDMENT-012-C02-INVENTORY-RESERVATION-COMMISSION-2026-09-25.md`
- `docs/architecture/amendments/ASAS-ROADMAP-AMENDMENT-013-MULTI-ACTOR-INVENTORY-2026-09-25.md`
- `docs/architecture/amendments/ASAS-SOT-AMENDMENT-014-C02-ATTRIBUTION-SEMANTICS-2026-09-25.md`
- `docs/architecture/amendments/ASAS-SOT-AMENDMENT-015-C02-COMPETITION-C03-ENTRY-2026-09-25.md`
- `docs/architecture/conference/C02-03-RESERVATION-COMMISSION-FOUNDER-DECISION-GATE-2026-09-25.md`
- `docs/architecture/decisions/C02-03-INVENTORY-COMPETITION-FOUNDER-DECISION-2026-09-25.md`
- `docs/architecture/research/ASAS-C02-INVENTORY-COMPETITION-RESEARCH-2026-09-25.md`
- `docs/architecture/research/ASAS-C02-INVENTORY-RESERVATION-CONCURRENCY-RESEARCH-2026-09-25.md`
- `docs/architecture/research/ASAS-C02-RESERVATION-CONCURRENCY-AUTHORIZATION-RESEARCH-2026-09-25.md`
- `docs/research/ASAS-C02-INVENTORY-RESERVATION-RESEARCH-2026-09-25.md`
- `docs/handoff/C02-03-FOUNDER-DECISIONS-2026-09-25.md`

### C03
- `docs/architecture/amendments/ASAS-ROADMAP-AMENDMENT-014-C03-REAL-ESTATE-DOMAIN-2026-09-25.md`
- `docs/architecture/amendments/ASAS-ROADMAP-AMENDMENT-016-C03-REAL-ESTATE-DOMAIN-2026-09-25.md`
- `docs/architecture/contracts/ASAS-C03-REAL-ESTATE-RESOURCE-MODEL-CONTRACT-2026.md`
- `docs/architecture/reconciliation/ASAS-C03.13-RUNTIME-PERSISTENCE-REALITY-2026-09-29.md`
- `docs/architecture/reconciliation/C03-DEEP-CLOSURE-REVIEW-2026-09-29.md`
- `docs/architecture/research/ASAS-RESEARCH-RECORD-C03-BUILDING-2026-09-26.md`
- `docs/architecture/research/ASAS-RESEARCH-RECORD-C03-FLOOR-2026-09-26.md`
- `docs/architecture/research/ASAS-RESEARCH-RECORD-C03-LISTING-2026-09-26.md`
- `docs/architecture/research/ASAS-RESEARCH-RECORD-C03-RESERVATION-2026-09-26.md`
- `docs/architecture/research/ASAS-RESEARCH-RECORD-C03-UNIT-2026-09-26.md`
- `docs/architecture/research/ASAS-RESEARCH-RECORD-C03.13-RESERVATION-DATA-SAFETY-2026-09-26.md`
- `docs/architecture/research/ASAS-RESEARCH-RECORD-Q1-BUILDING-2026-09-24.md`
- `docs/architecture/task-packets/ASAS-TASK-C03.13-BROWNFIELD-SCHEMA-RECONCILIATION-2026.md`
- `docs/handoff/ASAS-C03-CONFERENCE-CHECKPOINT-2026-09-25.md`
- `docs/research/ASAS-C03-REAL-ESTATE-DOMAIN-RESEARCH-2026-09-25.md`

### C04
- `docs/architecture/task-packets/ASAS-TASK-C04-CRM-ENGINEERING-CONFERENCE-2026-09-26.md`

### C05
- `docs/architecture/task-packets/ASAS-TASK-C05-SALES-ENGINEERING-CONFERENCE-2026-09-26.md`
- `docs/handoff/ASAS-C05-CLOSED-C06-OPEN-CHECKPOINT-2026-09-26.md`

### C06
- `docs/architecture/task-packets/ASAS-TASK-C06-FINANCE-ENGINEERING-CONFERENCE-2026-09-26.md`
- `docs/handoff/ASAS-GATE-00-C06-FINANCE-CHECKPOINT-2026-09-27.md`

### Combined C03–C06
- `docs/architecture/reconciliation/ASAS-C03-C06-DEEP-CLOSURE-DECISIONS-2026-09-27.md`
- `docs/architecture/reconciliation/ASAS-C03-C06-DEEP-CONFERENCE-REVIEW-2026-09-27.md`
- `docs/architecture/research/ASAS-C03-C06-EXTERNAL-RESEARCH-2026-09-27.md`

## C01 and C07–C22

No branch file whose **filename** explicitly identifies these tracks was found in the current recursive branch tree during this inventory. Their Phase C directories remain valid and intentionally empty of fabricated source material.

## Important distinction

`C-track source corpus` != `canonical artifact owner` != `closure status`.

A source document may be historical, supporting, superseded, open, or evidence-only. Its presence here never changes its authority or closure state.

## Next action

For each active C-track, the conference process will reconcile this corpus against the canonical artifact register, ADRs, contracts, research records, task packets, runtime evidence, and current V3 architecture before any closure claim is made.
