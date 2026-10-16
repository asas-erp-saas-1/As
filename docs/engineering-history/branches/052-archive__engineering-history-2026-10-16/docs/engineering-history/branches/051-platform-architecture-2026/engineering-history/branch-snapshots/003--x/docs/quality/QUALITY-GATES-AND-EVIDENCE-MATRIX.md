# ASAS Real Estate OS — Quality Gates & Evidence Matrix

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.

## 1. Principle

A green build is not proof by itself. Each risk must have a gate that can fail when the corresponding defect is deliberately seeded.

## 2. Gate hierarchy

| Gate | Proof required | Failure examples |
|---|---|---|
| Platform P | access, backup/restore, branch/CI/preview protection, secrets topology | missing restore proof, production auto-deploy, secret exposure |
| Reality baseline | production schema inventory, dump, Prisma reconciliation, migration baseline | undocumented table/column/index/RLS drift |
| Tenant isolation | cross-tenant read/write attack suite | any unauthorized row access |
| IAM | full permission matrix + route map + lockout/session tests | skipped persona/cell, unmapped route |
| Domain | state-machine and invariant tests | illegal transition succeeds |
| Inventory | constraint/race/integrity suite | double reservation, invalid availability |
| Finance | ledger balance/immutability/allocation tests | unbalanced entry, edited posted record |
| Integration | signature/idempotency/retry tests | duplicate provider event creates duplicate business fact |
| UI | accessibility, responsive, RTL/LTR, visual regression | keyboard trap, layout break, untranslated state |
| Performance | measured bundle/query/render budgets | budget regression without explicit approval |
| Security | dependency/secrets/static/security test suite | BOLA/IDOR, secret leak, unsafe webhook |
| Release | migration dry-run, smoke, rollback/recovery evidence | irrecoverable deployment |

## 3. Required evidence format

Each completed task/PR records:

1. task ID;
2. contract/ADR sources;
3. changed files;
4. commands/tests executed;
5. pass/fail output summary;
6. database migration/drift evidence where applicable;
7. authorization/tenant evidence where applicable;
8. visual/accessibility evidence for UI;
9. performance measurements where relevant;
10. security findings;
11. known residual risks;
12. rollback/recovery path.

Evidence must identify the environment and commit under test. Screenshots without test context are insufficient for critical acceptance criteria.

## 4. Adversarial testing doctrine

For each critical feature, deliberately test at least:

- wrong tenant;
- wrong role;
- correct role with insufficient scope;
- revoked privilege during an active session;
- expired session;
- duplicate request;
- concurrent request;
- stale client state;
- dependency timeout;
- dependency returns malformed data;
- database constraint conflict;
- partial workflow failure;
- retry after success;
- localization/RTL edge case for UI;
- keyboard-only and screen-reader path for UI.

## 5. Data integrity gates

Financial and inventory acceptance requires database-level proof for rules that cannot safely live only in application code. Race tests must run against PostgreSQL behavior, not a mock database.

Posted financial facts are immutable. Corrections are modeled as governed reversals/corrections.

## 6. UI acceptance gates

Critical journeys require:

- mobile 360–430,
- tablet 768–1024,
- desktop 1280–2560,
- `ar-DZ` RTL,
- French and English LTR,
- loading/empty/filtered-empty/error/no-permission states,
- dense-data behavior,
- keyboard navigation,
- axe/accessibility validation,
- visual comparison against approved Figma/design baseline.

## 7. Performance evidence

Do not claim performance from intuition. Record the relevant measured metric, dataset size, network condition, device/browser class and comparison baseline. Large tables require server-side pagination and appropriate virtualization rather than client-side bulk loading.

## 8. Security evidence

At minimum, release evidence must show:

- secret scanning,
- dependency/audit review,
- tenant isolation tests,
- authorization matrix tests,
- webhook signature tests where used,
- rate-limit tests on abuse surfaces,
- upload/content-security tests where media/Studio accepts user input.

## 9. Stop-the-line criteria

No release when:

- a tenant breakout is reproducible;
- a financial invariant can be violated;
- two active reservation winners can exist;
- a protected route is unmapped/default-allow;
- a migration cannot be explained/recovered;
- critical accessibility failure remains;
- required evidence is missing;
- production reality materially contradicts the contract without founder-approved decision.
