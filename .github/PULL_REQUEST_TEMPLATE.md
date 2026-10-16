# ASAS Pull Request

Before opening or marking this PR ready, follow the [Engineering Delivery Workflow](../docs/governance/ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md). For material work, attach a completed [Engineering Task Packet](../docs/governance/ENGINEERING-TASK-PACKET-TEMPLATE-2026.md) and, before closure, an [Evidence Record](../docs/governance/ENGINEERING-EVIDENCE-RECORD-TEMPLATE-2026.md).

## 1. Task contract
- Task ID / issue:
- Work-item status: DRAFT / READY / IN PROGRESS / BLOCKED / IN REVIEW / VERIFIED / MERGED / CLOSED
- Risk lane: R0 INSPECT / R1 DOCS / R2 ARCHITECTURE / R3 IMPLEMENTATION / R4 PROTECTED CHANGE
- Requested autonomy level: A0 / A1 / A2 / A3
- Current gate / controlling workstream:
- Owner / executor:
- Required reviewers / approvers:

## 2. Objective and boundary
- Problem and observable outcome:
- In scope:
- Explicit non-goals:
- Dependencies:
- Files/surfaces allowed to change:
- Protected surfaces explicitly out of scope:

## 3. Authority and traceability
- Canonical artifacts / contracts / ADRs / registers:
- Evidence and provenance inspected:
- Decision/authorization record (required where applicable):
- Trace: requirement → authority → contract/invariant → change → tests/evidence:
- Conflicts, assumptions, or blocked questions:

## 4. Safety and impact
- [ ] Tenant/resource boundary reviewed where applicable
- [ ] Authorization and least privilege reviewed
- [ ] State-machine invariants / illegal transitions reviewed where applicable
- [ ] Idempotency, retries and concurrency reviewed where applicable
- [ ] Financial invariants / audit reviewed where applicable
- [ ] Privacy, secrets and external side effects reviewed where applicable
- [ ] Schema/migration, rollback and recovery reviewed where applicable
- [ ] No unapproved production or irreversible operation is included

## 5. Verification plan and actual results
For each applicable check, record exact commands/method, tested commit SHA, result, and durable log/output link. Use only VERIFIED / FAILED / BLOCKED / NOT EXECUTED; mark non-applicable checks with a reason.

| Check | Required? | Result | Evidence / run |
|---|---|---|---|
| Static analysis / format / link or structure checks | | | |
| Typecheck / build | | | |
| Unit / invariant tests | | | |
| Integration / API / E2E tests | | | |
| Negative / adversarial / security / tenant tests | | | |
| Concurrency / idempotency / retry tests | | | |
| Migration / recovery checks | | | |
| Required GitHub Actions checks | YES | | |
| Preview/deployment check, if configured/required | | | |
| Post-merge checks (complete after merge) | | | |

## 6. Review, delivery and rollback
- Files changed and why:
- Independent review / required owner approvals:
- Blocking review threads:
- Risks / known limitations:
- Rollback / forward-fix / recovery plan:
- Post-merge verification:
- Canonical register, index or checkpoint updates:
- Follow-up tasks / owners:

## 7. Final disposition
- [ ] Scope matches the task contract and no unrelated changes are bundled
- [ ] All required acceptance criteria have evidence
- [ ] All required checks are green on the current head, or the PR remains BLOCKED
- [ ] Required authority/owner approvals are recorded
- [ ] No gate/C-track closure or implementation authorization is inferred from document presence or merge status

**Evidence status:** VERIFIED / FAILED / BLOCKED / NOT EXECUTED  
**Merge status:** DRAFT / READY FOR REVIEW / MERGEABLE AFTER REQUIRED CHECKS / BLOCKED
