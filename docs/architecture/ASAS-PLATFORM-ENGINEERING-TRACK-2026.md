# ASAS — PLATFORM ENGINEERING TRACK 2026

**Artifact ID:** ASAS-PLATFORM-ENGINEERING-TRACK-2026-001  
**Status:** ACTIVE / CANONICAL EXECUTION CONTROL  
**Version:** 1.0.0  
**Date:** 2026-09-26  
**Repository:** `asas-erp-saas-1/As`  
**Branch:** `platform-architecture-2026`  
**Owner:** Lead Architecture / Engineering Control Plane

## 1. Purpose

This track converts the Engineering Conference from a discussion sequence into a controlled platform-engineering system.

The track coordinates five activities continuously:

`RESEARCH → DECIDE → CONTRACT → IMPLEMENT → VERIFY`

A conference decision is not treated as implementation completion. An implementation change is not treated as architecture truth until evidence closes the applicable gate.

## 2. Non-negotiable execution model

```text
FOUNDER / PRODUCT AUTHORITY
        ↓
ENGINEERING CONFERENCE
        ↓
ARCHITECTURE / DOMAIN DECISION
        ↓
ADR + CONTRACT + REGISTER IMPACT
        ↓
AUTHORIZED TASK PACKET
        ↓
CODEX IMPLEMENTATION
        ↓
TEST / SECURITY / CONCURRENCY / DATA VERIFICATION
        ↓
EVIDENCE
        ↓
CHECKPOINT
```

The current repository operating contract makes Codex the primary repository implementation executor. AI agents may not invent unresolved product semantics, bypass canonical contracts, or claim verification without execution evidence.

## 3. Workstream model

### W0 — Control Plane

Maintain:

- `AGENTS.md`;
- current checkpoint;
- Engineering Conference Path;
- Architecture Roadmap;
- Engineering Source of Truth;
- canonical artifact register;
- master execution path;
- task packets;
- evidence classification.

**Gate:** one current checkpoint, no hidden canonical duplicate, no stale instruction capable of overriding current authority.

### W1 — Architecture / Domain

Close:

- bounded contexts;
- entities/value objects;
- aggregate candidates;
- invariants;
- commands;
- state machines;
- ownership;
- authorization semantics;
- cross-context contracts.

**Gate:** semantic ownership and contract are closed for the authorized slice.

### W2 — Data / Persistence

Sequence:

`brownfield evidence → reconciliation → schema contract → local executable schema → migration → constraints → RLS → concurrency → evidence`

Never infer the live database from a target schema or source package.

### W3 — Security / Tenancy

Verify:

- tenant scope;
- authorization;
- resource scope;
- RLS defense-in-depth;
- storage/search/cache/event/job isolation;
- support/admin boundaries;
- AI authority inheritance.

### W4 — Events / Integration

For every authoritative durable event:

`command → transaction → domain change → outbox → publication → idempotent consumer → reconciliation`

Events are contracts, not arbitrary strings emitted from controllers.

### W5 — Application Platform

Implement only after the selected slice passes architecture/data/security gates.

Default architecture remains modular-monolith-first. New services require evidence of a real boundary, not organizational enthusiasm.

### W6 — Experience / Design

Maintain:

`tokens → primitives → components → patterns → templates → surfaces`

All implementation must preserve Arabic/RTL, French/English, responsive, accessibility, loading, empty, error and high-density operational states where applicable.

### W7 — Verification / Reliability

Verification is independent of implementation intent.

Required classes include:

- unit/domain tests;
- integration tests;
- database constraint tests;
- RLS/tenant tests;
- authorization tests;
- concurrency/race tests;
- idempotency/retry tests;
- event delivery tests;
- migration replay tests;
- browser/visual tests where UI changes;
- recovery/rollback evidence where operationally relevant.

### W8 — Runtime / Operations

Only after local evidence is established:

`CI → staging/runtime identity → controlled integration → observability → backup/restore → production gate`

Production is not the architecture laboratory.

## 4. Conference-to-engineering lifecycle

Every major decision follows this exact lifecycle:

1. **QUESTION** — identify the load-bearing unknown.
2. **RESEARCH** — repository, history, source package, official external sources.
3. **ALTERNATIVES** — enumerate viable designs.
4. **FAILURE MODES** — concurrency, security, data, operational and product failure analysis.
5. **AUTHORITY** — identify founder, architecture, runtime or external authority.
6. **DECISION** — choose the smallest defensible model within authority.
7. **CONTRACT** — encode semantics and boundaries.
8. **REGISTER IMPACT** — permissions/events/states/schema/aggregates as applicable.
9. **TASK PACKET** — authorize a bounded implementation slice.
10. **IMPLEMENT** — Codex executes only the authorized scope.
11. **VERIFY** — tests and objective evidence.
12. **RECONCILE** — update affected canonical artifacts.
13. **CHECKPOINT** — record exact state and next dependency.

