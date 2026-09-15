# ASAS — Claude Implementation Readiness Master

**Purpose:** prepare the ASAS repository so Claude can autonomously develop application code and database changes once the relevant gates are closed.

## 1. Primary mission

The objective of the foundation program is not documentation for its own sake.

The objective is to eliminate the classes of ambiguity and operational risk that would force Claude to guess while implementing the real ASAS system.

The desired end state is:

> Claude can take an implementation-ready task, inspect the repository and verified platform reality, implement the required code/database change, test it adversarially, produce evidence, commit it on a task-scoped branch, and continue to the next unblocked task — stopping only at protected founder decisions.

## 2. Canonical project boundary

**ONLY:** `asas-erp-saas-1/As`

Never use these as project evidence:

- `asas-erp-saas-1/Asas-website`
- Supabase project `asas-web-site` / ref `xwokfufeeodobkuaxvgx`
- any similarly named repository, deployment or database unless the linkage is independently proven.

## 3. What foundation must deliver

### A. Product authority

- product truth
- canonical architecture
- bounded contexts
- aggregate ownership
- state machines
- commands
- permissions and ABAC
- events
- invariants
- protected founder decisions

### B. Engineering authority

- implementation task packets
- dependency-aware build orders
- migration rules
- transaction boundaries
- idempotency
- concurrency controls
- outbox/inbox
- audit/evidence
- observability
- testing strategy
- release gates

### C. Platform reality

Before schema-touching work, prove:

- repository identity
- branch
- actual Supabase project
- actual Vercel project where applicable
- environment classification
- database version
- migration history
- schema and relationships
- RLS/policies
- backup/restore capability
- repository-to-runtime-to-database linkage

The identity gate is currently **OPEN/BLOCKED** because the only connected Supabase project discovered is `asas-web-site`, which is explicitly a different project.

## 4. Claude autonomy model

### A0 — execute

Claude acts without founder approval for reversible, contract-complete, testable implementation details.

### A1 — execute + micro-ADR

Claude chooses among technical alternatives when business semantics do not change and records the decision.

### A2 — founder decision

Stop for business/legal/financial semantics, tenant/data ownership, canonical events/contexts, material provider commitments, privileged AI authority, production-data transformations, or irreversible migrations.

### A3 — prohibited

No production reset, destructive migration without approval, force push, security bypass, secret exposure, RLS weakening, or contract rewriting to fit code.

## 5. Implementation gate sequence

### GATE-00 — Reality

`Repo → branch → platform identity → environment → database → migrations → backup/restore → evidence`

### GATE-01 — Kernel

`Identity → tenant → authorization → command boundary → validation → transaction → audit → idempotency → outbox/inbox`

### GATE-02 — Domain

`State machines → invariants → concurrency → money/time/document correctness`

### GATE-03 — Cross-domain

`Lead → qualification → visit → opportunity → offer → reservation → contract → payment/collection`

### GATE-04 — Experience

Role/task UX, Figma traceability, responsive behavior, RTL/LTR, accessibility and permission-aware states.

### GATE-05 — Integrations

Provider-neutral connectors, OAuth/credentials, webhook verification, replay protection, reconciliation and failure queues.

### GATE-06 — Intelligence

AI recommendations and governed tool execution after core authorization/data boundaries are proven.

### GATE-07 — Scale/reliability

Performance budgets, queues, projections, caching, load shedding, cost controls, SLOs and recovery drills.

## 6. Current foundation priorities

1. Verify the actual Supabase/Vercel identity for `As`.
2. Perform read-only production/development reality inspection against the verified platform.
3. Reconcile canonical schema/contracts with real schema before designing migrations.
4. Close B.4 legal state graph.
5. Close remaining B.2/B.3/B.5/B.6/B.7/B.8/B.9/B.11 policy predicates.
6. Complete command ↔ permission ↔ ABAC ↔ state edge ↔ event traceability.
7. Close critical invariant/security/tenant-negative test contracts.
8. Turn the dependency graph into implementation-ready task packets.
9. Open the first executable vertical slice when its gate is actually green.

## 7. Definition of implementation readiness

The foundation is ready for Claude to implement a task when:

- authoritative contract exists;
- repository/platform reality is known;
- task dependencies are resolved;
- command/state/permission/event mappings are explicit;
- invariants and concurrency hazards have verification methods;
- migration impact is known and safe;
- positive and negative tests are defined;
- rollback/forward-fix path is known;
- no A2/A3 decision is hidden inside the task.

This does **not** require the entire ASAS product to be fully specified before any code can ever be written. Readiness is task-scoped and dependency-aware.

## 8. Golden implementation pattern

Every business mutation should follow:

`Command → Identity → Tenant → Authorization → Idempotency → Validation → Invariant → Transaction → State transition → Audit + Outbox → Response`

External side effects occur after durable internal state and are protected by idempotency/retry/reconciliation semantics.

## 9. Database doctrine

- Existing production reality is authoritative for existing data.
- Canonical contracts are authoritative for the target model.
- Extend; never casually rewrite.
- Use expand/contract migrations for live evolution.
- Never use production reset or uncontrolled `db push`.
- Never delete real business records to repair application logic.
- Posted financial truth is immutable; corrections are compensating entries.
- Verify migrations with actual queries and evidence.

## 10. Claude operating loop

`Locate → Load → Inspect → Research → Model → Plan → Build → Attack → Verify → Record → Integrate → Continue`

The loop must be autonomous after the relevant gate is open.

## 11. Stop-line conditions

Stop immediately and surface evidence for:

- production reality contradicting a canonical contract;
- undefined business/legal/financial semantics;
- missing canonical event/permission/context required for a feature;
- unsafe cross-tenant access;
- duplicate reservation/payment side effects;
- accounting imbalance;
- unsafe migration;
- unverifiable backup/recovery boundary;
- provider trust or webhook authenticity not established;
- AI authorization/data-egress bypass;
- material security weakening.

## 12. Founder decision boundary

Founder control is preserved over the business, not over every coding detail.

Claude should not ask the founder whether to:

- write a normal test;
- fix a type error;
- refactor safely;
- implement a registered component;
- add loading/error/empty states;
- improve accessibility;
- add observability;
- fix a defect inside the approved contract;
- choose a reversible technical implementation under A1.

Claude should ask when the choice changes what ASAS means, owns, promises, charges, records, exposes, or authorizes.

## 13. Current status

**Foundation direction: CORRECTED.**

**Canonical repository: VERIFIED.**

**Wrong-project contamination: IDENTIFIED AND CORRECTED in durable state.**

**Actual platform identity: BLOCKED / NOT VERIFIED.**

**Application implementation: waiting only on the relevant implementation gates, not on documentation perfection.**

**Next action: GATE-00 platform identity and reality reconciliation.**
