# ASAS Open Contract Conflicts

Status: CANONICAL FOUNDATION BLOCKER REGISTER

## Purpose

Record material contradictions discovered across approved/source artifacts before implementation. This file does not choose a winner. It prevents Claude from silently reconciling conflicting architecture.

## C2-001 — Bounded-context/module count and decomposition

### Conflict

The source set contains two materially different architectural decompositions:

- `AGENTS.md` describes ASAS as a modular monolith with **nine bounded contexts**: Core, CRM, Sales, Inventory, Finance, Website Studio, Marketing, Analytics, Documents; Scheduling is explicitly a CRM submodule.
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

An entry is CLOSED only after the conflicting sources are explicitly identified, the canonical interpretation is recorded in an ADR or approved contract, affected registers/tasks are traced, and verification requirements are updated.

Claude MUST NOT resolve these conflicts silently.
