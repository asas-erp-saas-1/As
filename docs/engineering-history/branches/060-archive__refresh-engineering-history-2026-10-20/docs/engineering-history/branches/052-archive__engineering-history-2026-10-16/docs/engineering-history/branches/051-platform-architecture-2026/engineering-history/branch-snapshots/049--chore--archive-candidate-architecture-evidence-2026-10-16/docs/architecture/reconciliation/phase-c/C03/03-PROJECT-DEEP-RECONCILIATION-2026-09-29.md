# C03 — Project Deep Reconciliation

**Date:** 2026-09-29  
**Status:** OPEN — not closure-ready  
**Track:** Phase C / Real Estate Core  
**Authority:** Architecture V3 + existing C03 source corpus + Enterprise Domain Model  

## 1. Scope

This record reconciles the meaning of `Project` only. It does not design SQL, ORM schema, migrations, APIs, or implementation.

## 2. Source-derived baseline

Architecture V3 defines the real-estate hierarchy as:

`Organization → Project → Building → Floor → Unit`.

It also defines Project as a core ontology object and explicitly models the relationship `Project → contains → Building`. Project is listed as master data. The ontology is a governed representation over authoritative domain records, not a second database.

The Enterprise Domain Model contains an older terminology baseline in which `Agency` is the tenant root and every aggregate carries `AgencyId`. It also identifies `Unit` as its own aggregate and explicitly leaves the Project/Unit aggregate-boundary decision as an open review item. This historical source is evidence, not an automatic override of V3.

## 3. Decisions locked now

### D1 — Project is a canonical Real Estate Core object

**DECISION:** `Project` remains a first-class domain object. It is not synonymous with `Property`, `Listing`, or `Unit`.

**Reason:** V3 explicitly places Project in the canonical real-estate hierarchy and ontology.

### D2 — Project is not inventory

**DECISION:** commercial inventory authority belongs at Unit level, not Project level.

**Reason:** V3 defines Unit as the operationally saleable object and gives Unit the commercial lifecycle. Project groups/organizes the real-estate structure; it does not inherit the Unit commercial state machine.

### D3 — Project and Unit lifecycle must not be conflated

**DECISION:** the Unit commercial and construction state machines do not imply a Project state machine.

**Status:** Project lifecycle remains OPEN.

### D4 — Tenant scoping is a mandatory semantic property

**DECISION:** Project must belong to an explicit tenant/organizational boundary in the eventual executable model.

**Status:** persistence field/name is OPEN. Do not invent `tenant_id`, `agency_id`, or `organization_id` until the identity/tenancy reconciliation is completed.

### D5 — Project is not yet declared an Aggregate Root

**DECISION:** no Aggregate Root designation is locked at this stage.

**Reason:** aggregate status requires consistency-boundary evidence: invariants, commands, transaction boundaries, concurrency requirements, ownership and cross-context rules. Hierarchical position alone is insufficient.

### D6 — Project is master data

**DECISION:** Project belongs to the V3 master-data class.

**Implication:** Project is enterprise-defining, relatively slow-changing data and requires controlled lifecycle/change governance. This does not authorize schema implementation.

## 4. Historical reconciliation

| Historical material | Current treatment | Reason |
|---|---|---|
| V3 Organization → Project → Building → Floor → Unit | CANONICAL | Current architecture authority |
| V3 Project → contains → Building | CANONICAL | Current ontology link |
| V3 Project as master data | CANONICAL | Current data classification |
| Enterprise Domain Model Agency as tenant root | SUPPORTING / LEGACY TERMINOLOGY | Relevant historical tenancy decision; must be reconciled with current Organization/tenant model |
| Enterprise Domain Model Unit as separate aggregate | SUPPORTING OPEN DECISION | Still relevant to consistency-boundary analysis |
| Old 15-module model | SUPERSEDED | V3 explicitly establishes nine canonical bounded contexts |

## 5. Open questions required before Project closure

1. What is the canonical Project identity and reference-number policy?
2. What exact organization/tenant ownership relationship is canonical?
3. Who may create, publish, archive, amend, or transfer a Project?
4. Does Project require an explicit lifecycle? If yes, what are its states and legal/business transition rules?
5. Which Project attributes are immutable after publication?
6. What invariants belong to Project itself?
7. Which invariants belong to Building or Unit instead?
8. Is Project an Aggregate Root, or a master-data entity governed by a different consistency boundary?
9. Can a Project exist before its first Building?
10. Can a Project contain multiple Buildings and mixed unit inventories?
11. How does Project relate to developer/promoter identity?
12. How does Track A (own/developer project) attach to Project?
13. Can brokerage Track B reference Project, or must it use Listing/Property independently?
14. What Project data is consumed by CRM, Sales, Inventory, Finance, Marketing and Analytics?
15. Which Project changes emit domain events?
16. Which actions are allowed directly on Project?
17. What approval rules apply to publication or material changes?
18. What documents are Project-level versus Building/Unit-level?
19. What is the archival/retention rule?
20. What data classification/security policy applies to Project fields?
21. What is the minimum Project representation required by the MVP golden journey?
22. Which Algeria-specific legal/commercial attributes belong at Project level?
23. What is the canonical external reference/numbering strategy?
24. What is the lineage from Project master data to analytics/search?
25. What AI operations may read Project and which, if any, may propose changes?

## 6. Explicit non-decisions

The following are deliberately NOT decided here:

- SQL table structure
- Prisma/Drizzle model
- primary-key type
- tenant foreign-key column name
- RLS policy implementation
- API route design
- event transport
- search index schema
- Project status enum
- Project aggregate-root status

## 7. Closure gate for this record

Project cannot be marked CLOSED until the open questions above are reconciled against the authoritative source corpus, current V3, tenancy/identity architecture, C03 contracts, cross-domain contracts, runtime reality and an independent/red-team review.

## 8. Evidence classification

- **SOURCE-VERIFIED:** V3 hierarchy, ontology object/link model, master-data classification, Unit commercial/construction separation.
- **SUPPORTING-SOURCE:** Enterprise Domain Model terminology and historical aggregate proposals.
- **INFERENCE:** Project should be tenant/organization scoped; this is a semantic requirement, not yet a persisted schema decision.
- **OPEN:** lifecycle, identity policy, aggregate boundary, commands/events, detailed invariants, ownership/approval model.
- **IMPLEMENTATION:** not authorized.

## 9. Current decision

**Project reconciliation remains OPEN.** The next work item is **Project Identity + Ownership + Lifecycle reconciliation**, followed by aggregate/invariant analysis. Building review must not begin until those Project questions are either closed or explicitly shown to be independent.