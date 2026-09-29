# ASAS C03 Real Estate Domain Research — 2026-09-25

**Status:** ACTIVE RESEARCH — not implementation authority

## 1. Research conclusion

The current ASAS conference must model real-estate resources independently from organization type. The repository's canonical project identity describes ASAS as covering projects, buildings, inventory and units, while the core lifecycle map places Project/Building/Unit Inventory in the Real Estate domain and connects it to Website, CRM, Sales and Finance. These sources establish the domain boundary but do not by themselves settle the final target schema.

## 2. Key architectural risks

### Developer-centric ownership

A schema that hard-codes Developer as universal owner/controller would conflict with the newly approved multi-actor operating model.

### Status-field overload

A single Unit.status may incorrectly combine availability, reservation, legal/contract state, construction state, and publication state.

### Listing duplication

Creating a new Unit per channel/agency would create competing sources of truth.

### Price mutation

Overwriting the current price can destroy historical commercial evidence.

### Hierarchy rigidity

Assuming every property is `Project → Building → Floor → Apartment` would fail for villas, land, retail, parking, storage, mixed-use and projects without a building hierarchy.

## 3. Research hypotheses to validate

- Resource identity should be stable independently of listing/channel.
- Inventory state should be governed by explicit transitions.
- Commercial availability should be separable from publication visibility.
- Pricing should support effective dating/versioning.
- Authority should be contextual and relationship-aware.
- Listing/channel representations should point to canonical resources.
- Property/resource taxonomy should support extensibility without uncontrolled EAV.

## 4. ASAS source evidence

`PROJECT-CANONICAL-IDENTITY.md` defines the repository as covering projects, buildings, inventory and units, plus developer/promoter workspaces and property stock management.

`CORE-LIFECYCLE-CANONICAL-MAP.md` places Project/Building/Unit Inventory in the Real Estate / Inventory domain and connects Options/Reservations to Sales, Inventory, CRM, Finance and Documents.

These sources support the domain scope. They do not prove the current production schema is correct or complete.

## 5. Next research tasks

1. Inspect current repository domain/schema artifacts for existing Project/Building/Unit/Inventory assumptions.
2. Compare alternative real-estate domain models and inventory state approaches.
3. Enumerate property asset classes required by the platform vision.
4. Define identity and hierarchy edge cases.
5. Define price and availability temporal semantics.
6. Produce founder decision gates only for unresolved business semantics.
7. Derive schema contract only after the domain contract is accepted.
