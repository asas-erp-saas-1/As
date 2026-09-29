# ASAS Project Domain Contract — 2026

**Status:** PROPOSED / C03.3 SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED
**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Owner:** Real Estate Domain / Core collaboration boundary

## 1. Purpose

Define the semantic contract for Project before schema or implementation work.

## 2. Canonical meaning

A **Project** is a governed real-estate development/commercial project within an Organization business context. It is a first-class domain/ontology object and the primary commercial collaboration context for development inventory.

Project is not merely:

- a UI page;
- a website collection;
- a listing;
- a Unit grouping;
- a CRM campaign.

## 3. Identity

Project requires stable technical identity independent of mutable human-facing fields.

Mutable examples:

- project name;
- code/reference;
- slug;
- marketing title;
- address labels;
- publication metadata.

Historical relationships must survive those changes.

## 4. Ownership and collaboration

The common case is:

`Organization → Project`

with Developer ownership/control for development inventory.

Other legitimate inventory actors remain supported by the architecture.

Partner access is expressed through:

`Organization Relationship + Project Context + Resource Scope + Permission`

Visibility is not ownership transfer.

## 5. Development topology

Canonical model:

`Project → [Building] → [Floor] → Unit`

Building and Floor are conditional topology components. A project may contain Units without requiring both levels.

## 6. Relationships

Project may be referenced by:

- Building;
- Unit;
- Listing/market representation where applicable;
- Lead interest;
- Offer;
- Hold/Reservation through Unit;
- Contract through commercial transaction;
- Campaign/attribution;
- Project documents;
- Project media;
- Project publication projection.

Reference does not transfer ownership between contexts.

## 7. Project-owned vs linked facts

Project owns/controls its own project-domain facts.

It does not own the authoritative persistence of:

- Lead/Customer;
- Reservation;
- Contract;
- Payment/Ledger;
- Commission entitlement/payout;
- Scheduling;
- campaign attribution facts.

Those domains own their facts and reference Project where contractually required.

## 8. Publication

Public website/project pages are projections of authoritative Project records.

Publishing a Project does not create a second Project source of truth and does not change ownership or inventory authorization.

## 9. Required invariants

- Project identity is stable.
- A development Unit resolves to a Project through authoritative topology.
- Project access is authorized; Project context alone is not permission.
- Organization type does not automatically establish Project authority.
- Public projections cannot mutate authoritative Project facts without an authorized domain command.
- Configuration cannot weaken Project security or domain invariants.
- Historical commercial facts remain linked to the stable Project identity after mutable labels change.

## 10. Deferred semantics

Not closed by this contract:

- complete Project lifecycle;
- Project status/state machine;
- Project type taxonomy;
- geography/address model;
- inventory batch model;
- pricing/versioning;
- exact Project Inventory Access permissions;
- Building/Floor persistence;
- schema/migration;
- live runtime mapping.

## 11. Required verification

Before implementation:

1. reconcile Project representation in repository schema/migrations;
2. locate all existing Project references and foreign keys;
3. identify authoritative runtime database after Reality Lock;
4. reconcile existing Project status/type/reference fields;
5. map Project permissions against the canonical permission register;
6. map Project events against the event register;
7. define schema contract;
8. write authorization and historical-identity tests.

## 12. Traceability

Architecture decision: `ADR-0025-PROJECT-DOMAIN-SEMANTICS-2026-09-26.md`

Conference: `C03.3 Project`

Next: `C03.4 Building`
