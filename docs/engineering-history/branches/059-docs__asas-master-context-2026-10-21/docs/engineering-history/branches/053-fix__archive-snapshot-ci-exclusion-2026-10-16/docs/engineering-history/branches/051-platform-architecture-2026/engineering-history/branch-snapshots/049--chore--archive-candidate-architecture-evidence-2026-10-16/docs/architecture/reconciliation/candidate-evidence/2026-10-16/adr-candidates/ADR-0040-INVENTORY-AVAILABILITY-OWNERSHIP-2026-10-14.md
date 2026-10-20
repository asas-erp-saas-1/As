# ADR-0040 — Inventory Availability Ownership and Aggregate Boundary

> **CANONICALIZATION NOTICE (2026-10-16):** This is preserved from source branch `cline/hp1c6fdq` as candidate evidence for review. Any source-branch `ACCEPTED` labels, claimed delegation, and “finding closed” statements are not independent proof of canonical approval. This archive does not ratify the decision, close a gate/C-track, authorize implementation, or permit schema/migration/RLS/production changes.


**Status:** PROPOSED CANDIDATE — not ratified on the canonical branch; implementation gated
**Date:** 2026-10-14
**Source branch:** `cline/hp1c6fdq` — source-branch assertion, not canonical acceptance
**Decision owner:** Engineering Conference under founder delegation (2026-09-26)
**Conference route:** C03 → GATE-02 / GATE-03
**Resolves:** C03 blockers B2 and B3; C03 open decision C03-O02

## 1. Problem

Two coupled questions were left open:

- **B2** — is inventory availability a state of the Unit, or a separate Inventory
  object/aggregate with its own cardinality and lifecycle?
- **B3** — what is the exact mapping between `apartment.commercial_status` and
  "authoritative inventory availability"?

Both questions assume there are two concepts requiring a mapping. The evidence
says there is one.

## 2. Evidence

1. **`ADR-0033` defines availability as the Unit lifecycle.** Its opening
   decision states: "ASAS inventory availability is the controlled commercial
   lifecycle of a canonical development Unit. It is not a mutable convenience
   flag and it is not derived from UI state, listings, search indexes or client
   assumptions."
2. **The register has no Inventory state machine.** `registers/state-machines.json`
   defines 11 machines; none is an inventory machine. There is no `inventory.*`
   event and no `inventory.*` permission key.
3. **The register explicitly warns against reading emission groups as domains.**
   Its meta note states: "Emission groups are event-routing lanes, not bounded
   contexts." The `Inventory` lane contains the `apartment.*` resource events, not
   a separate aggregate's events.
4. **`ADR-0028` keeps inventory inside Unit.** Its Unit-level concept list
   includes "inventory ownership reference", and its explicit outside-ownership
   list contains Lead, Offer, Hold, Reservation, Contract, payment, ledger,
   commission, campaign, media and scheduling — but **not** inventory
   availability.
5. **The aggregate register supports Unit as its own aggregate.** OI-002 records
   that the source model "deliberately makes Unit its own aggregate because units
   are concurrently updated", and the candidate aggregate list for
   "Property & Inventory" is `Project`, `Unit`, `Listing` — with no separate
   Inventory aggregate.
6. **PostgreSQL is the authority; projections are derived** (C03-D05,
   `PHASE-11-SCALABILITY-BLUEPRINT`).

## 3. Decision 1 — B3 dissolves: availability *is* the Unit commercial dimension

There is no second "availability" state machine to map onto
`apartment.commercial_status`. Availability is the commercial dimension of the
Unit.

Consequently:

- "authoritative inventory availability" = the Unit's commercial state, as
  defined by `ADR-0038` Decision 2;
- the phrase "commercial status ↔ availability mapping" describes an **identity**,
  not a translation, and no mapping table, synchronisation job or derived field is
  required;
- what *does* require design is the **allocatability policy** layer — who may
  place a hold, on which channel, with what priority, under which competition
  rules. That layer constrains commands; it does not create a second state.

## 4. Decision 2 — No separate Inventory aggregate or entity

**Decision:** inventory positions are Units. No `Inventory` aggregate, entity or
table is created. A separate inventory record must not be introduced without a
superseding ADR that demonstrates a distinct invariant set and consistency
boundary.

**Rationale.**

1. No register evidence exists for it (no machine, event or permission).
2. Concurrency is per-Unit; the invariant is "one active commercial control per
   Unit" (`ADR-0034`). A parallel inventory entity would need its own uniqueness
   constraint and would create two availability truths that can diverge.
3. `ADR-0033` invariant 4 already forbids projections from creating commercial
   availability; a second authoritative inventory record is the same failure mode
   in a different place.
4. The non-negotiable "public website, Studio, CRM, ERP and integrations share
   canonical domain data rather than duplicated truths" is satisfied by one Unit
   resource, not by a Unit plus an Inventory mirror.

## 5. Decision 3 — Ownership

| Concern | Owner | Authority |
|---|---|---|
| Unit identity and structural characteristics | Real Estate (Core) | Unit aggregate |
| Unit commercial dimension (availability truth) | Real Estate / Inventory capability | PostgreSQL; Unit aggregate |
| Unit construction dimension (projection) | Real Estate, driven by milestone certification | `milestone.certified` |
| Hold obligation | Sales (bounded commercial control on a Unit) | Hold contract |
| Reservation lifecycle and winner adjudication | Sales | Reservation aggregate + `ADR-0034` protocol |
| Contract lifecycle | Sales | Contract aggregate |
| Payment, receipt, ledger | Finance | Finance contracts |
| Publication and search | Studio / Search | derived projections, never authoritative |

