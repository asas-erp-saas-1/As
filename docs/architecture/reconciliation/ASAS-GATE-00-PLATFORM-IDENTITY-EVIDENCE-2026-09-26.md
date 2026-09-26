# ASAS — GATE-00 Platform Identity Evidence

**Date:** 2026-09-26
**Branch:** `platform-architecture-2026`
**Status:** PARTIAL — repository and Supabase platform identity verified; Vercel/environment mapping not yet independently verified
**Authority:** H0 Foundation Gate Convergence

## Verified repository identity

- GitHub repository: `asas-erp-saas-1/As`
- Architecture branch: `platform-architecture-2026`
- Repository default branch: `main`
- Conference work remains exclusively on `platform-architecture-2026` by current execution policy.

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
- all observed non-system base tables are Supabase-managed `auth`, `realtime`, `storage`, or `vault` tables.
- no ASAS application tables such as `projects`, `buildings`, `apartments`, `units`, `listings`, `reservations`, `offers`, `holds`, `price_versions`, or `outbox_events` were observed in `public`.
- Supabase migration inventory for this project currently returns zero migrations.

## Security observation

RLS posture was inspected read-only on non-system tables. Supabase-managed schemas contain a mixture of RLS-enabled and non-RLS tables. This must not be interpreted as the ASAS application security baseline because no ASAS application tables currently exist in `public` on this inspected project.

## Critical interpretation

This is the first independent runtime evidence for the platform candidate, and it materially changes the brownfield hypothesis:

> The inspected `Asas platform` project is currently a Supabase platform shell with no ASAS application persistence in `public`, not an observed brownfield application database containing the previously discussed Unit/Apartment/Reservation model.

Therefore the prior repository/source observations of 59/17/56 models remain source-package evidence only. They are not live database evidence.

## Remaining GATE-00 blockers

- Verify Vercel project identity and environment mapping.
- Verify application environment variables map the intended ASAS runtime to `oliiumegstqujwexikhr` rather than `asas-web-site`.
- Verify whether another Supabase project/database is the actual runtime target for an existing ASAS application deployment.
- Add a machine-checkable wrong-project/schema-touch guard before any schema implementation.

## Safety

No DDL, migration, RLS change, seed, reset, branch creation, or destructive operation was performed during this inspection.

## Decision impact

GATE-00 is **PARTIAL**, not CLOSED. GATE-03 database reality remains **OPEN/REQUIRES RUNTIME TARGET CONFIRMATION**. No production schema/RLS/reservation implementation is authorized by this evidence.
