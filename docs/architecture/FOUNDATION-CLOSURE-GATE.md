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
| Domain contracts | READY for review; adversarial gaps OPEN |
| API/application boundary | READY structurally; abuse/idempotency/property controls OPEN |
| Data integrity | BLOCKED on real production identity; concurrency/finance invariants OPEN |
| Tenancy/RLS | BLOCKED until Phase 0 implementation/evidence; negative-path matrix OPEN |
| IAM | BLOCKED until Phase 0 exit; object/property authorization closure OPEN |
| State-machine normalization contract | ESTABLISHED; exact register-derived edges still required |
| Event taxonomy/version contract | ESTABLISHED; 103-event mapping plus outbox/inbox semantics OPEN |
| Authorization traceability | ESTABLISHED structurally; exact 50-permission command mapping still required |
| UX/Figma traceability | STRUCTURE ESTABLISHED; exact critical-flow IDs still required |
| Finance | DESIGN READY; accounting invariants/rounding/period rules OPEN |
| Inventory | DESIGN READY; reservation concurrency proof OPEN |
| CRM | DESIGN READY |
| Studio | DESIGN READY; public/private projection and media security OPEN |
| Integrations/plugins | DESIGN READY; secret/webhook/egress controls OPEN |
| AI | DESIGN READY; tool-level data-egress controls OPEN |
| Security | BASELINE READY; adversarial closure OPEN |
| Quality/evidence | STRUCTURE READY; invariant/concurrency/negative tests OPEN |
| Claude handoff | READY for constrained execution after gates |
| Platform identity | BLOCKED |

## 3. New adversarial closure layer

The package is not treated as complete merely because its registers and prose are internally coherent. An independent failure-mode review has added `docs/audit/FOUNDATION-ADVERSARIAL-GAP-REGISTER.md`.

The review identified **30 additional hardening findings**, with the highest-risk classes being:

- reservation concurrency and duplicate-winner prevention;
- durable idempotency semantics;
- transactional outbox relay/inbox behavior;
- object-level and property-level authorization;
- sensitive-business-flow abuse controls;
- append-only/tamper-evident audit behavior;
- accounting invariants and money/currency semantics;
- PII lifecycle and retention;
- secrets and webhook replay/security;
- observability correlation and SLO/RPO/RTO;
- migration safety;
- tenant-negative testing across every access path;
- AI tool/data egress controls;
- public/private projection boundaries;
- invariant/property/concurrency test strategy.

This adversarial layer is now part of the closure criteria.

## 4. Hard blockers before Claude implementation

### B1 — Platform identity
The actual Supabase production project for `As` is not verified. The actual Vercel project for `As` is not verified. Do not infer either from similarly named projects.

### B2 — Production reality
The v1.6.1 path requires inspection of the actual production schema before schema-touching work. Without the real database identity, Phase 0 forensic reconciliation cannot truthfully pass.

### B3 — Restore evidence
The required production protection/restore drill cannot be claimed until the correct production project is identified, and RPO/RTO targets must be explicit.

### B4 — Phase 0 exit gate
Tenant isolation, migration baseline/drift protection, transactional outbox/inbox semantics and observability must be proven before Phase 1 IAM implementation.

### B5 — Exact register traceability
Before business-feature implementation, the implementation operator must resolve the exact state-machine, event and permission mappings from the authoritative registers. The normalization documents define the structure; they do not authorize inventing missing semantics.

### B6 — Critical invariant closure
Before implementation readiness, the architecture must specify verification for reservation single-winner, finance balance/allocation, idempotency replay, audit append-only behavior and cross-tenant negative paths.

### B7 — Public/private and AI data boundaries
Public projections and AI tools must have explicit field/tool allowlists and tenant-aware authorization before either surface can be considered production-safe.

## 5. Package consistency watchlist

Direct inspection of the delivered package found measurable prose/artifact discrepancies:

- tasks: **119 measured** vs **114 described in AGENTS prose**;
- Prisma enums: **17 measured** vs **16 described in AGENTS prose**;
- production table count: conflicting prose references **15** and **16**; live DB is UNKNOWN until introspected;
- claimed verifier script: **MISSING / NOT VERIFIED**.

