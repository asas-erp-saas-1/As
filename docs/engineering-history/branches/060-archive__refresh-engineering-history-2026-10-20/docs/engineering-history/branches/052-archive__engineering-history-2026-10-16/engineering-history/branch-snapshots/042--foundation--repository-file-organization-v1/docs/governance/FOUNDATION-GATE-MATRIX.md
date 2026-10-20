# ASAS Foundation Gate Matrix

**Repository:** `asas-erp-saas-1/As`  
**Status:** Canonical gate-definition control

> This matrix defines gate meaning and dependency order. It is **not** the operational status ledger. Current status is owned exclusively by `docs/governance/FOUNDATION-GATE-REGISTER.md`.

| Gate | Purpose | Required before |
|---|---|---|
| G0 | Repository identity and authoritative source | Any project work |
| G1 | Platform identity: Supabase/Vercel/environment | Runtime, DB, deployment work |
| G2 | Canonical contract reconciliation | Implementation planning |
| G3 | Task graph and task packets | Autonomous implementation |
| G4 | CI/verification baseline | Merge of implementation |
| G5 | Security/tenant baseline | Auth/data implementation |
| G6 | Database/migration safety baseline | Schema/migration implementation |
| G7 | Claude autonomy authorization | A1/A2/A3 execution |

## Gate semantics

- **GREEN:** objective evidence satisfies the gate.
- **AMBER:** controls exist, but required evidence/reconciliation remains.
- **OPEN:** work remains; no downstream authorization follows.
- **BLOCKED:** a prerequisite outside the current task must be resolved first.
- **NOT AUTHORIZED:** technical controls may exist, but execution authority has not been granted.

## Status authority

Do not maintain a second `Current state` column here. Use the Foundation Gate Register for current state. This prevents drift between multiple gate ledgers.

## Non-negotiable rule

No downstream document, branch, or task packet may imply that a blocked gate is green. Foundation status is evidence-driven, not progress-driven.
