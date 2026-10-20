# ASAS — SOURCE OF TRUTH ENVIRONMENT IDENTITY AMENDMENT

**Date:** 2026-09-27
**Status:** CANONICAL AMENDMENT / GATE-00
**Branch:** `platform-architecture-2026`

## Decision

The platform adopts an explicit mapping model:

`Vercel Environment ≠ Supabase Environment`.

Vercel deployment environments and Supabase Projects/branches are different control-plane concepts. Their relationship must be proven, never inferred from names.

## Production identity

The only acceptable production identity chain is:

`Vercel Production Deployment → exact configured environment variables → exact Supabase PROJECT_REF`.

The production Supabase PROJECT_REF is the immutable/non-secret identity used by engineering guards. The Supabase project display name is descriptive metadata only.

## Current candidate

`Asas platform` / `oliiumegstqujwexikhr` has been read-only introspected and currently shows zero ASAS application tables in `public`. It is therefore an inspected candidate, not verified production identity.

## Development / Preview

Development is local-first. If remote development is required, use a separately verified non-production Supabase Project/branch.

Preview/custom environments must be isolated from Production before schema mutation, destructive testing or migration rehearsal.

## Current-source policy

Current Vercel/Supabase behavior must be researched from the newest official vendor documentation available at the time of the decision. Older sources are fallback-only when current official material cannot answer the required question.

## Evidence

Detailed research:
`docs/architecture/research/ASAS-VERCEL-SUPABASE-ENVIRONMENT-MAPPING-2026-09-27.md`

Roadmap/master amendment:
`docs/architecture/reconciliation/ASAS-ROADMAP-MASTER-ENVIRONMENT-IDENTITY-AMENDMENT-2026-09-27.md`

Current checkpoint:
`docs/handoff/CURRENT-SESSION-STATE.md`
