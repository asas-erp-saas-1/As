# ADR-0039 — Unit / Apartment Canonical Identity

**Status:** ACCEPTED — reconciliation decision; implementation gated
**Date:** 2026-10-14
**Branch:** `platform-architecture-2026`
**Decision owner:** Engineering Conference under founder delegation (2026-09-26)
**Conference route:** C03 → GATE-02
**Resolves:** C03 blocker B1; C03 open decision C03-O01

## 1. Problem

The architecture uses two names for the same real-estate development resource:

- `Unit` — the canonical term used by the architecture and product domain
  (`ADR-0024` §2.2, `ADR-0028`).
- `apartment` — the name used throughout the normative machine-readable register
  (`apartment.commercial_status`, `apartment.construction_status`), the event
  register (11 `apartment.*` events), and the permission register (6
  `apartment.*` keys).

C03 artifact 27 (`27-APARTMENT-UNIT-COMMERCIAL-IDENTITY-RECONCILIATION-2026-10-02.md`)
narrowed this to exactly two permitted answers and forbade inventing a third for
implementation convenience:

- **Option A** — identity equivalence: `Unit = Apartment`.
- **Option B** — distinct representations: `Unit ──linked-to── Apartment`, with
  explicit ownership, identity, synchronisation and lifecycle rules.

Artifact 31 restated the same blocker as four candidate readings (canonical
domain name, legacy/application synonym, commercial projection, separate object
linked one-to-one) and required an authoritative decision before any second
identity could be created.

Until this is decided, no safe persistence, publication, search, CRM or
reservation boundary can be defined, because the architecture does not know
whether it is talking about one resource or two.

## 2. Evidence

### 2.1 The register names the aggregate `apartment`

```text
B.1_apartment_commercial_status   aggregate: apartment.commercial_status
B.2_apartment_construction_status aggregate: apartment.construction_status
```

There is **no** `unit.*` state machine, no `unit.*` event and no `unit.*`
permission key anywhere in the registers.

### 2.2 The event register uses `apartment.*` for the resource facts

`apartment.published`, `apartment.held`, `apartment.reserved`,
`apartment.released`, `apartment.contracted`, `apartment.sold`,
`apartment.blocked`, `apartment.unblocked`, `apartment.off_marketed`,
`apartment.back_on_market`, `apartment.price_changed`.

### 2.3 The permission register uses `apartment.*` for the resource authority

`apartment.read`, `apartment.create`, `apartment.update`,
`apartment.hold.create`, `apartment.price.override`,
`apartment.marketing.publish`.

### 2.4 The architecture names the resource `Unit`

`ADR-0024` §2.2: "For developer/development operations, **Unit is the canonical
inventory resource**", in the hierarchy
`Organization → Project → [Building] → [Floor] → Unit`.

`ADR-0028`: "`Unit` is the canonical development-inventory domain entity."

### 2.5 The resource is a single commercial record in the product

Product truth, as recorded in C03 artifact 31 §3, describes a single apartment
record driving the public page, inventory, search and admin surfaces. No
evidence anywhere describes two synchronised resource records.

### 2.6 Brownfield persistence uses `Apartment`

The measured source contract contains an `Apartment` model (59-model source
contract) carrying project/floor-related fields and construction state, with
`ProjectMilestone.building_id` and `LedgerEntry.building_id` as adjacent
references. This is source/persistence naming, and it is evidence of *one*
resource record, not of a second entity.

## 3. Decision

**Option A is adopted: identity equivalence.**

Precisely:

1. **One identity.** There is exactly one canonical development-inventory
   resource identity per real-world sellable development resource.
2. **`Unit` is the canonical domain term.** New architecture, contract, ADR and
   domain artifacts name the resource `Unit`.
3. **`apartment` is the source and persistence namespace for that same resource.**
   Every `apartment.*` register aggregate, event and permission key denotes the
   `Unit` aggregate — not a parallel object, not a projection, not a legacy twin.
4. **The mapping is total and 1:1.** `apartment.commercial_status` is the Unit's
   commercial dimension; `apartment.construction_status` is the Unit's
   construction dimension; `apartment.*` events are Unit facts.
5. **No second identity may be created.** `Apartment` must not be modelled as a
   distinct entity, a commercial projection, a synchronised mirror, or a
   one-to-one linked object.

## 4. Naming governance

1. **Register values are not renamed.** `apartment.*` identifiers remain
   character-for-character as registered, per `ADR-0038` Decision 1 and C03-D03.
2. **New artifacts cite registered names verbatim.** A new contract, ADR or test
   that references a registered event, permission or state machine must use the
   registered name, not a `unit.*` translation.
3. **`Unit` is the canonical prose/domain term.** Architecture documents explain
   the resource as `Unit` and record the equivalence once (here), instead of
   restating it in every artifact.
4. **Product and UI vocabulary is separate from domain identity.** Localised
   presentation terms ("apartment", "appartement", "شقة", "villa", "office")
   describe the resource to users and are a typology/localisation concern, not a
   second identity. `ADR-0024` §5 already separates physical/commercial semantics
   from presentation labels.
