# C03 — Project Command Boundary Analysis

**Date:** 2026-10-01
**Status:** RECONCILIATION — OPEN
**Scope:** Project only

## Purpose

Determine which Project operations are authoritative domain commands, which are publication/configuration capabilities, and which consistency boundaries belong to other contexts. This document does not authorize implementation.

## Governing evidence

- V3 establishes nine canonical bounded contexts and separates platform capabilities from domain contexts.
- V3 requires domain commands to execute through transaction → domain mutation → audit → outbox → commit → consumer/evidence.
- Configuration cannot weaken core invariants or security.
- Public data is a published projection, not direct operational-data exposure.
- Historical Enterprise Domain Model treats Project as a core aggregate candidate and Unit as an independent aggregate, but its AgencyId terminology is historical and is reconciled against current Organization terminology elsewhere in C03.

## Command analysis

| Operation | Domain mutation? | Candidate Project boundary | External/other context dependency | Current decision |
|---|---|---|---|---|
| Create Project | Yes | Project identity + tenant ownership | Identity/Tenancy, permissions | OPEN — Project command candidate |
| Amend Project master data | Yes | Project-owned master attributes | Audit, Documents where applicable | OPEN — Project command candidate |
| Publish public representation | No, primarily publication state/projection | Studio/publication boundary | Studio, Search, Media | NOT a Project aggregate invariant |
| Unpublish | No, publication/projection concern | Studio/publication boundary | Studio, Search, Media | NOT a Project aggregate invariant |
| Archive Project | Yes, lifecycle/governance mutation | Project record + dependent policy checks | Inventory/Studio/Documents | OPEN — invariant discovery required |
| Transfer between organizations | Yes if supported | Ownership/tenant boundary | Tenancy, authorization, audit | OPEN — do not implement by changing a foreign key casually |
| Add Building | Yes, relationship/master-data mutation | Project relationship to Building | Building/Core | OPEN — atomicity not yet proven |
| Remove Building | Yes if supported | Relationship + dependent-data policy | Building/Inventory/Studio | OPEN — destructive semantics unresolved |
| Change Unit availability | No | Unit/Inventory | Sales/Reservation | OUTSIDE Project boundary |
| Reserve Unit | No | Reservation/Unit | Sales/Reservation | OUTSIDE Project boundary |
| Record payment | No | Finance | Contract/Finance | OUTSIDE Project boundary |

## Key conclusion

The command list does not yet prove that Project must own Building as an aggregate child. `Project contains Building` is an ontology/domain relationship, not by itself a transactional aggregate boundary.

Likewise, public publication is explicitly a projection/publishing concern in V3 and must not be used as evidence for a Project aggregate lifecycle.

## Candidate Project-owned invariants

1. Project identity remains stable after creation.
2. Project cannot cross tenant/organization boundaries through an ordinary amendment.
3. Project mutations are authorized and auditable.
4. Project archival must respect dependent-object/publishing policy before becoming effective.
5. Project master-data changes must not silently mutate Unit commercial state, reservations, contracts, or finance records.

These are **candidate domain/policy invariants**, not all proven aggregate-local invariants.

## Aggregate decision

**Project Aggregate Root: OPEN.**

Reason: current evidence establishes Project as a canonical master-data object and establishes Unit as independent for concurrency, but does not yet establish a set of invariants requiring Project + Building to commit atomically.

## Next evidence required

Before closing Project aggregate boundary:

- enumerate Project create/amend/archive authorization rules;
- identify all dependent Building/Unit constraints;
- determine whether any invariant requires same-transaction Project + Building mutation;
- resolve transfer semantics;
- resolve archive semantics;
- reconcile historical Project aggregate terminology with current V3 bounded-context terminology;
- perform red-team review against CRM, Sales, Inventory, Studio, Documents and Finance.

## Closure rule

No schema, ORM aggregate mapping, API contract, event contract, or migration may be treated as final from this document alone. Implementation remains blocked until the applicable engineering gates authorize it.
