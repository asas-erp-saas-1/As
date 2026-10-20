# C03 — Project Lifecycle & Archive Policy

**Date:** 2026-10-01  
**Status:** RECONCILIATION — PARTIALLY CLOSED  
**Scope:** Project only

## 1. Authority

Current V3 is authoritative for the target architecture. Historical domain material is retained as evidence and must not silently override V3.

V3 defines the Real Estate Core hierarchy as:

`Organization → Project → Building → Floor → Unit`

It defines explicit lifecycle state machines for Unit, separating Commercial State from Construction State. It does **not** define a canonical Project state machine.

V3 also defines Studio publishing separately:

`Draft → Validate → Review → Publish → Projection → Cache invalidation → Public site`

Therefore publication state is not evidence of a Project domain lifecycle.

## 2. Decision: no canonical single Project status yet

**LOCKED:** ASAS must not invent a single Project enum such as `DRAFT → ACTIVE → PUBLISHED → SUSPENDED → ARCHIVED` merely to make the UI or schema convenient.

**REASON:** Current authoritative sources do not establish such a Project state machine.

The Project is a master-data/core object, while operational state is distributed across the domains that actually own the relevant consistency rules.

## 3. Lifecycle dimensions

The architecture may eventually require separate Project-related dimensions, but these remain unmodeled until evidence establishes them:

- development / planning lifecycle;
- legal / approval lifecycle;
- construction/program lifecycle;
- commercial availability/publication lifecycle;
- operational/archive lifecycle;
- data-governance lifecycle.

These dimensions must not be collapsed into one status without a proven domain rule.

## 4. Archive decision

**LOCKED:** Archive is a governed Project mutation/capability, not hard deletion.

Archive must preserve historical integrity and must not implicitly delete or rewrite:

- Units;
- Reservations;
- Contracts;
- Payments / ledger records;
- Documents;
- Audit history;
- Domain events.

Current evidence supports independent archival/retention behavior across records; it does not authorize a cascade archive of all dependents.

## 5. Archive preconditions remain OPEN

Before Project archive becomes effective, the following policy questions must be explicitly resolved:

1. Can a Project be archived while any Unit remains commercially active?
2. What happens to active Reservations?
3. What happens to Contracts and payment obligations?
4. What happens to public publication/projections?
5. Can documents remain accessible after Project archive?
6. Is reactivation supported, and under what authority?
7. Does archive mean operationally closed, legally retained, or both?
8. What happens to search indexes and cached public projections?

These are not to be answered by assumption.

## 6. Publication interaction

Project archive must not directly mutate the public site as a database side effect.

The V3 publication flow is a separate governed pipeline:

`Draft → Validate → Review → Publish → Projection → Cache invalidation → Public site`

Therefore Project archival may **trigger/request** a publication consequence, but Studio remains responsible for the published projection.

## 7. Cross-domain safety

Project archive must not violate stronger invariants owned elsewhere:

- Reservation: one active winner per Unit under concurrency;
- Finance: double-entry integrity and immutable posted entries;
- Unit: separate commercial and construction state machines;
- Documents: retention/legal-hold requirements;
- Tenant/security: tenant and authorization boundaries;
- Audit/event platform: traceable mutation and event evidence.

A Project command cannot bypass these contexts by performing cross-domain direct mutations.

## 8. Reactivation

**OPEN.** No source currently proves that archived Project reactivation is required. It must not be implemented as a generic inverse of archive until business and governance evidence exists.

## 9. Project lifecycle closure decision

The correct architectural conclusion at this point is:

> **Project has no canonical single lifecycle state machine in the current V3 source of truth.**

This closes the question of whether we should invent a Project enum now: **NO**.

It does **not** close the future lifecycle dimensions or archive preconditions.

## 10. Evidence chain

Target evidence must remain traceable as:

`Requirement → Decision → Domain Rule → Contract → Implementation → Test → Evidence`

No implementation authorization follows from this document alone.

## 11. Current closure status

| Area | Status |
|---|---|
| Single Project lifecycle enum | **CLOSED — DO NOT INVENT** |
| Unit lifecycle ownership | **CLOSED — Unit-owned** |
| Publication lifecycle ownership | **CLOSED — Studio/publication boundary** |
| Archive ≠ delete | **CLOSED** |
| Cascade archive/delete | **CLOSED — prohibited by default** |
| Archive preconditions | **OPEN** |
| Reactivation | **OPEN** |
| Legal/approval lifecycle | **OPEN** |
| Construction lifecycle at Project level | **OPEN** |
| Aggregate boundary | **OPEN** |
| Implementation authorization | **BLOCKED** |

## 12. Source notes

Primary source: `ASAS-ARCHITECTURE-V3.md`.

Relevant V3 facts:
- Real Estate Core hierarchy is Organization → Project → Building → Floor → Unit.
- Unit has separate Commercial and Construction state machines.
- Reservation is an independent critical consistency boundary.
- Finance is a separate integrity domain.
- Public data is a published projection.
- Studio publishing is versioned and auditable.
- Data governance includes retention, lineage, access, deletion/anonymization policy.

Historical material remains evidence only where it does not conflict with V3.
