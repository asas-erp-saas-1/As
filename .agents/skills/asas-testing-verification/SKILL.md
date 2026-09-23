---
name: asas-testing-verification
description: Independently verify ASAS implementation through unit, integration, contract, state, concurrency, security, RLS, E2E and visual evidence.
---

# Testing and Verification

## Principle

The implementing agent is not the sole evidence for correctness. Verification must be fresh and adversarial for material changes.

## Test layers

Use the smallest sufficient combination of:
- static/type/lint checks;
- unit tests;
- domain invariant tests;
- state-machine legal/illegal transition tests;
- integration tests;
- database constraint tests;
- RLS/tenant tests;
- authorization tests;
- event/outbox/idempotency tests;
- concurrency/race tests;
- API contract/webhook tests;
- E2E/browser tests;
- accessibility tests;
- visual regression;
- migration replay/rollback evidence;
- performance/recovery tests when applicable.

## Critical commercial loop

Trace and test:
`Project → Building → Unit → Lead → Assignment → Activity → Visit → Offer → Reservation → Contract → Payment Plan → Payment/Receipt → Audit → Reporting`.

## Verification status

Use only:
`VERIFIED / FAILED / BLOCKED / NOT_EXECUTED`.

A passing typecheck is not domain verification. A screenshot is not interaction verification. Documentation is not runtime evidence.

## Evidence

Record exact commands, inputs, outputs, commit and artifact references for material closure. Never invent missing evidence.
