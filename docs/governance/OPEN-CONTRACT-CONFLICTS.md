# ASAS Open Contract Conflicts

Status: CANONICAL FOUNDATION BLOCKER REGISTER

## Purpose

Record material contradictions discovered across approved/source artifacts before implementation. This file does not silently choose a winner. It prevents Claude from reconciling conflicting architecture without an explicit recorded decision.

## C2-001 — Bounded-context/module count and decomposition

### Conflict

The source set contains two materially different architectural summaries:

- `AGENTS.md` contains a condensed nine-context description and places Scheduling under CRM.
- `ASAS_Enterprise_Domain_Model` and the approved Phase 1.5 roadmap identify **15 bounded contexts**.
- `ASAS_Master_Implementation_Specification` defines **15 independent modules / 15 PostgreSQL schemas** and explicit module communication rules.

### Reconciliation finding

The 15-context decomposition is the only source set that provides the granular implementation boundaries required for module ownership, persistence, event contracts, dependency enforcement, worker/process ownership, and future extraction. The nine-context statement is therefore classified as a **legacy condensed summary**, not the implementation decomposition.

This finding is recorded in `docs/decisions/ADR-0001-CANONICAL-CONTEXT-MODULE-DECOMPOSITION.md` as a **PROPOSED** decision.

### Proposed canonical decomposition

1. Lead & CRM — `lead_crm`
2. Property & Inventory — `property_inventory`
3. Visit Management — `visit_management`
4. Reservation & Contract — `reservation_contract`
5. Payment & Finance — `payment_finance`
6. Commission & Payout — `commission_payout`
7. Communication — `communication`
8. Identity, Access & Workspace — `identity_access`
9. Notification — `notification`
10. Collaboration & Extensibility — `collaboration`
11. Calendar & Scheduling — `calendar_scheduling`
12. Activity, Timeline & Audit — `activity_audit`
13. Search — `search`
14. Reporting & Analytics — `reporting`
15. Workflow & Automation Engine — `workflow_engine`

The deployment shape remains a modular monolith with enforced boundaries; this reconciliation does not authorize microservices.

### Current disposition

**PROVISIONALLY RECONCILED — IMPLEMENTATION BLOCKED PENDING FOUNDER ACCEPTANCE OF ADR-0001.**

The contradiction is no longer an extraction mystery: the source hierarchy supports the 15-context implementation map. It is not marked CLOSED because the repository governance requires explicit founder/product architecture acceptance for a C2 decision.

### Required acceptance

Founder accepts or rejects ADR-0001. If accepted, update the condensed `AGENTS.md` wording and promote the Context-to-Module Map to canonical. If rejected, record the alternative mapping and its complete impact analysis before implementation.

## C2-002 — Current live-database claim versus repository implementation target

### Conflict

The source doctrine states that an existing production database is the reality arbiter and contains a pre-existing table baseline, while the current repository is intentionally pre-implementation and the connected platform evidence has not been accepted as proof of the canonical `As` runtime environment.

### Classification

C2/C3 depending on whether a schema-touching task is proposed.

### Current disposition

OPEN — no schema implementation may infer live structure from documentation.

### Required decision/evidence

When live environment access is intentionally authorized, capture database identity, schema inventory, drift report, backup/restore evidence, and migration authority before schema-touching work. Until then, treat all live-schema assertions as source claims, not verified repository reality.

## Closure rule

An entry is CLOSED only after the conflicting sources are explicitly identified, the canonical interpretation is recorded in an accepted ADR or approved contract, affected registers/tasks are traced, and verification requirements are updated.

Claude MUST NOT resolve these conflicts silently.
