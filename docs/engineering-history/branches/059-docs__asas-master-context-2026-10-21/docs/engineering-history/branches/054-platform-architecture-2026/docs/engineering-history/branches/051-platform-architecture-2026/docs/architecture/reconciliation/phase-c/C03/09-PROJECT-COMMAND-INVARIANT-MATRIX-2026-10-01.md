# C03 — Project Command / Invariant Matrix

**Status:** OPEN — decision evidence in progress  
**Date:** 2026-10-01  
**Scope:** Project only. No Building implementation decision is made here.

## Authority rule

This document reconciles the current C03 engineering work against the supplied ASAS architecture material. It does not invent persistence schema, API shapes, enum values, or aggregate boundaries where the source material does not establish them.

V3 establishes the Real Estate Core hierarchy `Organization → Project → Building → Floor → Unit`, separates Unit commercial and construction states, and requires governed commands/events/reconciliation. The historical domain model provides supporting evidence that Unit should remain an independent aggregate because of concurrency. These facts do not, by themselves, prove that Project must be an Aggregate Root.

## Command / invariant matrix

| Candidate operation | Required semantic invariant | Atomicity / boundary conclusion | Event requirement | Status |
|---|---|---|---|---|
| Create Project | Canonical Project identity must be established within one tenant/organization boundary. | Creation must establish the Project record and its tenant ownership consistently. Exact persistence shape is OPEN. | A governed creation event is expected if the operation is implemented through the V3 event model. | OPEN |
| Amend Project | Amendments must not silently change canonical identity or cross tenant boundary. | Exact fields that are immutable vs mutable are not yet established by the sources. | Governed mutation/audit/event semantics required by V3. | OPEN |
| Publish Project | Publication is a product/content concern in existing operating material; V3 does not define it as the canonical Real Estate lifecycle. | Must not be confused with Unit commercial state. Exact state model remains OPEN. | If implemented as a domain action, event must follow governed event lifecycle. | OPEN |
| Archive Project | Archive/delete must preserve data integrity and must not silently destroy authoritative history. | Exact archive semantics and downstream restrictions remain OPEN. | Audit/event evidence required for governed mutation. | OPEN |
| Add Building | Project→Building relationship must remain within the same tenant/organization boundary. | No evidence yet that Project + Building require one aggregate transaction. | Relationship mutation event semantics OPEN. | OPEN |
| Remove Building | Cannot orphan or silently invalidate dependent authoritative records. Exact dependency rules must be defined before destructive behavior. | Boundary remains OPEN; likely requires explicit dependency checks rather than assuming aggregate containment. | Audit/event semantics OPEN. | OPEN |
| Transfer Project | Tenant/ownership transfer must be explicit and must not violate tenant isolation. | Cross-tenant transfer semantics are not defined by current sources. | Requires auditable, permission-aware domain action if supported. | OPEN |
| Developer relationship | Developer/Promoter relationship must not be conflated with ASAS Organization/Tenant ownership. | Relationship model is OPEN. | Event semantics OPEN. | OPEN |
| External import | Imported identity must preserve provenance and must not overwrite canonical identity without reconciliation. | External-system reconciliation boundary OPEN. | Import/reconciliation evidence required. | OPEN |
| Merge Projects | No source currently defines merge semantics. | BLOCKED until identity, references, children, documents, inventory and history implications are defined. | OPEN. | BLOCKED |
| Split Project | No source currently defines split semantics. | BLOCKED until identity, child ownership, historical records and provenance are defined. | OPEN. | BLOCKED |

## Aggregate conclusion

The matrix does **not** justify closing `Project = Aggregate Root`.

The current evidence supports:

1. Project is a canonical Real Estate Core entity / master-data concept.
2. Project is tenant-scoped.
3. Unit remains an independent consistency boundary for its own commercial/construction behavior.
4. Reservation is explicitly a critical consistency boundary at Unit level, with concurrency protections.
5. Project→Building is a semantic relationship, but hierarchy alone is insufficient to prove aggregate containment.

Therefore:

> **Project Aggregate Root remains OPEN.**

The next closure evidence must come from the actual Project commands and invariants that require transactional consistency, not from the ontology hierarchy alone.

## Source-derived constraints

The supplied V3 material requires domain command → transaction → mutation → audit → outbox event → commit → dispatch → idempotency → handler → evidence for governed events. It also states that events must be immutable, versioned, idempotent, traceable and permission-aware.

The supplied operating material states that Project management includes create/edit/archive/delete-safely, gallery/hero/amenities/apartments/SEO/status/starting-price/delivery/availability management. These are product requirements and must not automatically be interpreted as domain aggregate boundaries.

## Closure blockers

- Exact Project immutable identity fields are not fully specified.
- Exact Project lifecycle is not specified by V3.
- Exact Project↔Developer ownership/relationship model is not fully specified.
- Project transfer semantics are not specified.
- Project merge/split semantics are not specified.
- Project-specific invariants requiring atomic consistency are not sufficiently enumerated.
- Existing runtime/persistence implementation must be reconciled before any implementation contract is declared canonical.

## Next step

Proceed with **Project invariant discovery** from real business commands and cross-domain consumers. Do not start Building reconciliation until the Project aggregate-boundary question has sufficient evidence for a deliberate decision.