# ASAS Open Contract Conflicts

Status: CANONICAL FOUNDATION BLOCKER REGISTER
Version: 1.1
Date: 2026-09-20

## Purpose

Record material contradictions discovered across approved/source artifacts before implementation. This file does not choose a winner. It prevents Claude from silently reconciling conflicting architecture.

## C2-001 — Bounded-context/module count and decomposition

### Conflict

The source set contains two materially different architectural decompositions:

- `AGENTS.md` describes ASAS as a modular monolith with **nine bounded contexts**: Core, CRM, Sales, Inventory, Finance, Website Studio, Marketing, Analytics, Documents; Scheduling is explicitly described as a CRM submodule in the current handoff formulation.
- `ASAS_Master_Implementation_Specification` describes **15 modules / 15 database schemas**, including Lead & CRM, Property & Inventory, Visit Management, Reservation & Contract, Payment & Finance, Commission & Payout, Communication, Identity/Access/Workspace, Notification, Collaboration/Extensibility, Calendar/Scheduling, Activity/Timeline/Audit, Search, Reporting/Analytics, Workflow/Automation.

These are not safely interchangeable: they imply different ownership boundaries, persistence boundaries, event contracts, dependency rules, and implementation structure.

### Classification

C2 — semantic/architectural conflict.

### Current disposition

OPEN — HARD STOP for any implementation that depends on the affected decomposition.

### Non-conflicting principle

Both sources support a modular, boundary-enforced architecture and do not justify premature distributed microservices. The exact context/module mapping remains unresolved.

### Required decision

Produce one canonical Context-to-Module Map defining:

1. bounded context name and ID;
2. module name and ID;
3. aggregate ownership;
4. persistence/schema ownership;
5. synchronous published interfaces;
6. asynchronous events;
7. allowed dependencies;
8. tenant/security authority;
9. process/worker ownership;
10. extraction boundary if the module is later separated.

### Authority required

Founder/product architecture decision recorded as an ADR, after reconciliation of the approved Blueprint and implementation specification.

## C2-001-S — Scheduling ownership sub-conflict

### Conflict

Scheduling is represented differently across architecture-era sources:

- current Master-Spec-oriented handoff places Scheduling under CRM;
- ADR-0018 is recorded as a Core-hosted Scheduling submodule;
- older ADR/context wording contains a different decomposition.

### Classification

C2 — ownership conflict.

### Current disposition

OPEN — FOUNDER DECISION REQUIRED.

### Required decision

Select the canonical owner and update the Context-to-Module Map, affected contracts, events, permissions, tasks and implementation dependencies in one reconciled change.

## C2-002 — Current live-database claim versus repository implementation target

### Conflict

The source doctrine states that an existing production database is the reality arbiter and contains a pre-existing table baseline, while the current repository is intentionally pre-implementation and the connected platform evidence has not been accepted as proof of the canonical `As` runtime environment.

The connected Supabase account currently exposes a project named `asas-web-site`, not a project whose identity has been verified as the runtime for `asas-erp-saas-1/As`.

### Classification

C2/C3 depending on whether a schema-touching task is proposed.

### Current disposition

OPEN — no schema implementation may infer live structure from documentation or from the similarly named unverified project.

### Required decision/evidence

When the actual live environment is intentionally authorized, capture database identity, schema inventory, drift report, backup/restore evidence, and migration authority before schema-touching work. Until then, treat all live-schema assertions as source claims, not verified repository reality.

## Closure rule

An entry is CLOSED only after the conflicting sources are explicitly identified, the canonical interpretation is recorded in an ADR or approved contract, affected registers/tasks are traced, and verification requirements are updated.

Claude MUST NOT resolve these conflicts silently.
