# ASAS Engineering Work Packet — Template

**Status:** TEMPLATE — copy per task; do not treat this file as an active task packet.

## 1. Identity and ownership
- **Task ID:**
- **Title / outcome:**
- **Request / issue / PR:**
- **Business or technical owner:**
- **Executor:**
- **Reviewer(s) / approver(s):**
- **Requested autonomy level:**
- **Risk lane:** R0 / R1 / R2 / R3 / R4
- **Current gate / controlling workstream:**
- **Work-item status:** DRAFT / READY / IN PROGRESS / BLOCKED / IN REVIEW / VERIFIED / MERGED / CLOSED / CANCELLED

## 2. Objective and boundary
- **Problem to solve:**
- **Observable outcome:**
- **In scope:**
- **Explicit non-goals:**
- **Files/surfaces allowed to change:**
- **Forbidden surfaces or side effects:**
- **Required human decisions/approvals:**

## 3. Authority and provenance
| Artifact/source | Authority/evidence class | Specific section or fact used | Current/branch/commit | Conflict or caveat |
|---|---|---|---|---|
| | | | | |

- **Canonical owner(s):**
- **Relevant ADRs/contracts/registers:**
- **Source-package or unmerged-branch inputs (if any):**
- **External primary sources (if any):**
- **Conflicts and their owner:**

## 4. Dependencies and traceability
| Dependency / decision | Owner | Current status | Evidence or unblock condition |
|---|---|---|---|
| | | | |

Traceability as applicable:
`requirement → authority → context/owner → contract → invariant → permission/tenant → event/audit → data impact → implementation → test → evidence`

## 5. Risk assessment
- **Security / tenancy / privacy:**
- **Financial / legal / business semantics:**
- **Concurrency / idempotency / retries:**
- **Data/schema/migration impact:**
- **External side effects / deployment impact:**
- **Failure modes and abuse cases:**
- **Rollback / forward-fix / recovery:**
- **Stop conditions and escalation owner:**

## 6. Acceptance criteria (observable)
| ID | Given / when / then or exact expected outcome | Verification method | Evidence location | Required? |
|---|---|---|---|---|
| AC-01 | | | | YES |

## 7. Execution plan
1. Baseline branch/commit and inspect the current checkpoint.
2. Inspect authoritative sources and affected artifacts.
3. Resolve or explicitly block decisions and dependencies.
4. Create task-scoped branch.
5. Implement the smallest coherent change.
6. Run the planned verification and record exact results.
7. Request independent/adversarial review.
8. Satisfy PR/CI/owner gates.
9. Verify after merge; reconcile indexes/checkpoint.
10. Preserve evidence and identify the next dependency.

## 8. Authorization boundaries
- **Implementation authorized for this exact slice?** YES / NO
- **Schema design/creation authorized?** YES / NO / NOT APPLICABLE
- **Migration authorized?** YES / NO / NOT APPLICABLE
- **RLS/security policy change authorized?** YES / NO / NOT APPLICABLE
- **Production/runtime mutation authorized?** YES / NO / NOT APPLICABLE
- **Authorizing artifact / human / date:**
- **Target environment and identity proof (if applicable):**

A task must remain BLOCKED if the required authorization is absent. Never infer authorization from this template, a conversation, a green build, or a merged architecture document.

## 9. Verification plan and actual result
| Check | Planned command/method | Applicable? | Actual result: VERIFIED / FAILED / BLOCKED / NOT EXECUTED | Commit / run / output link |
|---|---|---|---|---|
| Static / lint / format | | | | |
| Typecheck / build | | | | |
| Unit / domain invariants | | | | |
| Integration / E2E | | | | |
| Security / tenant / authorization | | | | |
| Concurrency / idempotency / failure | | | | |
| Migration / recovery / rollback | | | | |
| Architecture/document/reference | | | | |
| CI / deployment / post-merge | | | | |

## 10. Delivery and handoff
- **Branch / base / baseline SHA:**
- **PR / final commit / merge commit:**
- **Approvals:**
- **CI status and failed-check disposition:**
- **Preview/deployment status (if applicable):**
- **Evidence record path:**
- **Canonical registers/indexes/checkpoint updated:**
- **Known limitations / follow-up tasks / owners:**
- **Final evidence status:** VERIFIED / FAILED / BLOCKED / NOT EXECUTED
- **Closure decision and reviewer:**

## 11. Completion checklist
- [ ] Objective and non-goals were met without scope creep.
- [ ] Canonical authority and provenance are recorded.
- [ ] Required approvals/authorization exist.
- [ ] Verification matches the exact commit and target.
- [ ] Blocking findings are resolved or task remains BLOCKED.
- [ ] Required PR checks are green or explicitly dispositioned by the owner.
- [ ] Post-merge checks and checkpoint reconciliation are complete.
