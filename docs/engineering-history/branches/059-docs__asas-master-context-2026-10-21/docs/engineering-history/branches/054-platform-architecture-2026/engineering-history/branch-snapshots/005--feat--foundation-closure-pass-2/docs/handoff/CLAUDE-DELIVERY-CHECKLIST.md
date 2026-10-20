# ASAS Claude Delivery Checklist

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.

This checklist is the final delivery contract for every implementation task in the ASAS repository.

## Before coding

- [ ] Correct repository and branch verified.
- [ ] SESSION_STATE read.
- [ ] Relevant Blueprint/register/ADR sources identified.
- [ ] Current implementation and production reality inspected when relevant.
- [ ] Task boundary written.
- [ ] Domain contract identified.
- [ ] Permission + tenant scope identified.
- [ ] Data/migration impact identified.
- [ ] UX states and responsive/locale matrix identified.
- [ ] Figma nodes/components/variables inspected when UI is involved.
- [ ] Security threats and negative tests identified.
- [ ] Observability/evidence plan identified.
- [ ] Founder decision requested if Class C/D.

## During coding

- [ ] Smallest coherent change only.
- [ ] No unrelated refactor.
- [ ] No arbitrary status setter.
- [ ] No UI-only authorization.
- [ ] No cross-context aggregate mutation.
- [ ] No raw money arithmetic outside governed value objects/services.
- [ ] No secrets in source/logs/client bundles.
- [ ] No destructive migration without approved plan.
- [ ] No alternate source of truth introduced.

## Before PR

- [ ] Unit/domain tests pass.
- [ ] Integration tests pass where boundaries changed.
- [ ] Negative authorization tests pass.
- [ ] Tenant breakout tests pass where applicable.
- [ ] Race/idempotency tests pass where applicable.
- [ ] Database migration/drift check passes where applicable.
- [ ] Audit/outbox behavior verified where applicable.
- [ ] Accessibility/keyboard checks pass for UI.
- [ ] RTL + French/English checks pass for UI.
- [ ] Responsive matrix checked.
- [ ] Figma/runtime visual comparison checked.
- [ ] Performance budget checked where applicable.
- [ ] Security/dependency/secret checks pass.
- [ ] Logs/traces contain sufficient diagnostic context and no sensitive leakage.

## PR evidence

The PR must state:

1. task ID;
2. contract sources;
3. exact changed files;
4. exact tests/commands and outcomes;
5. database impact;
6. authorization/tenant evidence;
7. UX/accessibility/visual evidence;
8. security findings;
9. performance measurements;
10. observability evidence;
11. residual risks;
12. rollback/recovery path.

## Final status vocabulary

Each applicable item must be marked **VERIFIED**, **FAILED**, **BLOCKED**, or **NOT EXECUTED**.

A missing prerequisite is a blocker, not a reason to fabricate evidence.

## Merge gate

Do not merge when a stop-the-line condition from `QUALITY-GATES-AND-EVIDENCE-MATRIX.md` is present, when production reality contradicts the contract without a recorded decision, or when critical evidence is absent.
