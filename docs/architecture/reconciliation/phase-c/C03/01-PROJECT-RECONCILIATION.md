# C03 — Project Semantic Reconciliation

**Track:** C03 — Real Estate  
**Status:** OPEN — deep closure in progress  
**Stage:** Project  
**Scope:** semantic/domain reconciliation only; no schema or implementation authorization  
**Date:** 2026-09-29

## 1. Authority and evidence classes

This record reconciles existing ASAS architecture material; it does not replace it.

- **Architecture target:** `docs/architecture/ASAS-ARCHITECTURE-V3.md`
- **C03 resource authority:** `docs/architecture/contracts/ASAS-C03-REAL-ESTATE-RESOURCE-MODEL-CONTRACT-2026.md`
- **C03 deep-closure record:** `docs/architecture/reconciliation/C03-DEEP-CLOSURE-REVIEW-2026-09-29.md`
- **Runtime reality:** current Supabase inspection recorded in `CURRENT-SESSION-STATE.md`
- **Repository reality:** current branch tree and existing C03 artifacts
- **External research:** supporting evidence only; it cannot override ASAS canonical decisions

Evidence labels used here: `SOURCE-CANONICAL`, `REPOSITORY-VERIFIED`, `RUNTIME-VERIFIED`, `EXTERNAL-RESEARCH`, `INFERENCE`, `OPEN`.

## 2. Current canonical meaning

V3 defines the Real Estate Core hierarchy as:

`Organization → Project → Building → Floor → Unit`

For brokerage, V3 separately defines:

`Owner → Mandate → Listing → Property`

Both feed the commercial model. V3 also makes `Project`, `Building`, `Floor`, `Unit` ontology objects and treats the ontology as a governed representation over authoritative domain records, not a second database.

**Decision:** retain `Project` as a first-class Real Estate Core object. Do not collapse Project into Listing, Unit, Building, or a generic Property record.

**Evidence:** `SOURCE-CANONICAL` from Architecture V3.

## 3. Project is not an inventory item

A Project is the real-estate development/container concept under which structural and commercial inventory can be organized. A Unit is the saleable/managed inventory resource. A Listing is a commercial representation and must not be treated as the same object as a Unit.

**Decision:** Project owns/contains the real-estate structure; Unit remains the inventory resource; Listing remains a separate commercial representation.

This preserves the V3 distinction and prevents downstream CRM/Sales/Inventory concerns from redefining the Core ontology.

## 4. Project ownership and tenant boundary

V3 establishes the enterprise hierarchy:

`Platform → Organization → Company → Branch → Team → User`

and requires tenant boundaries across database, cache, search, storage, events, jobs, analytics, AI memory, logs and integrations.

**Decision:** Project must be tenant-scoped through the canonical organization/tenant ownership model. A Project must never become a cross-tenant shared mutable object merely because later search, analytics, AI or integrations can reference it.

**Important:** the exact persistence key/cardinality for tenant ownership is still a contract/schema reconciliation question. This record does **not** authorize a column or table design.

**Evidence:** `SOURCE-CANONICAL` V3; persistence shape remains `OPEN`.

## 5. Lifecycle separation

V3 explicitly separates Unit commercial state from construction state. Therefore Project must not become a proxy for Unit availability or construction status.

**Decision:** Project-level lifecycle concepts, if required, must be explicitly defined rather than inferred from Unit status. Unit commercial and construction state machines remain independent.

**OPEN question:** whether Project itself requires a canonical lifecycle state machine in C03, and if so which states, transitions, commands, approvals and events are authoritative.

## 6. Aggregate / transaction boundary

External DDD research supports treating an aggregate as a consistency boundary whose root protects its invariants; transactions should not cross aggregate boundaries casually. This is a design principle, not an ASAS authority.

**Decision for C03:** do not declare `Project` an aggregate root solely because it is a top-level hierarchy node. Aggregate ownership must be established from actual invariants and transaction requirements. In particular, Unit reservation concurrency belongs to the reservation consistency boundary and must not be inferred as a Project-wide transaction.

