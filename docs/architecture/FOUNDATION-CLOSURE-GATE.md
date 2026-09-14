# ASAS Foundation Closure Gate

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.
**Date:** 2026-09-14
**Purpose:** final pre-execution checklist for the architecture, UX/UI, Figma, security, quality, integration and Claude handoff foundation.

## 1. Closure principle

The foundation is complete enough for implementation only when every architectural rule has an authoritative source, every critical risk has a verification method, and every unresolved dependency is explicitly marked BLOCKED rather than silently approximated.

This document does not authorize implementation. It determines readiness for a future Founder GO.

## 2. Foundation areas

| Area | Required contract | Current status |
|---|---|---|
| Product truth | Product Truth + architecture direction | READY |
| Repository identity | Canonical `asas-erp-saas-1/As` | VERIFIED |
| Domain boundaries | Domain Contracts Map | READY |
| API/application boundary | API Contract Map | READY |
| Data integrity | Blueprint + database foundation rules | BLOCKED on real production identity |
| Tenancy/RLS | Foundation map + security baseline | BLOCKED until Phase 0 implementation/evidence |
| IAM | v1.6.1 Phase 1 register + master contract | BLOCKED until Phase 0 exit |
| State machines | v1.6.1 machines/register | READY FOR IMPLEMENTATION REVIEW; remaining prose machines must be canonicalized where required by the register |
| Events/outbox | Blueprint + domain contract | READY FOR IMPLEMENTATION |
| Finance | Blueprint finance invariants | READY FOR IMPLEMENTATION |
| Inventory | Blueprint dual-axis/race rules | READY FOR IMPLEMENTATION |
| CRM | Golden journeys + domain contract | READY FOR IMPLEMENTATION |
| Studio | Figma/UX + domain contract | READY FOR IMPLEMENTATION |
| Integrations/plugins | Integration contract | READY FOR IMPLEMENTATION REVIEW |
| AI | AI governance | READY FOR IMPLEMENTATION REVIEW |
| UX/UI | Golden Journeys + Figma contract | READY FOR DESIGN/IMPLEMENTATION |
| Design system | Blueprint component/token register + Figma contract | READY FOR DESIGN/IMPLEMENTATION |
| Accessibility | Quality gate + UX contract | READY FOR IMPLEMENTATION |
| i18n/RTL | UX/design contracts | READY FOR IMPLEMENTATION |
| Security | Threat Model baseline | READY FOR IMPLEMENTATION |
| Quality/evidence | Quality Gates Matrix | READY FOR IMPLEMENTATION |
| Claude handoff | Master + Bootstrap + Roadmap | READY |
| Platform identity | P0 dependency verification | BLOCKED |

## 3. Hard blockers before Claude implementation

### B1 — Platform identity
The actual Supabase production project for `As` is not verified. The actual Vercel project for `As` is not verified. Do not infer either from similarly named projects.

### B2 — Production reality
The v1.6.1 path requires inspection of the actual production schema before schema-touching work. Without the real database identity, Phase 0 forensic reconciliation cannot truthfully pass.

### B3 — Restore evidence
The required production protection/restore drill cannot be claimed until the correct production project is identified.

### B4 — Phase 0 exit gate
Tenant isolation, migration baseline/drift protection, transactional outbox and observability must be proven before Phase 1 IAM implementation.

## 4. Package consistency watchlist

The implementation operator must verify package claims against the delivered package before execution. In particular:

- the package README claims a verification script and a quantified verification set; the delivered package must be checked for the actual script before relying on that claim;
- the Blueprint/register/schema/component counts must be measured from the delivered files, not copied from prose;
- prose-defined state machines must be reconciled with the machine-readable register before implementation where the register requires structured transitions;
- repository naming in the package must not override the founder's canonical repository identity.

A package claim is not evidence until the artifact exists and is inspected.

## 5. Claude execution contract

Claude must read, in order:

1. `AGENTS.md`
2. `docs/product/PRODUCT_TRUTH.md`
3. `docs/product/PRODUCT_ARCHITECTURE_DIRECTION.md`
4. `docs/handoff/SESSION_STATE.md`
5. `docs/handoff/CLAUDE-EXECUTION-MASTER.md`
6. `docs/architecture/FOUNDATION-ENGINEERING-MAP.md`
7. `docs/architecture/DOMAIN-CONTRACTS-MAP.md`
8. `docs/architecture/API-CONTRACT-MAP.md`
9. `docs/design/FIGMA-UX-UI-ENGINEERING-CONTRACT.md`
10. `docs/ux/GOLDEN-JOURNEYS-UX-SPEC.md`
11. `docs/security/THREAT-MODEL-AND-SECURITY-BASELINE.md`
12. `docs/integrations/INTEGRATION-AND-PLUGIN-CONTRACT.md`
13. `docs/ai/AI-COPILOT-GOVERNANCE.md`
14. `docs/quality/QUALITY-GATES-AND-EVIDENCE-MATRIX.md`
15. relevant Blueprint chapter/register/ADR/skill.

Then it must execute Gate 00 before any implementation. Gate 01 and Gate 02 must pass before Phase 1.

## 6. UI/Figma non-negotiable

For UI work the implementation chain is:

`task → persona/job → golden journey → Figma node/context → variables/components → states → permissions → command → implementation → accessibility → RTL/LTR → responsive → visual regression`

Figma does not redefine domain behavior. Code does not invent a second token system. Screenshots are evidence, not the source of business truth.

## 7. Release stop conditions

Stop the release for any reproducible tenant breakout, financial invariant violation, duplicate reservation winner, default-allow protected route, unsafe migration, critical accessibility failure, missing critical evidence, secret exposure, unverified provider trust, or material production-contract contradiction.

## 8. Founder GO boundary

Before Founder GO:

- documentation/design/handoff work is allowed;
- research and contract refinement are allowed;
- no application implementation;
- no database schema/migrations;
- no production deployment or mutation.

After Founder GO, Claude may execute only the approved roadmap and must preserve the same stop conditions.

## 9. Current verdict

**FOUNDATION ARCHITECTURE: substantially specified.**

**IMPLEMENTATION READINESS: BLOCKED by platform identity and Phase P/Phase 0 evidence.**

**APPLICATION IMPLEMENTATION: NOT AUTHORIZED in this workstream.**

**DATABASE IMPLEMENTATION: NOT AUTHORIZED in this workstream.**
