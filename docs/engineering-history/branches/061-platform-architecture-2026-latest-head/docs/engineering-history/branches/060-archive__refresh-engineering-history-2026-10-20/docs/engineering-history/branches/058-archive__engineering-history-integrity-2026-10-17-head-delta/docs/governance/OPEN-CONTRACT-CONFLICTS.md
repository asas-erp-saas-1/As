# ASAS Open Contract Conflicts

Status: CANONICAL FOUNDATION BLOCKER REGISTER
Version: 1.2
Date: 2026-09-20

## Purpose

Record material contradictions discovered across approved/source artifacts before implementation. This file prevents Claude from silently reconciling genuinely unresolved architecture and runtime conflicts.

## C2-001 — Bounded-context/module count and decomposition

### High-level decision (supersedes the older open count status)

**Status:** HIGH-LEVEL GROUPING DECIDED; DETAILED OWNERSHIP REFINEMENT OPEN.

**Authority:** `docs/governance/FOUNDER-DECISIONS.md` — FD-001, CLOSED / architecture decided 2026-09-26.

The accepted current high-level grouping is nine bounded contexts: Core, CRM, Sales, Inventory, Finance, Website Studio, Marketing, Analytics, Documents. The historical 15-module proposal is implementation-decomposition evidence, not a competing bounded-context model. Do not force one-to-one numeric correspondence between contexts, implementation modules, aggregates, database schemas, read models, workers or event consumers.

The exact historically claimed approved Phase 1.5 Domain Model v2 / Context Map v2 remains unlocated. This remains a **provenance gap**, not permission to ignore or silently recreate the later explicit FD-001 decision. The missing source must remain noted, while FD-001 governs current high-level grouping.

**Still OPEN:** per-context/module/aggregate/persistence ownership; dependency direction; transaction and consistency boundaries; permission/tenant scopes; event ownership; mapping to tasks and registers. These need evidence-backed contracts and traceability. No application/database implementation is authorized merely because the high-level context decision is closed.

**Historical record:** the 2026-09-20 status below was accurate before FD-001 and is superseded only for the high-level context-count decision, not for detailed ownership refinement.

## C2-001-S — Scheduling ownership sub-conflict

### Historical conflict

Older architecture sources placed Scheduling in different places, including CRM-adjacent formulations and a Core-hosted capability. The conflict was later decided.

### Current disposition

**OWNER DECISION CLOSED** by `docs/governance/FOUNDER-DECISIONS.md` FD-002 and accepted `docs/architecture/decisions/ADR-0021-SCHEDULING-OWNERSHIP-2026-09-26.md`.

Scheduling is a Core-hosted platform capability, not a separate bounded context and not a CRM-owned persistence boundary. Calendar/provider integration belongs to Integrations. The ADR does not itself authorize schema creation.

### Remaining work

**OPEN:** reconcile existing appointment/activity records and schema history; define the contract; map permissions, tenant/resource scope, events/outbox, audit and failure behavior; specify tests before implementation. Do not keep escalating owner selection as unresolved unless newer authoritative evidence supersedes FD-002 / ADR-0021.

### Identifier note

This register's local `C2-002` identifier below refers to runtime/database identity. Other documents previously used `C2-002` for Scheduling. Until the historical ID namespace is fully normalized, always cite the owning file and title, not the identifier alone.

## C2-002 — Current live-database claim versus repository implementation target

### Conflict

The source doctrine states that an existing production database is the reality arbiter and contains a pre-existing table baseline, while the current repository is intentionally pre-implementation and connected platform evidence has not been accepted as proof of the canonical `As` runtime environment.

The earlier inspection recorded a connected Supabase listing exposing `asas-web-site` (`xwokfufeeodobkuaxvgx`) without proving the runtime mapping for `asas-erp-saas-1/As`. Later repository records also identify `Asas platform` (`oliiumegstqujwexikhr`) as an inspected/designated candidate. Neither a project name nor project existence proves that the Vercel Production environment is bound to it.

### Classification

C2/C3 depending on whether a schema-touching task is proposed.

### Current disposition

`OPEN / BLOCKED — do not infer the production database binding or authorize schema work from documentation, project names, or project health. Prove the exact Vercel Production deployment → environment scope → non-secret Supabase PROJECT_REF chain first.`

### Required decision/evidence

When the actual live environment is intentionally authorized, capture database identity, schema inventory, drift report, backup/restore evidence, and migration authority before schema-touching work. Until then, treat all live-schema assertions as source claims, not verified repository reality. As observed on 2026-10-17, the GitHub branch endpoint returned `protected: false`; repository protection remains a separate GATE-00 closure requirement.

## Closure rule

An entry is CLOSED only after the conflicting sources are explicitly identified, the canonical interpretation is recorded in an ADR or approved contract, affected registers/tasks are traced, and verification requirements are updated.

Claude MUST NOT resolve unresolved ownership, financial, security, legal or destructive-data decisions silently.