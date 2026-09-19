# C2-001 — Architecture Evidence & Reconciliation Package

Status: OPEN / DECISION REQUIRED
Repository: `asas-erp-saas-1/As`
Date: 2026-09-19

## 1. Purpose

Establish an evidence-backed decision package for reconciling the ASAS Enterprise Real Estate OS domain/context model with implementation modules and persistence boundaries.

This package does not choose the final context cardinality. It separates strategic vision from canonical implementation authority and defines the evidence required for the final ADR.

## 2. Source observations

### Strategic enterprise source

The Enterprise Real Estate OS material defines a broad enterprise vision covering competitor reverse engineering, enterprise strategy, domain architecture, operating-system architecture, event-driven architecture, module inventory, real-estate operating model, data architecture, AI operating system, UX, security/governance, scalability, and product roadmap.

It explicitly presents an Enterprise Real Estate OS progression through MVP, V1, V2, V3, V4, Enterprise Edition and Holding OS.

It also contains a `Phase 1.5 — Enterprise Domain Model` statement describing 15 bounded contexts.

### Repository roadmap source

`ASAS_Master_Roadmap` records Phase 1.5 as approved v2 and states that its deliverables are Domain Model v2 with 15 bounded contexts and Context Map v2. It then defines Phase 2.1 as the work that determines how those bounded contexts become modules/services.

### Current repository governance

Current repository governance separately identifies a conflict between a 9-context decomposition and implementation material describing 15 modules/schemas. It explicitly prohibits treating context, module, schema, aggregate, read model, worker or event consumer as interchangeable concepts.

## 3. Reconciliation facts

The following are facts, not conclusions:

1. The enterprise source is broader than the MVP.
2. The enterprise source contains a 15-bounded-context statement.
3. The repository roadmap records 15 bounded contexts as an approved Phase 1.5 deliverable.
4. Other current governance material records a 9-context model.
5. Implementation material describes 15 modules/schemas.
6. Therefore, the repository currently contains a semantic decomposition conflict that must be reconciled before implementation ownership is frozen.

## 4. What the enterprise source contributes

The enterprise source should be used to enrich the target-state vision with:

- real-estate lifecycle coverage;
- enterprise capability breadth;
- multi-company/group evolution;
- multi-country evolution;
- AI operating-system direction;
- security/governance principles;
- scalability concerns;
- executive/operational/financial layers;
- productization direction.

It should not be used alone to prove:

- live database state;
- current Supabase identity;
- current Vercel identity;
- deployed infrastructure;
- actual repository implementation;
- final legal/accounting semantics;
- final bounded-context ownership when repository sources conflict.

## 5. Required final decision model

The final ADR must define, for every canonical bounded context:

- Context ID and name;
- purpose and responsibility;
- explicit non-responsibilities;
- upstream/downstream relationships;
- aggregate ownership;
- module mapping;
- schema ownership;
- commands and write ownership;
- domain/integration events;
- read-model ownership;
- worker/process ownership;
- permission authority;
- tenant boundary;
- transaction boundary;
- external side effects;
- dependency direction;
- migration boundary;
- evidence/provenance.

## 6. Decision options to evaluate

The decision-maker should evaluate at least:

### Option A — retain the repository's current 9-context model

Evaluate whether it faithfully represents the approved Phase 1.5 domain model and whether implementation modules can map cleanly without semantic overload.

### Option B — adopt the approved Phase 1.5 15-context model

Evaluate whether the underlying approved Domain Model v2 and Context Map v2 are recoverable and whether each context has independent business responsibility and ownership rather than being a module-shaped decomposition.

### Option C — revise the context model

Permitted only if the evidence demonstrates that the recorded Phase 1.5 model is obsolete, internally inconsistent, or superseded by a higher-authority approved decision. Any split, merge, rename or removal requires explicit provenance and ADR treatment.

No option is selected by this package.

## 7. Required evidence before ADR closure

1. Locate and inspect the authoritative Domain Model v2.
2. Locate and inspect the authoritative Context Map v2.
3. Identify their provenance and approval status.
4. Extract all context IDs and responsibilities.
5. Map each context to implementation modules without assuming one-to-one cardinality.
6. Map aggregate ownership.
7. Map schema ownership.
8. Identify cross-context writes and reject ambiguous ownership.
9. Identify read models/workers/event consumers that are not business-rule owners.
10. Identify task references affected by any context decision.
11. Identify security/tenant implications.
12. Record unresolved decisions for Founder/Product Architecture approval.

## 8. Hard stops

Do not:

- create executable schema from the unresolved model;
- create migrations to force one decomposition;
- rename contexts silently;
- convert every module into a context;
- convert every worker/read model into a context;
- close C2-001 based on documentation existence alone.

## 9. Exit criteria

C2-001 can become `VERIFIED` only when:

`Authoritative source identified → Context Map approved → responsibilities verified → module mapping verified → aggregate/schema/event/permission ownership verified → conflicts resolved → ADR recorded → canonical map published → references updated → verification passed`

Until then: `BLOCKED` for affected implementation slices.
