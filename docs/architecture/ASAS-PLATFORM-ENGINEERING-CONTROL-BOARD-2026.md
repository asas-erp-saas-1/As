# ASAS — Platform Engineering Control Board

**Branch:** `platform-architecture-2026`  
**Date:** 2026-09-27  
**Status:** ACTIVE

## Operating model

```text
ENGINEERING CONFERENCE
  semantic truth
        ↓
PLATFORM ENGINEERING
  repository + runtime truth
        ↓
RECONCILIATION
        ↓
IMPLEMENTATION
        ↓
VERIFICATION
        ↓
EVIDENCE
        ↓
CHECKPOINT
```

The V3 engineering model requires a Reality Lock before planning and implementation. GATE-00 establishes platform identity; GATE-03 establishes live database reality; GATE-07 authorizes implementation only after foundation gates pass.

## Active workstreams

| Workstream | Current state | Next evidence |
|---|---|---|
| Engineering Conference | C01 closed; C02 semantic closure; C03.1–C03.12 closed; C03.13 open; C04 CRM semantic closure; C05 Sales semantic closure; C06 Finance open | Finance semantic closure + C03.13 brownfield evidence |
| GATE-00 Platform Identity | **NOT CLOSED / EXTERNAL ACCESS BLOCKER** | Vercel project/environment mapping + production branch + Supabase reference |
| Brownfield Persistence | OPEN | Verified runtime target + read-only introspection |
| Schema Contract | BLOCKED | Drift matrix + live evidence |
| Security / RLS | BLOCKED | Live policy evidence |
| State Register | Semantic basis exists | Runtime mutation reconciliation |
| Event Register | Semantic basis exists | Outbox/runtime reconciliation |
| Reservation | Semantic boundary closed | Concurrency implementation after DB evidence |
| CI / Architecture Gates | Existing foundation workflow | Re-run after current control-plane changes |
| Repository Hygiene | Active | Gate-06 verification |

## GATE-00 evidence boundary — 2026-09-27

Verified:

- GitHub repository identity: `asas-erp-saas-1/As`.
- Conference/engineering branch: `platform-architecture-2026`.
- Supabase project `Asas platform` (`oliiumegstqujwexikhr`) exists and is `ACTIVE_HEALTHY` on PostgreSQL 17.6.
- Read-only SQL introspection shows **0 tables in `public`**; only Supabase-managed schemas/tables are present.

Not verified:

- Vercel project identity for the canonical `As` repository.
- Production branch mapping.
- Development/preview mapping.
- Vercel environment variable mapping to the Supabase project ref.
- Proof that `oliiumegstqujwexikhr` is the runtime database for `As`.

The connected Vercel API returned `403 Forbidden` while attempting project discovery. Therefore GATE-00 remains open. The candidate Vercel identifier stored in `config/platform-identity.json` remains evidence only.

## Decision rule

A semantic decision may be recorded before implementation, but it cannot be represented as runtime fact until repository/runtime evidence exists.

## Current hard blockers

1. GATE-00 runtime mapping is not independently proven because Vercel environment access is unavailable through the current integration.
2. Live application database identity is not locked.
3. Executable Prisma/schema promotion is not authorized.
4. Reservation enforcement mechanism is not selected until actual persistence is reconciled.
5. RLS/security verification is not complete.
6. Current CI status has not been rerun after the latest control-plane changes.

## Engineering principles

- Database reality outranks documentation for existing brownfield structures.
- Extend; never blindly rewrite.
- Contracts precede data work.
- Authorization precedes mutation.
- State changes use governed state transitions.
- Money uses integer centimes and immutable posted ledger facts.
- Evidence precedes claims.
- Every defect fix receives a regression test when implementation begins.
- No destructive production action without the required human authorization.

## Next execution packets

### Foundation track
`ASAS-TASK-Q1-SCHEMA-05-RUNTIME-IDENTITY-AND-READONLY-INTROSPECTION-2026-09-26.md`

Read-only evidence is complete for the candidate Supabase project; runtime mapping remains blocked on Vercel access.

### Conference track
`ASAS-TASK-C06-FINANCE-ENGINEERING-CONFERENCE-2026-09-26.md`

Finance semantic work may continue at the contract/ADR level because it does not require environment mutation. It must not authorize implementation until GATE-00 through GATE-06 are closed.

## Source basis

The canonical V3 requires Reality Lock → repository/database verification → schema reconciliation → architecture-as-code gates → security/RLS gates → state/event/permission gates → implementation.

The AI developer protocol requires diagnosis, research, alternatives, verification, and exact blocker reporting rather than stopping at an error.