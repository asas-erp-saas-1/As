# ASAS — PLATFORM ARCHITECTURE BLUEPRINT 2026 — AMENDMENT 001

**Artifact ID:** ASAS-ARCH-PLATFORM-2026-001-A001  
**Status:** PROPOSED AMENDMENT — AUTHORITY RECONCILIATION  
**Version:** 1.0.0  
**Effective date:** 2026-09-20  
**Parent:** `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` v1.3.0  
**Branch:** `platform-architecture-2026`

> This amendment preserves the parent Blueprint and changes only the interpretations explicitly listed below. It must be read together with the parent until a subsequent Blueprint revision incorporates the amendment. It is not permission to implement code or database changes.

---

## 1. C2-001 — RECLASSIFICATION

### Previous wording

The parent Blueprint treated the nine-context view and the historical 15-module proposal as a direct architecture conflict requiring founder selection.

### Corrected interpretation

The evidence does **not** establish two equal-authority bounded-context models.

The current target domain grouping remains:

`Core / CRM / Sales / Inventory / Finance / Website Studio / Marketing / Analytics / Documents`

The 15-module artifact is a **proposed implementation decomposition** whose historical ADR explicitly awaited founder acceptance.

Therefore:

`C2-001 = OPEN ARCHITECTURAL REFINEMENT`

The engineering problem is to derive implementation module boundaries from:

- semantic cohesion;
- business capability ownership;
- aggregate ownership;
- transaction/consistency boundaries;
- authorization boundaries;
- data ownership;
- change cadence;
- failure isolation;
- scaling behavior;
- integration cost;
- operational complexity.

No founder decision is required merely to choose between the numbers 9 and 15.

---

## 2. C2-002 — SCHEDULING RECLASSIFICATION

Historical `ADR-0018` accepted Scheduling as a Core/CRM-hosted capability.

The 2026 architecture reopened that question.

Therefore:

`C2-002 = OPEN / PROPOSED SUPERSESSION`

The historical ADR remains evidence and is not silently deleted or invalidated.

Until a new ADR explicitly supersedes it or the 2026 baseline explicitly reaffirms it, implementation ownership must not be changed solely from the reopened discussion.

---

## 3. AGGREGATE / INVARIANT ENGINEERING IS NOW A FIRST-CLASS H1.3 ARTIFACT

The parent Blueprint's aggregate section is extended by:

`docs/architecture/ASAS-AGGREGATE-INVARIANT-BOUNDARY-REGISTER-2026.md`

This register is the derived contract for:

- candidate aggregates;
- invariant ownership;
- transaction-boundary candidates;
- concurrency requirements;
- open ownership questions;
- required tests/evidence.

It does not create database tables or authorize implementation.

---

## 4. CRITICAL CURRENT OPEN BOUNDARIES

The following must be resolved before schema promotion:

1. Unit ↔ Reservation atomic consistency boundary.
2. Offer ownership and invariants.
3. Payment vs PaymentSchedule vs Receipt semantics.
4. Building ownership and invariants.
5. Scheduling ownership / reaffirmation of ADR-0018.

---

## 5. AUTHORITY ROUTING

For the affected topics:

```text
Parent Blueprint
      ↓
Amendment 001
      ↓
Aggregate/Invariant Register
      ↓
Canonical registers / ADRs
      ↓
Implementation only after gates pass
```

Where an approved ADR or founder decision conflicts with this amendment, the amendment remains `PROPOSED` until the higher-authority decision is resolved.

---

## 6. IMPLEMENTATION GATE

This amendment does **not** authorize:

- Prisma schema generation;
- migrations;
- production database changes;
- application implementation;
- new bounded contexts;
- microservices;
- new infrastructure;
- autonomous AI authority.

Current checkpoint:

`ARCH-2026-H1.3-AGGREGATE-INVARIANT-CLOSURE`
