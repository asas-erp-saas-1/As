# ASAS — GATE-00 Vercel / Environment Reconciliation

**Date:** 2026-09-27
**Branch:** `platform-architecture-2026`
**Status:** OPEN — Vercel environment UI is evidenced; Production tracks `main`, while the sole active ASAS engineering line is `platform-architecture-2026`
**Authority:** H0 Foundation Gate Convergence

## 1. Current Vercel environment evidence

Founder-provided Vercel Environments screenshot for the ASAS deployment establishes:

- Production exists.
- Production currently tracks Git branch **`main`**.
- Production includes **`asasplatform2026.vercel.app`** plus two additional domains indicated by the UI.
- Preview is configured for **all unassigned Git branches**.
- Development is available through the **Vercel CLI**.

This is direct current configuration evidence and supersedes the previous uncertainty about the Production Branch.

## 2. Current GitHub reality

Direct repository inspection establishes:

- Repository: `asas-erp-saas-1/As`
- GitHub default branch: `main`
- Conference / Platform Engineering work line: `platform-architecture-2026`
- `platform-architecture-2026` is the sole active engineering work line by current founder operating decision.

Therefore the current platform configuration is:

```text
GitHub default branch:
main

ASAS engineering work line:
platform-architecture-2026

Vercel Production Branch:
main
```

This is a **configuration mismatch**, not an identity unknown.

## 3. Why the mismatch matters

Current Vercel documentation states that Production is used for the branch configured as the Production Branch; other Git branches are Preview unless explicitly mapped to another Vercel environment. Vercel supports a custom Production Branch. Current Supabase documentation confirms the same Vercel lifecycle model and explains that Preview is the normal environment for other branches.

Therefore, a deployment from `platform-architecture-2026` cannot be assumed to be Production while Vercel Production still tracks `main`.

**Current external authority:**
- Vercel custom Production Branch: https://vercel.com/blog/custom-production-branch
- Supabase/Vercel environment mapping: https://supabase.com/docs/guides/troubleshooting/vercel-integration-environment-variables-not-syncing-for-persistent-git-branches-b9191e
- Supabase Vercel Marketplace integration: https://supabase.com/docs/guides/integrations/vercel-marketplace
- Supabase environment management: https://supabase.com/docs/guides/deployment/managing-environments

Research date: 2026-09-27.

## 4. Supabase identity currently in evidence

- Display path: `Asas platforme 2026 / Asas platform`
- Project URL: `https://oliiumegstqujwexikhr.supabase.co`
- Project reference: `oliiumegstqujwexikhr`

Read-only introspection previously established zero ASAS application tables in `public` and zero Supabase migrations in this inspected project. This establishes the identity of the inspected Supabase project, but does not by itself prove that it is the application's live Production database.

## 5. Vercel / Supabase integration evidence

Founder reports that the paid Supabase/Vercel integration is installed and automatically synchronizes the Supabase/Postgres environment-variable family. The reported variables are:

- `POSTGRES_URL`
- `POSTGRES_PRISMA_URL`
- `POSTGRES_URL_NON_POOLING`
- `POSTGRES_USER`
- `POSTGRES_HOST`
- `POSTGRES_PASSWORD`
- `POSTGRES_DATABASE`
- `SUPABASE_ANON_KEY`
- `SUPABASE_URL`
- `SUPABASE_SERVICE_ROLE_KEY`
- `SUPABASE_JWT_SECRET`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `NEXT_PUBLIC_SUPABASE_URL`

Current Supabase Marketplace documentation now documents the synchronized family using `SUPABASE_SECRET_KEY`, `SUPABASE_PUBLISHABLE_KEY`, `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY`, and `NEXT_PUBLIC_SUPABASE_URL`, alongside the Postgres variables. This is recorded as **current vendor nomenclature**, not as evidence that the user's existing integration has already renamed its variables. We do not change or rotate credentials during GATE-00.

Secret values are never recorded in repository context.

## 6. Environment model decision

The ASAS conference operating decision is not to create additional Git engineering branches merely to satisfy conventional environment naming.

