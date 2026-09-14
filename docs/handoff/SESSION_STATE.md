# ASAS Session State

**Repository:** `asas-erp-saas-1/As`  
**Active branch:** `feat/phase-1-iam-foundation`  
**Last updated:** 2026-09-14

## Current state

- **Canonical project:** `https://github.com/asas-erp-saas-1/As`.
- The previously inspected `asas-erp-saas-1/Asas-website` is **NOT part of this project** and must not be used as brownfield source, production source, schema source, implementation reference, or runtime evidence for ASAS `As` unless the founder explicitly requests it in a future task.
- Persistent AI context protocol is installed.
- Principal engineer operating prompt is installed.
- Founder product truth is recorded.
- Product architecture direction is recorded.
- Phase P and Phase 0 are the current dependency path; Phase 1 is Identity & Access Management.
- Repository `As` is bootstrap-only at present; README explicitly states application implementation has not yet been added.
- A live Supabase project belonging to `As` is **not yet established**. The connected Supabase account currently exposes only `asas-web-site`, which is excluded from this project.
- A live Vercel project linked to `asas-erp-saas-1/As` is **not yet established**. Existing connected Vercel projects are linked to other repositories.
- Therefore Phase P / Phase 0 cannot yet be declared green, and Phase 1 implementation remains blocked by the v1.6.1 dependency gate.

## Durable decisions

- ASAS target: coherent Real Estate Operating System.
- Three connected surfaces: Public Experience, Studio/Publishing OS, Operations OS.
- Canonical data across website, CRM, ERP and integrations.
- Developer/promoter portfolios are first-class business relationships.
- Agency/tenant owns operational data.
- Future ASAS Group / multi-company expansion must not require architectural rebuild.
- Role/task-oriented UX; one authorization kernel.
- Architecture is challengeable; evidence may justify improvements.
- Do not infer project identity from similarly named historical repositories.

## Verified work completed in this session

- Re-verified repository `asas-erp-saas-1/As` metadata and active branch.
- Re-verified branch contents: bootstrap/product/handoff documentation only; no application implementation.
- Checked GitHub PR state: no PRs currently found for `As`.
- Checked connected Supabase projects: no verified `As` project found.
- Checked connected Vercel projects: no project linked to repository `As` found.
- Re-opened the v1.6.1 task register and confirmed Phase P precedes Phase 0, and Phase 0 must pass before Phase 1.
- Added `docs/audit/P0_DEPENDENCY_VERIFICATION.md` with the evidence matrix and unblock sequence.
- Added `docs/handoff/CLAUDE-EXECUTION-MASTER.md` as the future Claude implementation contract.
- Added `docs/handoff/CLAUDE-IMPLEMENTATION-ROADMAP.md` as the future execution/gate sequence.
- Added `docs/handoff/CLAUDE-SESSION-BOOTSTRAP.md` as deterministic startup/read-order instructions for Claude.
- Added `docs/architecture/FOUNDATION-ENGINEERING-MAP.md` covering platform, repository, domain, data, tenancy, security, UI/UX, Figma, integrations, AI, testing, observability and release foundations.
- Added `docs/architecture/DOMAIN-CONTRACTS-MAP.md` defining bounded-context ownership, aggregates, commands, events and invariants.
- Added `docs/architecture/API-CONTRACT-MAP.md` defining Server Actions/API/public API contracts, authorization, tenant, idempotency, errors and transaction rules.
- Added `docs/design/FIGMA-UX-UI-ENGINEERING-CONTRACT.md` defining Figma, design tokens, components, UX states, visual QA and Figma↔code governance.
- Added `docs/ux/GOLDEN-JOURNEYS-UX-SPEC.md` defining 12 critical UX journeys and universal state/responsive/RTL contracts.
- Added `docs/security/THREAT-MODEL-AND-SECURITY-BASELINE.md` covering tenant breakout, privilege escalation, sessions, reservation races, finance, webhooks, public abuse, Studio, SSRF, secrets and AI boundaries.
- Added `docs/integrations/INTEGRATION-AND-PLUGIN-CONTRACT.md` defining provider adapters, credentials, webhooks, retries, scheduling and future plugin governance.
- Added `docs/ai/AI-COPILOT-GOVERNANCE.md` defining AI read/recommend/draft/act boundaries, tenant isolation, tool permissions, approval and traceability.
- Added `docs/quality/QUALITY-GATES-AND-EVIDENCE-MATRIX.md` defining release gates, adversarial testing and evidence requirements.
- No application code was created.
- No database schema/migration was created or executed.
- No production DDL, migration, data mutation, reset, force-push, deployment, or destructive action was executed.

## Active workstream

**Foundation architecture and Claude handoff hardening — documentation/design only.**

## Immediate next gate

The next meaningful blocker is **platform identity**, not application coding:

1. Identify the actual Supabase production project belonging to `As`.
2. Identify the intended Vercel project for `As`, or establish that it does not yet exist.
3. Once platform identity is verified, execute only the applicable Phase P provisioning tasks — by Claude after founder GO.
4. Then perform Phase 0 forensic/schema baseline against the actual production reality.
5. Only after the Phase 0 exit gate is green, begin T-1.1 → T-1.9 in order.

## Explicit execution boundary

The founder has explicitly requested that the current work remain **foundation-only**. Do not create application code, database schema, migrations, deployments, or production changes in this workstream. The purpose is to prepare the architecture, contracts, UX/UI system, Figma workflow, engineering gates, testing model, security model, observability model, integration/plugin model, AI governance and Claude execution instructions so the later implementation operator can execute safely and coherently.

## Explicit correction

The prior session incorrectly treated `asas-erp-saas-1/Asas-website` as the brownfield source for this project. That conclusion is revoked. It must not influence architecture, schema, migration, IAM, or production decisions for `As`.

## Evidence vocabulary

VERIFIED / FAILED / BLOCKED / NOT EXECUTED

## Resume rule

A future session receiving "أكمل على المسار" must start from this file, then verify repository `asas-erp-saas-1/As` and current platform identity before taking implementation action.
