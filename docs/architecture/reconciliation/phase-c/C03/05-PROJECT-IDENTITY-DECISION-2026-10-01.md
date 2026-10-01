# C03 — Project Identity Decision

**Date:** 2026-10-01
**Status:** PARTIALLY LOCKED — implementation not authorized
**Track:** Phase C / Real Estate Core
**Scope:** Project identity only

## 1. Evidence reviewed

### Current architecture source

Architecture V3 establishes `Project` as master data in the canonical real-estate hierarchy:

`Organization → Project → Building → Floor → Unit`

It does not prescribe a concrete Project identifier format, human reference format, slug policy, or external identifier policy.

### Historical/domain sources

The older Enterprise Domain Model defines Project as a Track A aggregate with name, location, delivery estimate and developer approval reference. It does not establish a canonical Project identifier policy.

Historical implementation material contains a `Project` record with a UUID `id`, a unique `slug`, `developerId`, publication/archive fields and project-facing relationships. This is historical implementation evidence only; it is not current architecture authority and does not authorize reusing that schema.

A separate older website schema also uses UUID `id` and unique `slug`, while apartments reference `projectId`. Again, this is historical evidence, not the canonical V3 contract.

### External industry research

RESO distinguishes a system key from a human-facing identifier for listings: `ListingKey` is the unique source-system record identifier while `ListingId` is a well-known human-facing identifier and may not be unique across merged/multiple-originating systems. RESO's current work also emphasizes durable property identification and has been moving offer-management anchoring toward UPI rather than ListingId.

RESO does not establish an ASAS-specific Project identifier, so this research is an interoperability design reference, not an ASAS domain authority.

## 2. Decisions

### D1 — Separate canonical identity from human/business reference

**LOCKED:** ASAS shall conceptually distinguish:

1. **Canonical system identity** — stable identity of the Project record.
2. **Human/business reference** — a readable identifier used by staff, documents, integrations and search.
3. **Display name** — mutable business name.
4. **Slug** — presentation/routing concern, not identity.
5. **External references** — identifiers assigned by developers, partners, regulators or external systems.

This is a semantic architecture decision, not a schema decision.

### D2 — Canonical identity must be immutable

**LOCKED:** the canonical Project identity must survive name changes, slug changes, publication changes and ordinary master-data amendments.

### D3 — Human reference must not be treated as globally immutable identity

**LOCKED:** a readable Project reference may be operationally stable and governed, but the architecture must not depend on the assumption that a human/business number is globally unique across every external system.

### D4 — Slug is not identity

**LOCKED:** a Project slug is a presentation/routing identifier. It may be regenerated or versioned without changing the canonical Project identity.

### D5 — External references are namespaced

**LOCKED:** an external Project identifier must always carry enough source-system/provider context to avoid treating another organization's identifier as globally unique.

Conceptually:

`ExternalReference = (source_system, identifier, optional namespace/type)`

The exact executable representation remains OPEN.

### D6 — Do not reuse historical `slug` as Project identity

**LOCKED:** historical schemas that made `slug` unique are not sufficient evidence to make slug the canonical Project identity in V3.

## 3. What remains OPEN

- concrete primary-key type
- exact human reference format
- reference uniqueness scope (tenant, organization, global, or another boundary)
- whether Project reference is allocated automatically or configurable
- external-reference cardinality
- external-reference lifecycle
- merge/split semantics
- Project transfer semantics between organizational owners
- legal/regulatory identifiers that belong directly to Project
- archival and retention impact on identifiers
- exact API representation
- exact persistence representation

## 4. Important non-decision

We do **not** currently choose UUID, ULID, integer, UUIDv7, or any other concrete primary-key technology from this document.

The source material does not provide enough evidence to make that persistence-level choice yet, and doing so here would prematurely collapse architecture into implementation.

## 5. Reconciliation outcome

The previous C03 open question "What is the canonical Project identity and reference-number policy?" is now split into two levels:

- **Semantic identity model:** LOCKED.
- **Concrete identifier/reference policy:** OPEN.

This is a genuine closure improvement without pretending that unsupported implementation details are known.

## 6. Closure impact

Project cannot close yet. Identity is no longer an undifferentiated question, but ownership/tenancy, lifecycle, aggregate boundary, invariants, commands/events and cross-domain consequences remain open.

## 7. Evidence classification

- **SOURCE-VERIFIED:** Project is V3 master data; Project is distinct from Unit/Listing/Property.
- **HISTORICAL EVIDENCE:** UUID + slug pattern in older implementation material.
- **EXTERNAL RESEARCH:** RESO distinction between system keys and human-facing identifiers; current work on durable property identification.
- **ARCHITECTURAL INFERENCE / DECISION:** separate canonical identity, human reference, slug and external references.
- **IMPLEMENTATION:** not authorized.

## 8. References

- `ASAS-ARCHITECTURE-V3.md`
- `ASAS_Enterprise_Domain_Model`
- historical Project schema material in the source corpus
- RESO Data Dictionary / identifier and interoperability materials
