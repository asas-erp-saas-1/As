# ADR-0041 — Building Consistency Boundary and Aggregate Classification

> **CANONICALIZATION NOTICE (2026-10-16):** This is preserved from source branch `cline/hp1c6fdq` as candidate evidence for review. Any source-branch `ACCEPTED` labels, claimed delegation, and “finding closed” statements are not independent proof of canonical approval. This archive does not ratify the decision, close a gate/C-track, authorize implementation, or permit schema/migration/RLS/production changes.


**Status:** PROPOSED CANDIDATE — not ratified on the canonical branch; implementation gated
**Date:** 2026-10-14
**Source branch:** `cline/hp1c6fdq` — source-branch assertion, not canonical acceptance
**Decision owner:** Engineering Conference under founder delegation (2026-09-26)
**Conference route:** C03 → GATE-02 / GATE-03
**Resolves:** aggregate register OI-007; Building contract BLD-02; ADR-0026 follow-up "decide Building aggregate ownership"

## 1. Problem

`ADR-0026` (ACCEPTED) establishes Building as a first-class structural entity
with independent identity, and states that it "deliberately does not classify
Building as an aggregate root", refusing to let structural containment imply one
giant transaction boundary.

The Building Domain Contract records aggregate status as `OPEN / UNVERIFIED` and
lists BLD-02 (aggregate/entity/reference classification) as open. The aggregate
register OI-007 requires ownership and invariants to be closed before
implementation.

The real question is not "is Building a table". It is: **what must hold atomically
about a Building?**

## 2. Evidence

1. **ADR-0026** — Building is first-class; optional at Project topology level;
   stable identity independent of mutable human reference; owns
   structural/topological facts; explicitly does **not** own CRM, commercial
   attribution, commission, payments, reservations, scheduling, contracts or
   publication authority; follows the Project/inventory ownership model but is not
   an organization principal; may scope construction milestones; construction
   state remains distinct from Unit commercial state; must not assume an
   apartment-only model.
2. **ADR-0028 / ADR-0039 / ADR-0040** — Unit is the canonical development-inventory
   resource and its own aggregate root; structural containment is not aggregate
   containment (C03-D02).
3. **ADR-0038 Decision 3** — construction advances on `milestone.certified`;
   register B.2 drives the chain "per building".
4. **The registers** — there is **no** Building state machine, no `building.*`
   event and no `building.*` permission. The Inventory emission lane carries
   `apartment.*`, `milestone.certified`, `change_order.approved` and
   `project.published` / `project.unpublished`.
5. **C03 artifact 18** — Building has independent identity; Building lifecycle is
   not inferred from construction milestones.
6. **Product truth / master execution path** — the hierarchy is
   `Promoter/Organization → Project → Building → Unit`.

## 3. Decision 1 — Building-local consistency boundary

Building is classified as an aggregate root **scoped to its own structural
record**, and explicitly **not** as an aggregate root over the Units it contains.

What must hold atomically about a Building:

- its stable technical identity;
- its Project membership;
- its human reference/name and structural attributes;
- its own archive/lifecycle flags.

What must **not** be required to hold atomically with it:

- Unit identity, Unit commercial state, Unit construction projection;
- reservations, holds, contracts, payments;
- publication state.

**Consequence:** no command may require atomic mutation of a Building *and all of
its Units*. Structural operations that span units — archiving a building, moving
units between buildings, renaming — are application-level governed policies that
execute per-Unit transitions through each Unit's own aggregate, not one
aggregate transaction.

**Rationale.** The only invariants that genuinely require atomicity are
Building-local. A "one Building = one transaction" model would create precisely
the giant transaction boundary `ADR-0026` refuses, and would serialize every unit
operation within a building — directly conflicting with the per-Unit single-winner
reservation boundary (`ADR-0034`), which requires independent per-unit
concurrency.

**Relationship to ADR-0026.** `ADR-0026` deliberately deferred this
classification rather than contradicting it. This ADR completes the deferral and
does not supersede any part of `ADR-0026`; its prohibitions and topology rules
remain in force.

## 4. Decision 2 — Containment is a reference, not ownership

`Project → Building → Floor → Unit` is **structural topology**. A Unit references
its Building and Floor; a Building does not own Unit lifecycle.

Therefore:

1. Archiving or detaching a Building must never release, cancel, re-price or
   re-win a Unit commitment (C03-D07 reaffirmed).
2. A Building-scoped structural change must not imply inventory release,
   reservation cancellation, contract termination or financial reversal.
3. Deleting or archiving a Building while Units still reference it is a governed
   structural operation, not a cascade — no destructive cascade is authorized.

## 5. Decision 3 — Construction scope and the projection direction

Register B.2 drives the construction chain "per building" through
`milestone.certified`. Therefore:

1. Milestone certification is **Building-scoped** for projects that have
   buildings.
2. Unit construction state is the **projection** of its building's certified
   progress (`ADR-0038` Decision 3).
3. Building does **not** gain a construction state machine of its own. The
   register defines only `apartment.construction_status`; Building-level progress
   is expressed through milestone certification facts, not a second lifecycle.
4. Construction progress never performs a commercial transition (`ADR-0033`
   invariant 5).

**Partial resolution of G-9.** The driver scope is the building. What remains open
is the **project-without-buildings** case, where milestone certification must be
project-scoped or unit-scoped. Recorded as **G-19**.

