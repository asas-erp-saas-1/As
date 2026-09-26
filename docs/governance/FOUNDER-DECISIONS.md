# ASAS Founder Decision Register

Status: CANONICAL DECISION ESCALATION REGISTER
Version: 1.3
Date: 2026-09-26

## Purpose

Record decisions that an autonomous engineering agent must not silently make. Open entries are blocking only for work that depends on the unresolved decision.

## Delegation note — 2026-09-26

The Founder explicitly instructed the Engineering Conference to perform a comprehensive research-first review of the ASAS architecture, governance, repository evidence and external engineering sources, and to take the appropriate product/business decisions for the conference questions unless a matter requires qualified legal interpretation, destructive production authority, or objective runtime/database evidence that is not available. This instruction authorizes the conference to close the currently open founder-level product/architecture questions within that boundary. It does not authorize implementation to bypass the implementation gates.

## FD-001 — Context-to-module decomposition governance

**Status:** CLOSED / ARCHITECTURE DECIDED — 2026-09-26

**Decision:** Nine bounded contexts remain the canonical domain grouping for ASAS. Implementation modules, aggregates, schemas, read models, workers and event consumers are separate implementation concerns and are not required to have a one-to-one numerical correspondence with the nine contexts. The historical 15-module proposal remains provenance/implementation evidence only and must not be treated as a competing bounded-context model.

**Canonical contexts:** Core, CRM, Sales, Inventory, Finance, Website Studio, Marketing, Analytics, Documents.

**Platform capabilities:** Identity, Tenancy, Authorization, Audit, Events, Workflow, Scheduling, Search, Media, Notifications, Integrations, Configuration, AI, SaaS Control, Developer Platform.

**Rationale:** V3 explicitly defines the nine contexts and states that a bounded context is a semantic and ownership boundary, not a feature list. Treating every capability as a context would create false boundaries and fragment the modular-monolith architecture.

**Reopen only if:** new evidence proves independent domain ownership, materially different business semantics, security authority, transactional boundary or operational scaling requirements.

## FD-002 — Scheduling ownership

**Status:** CLOSED / FOUNDER-DELEGATED DECISION — 2026-09-26

**Decision:** Scheduling is a Core-hosted platform capability, not a separate bounded context and not a CRM-owned persistence boundary. Core owns canonical scheduling primitives and appointment/activity scheduling semantics; CRM, Sales, Studio, Marketing and other domains consume them through explicit application contracts. Calendar/provider integrations remain in Integrations.

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
