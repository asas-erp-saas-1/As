# ASAS Foundation Gate Matrix

**Repository:** `asas-erp-saas-1/As`
**Status:** Active foundation control

| Gate | Purpose | Required before | Current state |
|---|---|---|---|
| G0 | Repository identity and authoritative source | Any project work | GREEN |
| G1 | Platform identity: Supabase/Vercel/environment | Runtime, DB, deployment work | BLOCKED |
| G2 | Canonical contract reconciliation | Implementation planning | OPEN |
| G3 | Task graph and task packets | Autonomous implementation | OPEN |
| G4 | CI/verification baseline | Merge of implementation | PARTIAL |
| G5 | Security/tenant baseline | Auth/data implementation | OPEN |
| G6 | Database/migration safety baseline | Schema/migration implementation | BLOCKED until G1 |
| G7 | Claude autonomy authorization | A1/A2/A3 execution | NOT AUTHORIZED |

## Gate semantics

- **GREEN:** objective evidence satisfies the gate.
- **PARTIAL:** some controls exist, but the gate is not sufficient for the stated downstream action.
- **OPEN:** work remains; no downstream authorization follows.
- **BLOCKED:** a prerequisite outside the current task must be resolved first.
- **NOT AUTHORIZED:** the gate may be technically ready but the relevant execution authority has not been granted.

## Non-negotiable rule

No downstream document, branch or task packet may imply that a blocked gate is green. Foundation status is evidence-driven, not progress-driven.