Ownership of availability is therefore **not** transferred to Sales by the fact
that Sales drives reservations, and **not** transferred to Studio by the fact that
the website displays availability. Sales commands *request* transitions; the Unit
dimension *owns* the resulting state.

## 6. Decision 4 — Unit is an aggregate root; the hierarchy is not one aggregate

**Decision:** Unit is an aggregate root for its identity, structural
characteristics and two state dimensions. `Project → Building → Floor → Unit` is a
**structural topology**, not an aggregate containment graph (C03-D02, reaffirmed).
Reservation, Contract and Finance are separate aggregates that reference Unit by
stable identity.

**Rationale.** Unit-local invariants (identity stability, dimension independence,
single active commercial control) are the only invariants that must hold
atomically inside one boundary. No evidence supports a single Project-wide
aggregate, and `ADR-0028` deliberately declines to declare one.

## 7. Decision 5 — Allocatability is policy, not a second state

A Unit is allocatable for a new hold when its commercial state is `AVAILABLE`
(`ADR-0038` Decision 2 and Decision 6). Beyond that:

- **channel priority, competition, multi-actor authority and attribution** are
  governed by the existing C02 contracts
  (`ASAS-INVENTORY-CHANNEL-PRIORITY-AND-RESERVATION-COMPETITION-CONTRACT-2026.md`,
  `ASAS-INVENTORY-ACTOR-AND-MULTI-OWNER-CONTRACT-2026-09-25.md`,
  `ASAS-INVENTORY-ACCESS-AND-RESERVATION-ATTRIBUTION-CONTRACT-2026.md`,
  `ASAS-MULTI-ACTOR-AUTHORITY-CONTRACT-2026.md`);
- those contracts constrain **who may command** and **in what order**, and must
  not introduce additional commercial states;
- any conflict between an allocation policy and the register state machine is
  resolved in favour of the register.

## 8. Named open questions

| ID | Question | Disposition |
|---|---|---|
| G-10 | Does project-level allocation (releasing units to a channel/partner in bulk) require a distinct allocation record, or is it a policy constraint over Unit commands? | Defer to the C02 allocation contracts and GATE-02. No new entity is authorized meanwhile. |
| G-11 | "Inventory batch / release" relationship referenced by `ADR-0028` §implementation gates | Open. If a batch concept is required it must be justified by an invariant, not by convenience. |
| G-12 | Whether search requires a materialised availability read model | Derived only; `ADR-0033` invariant 4 forbids it becoming authority. |

## 9. Rejected alternatives

**A. A separate Inventory aggregate with its own availability state.**
Rejected: two availability truths, no register evidence, a duplicated uniqueness
constraint, and a permanent reconciliation surface.

**B. Availability as a mutable flag or boolean alongside the commercial state.**
Rejected: `ADR-0033` explicitly rejects a mutable convenience flag, and a second
field would allow the two to disagree.

**C. Availability derived from construction readiness.**
Rejected: `ADR-0033` invariant 5 and `ADR-0038` Decision 3 — construction never
performs a commercial transition.

**D. Availability owned by Sales because Sales drives reservations.**
Rejected: it would place inventory truth in the domain that only *requests*
commitments, and would invert the `ADR-0034` boundary.

**E. Availability owned by Studio/publication because the website shows it.**
Rejected: `ADR-0033` invariant 7 and `ADR-0038` Decision 5 — publication is a
projection and never creates operational availability.

**F. Availability owned by CRM because leads are matched to units.**
Rejected: matching is a read/assignment concern (`assign_unit`, ACT-014), not
inventory authority.

## 10. Consequences

**Positive.**

- One availability truth, in one place, with one concurrency invariant.
- Blocker B3 disappears rather than being mapped: there is no second concept.
- Search, Studio, CRM, analytics and AI all read the same authoritative fact.
- The C02 allocation contracts keep their scope (policy and authority) without
  creating entities.

**Costs and constraints.**

- "Inventory" remains a *capability and reporting* name, not an entity. Report and
  KPI definitions must resolve to Unit facts.
- Bulk-allocation requirements must be expressed as policy plus commands, not as a
  new aggregate, unless an invariant justifies one.

## 11. Verification required before implementation

1. Confirm no brownfield inventory-like table duplicates Unit availability
   (read-only).
2. Confirm all inventory/availability read models are derived and rebuildable.
3. Confirm the C02 allocation contracts introduce no additional commercial states.
4. Confirm tenant isolation applies to Unit availability and to every derived
   projection.
5. Record evidence against GATE-02 and GATE-03.

## 12. Reopen triggers

This ADR reopens if a genuine invariant requires an inventory position distinct
from a Unit (for example a resource that is allocatable but is not a sellable
development unit), or if a project-level allocation requirement proves
unrepresentable as policy over Unit commands.

## 13. Non-authorizations

- No new aggregate, table, column, ORM model, migration or RLS policy.
- No new commercial state or availability field.
- No authority for any projection over availability.
- No implementation authorization of any kind.

## 14. What this ADR does not close

- Concrete concurrency mechanism and race-test evidence (G-8, RACE-01…16).
- Brownfield persistence identity (G-7).
- Project-level allocation design (G-10).
- Floor semantics (C03-O07) and Building aggregate ownership (OI-007).
- C03 independent-review evidence.

