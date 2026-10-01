# C03 — Project Red-Team Cross-Domain Test

**Date:** 2026-10-01  
**Status:** RECONCILIATION — OPEN  
**Scope:** Project only; Core boundary and cross-domain dependencies

## 1. Governing architecture

V3 defines nine canonical bounded contexts: Core, CRM, Sales, Inventory, Finance, Studio, Marketing, Analytics and Documents. Platform capabilities such as Identity, Tenancy, Authorization, Audit, Events, Workflow, Search, Media and Notifications are not additional bounded contexts unless a later ADR proves independent ownership and transactional boundaries.

The ontology is a governed representation over authoritative domain records. `Project → contains → Building → contains → Floor → contains → Unit` therefore establishes semantic relationships, not automatic aggregate containment.

## 2. Red-team scenarios

| Scenario | Failure risk | Required owner / boundary | Project aggregate implication | Result |
|---|---|---|---|---|
| Archive Project while Units are active | Orphaned/hidden commercial inventory | Core + Inventory/Sales policy | Does not require Unit nesting | PASS — keep separate |
| Archive Project with active Reservation | Reservation becomes inconsistent | Sales/Reservation | Reservation owns its consistency | PASS — Project cannot silently invalidate it |
| Archive Project with Contract/Payment | Financial/legal record corruption | Sales + Finance | Finance/Contract invariants remain separate | PASS |
| Publish/unpublish Project | Public projection drift | Studio/Search/Media | Publication is not Project aggregate invariant | PASS |
| Project mutation emits event | stale projections / duplicate effects | Events + consumers | Outbox/event boundary, not aggregate expansion | PASS |
| Transfer Project across organizations | tenant isolation breach | Tenancy/Authorization + Core | Cross-boundary workflow required; ordinary FK update prohibited | BLOCKED pending transfer capability decision |
| Add Building | relationship consistency | Core/Building | Same-transaction atomicity not demonstrated | OPEN |
| Remove Building | orphan/dependent data | Core/Building/Inventory | Destructive policy not demonstrated | OPEN |
| Project affects Unit availability | accidental inventory mutation | Inventory | Unit owns commercial state | PASS — separate |
| Project affects reservation winner | concurrency breach | Sales/Reservation | Reservation owns one-winner invariant | PASS — separate |
| Project affects ledger | accounting corruption | Finance | Finance owns double-entry invariant | PASS — separate |
| Search/public read model | stale or cross-tenant data | Search/Studio | projection consistency, not aggregate boundary | PASS |
| Documents attached to Project | access/retention errors | Documents + platform authorization | document policy remains separate | PASS |
| CRM lead interested in Unit | reference becomes invalid | CRM + Inventory | reference/projection relationship | PASS |

## 3. Critical finding

The red-team scenarios do **not** produce a proven invariant requiring Project, Building, Unit, Reservation, Contract or Finance to be one transactional aggregate.

The strongest cross-domain rules are explicitly owned elsewhere:

- Reservation: one active winner per Unit under concurrency, protected by database uniqueness, isolation, conditional writes, expiration handling, idempotency, race tests, audit and outbox.
- Finance: double-entry balance and immutable posted entries.
- Contract/payment: legally constrained milestone/payment rules.
- Unit: commercial and construction state machines are separate and must not be collapsed.
- Studio/public: published projection, versioned and auditable, not direct operational-data exposure.

## 4. Project-owned candidate invariants surviving the red-team

1. Project identity remains stable after creation.
2. Project belongs to one tenant/organization boundary according to the canonical tenancy model.
3. Project mutation is authorized and auditable.
4. Project mutation must not silently mutate downstream transactional state.
5. Archive must not silently delete or invalidate transactional records.
6. Public publication must be mediated by Studio/publication contracts rather than direct operational exposure.

These are domain/policy candidates. The red-team does **not** yet prove that every candidate belongs inside a Project aggregate transaction.

## 5. Aggregate boundary conclusion

**Project Aggregate Root: OPEN, but evidence now strongly favors a Project-centric master-data aggregate boundary that does not contain Unit, Reservation, Contract or Finance records.**

`Building` remains the only material unresolved containment question. The evidence currently supports treating `Project → Building` as a domain relationship/reference until a specific atomic invariant proves otherwise.

Do not infer aggregate containment from the ontology hierarchy.

## 6. Closure blockers

C03 Project cannot be fully closed until:

- Project lifecycle is resolved as an authoritative state model or explicitly declared absent;
- transfer capability is either formally supported with a governed workflow or explicitly out of scope;
- archive policy is specified for dependent Buildings/publication and active commercial records;
- Add/Remove Building semantics are resolved;
- Project command/event contracts are traced to the canonical registers;
- repository implementation reality is reconciled against the architecture before any implementation authorization.

## 7. Governance rule

This document is evidence for architecture reconciliation only. It does not authorize schema, ORM, API, migration, RLS or production implementation. V3 requires evidence before claims, red-team verification, canonical ownership, and implementation authorization only after GATE-00 through GATE-06 pass.