Full detail is recorded in `docs/audit/PACKAGE-CONSISTENCY-REPORT.md`.

A prose claim is not evidence until the underlying artifact is present and inspected.

## 6. Required closure sequence

The next workstream is no longer “implement Phase 1.” It is:

1. authoritative register reconciliation;
2. adversarial domain invariants;
3. command/permission/object/property authorization matrix;
4. concurrency + idempotency + outbox/inbox contract;
5. tenant-negative access matrix;
6. finance invariants and money/time/data lifecycle contracts;
7. public/private projection + media + AI egress boundaries;
8. observability + SLO/RPO/RTO + recovery evidence design;
9. security/supply-chain/migration gates;
10. Golden Journey → Figma → command → permission → event → test evidence;
11. only then platform identity / Phase P/0 execution planning.

No stage is green merely because a document exists. Each stage needs an authoritative source and an objective verification method.

## 7. Claude execution contract

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
20. `docs/audit/FOUNDATION-ADVERSARIAL-GAP-REGISTER.md`
21. relevant Blueprint chapter/register/ADR/skill.

Then execute Gate 00 before implementation. Gate 01 and Gate 02 must pass before Phase 1.

## 8. UI/Figma non-negotiable

For UI work:

`task → persona/job → golden journey → Figma node/context → variables/components → states → permissions → command → implementation → accessibility → RTL/LTR → responsive → visual regression`

Figma does not redefine domain behavior. Code does not invent a second token system. Screenshots are evidence, not the source of business truth.

## 9. Technology research gate

The current primary-source research pass found no reason to change the chosen foundation architecture. The new adversarial pass strengthens, rather than replaces, the existing choices:

- PostgreSQL supports row-level locking appropriate for protecting high-contention business invariants when used correctly. citeturn0search0
- Prisma documents interactive transactions, idempotent APIs and optimistic concurrency control for read-modify-write workflows. citeturn0search5turn0search9
- OWASP identifies object-level/property-level authorization, sensitive business-flow abuse and unrestricted resource consumption as major API risks. citeturn0search1turn0search4turn0search6turn0search8
- OpenTelemetry provides semantic conventions across traces, metrics, logs and events, supporting a consistent correlation vocabulary. citeturn0search3turn0search7turn0search10
- Supabase documents daily backups and PITR behavior; recovery targets must be selected and verified rather than assumed. citeturn0search14
- NIST SSDF provides a secure-development framework for integrating security into the SDLC. citeturn0search19turn0search22

Version-sensitive facts must be re-verified when the corresponding implementation task starts.

## 10. Release stop conditions

Stop the release for any reproducible tenant breakout, financial invariant violation, duplicate reservation winner, idempotency replay that creates duplicate side effects, outbox loss/corruption, default-allow protected route, unauthorized property exposure, unsafe migration, critical accessibility failure, missing critical evidence, secret exposure, unsafe webhook replay, unverified provider trust, public/private data leak, AI tool authorization bypass, or material production-contract contradiction.

## 11. Founder GO boundary

Before Founder GO:

- documentation/design/handoff work is allowed;
- research and contract refinement are allowed;
- no application implementation;
- no database schema/migrations;
- no production deployment or mutation.

After Founder GO, Claude may execute only the approved roadmap and must preserve the same stop conditions.

## 12. Current verdict

**FOUNDATION ARCHITECTURE: SUBSTANTIALLY SPECIFIED, BUT NOT CLOSED.**

**FOUNDATION NORMALIZATION: STRUCTURALLY ESTABLISHED; EXACT REGISTER-TRACEABILITY STILL OPEN.**

**ADVERSARIAL HARDENING: OPEN — 30 findings recorded; P0 classes must be contractually closed before implementation readiness.**

**IMPLEMENTATION READINESS: BLOCKED by platform identity, Phase P/Phase 0 evidence, exact register-derived traceability, and critical invariant/security closure.**

**APPLICATION IMPLEMENTATION: NOT AUTHORIZED in this workstream.**

**DATABASE IMPLEMENTATION: NOT AUTHORIZED in this workstream.**
