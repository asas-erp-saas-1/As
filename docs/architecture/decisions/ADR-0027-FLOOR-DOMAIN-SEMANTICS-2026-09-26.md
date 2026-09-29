# ADR-0027 — Floor Domain Semantics

**Status:** ACCEPTED / C03.5 SEMANTICALLY CLOSED / IMPLEMENTATION BLOCKED
**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`

## Decision

`Floor` is a structural level object in the ASAS development model when a project requires independent floor-level semantics.

It is optional at topology level.

Valid development topologies remain:

`Project → Unit`
`Project → Building → Unit`
`Project → Building → Floor → Unit`

## Meaning

Floor represents a meaningful structural level within a Building.

It may carry level-specific identity/metadata and may be used for topology, authorization scope, publication and reporting.

## Important distinction

A Unit having a floor/level value does **not** automatically require a standalone Floor entity.

The platform may represent simple level information as an approved Unit-level value where there is no independent Floor business concept.

A standalone Floor object is justified when the level has its own identity, metadata, authorization scope, topology or other business semantics.

## Identity

When a Floor object exists, its technical identity is stable and independent of its display number/label.

Changing `1er étage` to another business representation must not rewrite Unit technical identity or historical transactions.

## Ownership and authorization

Floor belongs structurally to a Building. It is not an Organization, tenant, commercial actor, reservation authority or financial principal.

Floor-scoped access is derived from the existing resource authorization model and is never implied merely by a Floor record.

## Aggregate status

Floor is not automatically an aggregate root. Physical hierarchy does not determine transactional consistency boundaries.

Unit reservation remains governed by the Unit single-winner consistency boundary.

## Consequences

- supports residential and mixed-use projects with meaningful level structures;
- avoids forcing a Floor table for projects where a scalar level is sufficient;
- preserves stable Unit identity when human floor labels change;
- prevents structural topology from becoming a commercial or financial boundary.

## Evidence

V3 explicitly models Floor as an ontology object and places it between Building and Unit in the development hierarchy. Current ASAS conference state already establishes Floor as optional. Existing product/UI material demonstrates floor as a commercially useful Unit attribute but does not establish a mandatory persistence entity.

## Implementation gate

No Floor schema, migration, RLS policy, event or CRUD implementation is authorized by this ADR. Brownfield persistence reconciliation is required first.
