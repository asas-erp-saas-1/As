# ASAS Engineering Evidence Record — Template

**Status:** TEMPLATE — create one record per material task or tightly bounded verification bundle.

## 1. Evidence identity
- Task ID:
- PR / issue:
- Risk lane (R0–R4):
- Evidence owner:
- Independent reviewer:
- Date/time and timezone:
- Repository:
- Target branch:
- Tested commit SHA:
- Base commit SHA:
- Work-item status:
- Overall evidence status: VERIFIED / FAILED / BLOCKED / NOT EXECUTED

## 2. Baseline
- Canonical checkpoint and version:
- Relevant gate/C-track/domain state:
- Files and runtime surfaces inspected:
- Existing related PRs/branches:
- Baseline conflicts or limitations:

## 3. Verification ledger
| ID | Acceptance criterion | Check / exact command | Environment / target identity | Result | Run link or output artifact | Reviewer / notes |
|---|---|---|---|---|---|---|
| EV-01 | | | | VERIFIED / FAILED / BLOCKED / NOT EXECUTED | | |

Record exact commands rather than labels such as “tests passed.” For workflow checks, include run URL/ID, tested head SHA, job/step and the relevant log excerpt. For runtime/database checks, identify the environment and project/ref without exposing secrets.

## 4. Safety and adversarial review
- Authorization/tenant-scope evidence:
- Failure, retry and idempotency evidence:
- Concurrency/race evidence:
- Data/migration/recovery evidence:
- Financial/audit invariants:
- Negative/adversarial scenarios:
- External side effects and rollback:
- Independent review findings:
- Blocking findings and owners:

Use NOT APPLICABLE only with a short reason. Use NOT EXECUTED when a check was not run. Do not convert either to VERIFIED.

## 5. Results and disposition
- Acceptance criteria met:
- Acceptance criteria unmet:
- Known limitations:
- Failed/blocked/not-executed checks and reasons:
- Required remediation or follow-up task:
- Canonical artifacts/registers affected:
- Gate/checkpoint effect (describe; do not infer closure):

## 6. Integration and post-merge proof
- PR URL and approvals:
- Merge commit SHA and target branch:
- Required CI after merge:
- Preview/deployment ID, environment and commit (if applicable):
- Smoke/health/recovery result (if applicable):
- Post-merge paths/checkpoint confirmed:
- Final reviewer and date:

## 7. Conclusion
State one of the following and justify it in one paragraph:

- **VERIFIED** — all required checks passed for the stated scope and tested commit.
- **FAILED** — one or more required checks ran and failed.
- **BLOCKED** — work could not proceed because of a named dependency/authority/access blocker.
- **NOT EXECUTED** — no verification was performed; no correctness claim is made.
