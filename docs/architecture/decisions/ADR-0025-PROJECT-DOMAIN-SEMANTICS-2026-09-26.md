# ADR-0025 — Project Domain Semantics

**Status:** ACCEPTED — C03.3 SEMANTIC SLICE CLOSED
**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Decision owner:** Engineering Conference under Founder delegation

## Context

ASAS V3 defines Project as a first-class real-estate object in the ontology and as the root of the development hierarchy. The conference must distinguish Project's domain meaning from its future persistence shape and from downstream commercial resources.

The authoritative V3 model establishes:

`Organization → Project → Building → Floor → Unit`

with Building/Floor topology conditional in the broader conference model. The Project is also the primary commercial collaboration context in C02.

## Decision

### 1. Project is a first-class domain object

Project represents a governed real-estate development/commercial project within an Organization's business context. It is not merely a UI container, listing page, or grouping of Units.

### 2. Project is the primary development collaboration context

Commercial collaboration is scoped primarily through Project context plus Organization Relationship and Resource Scope. Project therefore acts as the principal boundary through which an authorized organization can receive project-level commercial/inventory access.

Project context does not itself grant access. Authorization still evaluates relationship, membership, team/role, assignment, permission, resource scope and invariants.

### 3. Project does not own every downstream fact

Project is the structural/commercial anchor for development inventory, but it does not become the owner of:

- CRM Lead truth;
- Reservation truth;
- Contract truth;
- Payment/Ledger truth;
- Commission entitlement;
- Campaign attribution;
- canonical Scheduling persistence.

Those remain owned by their respective contexts and are linked to Project where the domain contract requires it.

### 4. Project contains development inventory through topology

Canonical development relationship:

`Project → [Building] → [Floor] → Unit`

Building and Floor are optional according to project topology. A valid Project may contain Units without a conventional Building/Floor hierarchy where the real-estate topology requires it.

No universal assumption such as "every Project has Buildings" is permitted.

### 5. Project identity is stable and independent of human references

Project must have an immutable/stable technical identity. Human-facing project code, name, slug, address labels and marketing references are mutable attributes and must not be used as the sole technical identity.

Renaming or rebranding a Project must preserve its historical identity and linked commercial facts.

### 6. Project ownership and control are separate from visibility

The common case is Developer-owned/controlled Project, but the architecture remains compatible with other legitimate inventory actors. Organization type does not automatically determine authority.

A partner's project visibility is an authorization result, not a transfer of Project ownership.

### 7. Project publication is a projection

Public website/project pages are published representations of authoritative Project data. Studio/public publishing does not become a second Project source of truth.

The action `publish_project` is a controlled application action and must not mutate core ownership or inventory authority merely because content is published.

### 8. Project is not an aggregate definition by itself

This ADR closes the domain meaning of Project but does not authorize a database aggregate boundary, schema table shape, ORM model, or transaction boundary. Those require the C03 schema-contract and brownfield reconciliation stages.

## Explicit non-decisions

The conference has NOT yet closed:

- complete Project lifecycle/state machine;
- Project type taxonomy and country-specific classifications;
- exact Project address/geography model;
- inventory-batch persistence and lifecycle;
- Project pricing/versioning model;
- exact Project Inventory Access permission matrix;
- Project-level publication workflow contract;
- Building/Floor persistence;
- Project schema/migration;
- live database mapping.

## Invariants

1. A Unit in the development model must resolve to a Project through the authoritative topology.
2. Public projections cannot become authoritative Project records.
3. Project visibility cannot bypass authorization.
4. Project ownership cannot be inferred solely from organization type.
5. Human-readable Project identifiers cannot be the sole immutable identity.
6. Downstream domains cannot silently acquire ownership of Project data by referencing it.
7. Configuration cannot weaken Project security or core domain invariants.

## Consequences

The next C03 work must treat Project as the stable anchor and move to:

`Project lifecycle → topology/Building/Floor → inventory batch → Unit identity → Listing representation → authority → pricing/versioning → inventory lifecycle → reservation boundary → schema contract`.

Implementation remains blocked until brownfield and runtime identity evidence is reconciled.

## Evidence basis

- `ASAS-ARCHITECTURE-V3.md`, Real Estate Core / Ontology sections;
- `ASAS-ENGINEERING-CONFERENCE-PATH-2026.md`, C02 collaboration and C03 sequence;
- `ASAS-PROJECT-INVENTORY-COLLABORATION-CONTRACT-2026.md`;
- existing Building research/domain contract;
- source-of-truth and research-first governance.