Current operating model:

```text
platform-architecture-2026
        ↓
Vercel Production (required mapping)
        ↓
Verified Supabase Production project
```

Local development remains local-first. Preview/branching is not promoted to a production-data environment by default.

Important distinction:

`Vercel Environment != Supabase Environment`

The authoritative mapping is:

```text
Vercel deployment environment
        ↓
exact Git branch / deployment commit
        ↓
exact environment-variable scope
        ↓
exact Supabase project/branch identity
        ↓
exact PROJECT_REF
        ↓
evidence
```

Supabase's current environment-management guidance supports separate development/staging/production projects and recommends CI/CD for production migration deployment. ASAS is not adopting a `develop`/`staging` branch merely because that is one documented pattern; any additional environment must be justified by an explicit architecture decision.

## 7. Identity matrix

| System | Setting / identity | Evidence | Status |
|---|---|---|---|
| GitHub repository | `asas-erp-saas-1/As` | direct repository inspection | VERIFIED |
| GitHub default branch | `main` | direct branch inspection | VERIFIED |
| ASAS engineering line | `platform-architecture-2026` | direct branch inspection + founder operating decision | VERIFIED |
| Supabase | `Asas platform` / `oliiumegstqujwexikhr` | supplied URL + project identity + read-only inspection | VERIFIED AS INSPECTED CANDIDATE |
| Vercel domain | `asasplatform2026.vercel.app` | founder-provided Vercel UI evidence | VERIFIED AS OBSERVED DOMAIN |
| Vercel Production Branch | `main` | founder-provided Vercel UI evidence | VERIFIED CURRENT CONFIGURATION |
| Vercel Preview | all unassigned Git branches | founder-provided Vercel UI evidence | VERIFIED CURRENT CONFIGURATION |
| Vercel Development | CLI | founder-provided Vercel UI evidence | VERIFIED CURRENT CONFIGURATION |
| Supabase/Vercel integration | variable family synchronized | founder report + current vendor documentation | PARTIAL |
| Production → Supabase mapping | exact Project Ref | not independently verified | OPEN |
| Production deployment commit | exact SHA + branch | not independently verified | OPEN |

## 8. Gate decision

**GATE-00 remains OPEN.**

The reason is now precisely defined:

1. Vercel Production currently tracks `main`.
2. The sole active ASAS engineering work line is `platform-architecture-2026`.
3. The Production deployment therefore does not yet provide evidence that the current engineering line is the production runtime.
4. The Vercel connector currently returns `403 Forbidden` for project/deployment enumeration, so the runtime commit and environment-variable mapping cannot be independently verified from the connected Vercel API.
5. The Supabase project identity is known, but Production → `oliiumegstqujwexikhr` remains an end-to-end mapping claim until verified.

## 9. Required closure evidence

1. Configure Vercel Production Branch = `platform-architecture-2026`, or make an explicit founder decision to change the ASAS engineering-line policy.
2. Confirm a subsequent Production deployment sourced from `platform-architecture-2026` and record its commit SHA.
3. Inspect Production Environment Variables by **scope only**, without revealing values.
4. Verify Production's Supabase URL/reference corresponds to `oliiumegstqujwexikhr`.
5. Verify the database target through safe project-reference evidence, never by exposing secrets.
6. Add and activate the machine-readable wrong-project guard before schema-touching work.
7. Keep Preview/Development isolated from Production database credentials unless separately reviewed and explicitly authorized.

## 10. Safety boundary

No deployment, environment-variable mutation, domain change, database mutation, migration, RLS change, seed, reset, branch creation, or destructive operation was performed during this inspection.

The only repository-side changes in this continuation are evidence/context updates on `platform-architecture-2026`.

## 11. Decision impact

- GATE-00: **OPEN**
- GATE-03 database reality: **OPEN / runtime target confirmation required**
- C03–C06 implementation: **BLOCKED by foundation gates**
- No production schema, RLS, reservation, finance, or other database mutation is authorized by this evidence.
