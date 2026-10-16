#!/usr/bin/env bash
set -euo pipefail

fail() {
  printf 'ERROR: %s\n' "$*" >&2
  exit 1
}

require_file() {
  [[ -f "$1" ]] || fail "Required workflow artifact missing: $1"
  printf 'FILE OK: %s\n' "$1"
}

require_text() {
  local file="$1"
  local needle="$2"
  grep -Fq -- "$needle" "$file" || fail "Required workflow anchor missing in $file: $needle"
  printf 'ANCHOR OK: %s -> %s\n' "$file" "$needle"
}

files=(
  AGENTS.md
  docs/governance/ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md
  docs/governance/ENGINEERING-TASK-PACKET-TEMPLATE-2026.md
  docs/governance/ENGINEERING-EVIDENCE-RECORD-TEMPLATE-2026.md
  docs/handoff/CURRENT-SESSION-STATE.md
  docs/handoff/ASAS-MASTER-EXECUTION-PATH.md
  docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-CONSTITUTION-2026.md
  docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md
  docs/governance/ENGINEERING-CLOSURE-MATRIX-2026.md
  .github/PULL_REQUEST_TEMPLATE.md
)
for file in "${files[@]}"; do
  require_file "$file"
done

require_text AGENTS.md "ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md"
require_text .github/PULL_REQUEST_TEMPLATE.md "ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md"
require_text .github/PULL_REQUEST_TEMPLATE.md "ENGINEERING-TASK-PACKET-TEMPLATE-2026.md"
require_text docs/governance/ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md "## 5. Definition of Ready"
require_text docs/governance/ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md "## 6. End-to-end execution procedure"
require_text docs/governance/ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md "## 7. Evidence and status contract"
require_text docs/governance/ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md "## 10. Definition of Done"
require_text docs/governance/ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md "GATE-07"
require_text docs/governance/ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md "R4 — PROTECTED CHANGE"
require_text docs/governance/ENGINEERING-TASK-PACKET-TEMPLATE-2026.md "## 8. Authorization boundaries"
require_text docs/governance/ENGINEERING-TASK-PACKET-TEMPLATE-2026.md "## 9. Verification plan and actual result"
require_text docs/governance/ENGINEERING-EVIDENCE-RECORD-TEMPLATE-2026.md "VERIFIED / FAILED / BLOCKED / NOT EXECUTED"
require_text docs/handoff/ASAS-MASTER-EXECUTION-PATH.md "ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md"

constitution=docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-CONSTITUTION-2026.md
gate_model=docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md
require_text docs/handoff/ASAS-MASTER-EXECUTION-PATH.md "ASAS-ENGINEERING-CONFERENCE-CONSTITUTION-2026.md"
require_text "$constitution" "The first seven stages are `GATE-00` through `GATE-07`"
require_text "$constitution" "No parallel implementation path"
require_text "$constitution" "C01–C22"
require_text "$constitution" "IG-*"

for gate in GATE-00 GATE-01 GATE-02 GATE-03 GATE-04 GATE-05 GATE-06 GATE-07; do
  require_text "$gate_model" "### $gate"
done

printf 'PASS: engineering delivery workflow controls are structurally present.\n'
