# ASAS — GATE-00 Platform Identity Evidence

**Updated:** 2026-09-27
**Branch:** `platform-architecture-2026`
**Status:** PARTIAL — Supabase project identity runtime-verified; Vercel production branch/environment mapping remains open
**Authority:** H0 Foundation Gate Convergence

## Verified repository identity

- GitHub repository: `asas-erp-saas-1/As`
- Active engineering line: `platform-architecture-2026`
- Repository default branch: `main`
- Conference/platform engineering work is operated exclusively on `platform-architecture-2026` by current execution policy.

## Supabase platform identity — CLOSED

The connected Supabase integration exposes the ASAS platform project:

- Project: `Asas platform`
- Container: `Asas platforme 2026`
- Ref: `oliiumegstqujwexikhr`
- URL: `https://oliiumegstqujwexikhr.supabase.co`
- Region: `eu-west-1`
- PostgreSQL: 17 / GA release channel

This project is no longer treated as an uncertain candidate. The founder designated it as the ASAS platform project, and the connected Supabase integration independently exposes and verifies the same project identity.

## Live read-only introspection

Read-only introspection was executed against `oliiumegstqujwexikhr`.

Observed:

- database: `postgres`
- PostgreSQL server version: `17.6`
- cluster: `main`
- no ASAS application base tables exist in the `public` schema at this architecture stage.
- observed non-system base tables are Supabase-managed `auth`, `realtime`, `storage`, or `vault` tables.
- no ASAS application tables such as `projects`, `buildings`, `apartments`, `units`, `listings`, `reservations`, `offers`, `holds`, `price_versions`, or `outbox_events` were observed in `public`.
- Supabase migration inventory for this project currently returns zero migrations.

The lack of ASAS application tables is **not a project-identity contradiction**. It is consistent with the explicit conference rule that schema creation and database implementation have not yet been authorized.

## Vercel deployment attestation

The founder has explicitly reported that the ASAS project is deployed to Vercel and connected to `asas-erp-saas-1/As`.

Recorded candidate:

- Vercel project id: `prj_4yF8PAE1axukJh4fWwbZmBGXRKZB`
- Vercel project name: `asas-erp-saasv2`
- Primary domain: `asasplatform2026.vercel.app`

The Vercel integration available to this execution environment does not independently expose enough project/environment linkage to prove the complete runtime chain:

`GitHub repository → exact branch → Vercel production deployment → production environment variables → Supabase project ref`

Therefore Vercel runtime mapping remains **OPEN**. This is not uncertainty about the founder-designated Supabase project.

## GATE-00 remaining blockers

1. Independently verify the Vercel project identity.
2. Independently verify the Vercel production deployment branch and commit.
3. Verify production environment variable scope.
4. Verify production Vercel → Supabase mapping to `oliiumegstqujwexikhr`.
5. Retain the machine-checkable wrong-project/schema-touch guard before any schema implementation.
6. Repository protection/control evidence remains open.

## Safety

No DDL, migration, RLS change, seed, reset, branch creation, or destructive operation was performed during this inspection.

## Decision impact

**Supabase project identity ambiguity: CLOSED.**

**GATE-00: OPEN** until the remaining Vercel/repository-control evidence is closed.

**GATE-03 database implementation:** not authorized by this evidence.
