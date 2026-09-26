# ASAS — VERCEL / SUPABASE ENVIRONMENT MAPPING RESEARCH

**Date:** 2026-09-27
**Status:** CANONICAL RESEARCH RECORD / GATE-00 INPUT
**Branch:** `platform-architecture-2026`
**Repository:** `asas-erp-saas-1/As`

## 1. Question

How should ASAS map Vercel deployment environments to Supabase environments/projects, and how can each target be identified without guessing or relying on stale documentation?

## 2. Current-source rule

For current external platform behavior, prefer the newest official Vercel/Supabase documentation available at decision time. Do not use older blog posts/changelogs when current official documentation answers the question. Older sources may be cited only when a current official source does not cover the required historical fact.

## 3. Current authoritative findings

### Vercel

Vercel currently provides Production, Preview and Development environments. Production is associated with the configured production branch. Preview is used for non-production branch/PR deployments; Vercel also supports custom environments with branch tracking. Development is for local development via Vercel tooling and is not itself a Git deployment environment.

For ASAS, the engineering line `platform-architecture-2026` is the sole active work line. Therefore we do not create a staging branch merely to satisfy environment naming. If this branch is configured as the Vercel Production Branch, its deployment is the ASAS Production deployment. Preview/Development variables may exist as configuration scopes, but they are not automatically equivalent to separate Supabase projects.

### Supabase

Supabase does not use Vercel's Production/Preview/Development labels as a one-to-one project taxonomy. A Supabase Project is a PostgreSQL/Auth/Storage/Realtime boundary. Supabase also supports database branching/preview branches and can integrate branch deployments with Vercel Preview deployments. A separate Supabase Project is the clearest hard isolation boundary for ASAS production vs non-production when required.

A Supabase project is identified by its immutable project reference (`PROJECT_REF`). It is visible in Supabase Studio under `Settings → General → Project Settings → Reference ID` and in the project dashboard URL. The project URL and API keys are obtained from the project's API/Connect configuration. PostgreSQL connection strings are obtained from the project's `Connect` panel; the host/username/mode must be copied rather than reconstructed.

## 4. ASAS canonical environment model

### Production

```text
Vercel Production
  ↓
ASAS production deployment
  ↓
ONE VERIFIED Supabase Production Project
  ↓
PROJECT_REF = explicit, verified, machine-guarded
```

The production Supabase project is NOT currently assumed to be `oliiumegstqujwexikhr`. That project has been introspected and currently exposes zero ASAS application tables in `public`; therefore it remains a candidate/inspected project, not verified production identity.

### Preview / staging-like verification

Because ASAS intentionally operates on one active engineering branch, we do not create a `staging` Git branch merely for environment symmetry. If non-production remote verification is needed, use either:

1. a dedicated Vercel custom environment with explicit branch/deployment tracking where the Vercel plan supports it, mapped to an isolated Supabase project/branch; or
2. Vercel Preview with branch-scoped variables only when a real Preview deployment exists and its database target is explicitly isolated.

A Preview environment must never point at Production Supabase for schema mutation or destructive testing.

### Development

Development is the local engineering environment. It should use a local Supabase development stack when practical, or a separately identified non-production Supabase project when remote development is required. It must never inherit production database credentials by accident.

## 5. How to identify a Supabase target

For every candidate project:

1. Open the exact Supabase project.
2. `Settings → General → Project Settings → Reference ID` = canonical `PROJECT_REF`.
3. Confirm the dashboard URL contains the same reference.
4. Open `Connect` and record the connection mode/host shape without committing secrets.
5. Open `Settings → API` / project Connect details and confirm the project URL corresponds to the same project reference.
6. Inspect Database/SQL/CLI evidence only after project identity is confirmed.
7. Record the result as `RUNTIME-VERIFIED`, `SOURCE-VERIFIED`, `PARTIAL`, or `UNVERIFIED`; never infer identity from a project display name alone.

## 6. How to identify Vercel mapping

For the exact Vercel project:

1. `Settings → Git`: verify repository `asas-erp-saas-1/As` and configured Production Branch.
2. `Deployments`: identify the deployment, source branch and commit.
3. `Settings → Environments`: inspect Production/Preview/Development and any custom environments.
4. `Settings → Environment Variables`: inspect variable names and scope only; never expose secret values.
5. Verify the Supabase URL/reference represented by the non-secret variables against the intended Supabase `PROJECT_REF`.
6. Trigger a fresh deployment after environment-variable changes because Vercel applies environment variables to deployments.
7. Record deployment URL, commit SHA, branch, environment and database target as evidence.

## 7. Required technical guard

Documentation is insufficient. Before any schema-touching task/CI job, ASAS should compare the verified target `PROJECT_REF` against a single repository-controlled non-secret identity declaration and hard-fail on mismatch. Secrets remain in Vercel/Supabase/local secret stores and are never committed.

## 8. Decision

ASAS adopts the following rule:

`Vercel Environment ≠ Supabase Environment`

The mapping is explicit:

`Vercel deployment environment → exact Supabase project/branch identity → exact PROJECT_REF → evidence`

No environment is considered equivalent merely because its name is Production, Preview, Development, staging, or similar.

## 9. Research authority

Primary sources consulted on 2026-09-27:

- Vercel/Supabase current environment-variable and integration documentation.
- Supabase current Project Reference / GraphQL documentation.
- Supabase current database connection documentation.
- Supabase current environment/branching documentation.

See the external research citations in the engineering conference session record for the exact current URLs.

## 10. Gate impact

GATE-00 remains OPEN until the exact Vercel Production project, configured Production Branch, deployment commit, environment-variable mapping and exact production Supabase `PROJECT_REF` are independently verified.

No schema/RLS/migration/production mutation is authorized solely from this research record.
