# ASAS — Implementation Readiness Matrix

**Purpose:** decide objectively whether Claude may implement a task. This matrix is deliberately separate from the source blueprint package; it is an operational control artifact.

## Status model

- GREEN — evidence is sufficient for the scoped action.
- YELLOW — action may proceed only with explicit task-local constraints.
- RED — required contract/decision is incomplete.
- BLOCKED — external reality or authority is missing.

## Global gates

| Gate | Requirement | Current status |
|---|---|---|
| Repository identity | Work only in `asas-erp-saas-1/As` | GREEN |
| Product direction | Real Estate Operating System scope established | GREEN |
| Architecture | Canonical bounded-context architecture established | GREEN |
| Governance | AGENTS + execution path + handoff controls | GREEN |
| Canonical machine artifacts | Source package inventory/provenance established | YELLOW |
| Platform identity | Actual ASAS Vercel/Supabase/database independently proven | BLOCKED |
| Runtime implementation | Application baseline exists and is verified | RED |
| Production database mutation | Reality baseline + approved migration plan | BLOCKED |

## Task authorization

A task may enter implementation only when all task-local rows are GREEN or explicitly constrained YELLOW:

1. authoritative contract identified;
2. dependencies closed;
3. affected bounded context identified;
4. identity/tenant boundary specified;
5. authorization specified;
6. state/event/command mapping specified where applicable;
7. validation and invariants specified;
8. transaction boundary specified;
9. idempotency specified where a retry is possible;
10. concurrency behavior specified where races are possible;
11. external side effects specified;
12. migration impact assessed;
13. positive and negative verification defined;
14. rollback/forward-fix approach defined;
15. evidence output defined.

## Required closure evidence

For every implementation task, record:

- exact files changed;
- exact commands/checks executed;
- test output or CI evidence;
- security/tenant evidence where applicable;
- migration evidence where applicable;
- adversarial/race/idempotency evidence where applicable;
- commit SHA;
- residual risks;
- next dependency.

## Global stop lines

No task may bypass the matrix because of urgency, convenience, AI autonomy, or an existing code pattern. If evidence is unavailable, the status is `BLOCKED` or `NOT EXECUTED`, never `VERIFIED`.
