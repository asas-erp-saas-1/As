#!/usr/bin/env bash
set -euo pipefail

# ASAS GATE-00 fail-closed guard.
# This script verifies only the identity values supplied by the execution environment.
# It never discovers, changes, or mutates infrastructure.

EXPECTED_SUPABASE_REF="oliiumegstqujwexikhr"

if [[ -z "${ASAS_SUPABASE_PROJECT_REF:-}" ]]; then
  echo "GATE-00 FAIL: ASAS_SUPABASE_PROJECT_REF is not set." >&2
  exit 2
fi

if [[ "${ASAS_SUPABASE_PROJECT_REF}" != "${EXPECTED_SUPABASE_REF}" ]]; then
  echo "GATE-00 FAIL: Supabase project mismatch." >&2
  echo "Expected: ${EXPECTED_SUPABASE_REF}" >&2
  echo "Observed: ${ASAS_SUPABASE_PROJECT_REF}" >&2
  exit 3
fi

if [[ -z "${ASAS_VERCEL_PROJECT_ID:-}" ]]; then
  echo "GATE-00 FAIL: ASAS_VERCEL_PROJECT_ID is not set; Vercel runtime mapping is not yet verified." >&2
  exit 4
fi

# The Vercel project ID is intentionally not hard-coded yet.
# GATE-00 cannot close until the project/environment mapping is independently verified.
if [[ "${ASAS_VERCEL_PROJECT_ID}" == "UNVERIFIED" ]]; then
  echo "GATE-00 FAIL: Vercel project identity is explicitly marked UNVERIFIED." >&2
  exit 5
fi

echo "GATE-00 PARTIAL: Supabase candidate matches; Vercel identity is supplied but still requires repository/environment evidence."
echo "No database mutation performed by this guard."
