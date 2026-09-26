# ASAS — GATE-00 Platform Identity Evidence

**Updated:** 2026-09-27
**Branch:** `platform-architecture-2026`
**Status:** PARTIAL — repository and Supabase candidate verified; Vercel deployment is founder-attested but environment/runtime mapping remains independently unverified
**Authority:** H0 Foundation Gate Convergence

## Verified repository identity

- GitHub repository: `asas-erp-saas-1/As`
- Active engineering line: `platform-architecture-2026`
- Repository default branch: `main`
- Conference/platform engineering work is operated exclusively on `platform-architecture-2026` by current execution policy.

## Verified Supabase candidate

The connected Supabase account exposes two projects in the same organization:

1. `asas-web-site` — ref `xwokfufeeodobkuaxvgx`, region `eu-west-1`, PostgreSQL 17.
2. `Asas platform` — ref `oliiumegstqujwexikhr`, region `eu-west-1`, PostgreSQL 17, GA release channel.

For the current Platform Engineering track, `Asas platform` is the explicitly named platform project and is therefore the inspected candidate. This is an evidence record, not a claim that every application environment already points to it.

## Live read-only introspection

Read-only introspection was executed against `oliiumegstqujwexikhr`.

Observed:

- database: `postgres`
- PostgreSQL server version: `17.6`
- cluster: `main`
- no base tables exist in the `public` schema.
- observed non-system base tables are Supabase-managed `auth`, `realtime`, `storage`, or `vault` tables.
- no ASAS application tables such as `projects`, `buildings`, `apartments`, `units`, `listings`, `reservations`, `offers`, `holds`, `price_versions`, or `outbox_events` were observed in `public`.
- Supabase migration inventory for this project currently returns zero migrations.

## Security observation

RLS posture was inspected read-only on non-system tables. Supabase-managed schemas contain a mixture of RLS-enabled and non-RLS tables. This must not be interpreted as the ASAS application security baseline because no ASAS application tables currently exist in `public` on this inspected project.

## Vercel deployment attestation

The founder has explicitly reported that an ASAS project has been deployed to Vercel and connected to the GitHub repository `asas-erp-saas-1/As`.

The current candidate previously recorded for reconciliation is:

- Vercel project id: `prj_4yF8PAE1axukJh4fWwbZmBGXRKZB`
- Vercel project name: `asas-erp-saasv2`

This founder attestation is useful evidence of intended deployment state, but it is **not equivalent to independently verified runtime evidence**. The connected Vercel integration currently does not expose sufficient project/environment linkage to prove, from this execution environment, all of the following:

`GitHub repository → exact branch → Vercel production deployment → production environment variables → Supabase project ref`

Therefore the Vercel mapping remains OPEN rather than being promoted to VERIFIED.

## Critical interpretation

The inspected `Asas platform` project is currently a Supabase platform shell with no ASAS application persistence in `public`, not an observed brownfield application database containing the previously discussed Unit/Apartment/Reservation model.

Therefore prior repository/source observations of schema/model counts remain source-package evidence only. They are not live database evidence.

## Remaining GATE-00 blockers

1. Independently verify the Vercel project identity.
2. Independently verify the Vercel production deployment branch and commit.
3. Verify the production environment mapping to `oliiumegstqujwexikhr`.
4. Verify whether another Supabase project/database is the actual runtime target for an existing ASAS application deployment.
5. Retain a machine-checkable wrong-project/schema-touch guard before any schema implementation.

## Safety

No DDL, migration, RLS change, seed, reset, branch creation, or destructive operation was performed during this inspection.

## Decision impact

GATE-00 remains **PARTIAL / OPEN**.

GATE-03 database reality remains **OPEN / REQUIRES RUNTIME TARGET CONFIRMATION**.

No production schema, RLS, reservation, finance, or other database mutation is authorized by this evidence.
