#!/usr/bin/env bash
set -euo pipefail

# ASAS GATE-00 fail-closed guard.
# Identity is evidence, not a guess. This script never discovers or mutates infrastructure.

EXPECTED_VERCEL_PROJECT_ID="prj_4yF8PAE1axukJh4fWwbZmBGXRKZB"
EXPECTED_ENGINEERING_BRANCH="platform-architecture-2026"
EXPECTED_SUPABASE_REF=""

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

if [[ -z "${EXPECTED_SUPABASE_REF}" ]]; then
  echo "GATE-00 FAIL: no Supabase production PROJECT_REF is independently verified yet." >&2
  echo "Candidate oliiumegstqujwexikhr remains inspected/unverified because its public schema currently exposes zero ASAS application tables." >&2
  exit 5
fi

if [[ "${ASAS_SUPABASE_PROJECT_REF:-}" != "${EXPECTED_SUPABASE_REF}" ]]; then
  echo "GATE-00 FAIL: Supabase production project mismatch." >&2
  echo "Expected: ${EXPECTED_SUPABASE_REF}" >&2
  echo "Observed: ${ASAS_SUPABASE_PROJECT_REF:-<unset>}" >&2
  exit 6
fi

echo "GATE-00 PASS: platform identity inputs match the verified production mapping."
echo "No database mutation performed by this guard."
