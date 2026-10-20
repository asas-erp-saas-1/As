# ASAS Foundation Master Closure Program

**Status:** DESIGN / GOVERNANCE — no application or database implementation authorized  
**Date:** 2026-09-14  
**Owner:** Founder / Principal Engineering workflow

## 1. Objective

This document converts the foundation work from a document checklist into a closure program. The target is not a subjective percentage such as 99.999%. The target is **provable closure**: every critical behavior has a source of truth, an owner, a failure model, a verification method and objective evidence when implementation begins.

The v1.6.1 package is a major source, not the boundary of engineering analysis. External standards, failure-mode analysis, product logic, operational concerns and future scale are allowed to add findings. They must not silently overwrite an authoritative product decision; contradictions require an explicit decision record.

## 2. Closure dimensions

Every critical contract is evaluated across six dimensions:

1. **Semantic correctness** — does the rule mean exactly one thing?
2. **Authority** — where is the canonical source?
3. **Security** — who can read, mutate, execute, export or delegate it?
4. **Failure behavior** — what happens on retry, race, timeout, partial failure, malicious input or provider failure?
5. **Operability** — how is it observed, repaired, replayed, rolled back or recovered?
6. **Evidence** — how will the claim be objectively proven?

A contract is not closed if any critical dimension is unknown.

## 3. Master gates

### G00 — Source and reality reconciliation
**Purpose:** establish the truth hierarchy before design or schema decisions.

Must close:
- repository identity;
- package artifact inventory;
- authoritative Blueprint/register mapping;
- production project identity when available;
- production DB reality when available;
- package checksum/verifier discrepancy;
- contradictory prose claims.

**Failure condition:** any implementation decision relies on guessed production reality.

---

### G01 — Context and ownership closure
**Purpose:** ensure every domain object has exactly one authoritative owner.

Must close:
- nine bounded contexts;
- aggregate ownership;
- cross-context references;
- read-model/projection ownership;
- platform capability boundaries;
- public/private projection boundaries.

**Invariant:** no two contexts are allowed to become competing sources of truth for the same business fact.

---

### G02 — State-machine closure
**Purpose:** make every lifecycle deterministic and executable.

For B.1–B.11, close:
- exact states;
- exact legal edges;
- actor/permission for every edge;
- preconditions;
- side effects;
- emitted events;
- audit requirements;
- expiry/timeout behavior;
- recovery/compensation behavior;
- forbidden transitions.

**Invariant:** no arbitrary status setter exists in the conceptual model.

---

### G03 — Command closure
**Purpose:** turn business actions into a canonical command catalog.

Every mutating command must declare:
- command ID;
- owning context;
- aggregate/resource;
- caller/persona;
- permission;
- scope/ABAC;
- object authorization;
- property authorization;
- preconditions;
- idempotency class;
- transaction boundary;
- state transition;
- audit event;
- domain/integration events;
- typed errors;
- retry semantics.

**Invariant:** no mutation exists outside the command boundary.

---

### G04 — Authorization closure
**Purpose:** prove least privilege rather than merely naming roles.

Trace:
`identity → tenant → role/grant → permission → scope → deny override → ABAC → object authorization → property authorization → command → audit`

Must include negative cases:
- wrong tenant;
- wrong branch/team;
- wrong owner;
- expired role;
- revoked role;
- direct object ID manipulation;
- hidden property request;
- bulk export;
- service-to-service access;
- support/admin escalation.

OWASP's current API guidance makes object-, property- and function-level authorization central risks, not optional hardening. citeturn0search2turn0search21

---

### G05 — Transaction and concurrency closure
**Purpose:** define correctness under competing writers and retries.

Must close:
- transaction boundaries;
- isolation assumptions;
- row/advisory locking where required;
- uniqueness constraints;
- optimistic concurrency where appropriate;
- deadlock behavior;
- retry policy;
- idempotency storage;
- request fingerprinting;
- exactly-once semantic requirements.

**Critical tests:**
- two agents reserve one apartment;
- duplicate receipt submission;
- repeated webhook;
- concurrent hold/release;
- concurrent price change;
- concurrent payment allocation.

PostgreSQL documents row-level locks such as `FOR UPDATE` for serializing conflicting writers/lockers. citeturn0search17

---

### G06 — Event and workflow closure
**Purpose:** guarantee reliable propagation without distributed corruption.

Must close:
- 103 event mapping;
- event class;
- schema version;
- producer;
- aggregate;
- consumer;
- outbox transaction rule;
- relay/lease/retry;
- inbox/deduplication;
- dead-letter behavior;
- replay behavior;
- ordering guarantees;
- poison-message policy;
- compatibility policy.

**Invariant:** a consumer cannot directly mutate another context's authoritative aggregate.

---

### G07 — Financial correctness closure
**Purpose:** make financial records mathematically and operationally trustworthy.

Must close:
- integer minor units;
- currency model;
- rounding authority;
- journal balancing;
- immutable posting;
- reversals;
- allocation limits;
- overpayment;
- refunds;
- commissions;
- period close;
- correction workflow;
- reconciliation;
- idempotent receipt posting;
- audit trail.

**Core invariants:**
- every posted journal entry balances;
- posted entries never mutate;
- every correction has a compensating/reversal relationship;
- allocated amount never exceeds eligible source amount;
- reservation/contract/payment state cannot silently diverge from finance truth.

---

### G08 — Data governance and lifecycle closure
**Purpose:** define what data ASAS stores, exposes, retains and destroys.

Must close:
- data classification;
- PII categories;
- legal/contractual records;
- retention periods;
- anonymization rules;
- export/access requests;
- backups and restore implications;
- audit visibility;
- media lifecycle;
- secret lifecycle;
- tenant ownership.

