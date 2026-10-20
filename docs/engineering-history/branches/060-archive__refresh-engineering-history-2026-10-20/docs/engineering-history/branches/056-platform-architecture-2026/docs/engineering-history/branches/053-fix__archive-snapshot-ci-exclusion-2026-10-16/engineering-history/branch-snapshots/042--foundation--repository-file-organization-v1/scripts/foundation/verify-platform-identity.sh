#!/usr/bin/env bash
set -euo pipefail

# ASAS fail-closed platform identity guard.
# This script does not discover or guess provider identity.
# It verifies runtime identity against an evidence artifact created only after direct provider verification.

EVIDENCE_FILE="docs/audit/PLATFORM-IDENTITY-VERIFIED.json"

if [[ ! -f "$EVIDENCE_FILE" ]]; then
  echo "BLOCKED: $EVIDENCE_FILE does not exist."
  echo "Direct provider verification is required before schema-affecting work."
  exit 2
fi

command -v python >/dev/null 2>&1 || {
  echo "ERROR: python is required to validate platform identity evidence."
  exit 3
}

python - <<'PY'
import json
import os
import sys
from pathlib import Path

path = Path("docs/audit/PLATFORM-IDENTITY-VERIFIED.json")
try:
    evidence = json.loads(path.read_text(encoding="utf-8"))
except Exception as exc:
    print(f"ERROR: invalid platform identity evidence: {exc}")
    sys.exit(3)

required = ["repository", "provider", "project_ref", "verified_at", "verification_method", "verified_by", "environment"]
missing = [key for key in required if not evidence.get(key)]
if missing:
    print("ERROR: platform identity evidence is incomplete:", ", ".join(missing))
    sys.exit(3)

if evidence["repository"] != "asas-erp-saas-1/As":
    print("ERROR: evidence repository does not identify canonical ASAS repository.")
    sys.exit(4)

runtime_ref = os.environ.get("ASAS_SUPABASE_PROJECT_REF", "").strip()
if not runtime_ref:
    print("BLOCKED: ASAS_SUPABASE_PROJECT_REF is not set in the runtime environment.")
    print("The guard refuses to infer the project reference from repository documentation.")
    sys.exit(2)

if evidence["provider"].lower() != "supabase":
    print(f"ERROR: unsupported provider in this guard: {evidence['provider']}")
    sys.exit(4)

if runtime_ref != evidence["project_ref"]:
    print("BLOCKED: runtime Supabase project reference does not match verified evidence.")
    print(f"Expected verified project_ref: {evidence['project_ref']}")
    print(f"Observed runtime project_ref:  {runtime_ref}")
    sys.exit(5)

print("VERIFIED: runtime Supabase project reference matches the directly verified ASAS platform identity.")
PY
