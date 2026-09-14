# ASAS Foundation Closure Gate

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.
**Date:** 2026-09-14
**Purpose:** final pre-execution checklist for the architecture, UX/UI, Figma, security, quality, integration and Claude handoff foundation.

## 1. Closure principle

The foundation is complete enough for implementation only when every architectural rule has an authoritative source, every critical risk has a verification method, and every unresolved dependency is explicitly marked BLOCKED rather than silently approximated.

This document does not authorize implementation. It determines readiness for a future Founder GO.

## 2. Foundation areas

| Area | Current status |
|---|---|
| Product truth | READY |
| Repository identity | VERIFIED |
| Canonical nine-context map | ESTABLISHED; Gate 00 source reconciliation required |
| Domain contracts | READY for review |
| API/application boundary | READY |
| Data integrity | BLOCKED on real production identity |
| Tenancy/RLS | BLOCKED until Phase 0 implementation/evidence |
| IAM | BLOCKED until Phase 0 exit |
| State-machine normalization contract | ESTABLISHED; exact register-derived edges still required before each lifecycle implementation |
| Event taxonomy/version contract | ESTABLISHED; 103-event mapping still required |
| Authorization traceability | ESTABLISHED structurally; exact 50-permission command mapping still required |
| UX/Figma traceability | STRUCTURE ESTABLISHED; exact critical-flow IDs still required |
| Finance | READY for implementation review |
| Inventory | READY for implementation review |
| CRM | READY for implementation review |
| Studio | READY for implementation review |
| Integrations/plugins | READY for implementation review |
| AI | READY for implementation review |
| Security | READY for implementation review |
| Quality/evidence | READY |
| Claude handoff | READY |
| Platform identity | BLOCKED |

## 3. Hard blockers before Claude implementation

### B1 — Platform identity
The actual Supabase production project for `As` is not verified. The actual Vercel project for `As` is not verified. Do not infer either from similarly named projects.

### B2 — Production reality
The v1.6.1 path requires inspection of the actual production schema before schema-touching work. Without the real database identity, Phase 0 forensic reconciliation cannot truthfully pass.

### B3 — Restore evidence
The required production protection/restore drill cannot be claimed until the correct production project is identified.

### B4 — Phase 0 exit gate
Tenant isolation, migration baseline/drift protection, transactional outbox and observability must be proven before Phase 1 IAM implementation.

### B5 — Exact register traceability
Before business-feature implementation, the implementation operator must resolve the exact state-machine, event and permission mappings from the authoritative registers. The new normalization documents define the structure; they do not authorize inventing missing semantics.

## 4. Package consistency watchlist

Direct inspection of the delivered package found measurable prose/artifact discrepancies:

- tasks: **119 measured** vs **114 described in AGENTS prose**;
- Prisma enums: **17 measured** vs **16 described in AGENTS prose**;
- production table count: conflicting prose references **15** and **16**; live DB is UNKNOWN until introspected;
- claimed verifier script: **MISSING / NOT VERIFIED**.

Full detail is recorded in `docs/audit/PACKAGE-CONSISTENCY-REPORT.md`.

A prose claim is not evidence until the underlying artifact is present and inspected.

## 5. Claude execution contract

Claude must read, in order:

1. `AGENTS.md`
2. `docs/product/PRODUCT_TRUTH.md`
3. `docs/product/PRODUCT_ARCHITECTURE_DIRECTION.md`
4. `docs/handoff/SESSION_STATE.md`
5. `docs/handoff/CLAUDE-EXECUTION-MASTER.md`
6. `docs/architecture/FOUNDATION-ENGINEERING-MAP.md`
7. `docs/architecture/CONTEXT-MAP-CANONICALIZATION.md`
8. `docs/architecture/DOMAIN-CONTRACTS-MAP.md`
9. `docs/architecture/STATE-MACHINE-NORMALIZATION.md`
10. `docs/architecture/EVENT-TAXONOMY-CONTRACT.md`
11. `docs/architecture/AUTHORIZATION-TRACEABILITY.md`
12. `docs/architecture/API-CONTRACT-MAP.md`
13. `docs/architecture/CONTRACT-TRACEABILITY-MATRIX.md`
14. `docs/design/FIGMA-UX-UI-ENGINEERING-CONTRACT.md`
15. `docs/ux/GOLDEN-JOURNEYS-UX-SPEC.md`
16. `docs/security/THREAT-MODEL-AND-SECURITY-BASELINE.md`
17. `docs/integrations/INTEGRATION-AND-PLUGIN-CONTRACT.md`
18. `docs/ai/AI-COPILOT-GOVERNANCE.md`
19. `docs/quality/QUALITY-GATES-AND-EVIDENCE-MATRIX.md`
20. relevant Blueprint chapter/register/ADR/skill.

Then execute Gate 00 before implementation. Gate 01 and Gate 02 must pass before Phase 1.

## 6. UI/Figma non-negotiable

For UI work:

`task → persona/job → golden journey → Figma node/context → variables/components → states → permissions → command → implementation → accessibility → RTL/LTR → responsive → visual regression`

Figma does not redefine domain behavior. Code does not invent a second token system. Screenshots are evidence, not the source of business truth.

## 7. Current technology research gate

The current primary-source research pass found no reason to change the foundation architecture. Current official sources confirm:

- Figma MCP supports structured design context for Claude Code and recommends remote MCP for most users. citeturn0search1turn0search15
- Next.js continues to document App Router and Server Components as the current modern routing model. citeturn0search4
- Prisma documents migration/drift verification and reproducible migration history. citeturn0search2turn0search5turn0search12
- Supabase documents PostgreSQL RLS as database-level defense in depth and recommends explicit policy tests. citeturn0search0turn0search16

Version-sensitive facts must be re-verified when the corresponding implementation task starts.

## 8. Release stop conditions

Stop the release for any reproducible tenant breakout, financial invariant violation, duplicate reservation winner, default-allow protected route, unsafe migration, critical accessibility failure, missing critical evidence, secret exposure, unverified provider trust, or material production-contract contradiction.

## 9. Founder GO boundary

Before Founder GO:

- documentation/design/handoff work is allowed;
- research and contract refinement are allowed;
- no application implementation;
- no database schema/migrations;
- no production deployment or mutation.

After Founder GO, Claude may execute only the approved roadmap and must preserve the same stop conditions.

## 10. Current verdict

**FOUNDATION ARCHITECTURE: SUBSTANTIALLY SPECIFIED.**

**FOUNDATION NORMALIZATION: STRUCTURALLY ESTABLISHED; EXACT REGISTER-TRACEABILITY STILL OPEN.**

**IMPLEMENTATION READINESS: BLOCKED by platform identity, Phase P/Phase 0 evidence, and exact register-derived traceability.**

**APPLICATION IMPLEMENTATION: NOT AUTHORIZED in this workstream.**

**DATABASE IMPLEMENTATION: NOT AUTHORIZED in this workstream.**
