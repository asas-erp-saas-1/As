# ADR-0021 — Canonical Bounded-Context Reconciliation

- **Status:** PROPOSED — founder acceptance required
- **Date:** 2026-09-19
- **Scope:** C2-001 architecture authority
- **Repository:** `asas-erp-saas-1/As`

## Context

The source corpus contained three materially different architecture claims:

- the July Master Roadmap recorded Phase 1.5 as Approved v2 with 15 bounded contexts;
- the available Enterprise Domain Model / Context Map were Draft and showed 13 contexts;
- the repository `AGENTS.md` stated nine contexts.

A newer source package, inspected on 2026-09-19, contains `MASTER-SPEC.md` v3.3 dated 2026-09-14 and an accepted `blueprint/adr/0002-ddd-nine-bounded-contexts.md` dated 2026-09-02. The Master Spec explicitly describes ASAS as a modular monolith with nine bounded contexts and identifies ADR-0002 as the DDD decision. The accepted source ADR names the nine contexts as Core/Platform, CRM, Sales, Inventory, Finance, Website Studio, Marketing, Analytics, and Documents.

The source package therefore supplies stronger and later architecture evidence than the older repository-only claim, while the 15-context roadmap statement remains historical/conflicting evidence that must be preserved and explicitly reconciled.

## Decision under consideration

Adopt the **nine bounded contexts from accepted source-package ADR-0002** as the canonical bounded-context decomposition for the current implementation foundation, subject to founder acceptance of this reconciliation ADR.

The nine contexts are:

1. Core / Platform
2. CRM
3. Sales
4. Inventory
5. Finance
6. Website Studio
7. Marketing
8. Analytics
9. Documents

Scheduling is not promoted to a tenth bounded context by this ADR. Its ownership must follow the accepted source-package architecture unless a future architectural decision establishes a genuinely separate subdomain.

## Why this is not a module-count decision

The implementation specification's 15 modules/schemas are not treated as 15 bounded contexts. They must be mapped into the nine-context domain model according to ownership and responsibility. A module, PostgreSQL schema, aggregate, worker, projection, or event consumer is not automatically a bounded context.

## Treatment of conflicting evidence

### 15-context Roadmap claim

Retained as historical/approval-claim evidence. It is not deleted. It is superseded for current canonical architecture only if this ADR is accepted and verified.

### 13-context Draft Domain Model

Retained as draft historical evidence. It is not promoted to canonical.

### 15 implementation modules/schemas

Retained as implementation evidence. A later mapping task must reconcile each module to a canonical context and identify read-model/worker/infrastructure cases.

### `AGENTS.md` nine-context statement

Corroborated by the later source package. It becomes canonical only after this ADR is accepted and the active repository references are verified.

## Consequences

If accepted:

- C2-001 can progress from source recovery to canonical architecture reconciliation.
- A canonical Context → Module ownership map becomes the next architecture artifact.
- Task/schema/event/permission mappings must use the nine contexts as the domain ownership frame.
- No existing historical artifact is silently deleted.
- The 15-module specification remains useful but is explicitly classified as implementation decomposition.
- Scheduling remains a subdomain/module concern unless a future ADR proves otherwise.

## Required follow-up before C2-001 closure

1. Founder acceptance of this ADR.
2. Produce canonical context definitions: responsibilities, non-responsibilities, aggregates, events, permissions, tenancy authority.
3. Map the 15 implementation modules to the nine contexts.
4. Classify read models, workers, infrastructure and event consumers separately.
5. Update canonical registers and loading documents where required.
6. Search for active references that still present 13/15 as current architecture and classify each reference before changing it.
7. Verify CI catches stale canonical architecture references where practical.

## Alternatives rejected

### Keep 15 contexts
Rejected for current canonical direction because the recovered latest comprehensive engineering specification and accepted source ADR explicitly use nine, while the repository lacks the separately identifiable approved v2 artifacts that would substantiate the older 15-context claim.

### Keep 13 contexts
Rejected because the available 13-context artifact is explicitly Draft and therefore lacks approval authority.

### Keep the conflict unresolved indefinitely
Rejected as an execution strategy because implementation ownership cannot remain ambiguous forever. The correct resolution is an explicit architecture decision with provenance, not inference.

## Gate state

`PROPOSED / NOT YET CLOSED`

No database, schema, migration, or application implementation is authorized by this ADR until acceptance and downstream reconciliation are verified.
