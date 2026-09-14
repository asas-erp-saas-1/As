# ASAS Session State

**Repository:** `asas-erp-saas-1/As`  
**Active branch:** `feat/phase-1-iam-foundation`  
**Last updated:** 2026-09-14

## Current state

- **Canonical project:** `https://github.com/asas-erp-saas-1/As`.
- Historical `asas-erp-saas-1/Asas-website` is **NOT part of this project** and must not be used as brownfield source, production source, schema source, implementation reference, or runtime evidence unless the founder explicitly requests it.
- Persistent AI context protocol is installed.
- Principal engineer operating prompt is installed.
- Founder product truth is recorded.
- Product architecture direction is recorded.
- Phase P and Phase 0 remain the dependency path; Phase 1 is Identity & Access Management.
- Repository `As` remains bootstrap/documentation-only; no application implementation has been added.
- A live Supabase project belonging to `As` is **not yet established/verified**.
- A live Vercel project linked to `asas-erp-saas-1/As` is **not yet established/verified**.
- Therefore Phase P / Phase 0 cannot yet be declared green, and Phase 1 implementation remains blocked.

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
- The Blueprint operating protocol defines **nine bounded contexts**: Core/IAM, CRM, Sales, Inventory, Finance, Website Studio, Marketing, Analytics and Documents. Scheduling is hosted within CRM; public website is a product surface; integrations/workflow/notifications/audit/search are platform capabilities or projections unless the authoritative register says otherwise.
- Registered dotted event identities are the canonical event identities; PascalCase names may only be code symbols mapped one-to-one to the registered event/version.

## Foundation contracts established

- `docs/handoff/CLAUDE-EXECUTION-MASTER.md`
- `docs/handoff/CLAUDE-IMPLEMENTATION-ROADMAP.md`
- `docs/handoff/CLAUDE-SESSION-BOOTSTRAP.md`
- `docs/architecture/FOUNDATION-ENGINEERING-MAP.md`
- `docs/architecture/DOMAIN-CONTRACTS-MAP.md`
- `docs/architecture/CONTEXT-MAP-CANONICALIZATION.md`
- `docs/architecture/STATE-MACHINE-NORMALIZATION.md`
- `docs/architecture/EVENT-TAXONOMY-CONTRACT.md`
- `docs/architecture/AUTHORIZATION-TRACEABILITY.md`
- `docs/architecture/API-CONTRACT-MAP.md`
- `docs/architecture/CONTRACT-TRACEABILITY-MATRIX.md`
- `docs/design/FIGMA-UX-UI-ENGINEERING-CONTRACT.md`
- `docs/ux/GOLDEN-JOURNEYS-UX-SPEC.md`
- `docs/security/THREAT-MODEL-AND-SECURITY-BASELINE.md`
- `docs/integrations/INTEGRATION-AND-PLUGIN-CONTRACT.md`
- `docs/ai/AI-COPILOT-GOVERNANCE.md`
- `docs/quality/QUALITY-GATES-AND-EVIDENCE-MATRIX.md`
- `docs/architecture/FOUNDATION-CLOSURE-GATE.md`
- `docs/architecture/FOUNDATION-CONSISTENCY-AUDIT.md`
- `docs/research/FOUNDATION-TECHNOLOGY-RESEARCH-2026-09.md`
- `docs/audit/FOUNDATION-ADVERSARIAL-GAP-REGISTER.md`

## Verified work completed in this workstream