**Evidence:** `EXTERNAL-RESEARCH` + ASAS V3 reservation protocol. Further ASAS-specific aggregate decision remains `OPEN`.

## 7. External real-estate interoperability

RESO Data Dictionary 2.0 is the current ratified RESO certification version; RESO defines standardized resources, fields and lookups for interoperable real-estate data. RESO also supports local/custom extensions when standard fields do not cover local requirements.

**Decision:** ASAS may use RESO terminology as an interoperability mapping/reference layer where useful, especially for Listing/Property/Media concepts, but RESO must not redefine ASAS's Project/Unit development-domain semantics. ASAS is a real-estate operating system, not an MLS clone.

**Evidence:** `EXTERNAL-RESEARCH`. Mapping is deferred to the appropriate interoperability/Listing work and is not a Project schema decision.

## 8. Current persistence reality

The connected Supabase project currently has no ASAS application tables/views in `public`. The repository contains substantial C03 architecture/contracts/research but no verified executable ASAS application persistence path in the current branch.

**Decision:** Project persistence remains an architectural question. No Prisma model, SQL table, migration, index, RLS policy or repository implementation is authorized by this record.

**Evidence:** `RUNTIME-VERIFIED` + `REPOSITORY-VERIFIED`.

## 9. Required Project closure questions

C03 Project cannot close until each is answered with evidence:

1. What exactly makes two Project records different?
2. What is the canonical identity rule for Project?
3. Who owns/creates/edits/archives a Project?
4. What is the tenant/organization ownership rule?
5. Is Project an aggregate root, entity inside another aggregate, or a reference/master-data object? Why?
6. Does Project have a lifecycle state machine? If yes, what are its states and transitions?
7. Which Project properties are immutable after creation?
8. Which changes require approval and audit?
9. Can a Project contain multiple Companies/Branches/Teams or only one owner hierarchy?
10. Can a Project be transferred between organizations/owners? What is the audit and downstream effect?
11. Can a Project exist before Buildings/Units exist?
12. Can a Project contain multiple Buildings with independent construction states?
13. What is the relationship between Project and Developer/Promoter?
14. What is the relationship between Project and Mandate/Listing in brokerage scenarios?
15. What Project data is exposed to CRM, Sales, Inventory, Marketing, Studio and Analytics?
16. Which Project actions are commands versus direct data changes?
17. Which Project events are canonical and what are their producers/consumers?
18. What documents are attached to Project and which are legal/source-of-truth documents?
19. Which Project fields are master data, reference data, transactional data or derived data?
20. What is the archival/retention rule?
21. What is the deletion prohibition/reversal rule?
22. What are the Algeria-specific legal/business fields that are genuinely required versus optional country-pack data?
23. Which analytics metrics derive from Project and what is their lineage?
24. What AI operations may read Project, and which Project mutations must remain deterministic/authorized domain actions?
25. What external interoperability mapping is required, and where does ASAS intentionally diverge from RESO/MLS concepts?

## 10. Closure criteria for Project

Project may move from `OPEN` only when:

- canonical semantics are reconciled with all existing C03 artifacts;
- identity, ownership and tenant semantics are explicit;
- lifecycle/state behavior is either defined or explicitly declared unnecessary;
- aggregate/transaction boundary is justified;
- commands/events/invariants are registered or explicitly deferred with ownership;
- cross-domain dependencies are mapped to C04/C05/C06 without importing their ownership into C03;
- persistence implications are documented without prematurely designing schema;
- external research dependencies are current and traceable;
- an independent red-team review finds no unresolved material contradiction;
- evidence is locked in the C03 closure record.

## 11. Current decision

**Project semantic reconciliation: OPEN.**

The current architecture is sufficient to retain `Project` as a first-class C03 concept, but the evidence is not sufficient to close all Project semantics. The next work item is **Project identity + ownership + lifecycle reconciliation**, followed by Building only after Project closure criteria are satisfied.

No implementation authorization is created by this document.
