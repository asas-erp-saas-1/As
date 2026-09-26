# ASAS Research Record — C03 Floor

**Status:** ACCEPTED RESEARCH BASIS FOR C03.5
**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`

## Question

What is `Floor` in the ASAS development model, when is it required, and when should a Unit be allowed to exist without a Floor object?

## Verified ASAS facts

V3 lists Floor as an ontology object and defines:

`Project → Building → Floor → Unit`

The current conference state explicitly treats Floor as optional. Existing product material also uses floor as an apartment attribute for public presentation, but that presentation does not by itself prove a required Floor persistence entity.

## Decision basis

Floor is a **structural level object** within a Building when floor-level identity/semantics are meaningful to the project.

Floor is not a mandatory layer for every Unit.

Valid topologies include:

`Project → Unit`
`Project → Building → Unit`
`Project → Building → Floor → Unit`

A public label such as `1er étage`, `R+1`, `Level 1`, `GF`, `SS1`, or `1` is a representation of level semantics, not automatically a technical identity.

## Entity vs scalar distinction

The platform must not force a Floor entity merely because a Unit has a floor number.

Use a Floor object when the level has independent identity/metadata/authorization/topology semantics.

If a project only needs a simple level value and there is no independent Floor business object, the Unit may carry an approved level representation without inventing a standalone Floor aggregate/entity.

This preserves the V3 ontology while avoiding unnecessary persistence fragmentation.

## Boundary

Floor owns structural level facts and its relationship to Building/Units. It does not own:

- reservation control;
- commercial attribution;
- payment/ledger facts;
- CRM ownership;
- organization relationships;
- public publication authority.

## Identity

Where a Floor object exists, it must have stable technical identity independent of display number/label. Floor numbering may change by project convention without rewriting Unit technical identity or historical transactions.

## Aggregate status

Floor is not declared an aggregate root. Structural containment does not determine transactional consistency boundaries.

## External validation

Microsoft's DDD guidance distinguishes entities by stable identity and aggregates by transactional consistency boundaries; this supports not deriving aggregate boundaries from physical hierarchy alone. https://learn.microsoft.com/ar-sa/azure/architecture/microservices/model/tactical-domain-driven-design

## Implementation gate

No Floor schema or migration is authorized. Repository/schema/runtime evidence must first establish whether the current implementation already represents floor as a scalar, entity, or mixed legacy form.
