# ASAS Founder Decision Register

Status: CANONICAL DECISION ESCALATION REGISTER
Version: 1.1
Date: 2026-09-20

## Purpose

Record decisions that an autonomous engineering agent must not silently make. Open entries are blocking only for work that depends on the unresolved decision.

## FD-001 — Context-to-module decomposition governance

**Status:** OPEN / ARCHITECTURAL REFINEMENT — NOT A COUNT-BASED FOUNDER BLOCKER

**Reconciliation:** The 2026 Blueprint v1.4.0 explicitly distinguishes bounded contexts/domain groupings from implementation modules, aggregates, schemas, read models, workers and event consumers. The nine-context view is retained as a proposed high-level domain grouping; the historical 15-module proposal is retained as candidate implementation evidence. The numerical difference is not itself a contradiction requiring a founder choice.

**Founder decision is required only if:** a future ownership decision changes product/business semantics, creates a materially different domain boundary, changes financial/security authority, or otherwise crosses a founder authority boundary.

**Engineering responsibility:** maintain the evidence-backed Context/Domain/Module Map and record material ownership decisions through ADRs/contracts rather than forcing one-to-one counts.

## FD-002 — Scheduling ownership

**Status:** FOUNDER DECISION REQUIRED

**Conflicting evidence:**
- current Master-Spec-oriented handoff places Scheduling under CRM;
- ADR-0018 is recorded as Core-hosted Scheduling submodule;
- older ADR language contains a different context/module formulation.

**Decision required:** Choose the canonical ownership and record it in an ADR. Then update the Context/Module Map, affected contracts, tasks, events, permissions and implementation dependencies atomically.

**Blocking scope:** Scheduling implementation, scheduling persistence ownership, scheduling event ownership and dependency rules.

## FD-003 — Schema-contract count discrepancy

**Status:** OPEN / ENGINEERING RECONCILIATION FIRST

**Evidence:** historical declaration 59 models / 16 enums / 15 indexes versus verified source observation of 59 models / 17 enums / 56 `@@index` declarations.

**Decision required:** No product decision is requested yet. Engineering must first extract the complete authoritative source and reconcile the count. Founder escalation is required only if the authoritative sources remain semantically inconsistent after extraction.

## FD-004 — Task-register count discrepancy

**Status:** OPEN / ENGINEERING RECONCILIATION FIRST

**Evidence:** historical declaration 114 versus verified source observation of 119 top-level phase tasks and 121 task IDs including nested records, plus 3 recurring rituals.

**Decision required:** Engineering must reconcile source edition, top-level/nested semantics and promotion rules before implementation authorization. Founder decision is required only if two approved source artifacts remain contradictory.

## FD-005 — Canonical runtime/database identity

**Status:** BLOCKED / EVIDENCE REQUIRED

**Evidence:** connected Supabase listing exposes `asas-web-site`, while canonical repository is `asas-erp-saas-1/As`.

**Decision required:** Identify and explicitly authorize the actual runtime/database project before schema-touching work. Do not treat a similarly named project as the canonical environment.

## Escalation rule

Claude must STOP → DOCUMENT → ESCALATE whenever a change would resolve one of these entries by silently choosing a product, ownership, financial, legal, destructive-data or autonomous-authority interpretation.