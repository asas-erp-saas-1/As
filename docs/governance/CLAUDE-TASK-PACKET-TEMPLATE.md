# ASAS Claude Task Packet Template

**Task ID:** `TASK-XXXX`
**Status:** `DRAFT | READY | IN_PROGRESS | VERIFYING | CLOSED | BLOCKED`
**Autonomy:** `A0 | A1 | A2 | A3`
**Bounded Context:**

## Objective

## Non-goals

## Authority

- Product/architecture authority:
- Register references:
- Research references:
- Known conflicts:

## Dependencies

- Required task IDs:
- Required contracts:
- Required platform/reality gates:

## Domain impact

- Commands:
- Events:
- State machines/edges:
- Permissions:
- Tenant boundary:
- Financial/legal invariants:

## Data impact

- Read models:
- Write models:
- Schema changes:
- Migration strategy:
- Backward compatibility:

## External effects

- Providers:
- Outbox/inbox requirements:
- Webhook/reconciliation requirements:
- Idempotency key:

## Implementation contract

Describe the behavior that must exist. Do not prescribe implementation details unless they are architectural constraints.

## Acceptance criteria

- [ ] Functional behavior verified.
- [ ] Authorization verified.
- [ ] Tenant isolation verified.
- [ ] Invariants verified.
- [ ] Idempotency/concurrency verified where applicable.
- [ ] Database/migration safety verified where applicable.
- [ ] External side effects verified where applicable.
- [ ] Automated tests pass.
- [ ] Adversarial verification completed.
- [ ] Evidence recorded.

## Stop conditions

Claude must stop and escalate if the task requires a protected founder decision, an unresolved authoritative contradiction, unknown production identity, destructive production mutation, or a material security/data-ownership change.

## Evidence

- Tests:
- Review:
- Runtime/DB evidence:
- Screenshots or UX evidence:
- Remaining risks:

## Closure

Task may be marked `CLOSED` only after every mandatory acceptance criterion and evidence item is satisfied and the session checkpoint is updated.
