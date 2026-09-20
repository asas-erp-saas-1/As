# ASAS Open Contract Conflicts

Status: CANONICAL FOUNDATION BLOCKER REGISTER
Version: 1.2
Date: 2026-09-20

## Purpose

Record material contradictions discovered across approved/source artifacts before implementation. This file prevents Claude from silently reconciling genuinely unresolved architecture and runtime conflicts.

## C2-001 — Bounded-context/module count and decomposition

### Prior conflict

The source set contains two materially different architectural decomposition views:

- `AGENTS.md` describes ASAS as a modular monolith with nine high-level domain contexts: Core, CRM, Sales, Inventory, Finance, Website Studio, Marketing, Analytics, Documents.
- `ASAS_Master_Implementation_Specification` describes 15 implementation modules / historical schema partitions.

### Reconciliation

The 2026 Blueprint v1.4.0 and the accompanying evidence matrix explicitly distinguish:

`Bounded Context / Domain Group ≠ Implementation Module ≠ Aggregate ≠ Database Schema ≠ Read Model ≠ Worker ≠ Event Consumer`.

The nine-context view is retained as the current **proposed high-level domain grouping**. The historical 15-module view is retained as **candidate implementation decomposition evidence**. The count difference is therefore not, by itself, a semantic contradiction and must not be resolved by forcing one-to-one numerical correspondence.

### Classification

C2 — architectural refinement, not an active count contradiction.

### Current disposition

`OPEN ARCHITECTURAL REFINEMENT`

No application implementation is authorized merely by this reconciliation. Individual module ownership, aggregate ownership, persistence boundaries, dependency direction, permission authority and event ownership still require evidence and contract closure.

### Required work

Maintain an evidence-backed Context/Domain/Module Map. Accept individual mappings only when business responsibility, invariant ownership, authorization, tenant boundary, data ownership, consistency requirements, change cadence and integration cost support them. Record material ownership decisions through ADRs or approved contracts.

### Authority

Blueprint v1.4.0 establishes the classification rule. It does not silently accept every historical 15-module ownership statement as implementation truth.

## C2-001-S — Scheduling ownership sub-conflict

### Conflict

Scheduling is represented differently across architecture-era sources:

- current Master-Spec-oriented handoff places Scheduling under CRM;
- ADR-0018 is recorded as a Core-hosted Scheduling submodule;
- older ADR/context wording contains a different context/module formulation.

### Classification

C2 — ownership conflict.

### Current disposition

`OPEN — FOUNDER DECISION REQUIRED`.

### Required decision

Select the canonical owner and update the Context-to-Module Map, affected contracts, events, permissions, tasks and implementation dependencies in one reconciled change.

## C2-002 — Current live-database claim versus repository implementation target

### Conflict

The source doctrine states that an existing production database is the reality arbiter and contains a pre-existing table baseline, while the current repository is intentionally pre-implementation and connected platform evidence has not been accepted as proof of the canonical `As` runtime environment.

The connected Supabase account currently exposes a project named `asas-web-site`, not a project whose identity has been verified as the runtime for `asas-erp-saas-1/As`.

### Classification

C2/C3 depending on whether a schema-touching task is proposed.

### Current disposition

`OPEN — no schema implementation may infer live structure from documentation or from the similarly named unverified project.`

### Required decision/evidence

When the actual live environment is intentionally authorized, capture database identity, schema inventory, drift report, backup/restore evidence, and migration authority before schema-touching work. Until then, treat all live-schema assertions as source claims, not verified repository reality.

## Closure rule

An entry is CLOSED only after the conflicting sources are explicitly identified, the canonical interpretation is recorded in an ADR or approved contract, affected registers/tasks are traced, and verification requirements are updated.

Claude MUST NOT resolve unresolved ownership, financial, security, legal or destructive-data decisions silently.