# ASAS — GATE-00 Vercel / Environment Reconciliation

**Date:** 2026-09-27
**Branch:** `platform-architecture-2026`
**Status:** OPEN — Vercel environment UI is now evidenced; Production branch mapping conflicts with the active engineering line and must be corrected/verified
**Authority:** H0 Foundation Gate Convergence

## Evidence observed

### Vercel environment UI evidence

Founder-provided Vercel Environments screenshot for the ASAS deployment shows:

- Production environment exists.
- Production is currently tracking Git branch **`main`**.
- Production includes the deployment domain **`asasplatform2026.vercel.app`** plus two additional domains indicated by the UI.
- Preview is configured for **all unassigned Git branches** and currently has no custom domains.
- Development is available via CLI and currently has no custom domains.

This is direct founder-provided runtime configuration evidence and supersedes the previous statement that the Production Branch was unknown.

### Critical branch reconciliation

The repository's current engineering policy is that `platform-architecture-2026` is the **sole active engineering work line** for the Engineering Conference / Platform Engineering track. GitHub confirms that branch exists and is the active conference branch.

Therefore the current Vercel configuration creates this mismatch:

```text
GitHub engineering line:
platform-architecture-2026

Vercel Production Branch:
main
```

Under current Vercel behavior, a deployment from `platform-architecture-2026` is therefore not the configured Production deployment merely because it is the ASAS engineering branch; it falls under Preview unless a custom environment/branch mapping says otherwise.

This is now a **real GATE-00 configuration defect**, not an unknown fact.

## Supabase identity

The intended/inspected Supabase project is:

- Display path: `Asas platforme 2026 / Asas platform`
- Project URL: `https://oliiumegstqujwexikhr.supabase.co`
- Project reference: `oliiumegstqujwexikhr`

Read-only introspection previously established that this project currently has no ASAS application tables in `public` and zero Supabase migrations. Therefore the project identity is verified as a Supabase project candidate, but its role as the production application database remains a separate runtime question.

## Vercel / Supabase integration evidence

Founder reports that the paid Supabase/Vercel integration is installed and automatically synchronizes the Supabase/Postgres environment-variable family, including:

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

The existence of these variables is not itself proof that every environment uses the same target. Secret values are intentionally not recorded.

## Current identity matrix

| System | Candidate / setting | Evidence | Status |
|---|---|---|---|
| GitHub | `asas-erp-saas-1/As` | direct repository/branch inspection | VERIFIED |
| Conference branch | `platform-architecture-2026` | direct branch inspection | VERIFIED |
| GitHub default branch | `main` | direct branch inspection | VERIFIED; NOT the active conference line |
| Supabase | `Asas platform` / `oliiumegstqujwexikhr` | project URL + read-only inspection + founder identification | VERIFIED AS INSPECTED CANDIDATE |
| Vercel domain | `asasplatform2026.vercel.app` | founder-provided Vercel Environments screenshot | VERIFIED AS CONFIGURED DOMAIN |
| Vercel Production Branch | `main` | founder-provided Vercel Environments screenshot | VERIFIED CURRENT CONFIGURATION |
| Vercel Preview | all unassigned Git branches | founder-provided screenshot | VERIFIED CURRENT CONFIGURATION |
| Vercel Development | CLI | founder-provided screenshot | VERIFIED CURRENT CONFIGURATION |
| Vercel → Supabase | integration reported; exact environment target still not independently proven | founder report + variable-family evidence | PARTIAL |
| Production runtime → Supabase | exact end-to-end target | not independently verified | OPEN |

## Gate decision

**GATE-00 remains OPEN.**

The reason is no longer "we do not know the Production Branch." We now know it: **Vercel Production tracks `main`**.

That configuration conflicts with the active ASAS engineering rule that `platform-architecture-2026` is the sole active engineering work line. Before claiming GATE-00 green, one of the following must be established and recorded as an explicit founder/architecture decision:

1. Change Vercel Production Branch to `platform-architecture-2026` and keep `main` as a non-production/default repository branch; **preferred for the current conference operating model**; or
2. Explicitly redefine `main` as the production integration line and revise the conference branch policy and all canonical handoff/governance documents accordingly.

The second option would contradict the current working decision and therefore is not the path being executed unless the founder explicitly changes that decision.

## Required next evidence

1. In Vercel Project → Settings → Git, change/confirm Production Branch = `platform-architecture-2026`.
2. Confirm the next Production deployment is sourced from `platform-architecture-2026` and record its commit SHA.
3. Inspect Environment Variables by scope without revealing values.
4. Verify that Production's non-secret Supabase URL corresponds to project ref `oliiumegstqujwexikhr`.
5. Verify database connection target using safe project-reference evidence, not secret disclosure.
6. Keep Preview/Development isolated from Production database credentials unless an explicit, separately reviewed exception exists.
7. After the branch/environment correction, add the machine-readable wrong-project guard before any schema-touching work.

## Safety

No deployment, environment-variable mutation, domain change, database mutation, migration, RLS change, seed, reset, branch creation, or destructive operation was performed during this inspection.

## Decision impact

- GATE-00: **OPEN**
- GATE-03 database reality: **OPEN / runtime target confirmation still required**
- C03–C06 implementation: **BLOCKED by foundation gates**
- No production schema, RLS, reservation, finance, or other database mutation is authorized by this evidence.
