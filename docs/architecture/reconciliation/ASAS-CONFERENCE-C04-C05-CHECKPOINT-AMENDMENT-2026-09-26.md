# ASAS Engineering Conference — C04 → C05 Checkpoint Amendment

**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Canonical conference path:** `docs/architecture/ASAS-ENGINEERING-CONFERENCE-PATH-2026.md`
**Current execution checkpoint:** `ARCH-2026-H1.25-C04-CRM-SEMANTIC-CLOSURE-IMPLEMENTATION-BLOCKED-01`

## Purpose

Record the completed transition from C04 CRM semantic work to C05 Sales without rewriting historical conference decisions.

## C04 disposition

**SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED** by `ADR-0035`.

Closed subjects:

- Person as canonical human identity;
- Customer as organization-scoped relationship over Person;
- Lead ownership and organization scope;
- duplicate detection and controlled merge;
- 17-stage unified sales pipeline baseline;
- Deal as derived view rather than separate CRM authority;
- ownership vs assignment vs team/branch scope;
- attribution separation;
- communication platform boundary;
- consent/purpose governance boundary;
- Activity vs Task vs Appointment vs Communication;
- AI read/recommend/draft authority and approval boundary.

Deferred explicitly:

- executable state/event/permission registry IDs → registry reconciliation;
- legal basis/retention execution → C15 + country-pack evidence;
- runtime persistence → foundation/brownfield gates.

## C05 disposition

**OPEN / RESEARCH-FIRST.**

C05 must resolve the commercial transaction layer between CRM intent and authoritative inventory/financial milestones.

The active task packet is:

`docs/architecture/task-packets/ASAS-TASK-C05-SALES-ENGINEERING-CONFERENCE-2026-09-26.md`

Primary topics:

`Opportunity → Offer → Hold → Reservation → Contract preparation → Approval → Attribution handoff`

with special attention to:

- offer versioning and expiry;
- hold semantics and TTL;
- reservation preconditions/idempotency/concurrency;
- brokerage mandate authority;
- discount approvals;
- contract-preparation boundary;
- Finance handoff;
- event/audit semantics.

## Platform Engineering interaction

C05 semantic work does not bypass the foundation gates. `C03.13` brownfield reconciliation and H0/GATE-00..07 remain active. No schema/RLS/migration implementation is authorized merely because C05 becomes semantically closed.

## Anti-drift rule

A later C05 decision may amend a C04 decision only when it introduces a real cross-context conflict. The amendment must identify the superseded decision and preserve provenance. Otherwise C04 remains authoritative for CRM semantics.
