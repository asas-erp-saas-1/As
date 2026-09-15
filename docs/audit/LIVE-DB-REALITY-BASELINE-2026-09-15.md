# ASAS — Live DB Reality Baseline — 2026-09-15 (CORRECTION)

**Status:** BLOCKED / IDENTITY NOT VERIFIED / foundation-gating  
**Repository:** `asas-erp-saas-1/As`  
**Branch under review:** `feat/foundation-command-registry`  

## 1. Critical correction

The previous version of this document incorrectly treated the Supabase project `asas-web-site` as the production database for the canonical ASAS repository.

**That assumption is invalid. `asas-web-site` is a separate project and must not be used as the database reality for `asas-erp-saas-1/As`.**

The correction is authoritative for this workstream:

- Canonical code repository: `asas-erp-saas-1/As`
- `asas-erp-saas-1/Asas-website`: separate/unrelated repository; do not use it as evidence.
- Supabase project `asas-web-site` (`xwokfufeeodobkuaxvgx`): separate/unrelated project; do not use it as ASAS-OS production evidence.
- The actual Supabase project for `As` is **NOT YET VERIFIED**.
- Therefore no claim about the `As` production schema, rows, migrations, RLS, advisors, or database identity may be derived from `asas-web-site`.

## 2. What remains valid

The repository itself is correctly identified as `asas-erp-saas-1/As`, and the foundation work is documentation/bootstrap work intended to prepare a controlled execution environment for Claude.

The canonical architecture and machine-readable contracts remain the source baseline. The previous B.6 design documents remain design artifacts, but their statements about live production reality must not be treated as verified until the correct platform identity is established.

## 3. Required platform-identity gate

Before any schema-touching work, Claude must prove all of the following for the actual `As` environment:

1. GitHub repository identity and active branch.
2. Supabase project ID/ref and project name.
3. Vercel project identity, if Vercel is part of the deployment target.
4. Database engine/version.
5. Target environment classification (development/staging/production).
6. Migration history.
7. Existing tables, columns, relationships, indexes, constraints and RLS/policies.
8. Backup/PITR and restore evidence appropriate to the environment.
9. Environment-variable provenance without exposing secrets.
10. Evidence that the inspected database is actually the database used by `As`.

No similarly named project may be accepted by name alone.

## 4. B.6 implication

The earlier conclusion that B.6 reservation/hold/payment/finance/outbox/inbox tables are absent from production is **NOT VERIFIED** and must be withdrawn until the correct database is identified and inspected.

Do not infer either presence or absence of B.6 tables.

Do not patch reservation logic into any existing `apartments.status` field until the actual database is verified and reconciled against the canonical contract.

## 5. No production mutation

No production mutation is authorized by this correction. No DDL, DML, migration, reset, deployment, deletion, or branch force-update is authorized merely to resolve the identity problem.

## 6. Next execution task

**GATE-00 / PLATFORM-IDENTITY-AND-REALITY:** identify and verify the real Supabase/Vercel environment for `asas-erp-saas-1/As`, then perform a read-only repository-to-platform-to-database reconciliation.

Only after this gate is evidenced should the foundation program resume schema-specific reconciliation or implementation planning.
