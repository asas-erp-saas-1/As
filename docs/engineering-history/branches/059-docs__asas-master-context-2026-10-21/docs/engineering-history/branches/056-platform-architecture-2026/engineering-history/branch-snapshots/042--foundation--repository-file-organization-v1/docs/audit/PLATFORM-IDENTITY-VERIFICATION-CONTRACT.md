# ASAS — Platform Identity Verification Contract

**Status:** FOUNDATION CONTROL — GATE-00 DEPENDENCY
**Scope:** `asas-erp-saas-1/As`
**Authority:** Operational safety contract; does not itself prove provider identity

## Purpose

Prevent ASAS from ever treating a provider project as the canonical runtime/database merely because a URL, environment variable, dashboard name, or historical document looks plausible.

A documented near-miss occurred in which a Supabase project belonging to the separate `Asas-website` repository was treated as if it were the database for `As`. This contract converts that lesson into a technical pre-flight requirement.

## Identity rule

Before any task that can mutate schema, migrations, data, RLS, storage, edge functions, or production configuration:

1. Identify the repository as `asas-erp-saas-1/As`.
2. Obtain the provider project identity from the provider/runtime itself.
3. Compare it with the separately verified ASAS project identity.
4. Fail closed if either identity is missing or mismatched.
5. Record the verified identity as dated evidence.

Documentation, `.env` files, project display names, historical screenshots, or a repository name are not sufficient proof by themselves.

## Required evidence artifact

The following file becomes the canonical evidence record only after the platform owner verifies the provider directly:

`docs/audit/PLATFORM-IDENTITY-VERIFIED.json`

It MUST contain, at minimum:

- `repository`: `asas-erp-saas-1/As`
- `provider`: `supabase` or another explicitly named provider
- `project_ref`
- `verified_at`
- `verification_method`
- `verified_by`
- `environment`

Do not create this file with guessed values.

## Pre-flight guard

Use:

`bash scripts/foundation/verify-platform-identity.sh`

The guard is intentionally fail-closed. Until the evidence artifact exists and the runtime project reference matches it, schema-affecting work is **BLOCKED**.

## Scope

This contract covers platform identity only. It does not establish:

- schema correctness;
- RLS correctness;
- migration safety;
- backup/restore readiness;
- production readiness;
- application authorization.

Those remain separate gates.

## Explicit unresolved state

As long as `PLATFORM-IDENTITY-VERIFIED.json` has not been produced from direct provider verification, GATE-00 remains **OPEN/BLOCKED**. No agent may infer the missing project reference from historical ASAS material.
