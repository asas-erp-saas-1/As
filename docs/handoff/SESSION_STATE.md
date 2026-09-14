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
- Repository `As` is bootstrap-only at present; README explicitly states application implementation has not yet been added. fileciteturn32file0L2-L2
- A live Supabase project belonging to `As` is **not yet established**. The connected Supabase account currently exposes only `asas-web-site`, which is excluded from this project.
- A live Vercel project linked to `asas-erp-saas-1/As` is **not yet established**. Existing connected Vercel projects are linked to other repositories.
- Therefore Phase P / Phase 0 cannot yet be declared green, and Phase 1 implementation remains blocked by the v1.6.1 dependency gate. fileciteturn31file0L2-L2

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

## Foundation contracts established

- `docs/handoff/CLAUDE-EXECUTION-MASTER.md` — implementation governance and non-negotiables.
- `docs/handoff/CLAUDE-IMPLEMENTATION-ROADMAP.md` — Gate 00 → Gate 14 execution sequence.
- `docs/handoff/CLAUDE-SESSION-BOOTSTRAP.md` — deterministic Claude read/execute/close protocol. fileciteturn24file0L2-L2
- `docs/architecture/FOUNDATION-ENGINEERING-MAP.md` — platform through release foundations. fileciteturn34file0L2-L2
- `docs/architecture/DOMAIN-CONTRACTS-MAP.md` — bounded contexts, commands, events and invariants. fileciteturn23file0L2-L2
- `docs/architecture/API-CONTRACT-MAP.md` — application/API/public contracts, authorization, tenancy, idempotency and errors. fileciteturn26file0L2-L2
- `docs/design/FIGMA-UX-UI-ENGINEERING-CONTRACT.md` — design-system/Figma/code governance and visual QA. fileciteturn36file0L2-L2
- `docs/ux/GOLDEN-JOURNEYS-UX-SPEC.md` — 12 critical journeys and universal UI states. fileciteturn29file0L2-L2
- `docs/security/THREAT-MODEL-AND-SECURITY-BASELINE.md` — security and trust-boundary baseline. fileciteturn27file0L2-L2
- `docs/integrations/INTEGRATION-AND-PLUGIN-CONTRACT.md` — provider/plugin governance. fileciteturn37file0L2-L2
- `docs/ai/AI-COPILOT-GOVERNANCE.md` — governed AI read/recommend/draft/act model. fileciteturn35file0L2-L2
- `docs/quality/QUALITY-GATES-AND-EVIDENCE-MATRIX.md` — adversarial gates and evidence requirements. fileciteturn25file0L2-L2
- `docs/architecture/FOUNDATION-CLOSURE-GATE.md` — final foundation readiness and blocker matrix.

## Verified work completed in this workstream

- Re-verified repository `asas-erp-saas-1/As` metadata and active branch.
- Re-verified branch contents: bootstrap/product/handoff documentation only; no application implementation.
- Checked GitHub PR state: no PRs currently found for `As`.
- Checked connected Supabase projects: no verified `As` project found.
- Checked connected Vercel projects: no project linked to repository `As` found.
- Re-opened the v1.6.1 task register and confirmed Phase P precedes Phase 0, and Phase 0 must pass before Phase 1.
- Added the P0 dependency verification report.
- Established the complete Claude handoff contract, implementation roadmap and session bootstrap.
- Established domain, API, UX/Figma, security, integration/plugin, AI and quality contracts.
- Established the foundation closure gate.
- No application code was created.
- No database schema/migration was created or executed.
- No production DDL, migration, data mutation, reset, force-push, deployment, or destructive action was executed.

## Foundation audit verdict

**FOUNDATION ARCHITECTURE: SUBSTANTIALLY SPECIFIED.**

The architecture now has explicit contracts across domain boundaries, application/API behavior, UX/UI, Figma, accessibility/i18n, security, integrations/plugins, AI, testing, observability and release governance. The domain contract explicitly requires aggregate/invariant/authorization/event/audit behavior and rejects uncontrolled cross-context mutation. fileciteturn23file0L2-L2

The UX contract treats each critical journey as a governed workflow with states, permissions, commands and visual evidence, including responsive and RTL requirements. fileciteturn29file0L2-L2

The quality contract requires adversarial evidence, not merely a green build. fileciteturn25file0L2-L2

## Remaining hard blockers

1. **Platform identity:** actual Supabase production project for `As` is not verified.
2. **Platform identity:** actual Vercel project for `As` is not verified.
3. **Production reality:** the actual production database must be identified before schema-touching Phase 0 work.
4. **Restore evidence:** production backup/restore drill cannot be truthfully passed before the correct project is identified.
5. **Phase 0 exit:** tenant isolation, migration baseline/drift, outbox and observability must be implemented and evidenced by Claude before IAM.
6. **Package watchlist:** the delivered v1.6.1 package must be measured/checked rather than trusting prose claims, including its claimed verification script and counts.

## Active workstream

**Foundation architecture and Claude handoff hardening — documentation/design only.**

## Immediate next gate

The next meaningful blocker is **platform identity**, not application coding:

1. Identify the actual Supabase production project belonging to `As`.
2. Identify the intended Vercel project for `As`, or establish that it does not yet exist.
3. After Founder GO, Claude executes applicable Phase P tasks only.
4. Claude performs Phase 0 forensic/schema baseline against actual production reality.
5. Claude proves the Phase 0 exit gate.
6. Only then does Claude begin T-1.1 → T-1.9.

## Explicit execution boundary

The founder has requested that the current work remain **foundation-only**. Do not create application code, database schema, migrations, deployments, or production changes in this workstream. The purpose is to prepare the architecture, contracts, UX/UI system, Figma workflow, engineering gates, testing model, security model, observability model, integration/plugin model, AI governance and Claude execution instructions so the later implementation operator can execute safely and coherently.

## Evidence vocabulary

VERIFIED / FAILED / BLOCKED / NOT EXECUTED

## Resume rule

A future session receiving "أكمل عملك على المسار" must start from this file, verify `asas-erp-saas-1/As`, review the foundation closure gate, and verify current platform identity before taking implementation action.
