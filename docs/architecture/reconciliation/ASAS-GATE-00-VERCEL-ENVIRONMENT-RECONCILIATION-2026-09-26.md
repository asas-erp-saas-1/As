# ASAS — GATE-00 Vercel / Environment Reconciliation

**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Status:** OPEN — Vercel project inventory observed; runtime/environment mapping not verified
**Authority:** H0 Foundation Gate Convergence

## Evidence observed

The connected Vercel account exposes the team `asasadz-source's projects` (`team_5Vrk070JxVF2WUzGsJrpxmy9`). The project inventory includes, among others:

- `asas-website` — `prj_hy9IHiqpafv9saKs3zP0Qtjey7DI`
- `asas-erp-saasv2` — `prj_4yF8PAE1axukJh4fWwbZmBGXRKZB`
- `asas-2026` — `prj_vnl1EvczgPMdmv5bwZ3oUoKFHcpv`
- `asas-erp` — `prj_LgH3u7BTA68BEMFZNRh7zXrKYcTs`
- additional historical/experimental ASAS-related projects are present.

`asas-erp-saasv2` is therefore an observed Vercel project candidate, not a verified ASAS runtime identity.

## What is NOT verified

The available connected Vercel tooling did not provide independent evidence in this pass for:

- the Git repository connected to the candidate project;
- production branch mapping;
- preview/development branch mapping;
- production environment variables;
- `NEXT_PUBLIC_SUPABASE_URL` / Supabase project reference mapping;
- `DATABASE_URL` target mapping;
- whether `asas-erp-saasv2` is the active runtime for repository `asas-erp-saas-saas-1/As` (repository identity must be checked against actual project configuration);
- whether another listed Vercel project is the current runtime.

Runtime log queries for the candidate project returned no grouped production or preview runtime-log entries in the inspected seven-day window. This is evidence about observed logs, not proof that the project is unused or inactive.

## Current identity matrix

| System | Candidate | Evidence | Status |
|---|---|---|---|
| GitHub | `asas-erp-saas-1/As` | direct repository/branch inspection | VERIFIED |
| Conference branch | `platform-architecture-2026` | direct branch inspection | VERIFIED |
| Supabase | `Asas platform` / `oliiumegstqujwexikhr` | direct project inspection + read-only DB evidence | VERIFIED AS CANDIDATE |
| Vercel | `asas-erp-saasv2` / `prj_4yF8PAE1axukJh4fWwbZmBGXRKZB` | project inventory | CANDIDATE ONLY |
| Vercel → GitHub | unknown | no independent mapping evidence | UNVERIFIED |
| Vercel → Supabase | unknown | environment mapping unavailable in current evidence | UNVERIFIED |
| Production runtime | unknown | no verified end-to-end chain | UNVERIFIED |

## Gate decision

GATE-00 remains **PARTIAL**.

Do not infer production identity from project names. The historical near-miss involving `asas-web-site` makes name-based inference explicitly unsafe.

## Required next evidence

1. Inspect the candidate Vercel project's actual Git linkage.
2. Inspect environment-variable metadata without exposing secret values.
3. Verify the Supabase project reference associated with each environment.
4. Establish a single machine-readable runtime identity contract.
5. Make schema-touching CI/tasks fail closed when the verified project reference is absent or mismatched.

## Safety

No deployment, environment-variable mutation, domain change, database mutation, migration, or destructive operation was performed.
