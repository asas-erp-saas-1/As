# ASAS — ROADMAP / MASTER EXECUTION ENVIRONMENT IDENTITY AMENDMENT

**Date:** 2026-09-27
**Status:** CANONICAL AMENDMENT
**Branch:** `platform-architecture-2026`

## Purpose

This amendment is authoritative for the current roadmap/master-path treatment of Vercel and Supabase environment identity. It exists because the base roadmap/master files predate the current evidence and must not be silently rewritten from incomplete snapshots.

## Rule

`Vercel Environment ≠ Supabase Environment`.

Vercel currently has Production, Preview and Development, with custom environments available where supported. Supabase uses Projects and database branches. The mapping must always be explicit.

## Required production chain

```text
GitHub repository
  → platform-architecture-2026
  → Vercel Project
  → configured Production Branch
  → Production Deployment + Commit
  → Production Environment Variables
  → exact Supabase Production PROJECT_REF
```

Every arrow requires evidence before GATE-00 can be GREEN.

## ASAS branch rule

`platform-architecture-2026` is the sole active ASAS engineering work line. No staging branch is created merely to satisfy environment naming.

If non-production remote verification is needed, use an isolated Supabase project/branch with explicit Vercel Preview/custom-environment mapping. Never use Production Supabase for schema mutation or destructive verification.

## Supabase identification

The canonical identifier is `PROJECT_REF`, obtained from:

`Supabase Studio → Settings → General → Project Settings → Reference ID`

Confirm it against the project dashboard URL. Use the Supabase `Connect` panel for connection configuration. Project display names are not sufficient identity.

## Vercel identification

Verify:

- `Project → Settings → Git` repository and Production Branch;
- `Deployments` source branch, environment and commit;
- `Settings → Environments` environment definitions;
- `Settings → Environment Variables` variable names/scopes;
- non-secret Supabase URL/reference against the intended PROJECT_REF;
- fresh deployment after environment-variable changes.

Never expose or commit secret values in evidence.

## Technical guard

Before schema-touching work, CI/preflight must compare the verified Production PROJECT_REF against one repository-controlled non-secret identity declaration and hard-fail on mismatch.

## Gate effect

GATE-00 remains `PARTIAL / OPEN` until the exact Vercel Production mapping and exact Production Supabase PROJECT_REF are independently verified.

## Routing

Roadmap: `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md`

Master path: `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`

Current checkpoint: `docs/handoff/CURRENT-SESSION-STATE.md`

Detailed research: `docs/architecture/research/ASAS-VERCEL-SUPABASE-ENVIRONMENT-MAPPING-2026-09-27.md`
