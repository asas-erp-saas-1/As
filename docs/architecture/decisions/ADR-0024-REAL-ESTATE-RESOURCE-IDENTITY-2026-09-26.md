# ADR-0024 — Real Estate Resource Identity and Asset Taxonomy

**Status:** ACCEPTED / C03.1–C03.2 SEMANTICALLY CLOSED
**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Decision owner:** Founder, delegated through Engineering Conference
**Scope:** Real-estate resource identity, development inventory, brokerage listing, hierarchy and taxonomy

## 1. Context

ASAS source material contains two complementary models:

1. Development inventory: `Organization → Project → Building → Floor → Unit`.
2. Brokerage: `Owner → Mandate → Listing → Property`.

The earlier BRD also describes two sales tracks and recommends a shared commercial pipeline rather than unrelated systems. V3, however, explicitly defines Unit and Listing as distinct ontology objects and treats Unit as the strategic development inventory resource.

The conference must therefore avoid two opposite errors:

- creating one universal Property table that collapses different business semantics;
- creating completely disconnected systems for development inventory and brokerage.

## 2. Decision

### 2.1 Canonical conceptual category

ASAS uses the conceptual term **Real Estate Resource** for things that can participate in commercial workflows, but **Real Estate Resource is not a mandatory database entity**.

Its authoritative concrete resource types are governed by their business context.

### 2.2 Development resource

For developer/development operations, **Unit is the canonical inventory resource**.

A Unit is a uniquely identifiable commercial/physical resource that belongs to a Project and may optionally be located under a Building and/or Floor.

Canonical development hierarchy:

`Organization → Project → [Building] → [Floor] → Unit`

Square brackets indicate optional structural levels, not optional Unit identity.

This supports:

- apartment units;
- villas;
- offices;
- retail/commercial units;
- parking/storage resources when modeled as independently controlled inventory;
- mixed-use projects;
- projects without conventional buildings.

### 2.3 Brokerage resource

For brokerage/resale operations, **Listing is the canonical commercial representation** under an Owner/Mandate relationship.

Canonical brokerage chain:

`Owner → Mandate → Listing → Property representation`

A Listing is not a duplicate Unit unless the underlying property is actually represented by a Unit under a development context. The listing may reference the underlying real-world property identity where the business model permits, but Listing retains its own lifecycle and authority.

### 2.4 No universal Property aggregate at this stage

ASAS will not create a universal `Property` aggregate merely to force Unit and Listing into one table.

The ontology can provide a common cross-context vocabulary and relationship layer while concrete domain contexts retain their own authoritative models.

This follows DDD: a real-world concept may have different models in different bounded contexts; a single unified model is not required merely because users use the same everyday word. citeturn0search0turn0search3

### 2.5 Stable identity

Every authoritative resource has:

- immutable internal identity;
- tenant/organization ownership context;
- explicit business context/type;
- human-readable reference/code where required;
- lifecycle history;
- audit lineage.

Human codes such as `B3-F02-U102` are identifiers for human operations, not the primary technical identity. Technical identity must remain stable if labels, floor naming or numbering conventions change.

### 2.6 Project is the development aggregate boundary for hierarchy

A Project owns the structural relationship of its development inventory. Building and Floor are structural entities beneath Project when the project needs them. Unit is the commercial inventory aggregate/resource that downstream Sales and Inventory actions reference by stable identity.

No implementation assumption is made about whether Building or Floor must become independent persistence aggregates until brownfield schema reconciliation and aggregate-level invariants are verified.

## 3. Building decision

Building is a first-class domain/ontology/master-data concept, not merely a UI grouping.

However, a Project may be valid without Building records. A Building persistence model is therefore conditional on project topology and must not be made mandatory merely because the common residential example has buildings.

## 4. Floor decision

Floor is a structural classification/entity only where the project topology requires it.

A villa, land parcel or other resource may have no Floor. A conventional apartment building may have Floors. Floor must not be used to encode arbitrary unit ordering when no real floor concept exists.

## 5. Unit taxonomy

Unit type is reference/configuration data, not a separate bounded context.

Initial categories may include:

- Apartment;
- Villa;
- Office;
- Retail/Commercial;
- Parking;
- Storage;
- Land/Parcel where the project model explicitly treats it as saleable inventory.

Exact labels are configurable/localized; the canonical domain distinguishes physical/commercial semantics from presentation labels such as F2/F3/F4.

`F2/F3/F4` is a typology/marketing classification, not a universal inventory entity type.

## 6. Physical identity vs commercial representation

The following distinction is mandatory:

`Physical/Development Resource ≠ Listing ≠ Advertisement ≠ Campaign Creative`

A public website, portal or campaign must never create a second authoritative inventory resource merely by publishing a representation.

## 7. Ownership and authority

Resource identity does not itself determine who may sell, view, allocate or reserve the resource.

Those concerns remain separate:

`Identity ≠ Ownership ≠ Visibility ≠ Allocation ≠ Reservation Control`

This preserves the C02 collaboration decision.

## 8. State separation

Unit retains separate state dimensions:

### Commercial
`AVAILABLE | HELD | RESERVED | CONTRACTED | SOLD | OFF_MARKET`

### Construction
`NOT_STARTED | FOUNDATION | STRUCTURE | MASONRY | MEP | FINISHING | READY | DELIVERED`

These must never be collapsed into one status. fileciteturn60file1L260-L288

## 9. Why this is the chosen model

- It preserves the strong development hierarchy already established in V3.
- It preserves brokerage/resale semantics without inventing fake Project/Unit records.
- It supports a shared commercial pipeline while keeping domain ownership clear.
- It avoids premature universal-property modeling.
- It permits future Property/Asset abstraction if evidence shows a real cross-context invariant rather than merely shared terminology.
- It remains compatible with future multi-country and multi-organization operation.

## 10. Rejected alternatives

### A. One universal Property table as the canonical source for everything
Rejected because it collapses development Unit, brokerage Listing, ownership/mandate and publication semantics into one model and creates false coupling.

### B. Separate unrelated systems for development and brokerage
Rejected because the commercial workflow, customer model, communication and analytics need controlled interoperability.

### C. Building mandatory for every Project
Rejected because not all real-estate topologies require buildings.

### D. Floor mandatory for every Unit
Rejected because many saleable resources do not have meaningful floors.

### E. Human reference number as primary key
Rejected because business numbering can change; stable technical identity must not.

## 11. Verification before implementation

- reconcile current brownfield Project/Building/Floor/Unit/Listing persistence;
- inspect migrations and existing foreign keys;
- verify uniqueness requirements for project-scoped human references;
- map current Unit types and status fields to the taxonomy/state contracts;
- identify any existing universal Property table and classify it rather than deleting/rewriting it blindly;
- test projects with/without Building and Floor;
- test mixed-use projects;
- test Unit/listing separation;
- test reassignment and ownership changes without identity mutation.

## 12. External validation

DDD guidance supports defining bounded contexts and allowing different domain models for the same real-world concepts rather than forcing a single model across the entire system. It also recommends deriving service boundaries from business/domain analysis rather than technology-first decomposition. citeturn0search0turn0search3
