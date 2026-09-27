# ASAS — Implementation Readiness Master

**Status:** DOWNSTREAM IMPLEMENTATION CONTROL / NOT ENGINEERING-CONFERENCE AUTHORITY
**Version:** 2.0.0
**Scope:** prepare an authorized implementation slice after the Engineering Conference has closed the applicable architecture gates.

## 1. Authority boundary

This document does **not** define the ASAS Engineering Conference route.

The canonical architecture-conference authority is:

`docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-CONSTITUTION-2026.md`

and:

`docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md`

Its gate names are `GATE-00…GATE-07`.

This document uses `IG-00…IG-07` for downstream implementation readiness. Historical references to `GATE-00…GATE-07` in this document are legacy implementation-control labels and are not authoritative.

## 2. Purpose

Prepare the repository so Codex can implement an explicitly authorized, bounded slice without inventing business semantics, bypassing security, confusing research with authority, or expanding scope.

The objective is task-scoped readiness, not a blanket authorization to build the entire platform.

## 3. Canonical project boundary

**ONLY:** `asas-erp-saas-1/As`

The current Engineering Conference work line is:

`platform-architecture-2026`

The canonical ASAS platform infrastructure identity is recorded in the current session state and platform identity control files. Never substitute the separate `asas-erp-saas-1/Asas-website` project or its Supabase project as ASAS platform reality.

## 4. Preconditions

No implementation-readiness control can authorize work until the applicable Engineering Conference gate is GREEN.

Required inputs include, as applicable:

- canonical architecture;
- bounded-context ownership;
- ontology/domain semantics;
- contracts and invariants;
- security/tenancy model;
- state/event/permission definitions;
- UX/integration/operational consequences;
- verification requirements;
- exact task scope.

## 5. Downstream implementation controls

### IG-00 — Reality and task identity
`repo → active ref → verified applicable environment → runtime evidence where required → task scope → evidence`

### IG-01 — Kernel contract readiness
`identity → tenant → authorization → command boundary → validation → transaction → audit → idempotency → outbox/inbox`

### IG-02 — Domain behavior readiness
`state machines → invariants → concurrency → money/time/document correctness`

### IG-03 — Cross-context behavior readiness
`lead → qualification → visit → opportunity → offer → reservation → contract → payment/collection`

### IG-04 — Experience readiness
Role/task UX, responsive behavior, RTL/LTR, accessibility, permission-aware states and design traceability.

### IG-05 — Integration readiness
Provider-neutral connectors, credentials, webhook verification, replay protection, reconciliation and failure handling.

### IG-06 — Intelligence readiness
AI recommendations and governed tool execution only after core authorization/data boundaries are proven and the AI task is explicitly authorized.

### IG-07 — Scale/reliability readiness
Performance budgets, queues/projections/caching where justified, cost controls, SLOs, recovery evidence and operational readiness.

These are **implementation controls**, not architecture gates.

## 6. Task-scoped readiness

A slice is implementation-ready only when:

- the authoritative architecture is known;
- the relevant Engineering Conference gates are GREEN;
- contracts exist;
- dependencies are resolved;
- command/state/permission/event mappings are explicit;
- invariants and concurrency hazards have verification methods;
- migration impact is known and safe;
- positive and negative tests are defined;
- rollback/forward-fix is known;
- no founder/legal/financial/security decision is hidden inside the task.

## 7. Golden mutation pattern

`Command → Identity → Tenant → Authorization → Idempotency → Validation → Invariant → Transaction → State transition → Audit + Outbox → Response`

External side effects occur only after durable internal state and require idempotency, retry and reconciliation semantics where applicable.

## 8. Database doctrine

- Existing brownfield reality is authoritative for existing data.
- Target contracts are authoritative for desired behavior.
- Extend; never casually rewrite.
- Use controlled expand/contract evolution for live systems.
- Never use production reset or uncontrolled `db push`.
- Never delete business records to repair application logic.
- Posted financial truth is immutable; corrections are compensating entries.
- Verify migrations with actual evidence.

## 9. Agent autonomy

Agents may execute reversible, contract-complete, testable implementation details within an authorized task.

They must stop for business/legal/financial semantics, tenant/data ownership, canonical context ownership, privileged AI authority, destructive production operations, irreversible migrations or security exceptions.

## 10. Verification

A task is complete only when the named acceptance evidence exists and passes, applicable controls are GREEN, the evidence record is delivered where required, and the diff remains inside the authorized blast radius.

Do not claim checks were executed when they were not.

## 11. Relationship to the Engineering Conference

```text
ENGINEERING CONFERENCE
GATE-00 → GATE-01 → GATE-02 → GATE-03 → GATE-04 → GATE-05 → GATE-06 → GATE-07
                                      ↓
                         bounded implementation slice
                                      ↓
                         IG-00 → IG-07 as applicable
                                      ↓
                                Codex execution
```

This ordering is mandatory. Implementation readiness cannot pull architecture work forward, and an implementation control cannot override a canonical architecture decision.