## 5. Evidence classes

Use the repository vocabulary exactly:

`SOURCE-VERIFIED | RUNTIME-VERIFIED | TEST-VERIFIED | EXTERNALLY-VERIFIED | SUPPORTED | ENGINEERING-DERIVATION | PROPOSED | PARTIAL | OPEN | CONFLICT | BLOCKED | NOT_EXECUTED | FOUNDER-DECISION-REQUIRED`

A document existing is not evidence that its claim is implemented.

## 6. Current conference position

C03 semantic sequence through Reservation is closed:

`Resource Identity → Asset Taxonomy → Project → Building → Floor → Unit → Listing → Multi-Actor Authority → State Doctrine → Pricing/Versioning → Inventory Lifecycle → Reservation Boundary`

The next item is **C03.13 Schema Contract**, but C03.13 is evidence-gated.

The correct immediate engineering activity is therefore **brownfield persistence reconciliation**, not speculative schema authoring.

## 7. C03.13 entry gate

Before executable schema authorization, obtain and classify:

- repository schema/model files;
- migrations and migration history;
- ORM configuration;
- database connection/runtime identity evidence;
- current Unit/Apartment/Property/Listing/Reservation references;
- Project/Building/Floor persistence references;
- existing constraints/indexes/foreign keys;
- RLS policies and security-definer functions where present;
- event/outbox persistence;
- permission/state/event register mappings;
- test coverage and CI evidence.

Then produce:

`Observed Reality → Drift Inventory → Semantic Mapping → Required Changes → Migration Safety → Test Plan → Evidence`

No target table is authorized merely because the domain contract names an entity.

## 8. Reservation implementation doctrine

The semantic requirement is:

`ONE ACTIVE WINNER PER UNIT`

PostgreSQL supports database-enforced uniqueness, including partial unique indexes for subset uniqueness. PostgreSQL 18 also supports temporal uniqueness mechanisms, but the final ASAS mechanism must be selected against the actual brownfield schema and workload rather than assumed. citeturn0search1turn0search2turn0search5

The transaction must establish the reservation outcome and the Unit commercial consequence atomically. Durable events should use the transactional outbox pattern; the outbox does not replace the reservation invariant. citeturn0search0

## 9. Definition of Done for a platform slice

A slice is complete only when:

- semantics are authoritative;
- ownership is explicit;
- contract exists;
- permission/state/event impacts are reconciled;
- implementation is bounded;
- migration safety is known;
- tests exist;
- verification ran;
- failures are recorded;
- evidence is attached;
- canonical artifacts are synchronized;
- checkpoint identifies the next dependency.

## 10. Current engineering priority queue

### P0 — Foundation truth

1. Establish canonical runtime/database identity or explicitly remain BLOCKED.
2. Reconcile current repository persistence for Project/Building/Floor/Unit/Listing/Reservation.
3. Reconcile permission/event/state registers against closed C03 semantics.
4. Resolve stale canonical-artifact references.
5. Establish architecture-as-code checks for the conference control plane.

### P1 — C03.13

6. Produce the executable schema contract only after P0 evidence.
7. Select reservation concurrency mechanism.
8. Define price-version persistence and overlap rules.
9. Define Inventory Batch relationship and persistence.
10. Define RLS/security enforcement contract.

### P2 — Implementation vertical

11. Build one end-to-end vertical slice from command to DB to event to verification.
12. Add adversarial tests.
13. Capture evidence and close the implementation gate.

### P3 — Continue conference

14. C04 CRM.
15. C05 Sales.
16. C06 Finance.
17. C07–C22 according to dependency graph, not calendar preference.

## 11. Stop conditions

Stop rather than guess when:

- founder/product authority is required;
- live runtime identity cannot be proven;
- a migration could destroy or reinterpret production data;
- authorization semantics are ambiguous;
- financial/legal meaning is unresolved;
- two canonical sources conflict and authority is not established;
- implementation would create competing truth;
- verification cannot objectively prove the claim.

## 12. Canonical continuation rule

Every continuation session starts by loading:

`AGENTS.md → CURRENT-SESSION-STATE.md → ASAS-ENGINEERING-CONFERENCE-PATH-2026.md → ASAS-PLATFORM-ENGINEERING-TRACK-2026.md → ROADMAP → SOURCE OF TRUTH → relevant contracts/registers → task packet`

Then inspect HEAD and determine the highest unresolved dependency.

The engineering conference is therefore not a chat history. It is a controlled, evidence-producing engineering system stored in the repository.