- Re-verified repository and active branch.
- Re-verified documentation-only execution boundary.
- Measured delivered v1.6.1 package artifacts: 119 tasks, 103 registered events, 50 permissions, 11 state machines, 42 component inventory rows, 59 Prisma models, 17 enums and 69 checksum entries.
- Confirmed the delivered package does not contain the verifier script claimed by its prose documentation; retained as MISSING / NOT VERIFIED.
- Audited domain/context, API, security, quality, UX/Figma and Claude execution contracts.
- Corrected the repository Domain Contracts Map to the nine-context classification stated by the Blueprint operating protocol.
- Added canonical context classification, state-machine normalization contract, event taxonomy/version contract and authorization traceability contract.
- Recorded current primary-source research for Figma MCP, Next.js, Prisma migration/drift and Supabase RLS.
- Performed an independent adversarial review beyond package transcription and recorded 30 additional hardening findings covering concurrency, idempotency, outbox/inbox, object/property authorization, business-flow abuse, audit integrity, finance invariants, money/currency, time, PII lifecycle, secrets/webhooks, observability, SLO/RPO/RTO, migration safety, tenant-negative testing, search/cache/media, AI egress, contract versioning, testing, supply chain, public/private projections and decision traceability.
- Strengthened the foundation closure gate so these failure modes are now explicit closure criteria.
- No application code was created.
- No database schema/migration was created or executed.
- No production DDL, migration, data mutation, reset, force-push, deployment or destructive action was executed.

## Foundation audit verdict

**FOUNDATION ARCHITECTURE: SUBSTANTIALLY SPECIFIED, BUT NOT CLOSED.**

**FOUNDATION CONTRACT NORMALIZATION: STRUCTURE ESTABLISHED; EXACT REGISTER-DERIVED MATRICES STILL TO BE POPULATED/VERIFIED.**

**ADVERSARIAL HARDENING: OPEN — 30 findings recorded; P0 classes require contractual closure and later objective evidence.**

The package remains a strong architectural source, but it is not treated as proof of implementation readiness. External failure-mode analysis has expanded the closure criteria rather than blindly accepting package completeness claims.

## Remaining contract-hardening items

1. Populate exact B.1–B.11 transition edges from the authoritative register; do not invent missing edges.
2. Map every one of the 103 registered events to class/producer/aggregate/command/consumers/version.
3. Map every mutating command to one of the 50 registered permissions plus scope/ABAC/deny semantics, including object-level and property-level authorization.
4. Complete J1–J12 action traceability to commands, permissions, state machines and events.
5. Complete Figma screen/action identifiers for critical journeys.
6. Reconcile the missing package verifier claim.
7. Close the adversarial P0 contracts in `docs/audit/FOUNDATION-ADVERSARIAL-GAP-REGISTER.md`.
8. Define objective evidence for concurrency, idempotency, outbox/inbox, finance invariants, tenant-negative tests, public/private projections and AI tool authorization.

## Remaining execution blockers

### Platform / execution
1. Actual Supabase production project for `As` is not verified.
2. Actual Vercel project for `As` is not verified.
3. Actual production database must be identified before schema-touching Phase 0 work.
4. Required production backup/restore drill cannot be passed before correct project identity is known.
5. Phase 0 tenant isolation, migration baseline/drift, outbox/inbox and observability evidence must be proven before IAM.

### Contract / correctness
6. Exact source-register reconciliation remains required before feature implementation.
7. Package verifier claim remains MISSING / NOT VERIFIED.
8. Critical invariant/security contracts remain OPEN until explicitly specified and later evidenced.

## Active workstream

**Foundation architecture, adversarial research, contract normalization and Claude handoff hardening — documentation/design only.**

## Immediate next gate

Continue in this order:

1. exact register-derived state-machine edges;
2. 103-event producer/aggregate/command/consumer/version matrix;
3. 50-permission command/object/property/scope/ABAC matrix;
4. command registry and domain invariant matrix;
5. idempotency + concurrency + outbox/inbox contract;
6. finance/money/time/data-lifecycle contracts;
7. tenant-negative/public-private/AI egress matrices;
8. J1–J12 command/event traceability;
9. Figma screen/action mapping;
10. package verifier reconciliation;
11. then platform identity and Phase P/0 execution planning.

No stage is considered green because a document exists. Each stage requires authoritative provenance plus a concrete verification method.

## Explicit execution boundary

The founder requested foundation-only work. Do not create application code, database schema, migrations, deployments or production changes in this workstream.

## Evidence vocabulary

VERIFIED / FAILED / BLOCKED / NOT EXECUTED / NOT VERIFIED / OPEN

## Resume rule

A future session receiving "أكمل عملك على المسار" must start from this file, verify `asas-erp-saas-1/As`, review the foundation closure gate, consistency audit and adversarial gap register, and continue contract hardening before any implementation action.
