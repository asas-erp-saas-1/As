# ADR-0026 — Building Domain Semantics

**Status:** ACCEPTED / C03.4 SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED
**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`

## Decision

`Building` is a first-class structural real-estate entity in the ASAS development/inventory model.

Canonical topology:

`Organization → Project → [Building] → [Floor] → Unit`

Building is optional at Project topology level. Floor is optional.

## Meaning

Building represents a meaningful structural subdivision of a Project that can be identified and used for topology, authorization scope, inventory organization, publication and reporting.

It is not a tenant, organization, collaboration space, listing, reservation, pricing object, commercial actor or legal contract.

## Identity

Building has a stable technical identity independent of mutable human reference, name or slug.

Human references may be unique within a Project but are not the technical identity.

Changing a Building label/reference/slug must not rewrite Unit identity or historical transactions.

## Topology

Valid development topologies include:

`Project → Unit`
`Project → Building → Unit`
`Project → Building → Floor → Unit`

The architecture must not force a Building or Floor where the real project does not have a meaningful representation of one.

## Ownership and authorization

Building follows the Project/inventory ownership model but is not an independent organization principal.

Building-scoped collaboration is possible through the existing:

`Organization Relationship + Project Context + Resource Scope + Permission`

A Building record does not itself grant access.

## Domain boundary

Building owns structural/topological facts. It does not own CRM, commercial attribution, commission, payments, reservations, scheduling, contracts or public publication authority.

## Aggregate boundary

This ADR deliberately does not classify Building as an aggregate root.

DDD aggregate boundaries are consistency boundaries derived from transactional invariants. ASAS's Unit reservation is a critical single-winner boundary, so structural containment must not be interpreted as one giant Project/Building/Unit transaction boundary.

## Construction

Building may scope construction milestones/progress/documents, but construction state remains distinct from Unit commercial state.

## Mixed-use

Building must not assume an apartment-only model. Mixed-use, commercial, office and parking structures remain supported through asset/unit taxonomy.

## Evidence

ASAS V3 explicitly models Project, Building, Floor and Unit as ontology objects and states the development hierarchy. The current Conference Path and Session State establish Building as a first-class structural object with optional topology.

The historical repository path previously referenced as `ASAS-BUILDING-DOMAIN-CONTRACT-2026-09-24.md` could not be retrieved from the current branch content endpoint during this checkpoint and therefore is not treated as verified repository evidence. The new research record documents this reconciliation.

External DDD validation supports treating entity identity and aggregate boundaries separately from database structure and structural hierarchy.

## Consequences

Positive:

- supports real multi-building developments;
- supports projects without conventional buildings;
- preserves stable inventory identity;
- avoids coupling structural topology to reservation/finance transactions;
- supports Building-scoped authorization without making Building a tenant boundary.

Required follow-up:

- reconcile existing persistence;
- define exact Project Inventory permissions;
- decide Floor semantics;
- decide Unit aggregate/identity model;
- register any Building events/state machine only after semantic review.

## Implementation gate

No Building schema, migration, RLS policy or CRUD implementation is authorized by this ADR.
