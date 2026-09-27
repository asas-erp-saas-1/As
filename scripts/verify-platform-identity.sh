#!/usr/bin/env bash
set -euo pipefail

# ASAS GATE-00 fail-closed guard.
# Identity is evidence, not a guess. This script never discovers or mutates infrastructure.

EXPECTED_VERCEL_PROJECT_ID="prj_4yF8PAE1axukJh4fWwbZmBGXRKZB"
EXPECTED_ENGINEERING_BRANCH="platform-architecture-2026"
EXPECTED_SUPABASE_REF="oliiumegstqujwexikhr"

if [[ -z "${ASAS_VERCEL_PROJECT_ID:-}" ]]; then
  echo "GATE-00 FAIL: ASAS_VERCEL_PROJECT_ID is not set." >&2
  exit 2
fi

if [[ "${ASAS_VERCEL_PROJECT_ID}" != "${EXPECTED_VERCEL_PROJECT_ID}" ]]; then
  echo "GATE-00 FAIL: Vercel project mismatch." >&2
  echo "Expected: ${EXPECTED_VERCEL_PROJECT_ID}" >&2
  echo "Observed: ${ASAS_VERCEL_PROJECT_ID}" >&2
  exit 3
fi

if [[ "${ASAS_VERCEL_GIT_REF:-}" != "${EXPECTED_ENGINEERING_BRANCH}" ]]; then
  echo "GATE-00 FAIL: Production/engineering branch is not verified as ${EXPECTED_ENGINEERING_BRANCH}." >&2
  echo "Observed: ${ASAS_VERCEL_GIT_REF:-<unset>}" >&2
  exit 4
fi

if [[ "${ASAS_SUPABASE_PROJECT_REF:-}" != "${EXPECTED_SUPABASE_REF}" ]]; then
  echo "GATE-00 FAIL: Supabase project mismatch." >&2
  echo "Expected: ${EXPECTED_SUPABASE_REF}" >&2
  echo "Observed: ${ASAS_SUPABASE_PROJECT_REF:-<unset>}" >&2
  exit 5
fi

echo "GATE-00 PASS: supplied platform identity inputs match the canonical ASAS platform project and engineering branch."
echo "Production Vercel-to-Supabase runtime mapping must still be independently evidenced before GATE-00 closes."
echo "No database mutation performed by this guard."
