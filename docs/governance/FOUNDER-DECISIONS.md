# ASAS Founder Decision Register

Status: CANONICAL DECISION ESCALATION REGISTER
Version: 1.2
Date: 2026-09-26

## Purpose

Record decisions that an autonomous engineering agent must not silently make. Open entries are blocking only for work that depends on the unresolved decision.

## Delegation note — 2026-09-26

The Founder explicitly instructed the Engineering Conference to perform a comprehensive research-first review of the ASAS architecture, governance, repository evidence and external engineering sources, and to take the appropriate product/business decisions for the conference questions unless a matter requires qualified legal interpretation, destructive production authority, or objective runtime/database evidence that is not available. This instruction authorizes the conference to close the currently open founder-level product/architecture questions within that boundary. It does not authorize implementation to bypass the implementation gates.

## FD-001 — Context-to-module decomposition governance

**Status:** OPEN / ARCHITECTURAL REFINEMENT — NOT A COUNT-BASED FOUNDER BLOCKER

**Reconciliation:** The 2026 Blueprint explicitly distinguishes bounded contexts/domain groupings from implementation modules, aggregates, schemas, read models, workers and event consumers. The nine-context view is retained as the proposed high-level domain grouping; the historical 15-module proposal is retained as candidate implementation evidence. The numerical difference is not itself a contradiction requiring a founder choice.

**Founder decision is required only if:** a future ownership decision changes product/business semantics, creates a materially different domain boundary, changes financial/security authority, or otherwise crosses a founder authority boundary.

**Engineering responsibility:** maintain the evidence-backed Context/Domain/Module Map and record material ownership decisions through ADRs/contracts rather than forcing one-to-one counts.

## FD-002 — Scheduling ownership

**Status:** CLOSED / FOUNDER-DELEGATED DECISION — 2026-09-26

**Decision:** Scheduling is a **Core-hosted platform capability**, not a separate bounded context and not a CRM-owned persistence boundary. Core owns the canonical scheduling primitives and appointment/activity scheduling semantics; CRM, Sales, Studio, Marketing and other domains consume them through explicit application contracts. Scheduling may expose domain-specific projections inside consuming contexts, but those projections do not transfer ownership of the canonical schedule. Calendar/provider integrations remain in Integrations.

**Rationale:** Scheduling is cross-domain infrastructure for time-bound commitments and operational activities. Making it CRM-owned would force non-CRM workflows to depend on CRM persistence and would create unnecessary coupling. Making it a ninth/10th domain context would add a domain boundary without evidence that scheduling has an independent business model, authority, or consistency boundary. Core hosting preserves one canonical scheduling model while allowing domain-specific views.

**Required consequences:** update the Context/Module Map, affected contracts, permission/event ownership, task dependencies and roadmap. No scheduling schema implementation is authorized until its contract and persistence ownership are verified against brownfield evidence.

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

The engineering agent must STOP → DOCUMENT → ESCALATE whenever a change would resolve an open entry by silently choosing a product, ownership, financial, legal, destructive-data or autonomous-authority interpretation that is not covered by the Founder delegation above. Runtime/database identity and destructive production authority remain evidence/authorization gates even after delegation.