5. **A future rename of the `apartment.*` namespace** would require a superseding
   ADR plus a governed register amendment with provenance impact analysis. It is
   explicitly **not** authorized here.

## 5. What identity does NOT mean

Identity equivalence is a statement about the *resource*. It is not a licence to
merge lifecycles, aggregates or authority. The following remain true and
unchanged:

1. **Identity ≠ aggregate absorption.** `ADR-0028` places Hold, Reservation,
   Contract, Payment, Commission, Lead, Listing and Media explicitly *outside*
   Unit ownership. Unit owns stable identity, structural/inventory
   characteristics and its two state dimensions; the other lifecycles remain
   separate aggregates referencing Unit by identity.
2. **`apartment.commercial_status` ≠ `reservation.status`.** They are two
   distinct machines (register B.1 and B.6). `ADR-0034` establishes that the
   reservation record, not the Unit status, is the single-winner authority, and
   `ADR-0038` Decision 7 reaffirms the Unit status as a governed projection.
3. **Structural containment ≠ aggregate containment.** `Project → Building →
   Floor → Unit` is a structural topology. It does not establish one aggregate
   (C03-D02, reaffirmed).
4. **Identity ≠ ownership ≠ visibility ≠ allocation ≠ reservation control**
   (`ADR-0024` §7, `ADR-0028` §Ownership and collaboration).
5. **A Unit is not a Listing.** A Listing is a brokerage or publication
   representation; publishing a Unit must never create a second inventory
   resource (`ADR-0028` §Listing rule).
6. **Publication is a representation.** The Studio/public website is a projection
   of Unit facts, never a competing Unit record (C03 artifact 22).

## 6. Rejected alternatives

**Option B — distinct representations (`Unit ──linked-to── Apartment`).**
Rejected on four grounds: (i) no register evidence exists for a second identity —
there is no `unit.*` state machine, event or permission key; (ii) it would require
inventing a synchronisation contract with no source basis; (iii) it creates two
truths for one physical resource, violating the canonical-data non-negotiable;
(iv) C03 artifact 27 forbids inventing an interpretation for implementation
convenience.

**`Apartment` as a commercial projection over `Unit`.**
Rejected because it inverts authority. The register makes `apartment.*` the
*authoritative* commercial fact, not a derived view of it. A projection may not be
the source of truth for the thing it projects.

**`Apartment` as a separate object linked one-to-one.**
Rejected: it introduces a second identity plus synchronisation for a resource for
which no invariant requires separation.

**`Apartment` as a legacy synonym to be migrated away.**
Rejected as an implementation reading. It implies eventually renaming register
values, which C03-D03 forbids without superseding authority and which would sever
the register's provenance link to the source package. The correct and permanent
reading is "source and persistence namespace".

## 7. Consequences

**Positive.**

- One resource identity across website, Studio, CRM, Sales, Inventory, Finance
  and analytics; no dual-write and no synchronisation surface.
- The public page, inventory views, search and admin surfaces can share one
  authoritative record, as product truth already describes.
- The register's `apartment.*` namespace becomes fully explainable rather than a
  competing vocabulary.
- C03 blockers B1 and the "commercial projection" ambiguity are closed.
- Brownfield reconciliation becomes a 1:1 mapping task instead of an
  entity-merge design.

**Costs and constraints.**

- Documentation must not introduce `unit.*` aliases for registered identifiers;
  reviewers must reject them.
- Any brownfield `Apartment` table is the Unit resource and must be reconciled
  1:1; it must not be duplicated into a new "Unit" table.
- Search, cache and public projections must reference the same identity, so a
  publication record may never mint a new resource.

## 8. Verification required before implementation

1. Read-only introspection of the brownfield `Apartment` representation and its
   relations (project/floor references, construction fields, uniqueness).
2. Confirm no second resource table exists that could be interpreted as a
   parallel identity.
3. Confirm all `apartment.*` permission keys and events resolve to this single
   resource.
4. Confirm the public/Studio projection references the same identity and cannot
   create one.
5. Record evidence against GATE-02 (ontology) and GATE-03 (contracts).

## 9. Reopen triggers

This ADR reopens if brownfield introspection reveals a genuinely separate
resource that the architecture must model independently, if a legal or regulatory
requirement distinguishes the two names, or if a future ADR introduces a
distinct commercial representation with its own invariants.

## 10. Non-authorizations

- No renaming of register enum values, events, permissions or machine names.
- No schema, table, column, ORM, migration or RLS change.
- No creation of a second Unit/Apartment entity, projection or mirror.
- No collapse of commercial status into reservation, contract or finance state.
- No authority granted to the public website or any projection over inventory.

## 11. What this ADR does not close

- Unit ↔ Inventory aggregate/persistence boundary (`ADR-0040`).
- Reservation concurrency mechanism and brownfield persistence (G-7, G-8).
- Floor identity/lifecycle semantics (C03-O07).
- Building aggregate ownership (OI-007).