**Invariant:** business deletion is never conflated with physical deletion where legal/financial retention applies.

---

### G09 — Platform security closure
**Purpose:** close non-business attack surfaces.

Must close:
- authentication/session model;
- CSRF where relevant;
- CSP/security headers;
- SSRF controls;
- upload/media security;
- webhook signatures/replay;
- secret management;
- dependency/supply-chain controls;
- rate/resource limits;
- abuse detection;
- admin/support access;
- logging redaction.

OWASP explicitly includes SSRF, security misconfiguration, improper inventory management and unsafe consumption of APIs in its API security model. citeturn0search21turn0search25

---

### G10 — UX/Figma/product closure
**Purpose:** guarantee that UX expresses the same system semantics as the domain.

For every critical journey:
`persona → job → entry → data → action → permission → command → state → event → feedback → next action → recovery`

Figma must additionally define:
- node/screen ID;
- component/token dependencies;
- loading/empty/error/permission states;
- destructive confirmation;
- mobile behavior;
- RTL/LTR;
- keyboard/focus;
- accessibility;
- localization expansion;
- large-data behavior.

**Invariant:** design cannot invent domain behavior and implementation cannot invent a second design system.

---

### G11 — AI and integration trust closure
**Purpose:** prevent AI and third parties from becoming authorization bypasses.

Every AI tool/integration action must define:
- caller identity;
- tenant scope;
- permission;
- allowed input fields;
- allowed output fields;
- data classification;
- external data transfer;
- confirmation level;
- audit event;
- idempotency;
- failure/retry behavior.

**High-impact actions requiring stronger controls:** reservations, price changes, discounts, refunds, finance posting, role changes, publishing and bulk exports.

---

### G12 — Observability/reliability/recovery closure
**Purpose:** make production behavior diagnosable and recoverable.

Must close:
- trace ID;
- request ID;
- tenant ID;
- actor ID where safe;
- command ID;
- aggregate ID;
- event ID;
- job ID;
- integration ID;
- structured error taxonomy;
- metrics;
- logs;
- traces;
- SLOs;
- alert thresholds;
- RPO/RTO;
- backup policy;
- restore drill;
- incident/runbook ownership.

OpenTelemetry's semantic conventions explicitly exist to provide consistent naming across traces, metrics, logs and events and enable correlation across operations. citeturn0search0turn0search6

---

### G13 — Quality and release closure
**Purpose:** make “done” objectively testable.

Required evidence families:
- unit/domain invariant tests;
- state transition tests;
- authorization allow/deny matrix;
- tenant breakout tests;
- concurrency tests;
- idempotency tests;
- event replay tests;
- finance reconciliation tests;
- migration tests;
- accessibility tests;
- RTL/LTR visual tests;
- performance/load tests;
- security tests;
- dependency/supply-chain checks;
- recovery drill;
- production observability evidence.

NIST SSDF recommends integrating secure-development practices into the SDLC rather than relying on a final security inspection. citeturn0search4turn0search15

## 4. ASAS-specific invariants that must exist before implementation closure

1. One apartment cannot have two simultaneous winning reservations.
2. A reservation cannot be active against a unit whose authoritative commercial state forbids it.
3. A contract cannot become active without satisfying its legal/business prerequisites.
4. Posted finance records cannot be edited in place.
5. Every posted journal entry balances.
6. Payment allocations cannot exceed the eligible receipt/source amount.
7. A tenant can never read or mutate another tenant's private data through any supported access path.
8. A permission grant cannot silently broaden object/property access beyond policy.
9. Public projections cannot expose private domain fields by serializer accident.
10. AI cannot execute a command the human caller could not execute directly.
11. Repeating an idempotent command does not duplicate its business effect.
12. Replaying an event does not duplicate downstream business effects.
13. A failed external provider cannot leave an impossible internal state.
14. A state transition has one canonical meaning regardless of UI/API/AI caller.
15. Analytics cannot become a competing source of operational truth.
16. Search indexes cannot bypass authorization.
17. Cached private data cannot cross tenant or authorization boundaries.
18. Audit history cannot be rewritten through ordinary business permissions.
19. Migration failure cannot silently corrupt or orphan business records.
20. Recovery must restore a state that passes domain invariants, not merely a database that starts.

## 5. Definition of closure

A gate is **GREEN** only if:

- source is authoritative;
- semantics are unambiguous;
- dependencies are known;
- failure behavior is defined;
- security boundary is defined;
- verification method exists;
- implementation owner is known;
- evidence is produced when execution is authorized.

A gate remains **OPEN** if documentation is complete but verification cannot yet be performed.

A gate is **BLOCKED** if a required external dependency or reality is unavailable.

A gate is **FAILED** if objective evidence contradicts the contract.

## 6. Engineering principle

The project must optimize for **correctness before feature velocity** at high-risk boundaries.

The goal is not to make ASAS look complete.

The goal is to make it difficult for ASAS to become silently wrong.

## 7. Current state

- G00: OPEN/BLOCKED on production identity and source reconciliation.
- G01: substantially specified; ownership verification still open.
- G02: normalization established; exact register edges open.
- G03: command registry not yet closed.
- G04: authorization structure established; object/property matrix open.
- G05: adversarial requirements identified; formal contract open.
- G06: taxonomy established; delivery semantics open.
- G07: architecture direction established; accounting invariants open.
- G08: partial; lifecycle contract open.
- G09: baseline established; adversarial closure open.
- G10: structure established; exact journey/Figma traceability open.
- G11: governance established; tool-level egress matrix open.
- G12: baseline established; operational objectives/evidence open.
- G13: quality framework established; executable evidence unavailable until implementation.

**Current verdict: FOUNDATION NOT CLOSED. Continue hardening.**
