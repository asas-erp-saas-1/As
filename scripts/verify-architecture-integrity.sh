#!/usr/bin/env bash
#
# ASAS architecture integrity verification (architecture-as-code).
#
# Verifies three machine-checkable properties of the architecture corpus:
#   1. every C01-C22 conference track has a canonical index README;
#   2. every ADR file is present in the ADR register and no ADR number is duplicated;
#   3. every internal path reference resolves, except an explicit allowlist of
#      known gaps recorded in the architecture integrity review.
#
# This check verifies structure and reference integrity only. It does NOT verify
# architecture correctness, closure status or runtime behaviour, and it never
# promotes an artifact to canonical authority.
#
# Known-gap allowlist owner: docs/architecture/reconciliation/ASAS-ARCHITECTURE-INTEGRITY-REVIEW-2026-10-14.md (F-09)
#
set -euo pipefail

fail=0
note() { printf '%s\n' "$*"; }
error() { printf 'ERROR: %s\n' "$*" >&2; fail=1; }

# ---------------------------------------------------------------------------
# 1. Canonical Phase C track indexes
# ---------------------------------------------------------------------------
for n in $(seq -w 1 22); do
  index="docs/architecture/reconciliation/phase-c/C${n}/README.md"
  if [[ ! -f "$index" ]]; then
    error "missing C-track index: $index"
  fi
done
note "Phase C track indexes present (C01-C22)."

# ---------------------------------------------------------------------------
# 2. Architecture control indexes exist
# ---------------------------------------------------------------------------
required=(
  docs/architecture/README.md
  docs/architecture/ASAS-ADR-REGISTER-2026.md
  docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md
  docs/architecture/DOMAIN-ENGINEERING-TRACK-REGISTER-2026.md
  docs/governance/ENGINEERING-CLOSURE-MATRIX-2026.md
  docs/governance/CANONICAL-ARTIFACT-REGISTER.md
  docs/architecture/reconciliation/ASAS-ARCHITECTURE-INTEGRITY-REVIEW-2026-10-14.md
)
for file in "${required[@]}"; do
  if [[ ! -f "$file" ]]; then
    error "missing architecture control index: $file"
  else
    note "INDEX OK: $file"
  fi
done

# ---------------------------------------------------------------------------
# 3. ADR register coverage and numbering uniqueness
# ---------------------------------------------------------------------------
adr_files=$(find docs/architecture/adr docs/architecture/decisions -maxdepth 1 -name 'ADR-*.md' 2>/dev/null | sort)
if [[ -z "$adr_files" ]]; then
  error "no ADR files found under docs/architecture/adr or docs/architecture/decisions"
else
  while IFS= read -r file; do
    number=$(basename "$file" | grep -oE '^ADR-[0-9]{4}')
    if ! grep -qF "$number" docs/architecture/ASAS-ADR-REGISTER-2026.md; then
      error "ADR not recorded in register: $file ($number)"
    fi
  done <<< "$adr_files"
fi

duplicate_numbers=$(find docs/architecture/adr docs/architecture/decisions -maxdepth 1 -name 'ADR-*.md' -printf '%f\n' \
  | grep -oE '^ADR-[0-9]{4}' | sort | uniq -d || true)
if [[ -n "$duplicate_numbers" ]]; then
  error "duplicate ADR numbers: $(echo "$duplicate_numbers" | tr '\n' ' ')"
fi
note "ADR register coverage and numbering verified."

# ---------------------------------------------------------------------------
# 4. Internal reference integrity with explicit known-gap allowlist
# ---------------------------------------------------------------------------
allowlist=(
  # Template placeholder used in documentation, not a real C-track path.
  docs/architecture/reconciliation/phase-c/CNN/README.md
  docs/architecture/ARCHITECTURE-LINEAGE-RECONCILIATION.md
  docs/architecture/ASAS-ARCHITECTURE-V3.md
  docs/architecture/ASAS-CANONICAL-ARCHITECTURE-BASELINE-V3.md
  docs/architecture/CANONICAL-CONTEXT-TO-MODULE-MAP.md
  docs/architecture/SOURCE-AUTHORITY-LEDGER.md
  docs/architecture/contracts/ASAS-BUILDING-DOMAIN-CONTRACT-2026-09-24.md
  docs/decisions/ADR-0001-CANONICAL-CONTEXT-MODULE-DECOMPOSITION.md
  docs/memory/lessons.md
  docs/reports/t-p.9-exit-trace.md
  docs/skills/INDEX.md
  registers/tasks.json
  schema/asas-contracts.prisma
)

is_allowed() {
  local target="$1" allowed
  for allowed in "${allowlist[@]}"; do
    [[ "$target" == "$allowed" ]] && return 0
  done
  return 1
}

pattern='(docs|registers|schema|config|design|scripts|\.github|\.agents|architecture)/[A-Za-z0-9_./-]+\.(md|json|csv|sh|yml|prisma)'
references=$(git grep -hoE "$pattern" -- . 2>/dev/null | sort -u || true)

unresolved=0
while IFS= read -r ref; do
  [[ -z "$ref" ]] && continue
  if [[ -e "$ref" ]]; then
    continue
  fi
  if is_allowed "$ref"; then
    continue
  fi
  error "unresolved internal reference (not in known-gap allowlist): $ref"
  unresolved=1
done <<< "$references"

if [[ "$unresolved" -eq 0 ]]; then
  note "Internal references resolve (known gaps allowlisted)."
fi

# ---------------------------------------------------------------------------
if [[ "$fail" -ne 0 ]]; then
  echo "ARCHITECTURE INTEGRITY: FAILED"
  exit 1
fi
echo "ARCHITECTURE INTEGRITY: OK"
