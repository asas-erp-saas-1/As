# ASAS GATE-00 Closure Checklist — 2026-09-27

**Status:** OPEN / EVIDENCE-GATED
**Branch:** `platform-architecture-2026`
**Rule:** GATE-00 must be closed before GATE-01 begins. No gate hopping.

## Closure contract

GATE-00 is green only when every row below has independent evidence and the technical guard can fail closed on mismatch.

| Item | Required evidence | Current state |
|---|---|---|
| GitHub repository | exact owner/name + branch | VERIFIED: `asas-erp-saas-1/As` |
| Conference branch | exact branch ref | VERIFIED: `platform-architecture-2026` |
| Vercel project | project id/name | CANDIDATE only; connector currently returns 403 |
| GitHub ↔ Vercel linkage | repository owner/name in Vercel project | OPEN |
| Production branch | Vercel production branch = `platform-architecture-2026` | OPEN |
| Production deployment | deployment from the canonical branch, status Ready | OPEN |
| Development project | exact non-production target | OPEN |
| Production environment | production env exists and is the intended target | OPEN |
| Preview environment | preview target and branch behavior | OPEN |
| Supabase project | project ref/name | VERIFIED CANDIDATE: `oliiumegstqujwexikhr` / `Asas platform` |
| Production Supabase mapping | production env points to verified project | OPEN |
| Preview Supabase mapping | preview env points to intended development project | OPEN |
| Database identity | runtime connection resolves to intended Supabase project | OPEN |
| Technical guard | mismatches fail closed | PARTIAL — guard exists |
| No secrets in evidence | only IDs/names/statuses | REQUIRED |

## Required Vercel evidence

Because the connected Vercel integration currently returns HTTP 403 for project enumeration/runtime access, the following must be obtained from the project owner or from a Vercel CLI/API session with project access:

1. Project name and project ID.
2. Git repository: `asas-erp-saas-1/As`.
3. Production Branch: `platform-architecture-2026`.
4. Latest Production deployment commit SHA.
5. Development/Preview project or explicit environment target.
6. Environment-variable **names and targets only**; never values or secrets.
7. The Supabase project reference used by Production and Preview.

Vercel's current documentation confirms that environment variables can be targeted to Production/Preview/Development and optionally to a Git branch, and that Vercel exposes Git repository/branch/commit metadata for deployments. This is why environment mapping cannot be inferred from the project name alone.

## Acceptance rule

Do not mark GATE-00 GREEN from screenshots of a deployment URL alone. The evidence must connect:

`GitHub repo → canonical branch → Vercel project → production deployment → environment target → Supabase project`

A public deployment proves reachability, not identity or data-source correctness.

## Technical guard requirement

`config/platform-identity.json` remains fail-closed while Vercel runtime mapping is unverified. `scripts/verify-platform-identity.sh` must not be changed to accept an unverified project merely to make the gate pass.

## Stop condition

If any identity or environment mapping is ambiguous, remain in GATE-00. Do not start GATE-01, schema reconciliation, RLS, migrations or domain implementation.

## Next action

Once the missing Vercel evidence is available, reconcile it against `config/platform-identity.json`, update the guard, run the gate, archive the evidence, update `CURRENT-SESSION-STATE.md`, and only then advance to GATE-01.
