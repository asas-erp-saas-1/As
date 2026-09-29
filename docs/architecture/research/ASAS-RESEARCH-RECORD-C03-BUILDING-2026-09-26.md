# ASAS Research Record — C03 Building

**Status:** ACCEPTED RESEARCH BASIS FOR C03.4
**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Question:** What is Building in the ASAS real-estate domain, where does it belong, when is it optional, and what must remain outside its boundary?

## 1. Source hierarchy

### ASAS authoritative architecture sources

- `ASAS-ARCHITECTURE-V3.md`
- current Engineering Conference Path
- current Session State
- Project domain decision/contract
- existing Building references in the repository where verified

### External engineering validation

- Microsoft Azure Architecture Center — tactical DDD: entities have stable identity; aggregates define consistency boundaries; aggregates should be transactionally coherent and external references should be identity-based. https://learn.microsoft.com/ar-sa/azure/architecture/microservices/model/tactical-domain-driven-design
- Microsoft Azure Architecture Center — domain analysis: bounded contexts contain their own domain models and boundaries evolve iteratively. https://learn.microsoft.com/en-us/azure/architecture/microservices/model/domain-analysis
- Martin Fowler — DDD Aggregate: aggregate boundaries are consistency boundaries and are not simply database collections. https://martinfowler.com/bliki/DDD_Aggregate.html

## 2. ASAS source facts

V3 explicitly lists `Building` as an ontology object and as master data. It defines the development hierarchy as:

`Organization → Project → Building → Floor → Unit`

and defines links:

`Project → contains → Building`
`Building → contains → Floor`
`Floor → contains → Unit`

V3 also distinguishes the development track from brokerage:

`Development: Organization → Project → ... → Unit`
`Brokerage: Owner → Mandate → Listing → Property`

The current conference/session state separately records Building as a first-class structural domain/ontology object while allowing Project topology without a conventional building and allowing Floor to be optional.

## 3. Research conclusion

Building is a **first-class structural real-estate entity** inside the development/inventory model.

It is not:

- a tenant;
- an organization;
- a collaboration space;
- a listing;
- a reservation;
- a pricing object;
- a commercial actor;
- a construction project itself;
- a replacement for Project;
- a required parent for every Unit.

Building provides structural topology and identity where the development has a meaningful building-level subdivision.

## 4. Optionality

A Project may have:

1. no Building objects when its topology is directly Project → Unit;
2. one Building;
3. multiple Buildings;
4. buildings with Floors;
5. buildings without a meaningful Floor model.

Therefore the canonical model is:

`Project → [Building] → [Floor] → Unit`

where square brackets mean optional topology, not optional identity of Building when a Building record actually exists.

## 5. Identity

Building requires a stable technical identity independent of mutable human labels.

A display name such as `Bloc A`, `Tour 1`, `Bâtiment A`, or `Bloc A - Résidence X` is not the technical identity.

A building reference/code may be unique within a Project but is a business identifier, not the immutable technical primary key.

Renaming or re-coding a Building must not rewrite Unit identity or historical transactions.

## 6. Ownership

Building follows the Project's authoritative ownership/control model in the development track but does not itself become an independent organization principal.

Commercial collaboration may be scoped to Building through Organization Relationship + Project Context + Resource Scope, but Building scope does not itself create a relationship or permission.

## 7. Boundary

Building owns structural/topological facts such as:

- identity;
- Project membership;
- human reference/name;
- optional descriptive metadata;
- topology metadata where required;
- relationship to Floors and Units.

Building does not own:

- Lead ownership;
- campaign attribution;
- reservation authority;
- payment facts;
- commission entitlement;
- partner relationship;
- public publication authority;
- legal contract facts.

Those remain owned by their respective contexts/capabilities.

## 8. Aggregate question

The existence of a Building entity does **not** by itself prove that Building is an aggregate root.

Current decision:

`Building = entity/domain object; aggregate-root status remains implementation/domain-transaction gated.`

The reason is consistency-boundary analysis: DDD recommends aggregates be defined by transactional invariants rather than by hierarchy alone. Building, Floor and Unit may be structurally nested while still requiring separate aggregate boundaries because Unit reservation is a critical single-winner consistency boundary.

Therefore we explicitly reject:

`Project aggregate containing every Building + Floor + Unit + Reservation`

as a default implementation model.

## 9. Construction relationship

Building may carry structural construction information and may be the scope of construction milestones, but Construction tracking does not redefine Building ownership.

Construction state must remain separate from Unit commercial state.

The current V3 construction-lite direction is milestone/progress/document oriented and explicitly does not authorize a full Construction OS yet.

## 10. Mixed-use and non-standard topology

Building must support mixed-use projects without forcing every level/space into an apartment-only model.

Examples include:

- residential + retail;
- residential + office;
- parking structures;
- podium + towers;
- villa/land projects with no Building records.

The correct extension point is asset/unit taxonomy and topology, not hard-coding `Building = apartment block`.

## 11. Repository evidence limitation

The current GitHub branch did not expose the previously referenced path:

`docs/architecture/contracts/ASAS-BUILDING-DOMAIN-CONTRACT-2026-09-24.md`

through the repository content endpoint. Therefore that historical contract is **not treated as verified repository evidence** in this checkpoint.

The current decision is grounded instead in verified V3/source material and the current Session State. A later repository reconciliation may recover the historical artifact; if it materially contradicts this decision, the reopening protocol applies.

## 12. Implementation gate

No Building schema, migration, aggregate implementation, RLS policy, event registration, or UI CRUD is authorized by this research record.

Required next evidence:

- repository schema/model search;
- migration history search;
- live database identity verification;
- existing Building/`building_id` persistence evidence;
- permission mapping;
- event/state registration;
- adversarial topology tests.

## 13. Decision

C03.4 semantic decision is sufficiently supported to close the **domain meaning** of Building, while keeping persistence and aggregate-root decisions gated.
