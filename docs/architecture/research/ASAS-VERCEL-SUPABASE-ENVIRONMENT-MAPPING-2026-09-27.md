# ASAS — VERCEL / SUPABASE ENVIRONMENT MAPPING RESEARCH

**Date:** 2026-09-27
**Status:** CANONICAL RESEARCH RECORD / GATE-00 INPUT
**Branch:** `platform-architecture-2026`
**Repository:** `asas-erp-saas-1/As`

## 1. Question

How should ASAS map Vercel deployment environments to Supabase environments/projects, and how can each target be identified without guessing or relying on stale documentation?

## 2. Current-source rule

For current external platform behavior, prefer the newest official Vercel/Supabase documentation available at decision time. Do not use older blog posts/changelogs when current official documentation answers the question. Older sources may be cited only when a current official source does not cover the required historical fact.

Research date: **2026-09-27**.

## 3. Current authoritative findings

### Vercel

Current Supabase documentation for the Vercel integration states:

- Production is used for the branch configured as the Vercel Production Branch.
- Preview is used for other Git branches/PRs unless a separate custom environment with branch tracking is configured.
- Development is for local development via the Vercel CLI and does not apply to Git deployments on the Vercel platform.

Vercel supports selecting a custom Production Branch; ASAS therefore does not need to rename its engineering line to `main` merely to obtain Production behavior.

Primary current sources:

- https://supabase.com/docs/guides/troubleshooting/vercel-integration-environment-variables-not-syncing-for-persistent-git-branches-b9191e
- https://vercel.com/blog/custom-production-branch
- https://vercel.com/academy/vercel-foundations/vercel-settings

### Supabase / Vercel Marketplace

Current Supabase Marketplace documentation states that connected Vercel projects receive synchronized environment variables. The current documented variable family includes:

- `POSTGRES_URL`
- `POSTGRES_PRISMA_URL`
- `POSTGRES_URL_NON_POOLING`
- `POSTGRES_USER`
- `POSTGRES_HOST`
- `POSTGRES_PASSWORD`
- `POSTGRES_DATABASE`
- `SUPABASE_SECRET_KEY`
- `SUPABASE_PUBLISHABLE_KEY`
- `SUPABASE_URL`
- `SUPABASE_JWT_SECRET`
- `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY`
- `NEXT_PUBLIC_SUPABASE_URL`

The user reports an existing integration using the older/compatibility names `SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`, and `NEXT_PUBLIC_SUPABASE_ANON_KEY`. We record that as observed configuration; we do not silently rename or rotate credentials during GATE-00.

Primary current source:

- https://supabase.com/docs/guides/integrations/vercel-marketplace

### Supabase environments / projects / branches

Supabase distinguishes its own Project/branch model from Vercel's environment labels. A Supabase Project is the hard resource boundary for PostgreSQL/Auth/Storage/Realtime. Supabase also supports isolated database branches for preview workflows.

Current Supabase guidance supports:

- Local development using Supabase CLI.
- Optional staging/preview environments using separate projects or Pro branching.
- Production deployment through GitHub integration or CI/CD.

Primary current sources:

- https://supabase.com/docs/guides/deployment
- https://supabase.com/docs/guides/deployment/managing-environments
- https://supabase.com/docs/guides/deployment/branching/integrations

## 4. ASAS canonical environment model

### Production

```text
platform-architecture-2026
        ↓
Vercel Production
        ↓
ONE VERIFIED Supabase Production Project
        ↓
PROJECT_REF = explicit, verified, machine-guarded
```

The current Vercel UI evidence shows Production = `main`, so this model is **target architecture, not current reality**. GATE-00 remains open until the Production Branch is corrected/explicitly re-decided and the resulting deployment is verified.

The Supabase project `oliiumegstqujwexikhr` is inspected and identified, but its role as the verified Production database is not yet established. It currently showed zero ASAS application tables in `public` and zero Supabase migrations during prior read-only introspection.

### Preview / staging-like verification

ASAS intentionally operates on one active engineering branch. We do not create a `staging` Git branch merely for environment symmetry.

If non-production remote verification becomes necessary, use either:

1. a dedicated Vercel custom environment with explicit branch/deployment tracking, mapped to an isolated Supabase project/branch; or
2. Vercel Preview with explicitly isolated database credentials/target.

A Preview environment must never be assumed to be safe for Production database access or schema mutation.

### Development

Development is local-first. Use local Supabase where practical, or a separately identified non-production Supabase project when remote development is required. Never inherit Production database credentials accidentally.

## 5. How to identify a Supabase target

For every candidate project:

1. Open the exact Supabase project.
2. Use `Settings → General → Project Settings → Reference ID` as the canonical `PROJECT_REF`.
3. Confirm the dashboard URL contains the same project reference.
4. Use the project's `Connect` panel for database connection details; do not reconstruct hostnames/ports from memory.
5. Confirm the project URL corresponds to the same Project Ref.
6. Only after identity is confirmed, perform Database/SQL/CLI introspection.
7. Record status as `RUNTIME-VERIFIED`, `SOURCE-VERIFIED`, `PARTIAL`, or `UNVERIFIED`.

Primary current source:

- https://supabase.com/docs/guides/deployment/managing-environments

## 6. How to identify Vercel mapping

For the exact Vercel project:

1. `Settings → Git`: verify repository and configured Production Branch.
2. `Deployments`: identify deployment environment, source branch and commit.
3. `Settings → Environments`: inspect Production/Preview/Development and custom environments.
4. `Settings → Environment Variables`: inspect variable names and scopes only; never expose secret values.
5. Verify the Production Supabase URL/reference against the intended Supabase Project Ref.
6. After changing environment variables, redeploy; Vercel applies environment variables to deployments.
7. Record deployment URL, commit SHA, branch, environment and database target as evidence.

Primary current source:

- https://vercel.com/academy/vercel-foundations/vercel-settings

## 7. Required technical guard

Documentation is insufficient. Before any schema-touching task/CI job, ASAS should compare the verified target `PROJECT_REF` against a single repository-controlled non-secret identity declaration and hard-fail on mismatch. Secrets remain in Vercel/Supabase/local secret stores and are never committed.

Current repository declaration: `config/platform-identity.json`.

It is intentionally `failClosed: true` while GATE-00 is open.

## 8. Decision

ASAS adopts:

`Vercel Environment != Supabase Environment`

The mapping is explicit:

`Vercel deployment environment → exact Git branch / deployment commit → exact environment-variable scope → exact Supabase project/branch identity → exact PROJECT_REF → evidence`

No environment is considered equivalent merely because its label is Production, Preview, Development, staging, or similar.

## 9. Current ASAS evidence state

```text
GitHub repo                  VERIFIED
Conference branch            VERIFIED
Supabase candidate           VERIFIED AS INSPECTED CANDIDATE
Vercel domain                VERIFIED AS OBSERVED
Vercel Production branch     VERIFIED = main
Engineering line             VERIFIED = platform-architecture-2026
Production branch alignment  OPEN / MISMATCH
Production deployment SHA    OPEN
Production env target        OPEN
Production Supabase Ref      OPEN
```

## 10. Gate impact

**GATE-00 remains OPEN.**

No schema/RLS/migration/production mutation is authorized solely from this research record.

After GATE-00 is actually closed, proceed serially to GATE-01. C03–C06 remain implementation-blocked until the foundation gate sequence is complete, except for evidence reconciliation required by the active gate.