## 6. Decision 4 — No Building state machine, event or permission is created

The register contains no Building machine, event or permission, and this ADR
creates none. Consequently:

1. Building record lifecycle operations (create, rename, archive) must either be
   expressed through existing governed mechanisms, or first obtain a permission
   key and event through the register-delta process
   (`docs/architecture/reconciliation/ASAS-REGISTER-DELTA-2026-10-14.md`).
2. Publication of a project/building is expressed through `project.published` /
   `project.unpublished`, not through an invented Building event.
3. Construction is expressed through `milestone.certified` and, for regressions,
   `change_order.approved`.
4. No existing milestone event may be renamed or reassigned to make Building
   appear complete (Building contract §9, reaffirmed).

## 7. Decision 5 — Identity, reference and rename

1. Building has stable technical identity independent of its human reference.
2. The human reference may be unique within a Project, but it is not the technical
   identity (`ADR-0026`).
3. Renaming a Building, or changing its reference/slug, must not rewrite Unit
   identity or historical transactions.
4. Building is not an organization principal, tenant or security boundary;
   Building-scoped access derives from the resource authorization model and is
   never implied by the existence of a Building record.

## 8. Building contract item status after this ADR

| ID | Item | Status |
|---|---|---|
| BLD-02 | Aggregate/entity/reference classification | **CLOSED** — entity with a Building-local consistency boundary; not an aggregate root over its Units |
| BLD-03 | Project → Building cardinality | OPEN — product/domain decision |
| BLD-04 | Building → Floor → Unit semantics | PARTIAL — topology fixed (`ADR-0026`, `ADR-0027`); exact cardinality OPEN |
| BLD-05 | Natural identity/uniqueness | PARTIAL — reference unique within Project; exact key deferred to schema reconciliation |
| BLD-06 | Rename semantics | PARTIAL — identity is independent of reference (§7); product rules for reference reuse OPEN |
| BLD-07 | Unit move semantics | OPEN — product/domain decision; must not break Unit identity (`ADR-0028`) |
| BLD-08 | Archive semantics | PARTIAL — no destructive cascade (§4); eligibility policy OPEN |
| BLD-09 | Tenant ownership | SUPPORTED — follows the Project/inventory ownership model; not a tenant boundary (`ADR-0026`) |
| BLD-10 | Current repository representation | BLOCKED on G-7 (brownfield evidence) |
| BLD-11 | Live DB representation | BLOCKED on GATE-00 runtime identity |
| BLD-12 | Permission mapping | OPEN — register-delta |
| BLD-13 | Event implications | OPEN — register-delta; no Building event exists |
| BLD-14 | Test strategy | OPEN — depends on BLD-03/04/07 |

## 9. Rejected alternatives

**A. Building as an aggregate root over its Units.**
Rejected: creates the giant transaction boundary `ADR-0026` refuses; serializes all
unit operations within a building; conflicts with the per-Unit single-winner
reservation boundary required by `ADR-0034`.

**B. Building as a pure reference with no consistency boundary at all.**
Rejected: Building identity, rename and archive require their own atomic
guarantees; a boundary-less entity would permit partially-applied structural
changes.

**C. Give Building its own state machine.**
Rejected: no register basis; would create a second construction lifecycle and
duplicate `milestone.certified`.

**D. Merge Building into the Project aggregate.**
Rejected: Building has independent identity (`ADR-0026`), and Project-level
aggregation would serialize across all buildings and units in a project.

**E. Treat Building archive as a cascade over its Units.**
Rejected: violates C03-D07 and `ADR-0033`; structural containment is not
inventory authority.

## 10. Consequences

**Positive.**

- The last structural aggregate question on the critical path is closed without
  creating a giant transaction boundary.
- Per-unit concurrency is preserved; reservation races are unaffected by building
  size.
- The construction projection direction is explicit, so construction cannot
  become a second commercial lifecycle.
- Building remains free of invented state machines, events and permissions.

**Costs and constraints.**

- Cross-unit structural operations must be designed as governed policies, not
  single transactions — more application-level orchestration, and partial
  completion must be observable and resumable.
- Building-scoped reporting must aggregate from Unit facts rather than assume a
  Building-level state.

## 11. Verification required before implementation

1. Read-only confirmation of the brownfield Building representation and its
   relation to units and floors (G-7).
2. Confirmation that no existing code path treats a Building operation as a
   transaction over its units.
3. Confirmation that milestone certification is attributable to a building where
   buildings exist.
4. Register-delta decisions for any Building record lifecycle command.
5. Evidence recorded against GATE-02 and GATE-03.

## 12. Reopen triggers

This ADR reopens if a genuine Building-local invariant requires atomic coupling
with Unit state, if brownfield persistence shows Building and Unit are the same
record, or if a project-level requirement (phased or multi-building release)
proves unrepresentable as policy over per-Unit transitions.

## 13. Non-authorizations

- No Building table, model, migration, index, constraint or RLS policy.
- No Building state machine, event or permission.
- No destructive cascade from Building operations.
- No implementation authorization of any kind.

## 14. What this ADR does not close

- BLD-03/04/07 (cardinality, floor semantics, unit move) — product/domain.
- BLD-10/11 — brownfield and runtime evidence.
- G-19 (milestone scope for projects without buildings).
- Floor structural command semantics (C03-O07).
