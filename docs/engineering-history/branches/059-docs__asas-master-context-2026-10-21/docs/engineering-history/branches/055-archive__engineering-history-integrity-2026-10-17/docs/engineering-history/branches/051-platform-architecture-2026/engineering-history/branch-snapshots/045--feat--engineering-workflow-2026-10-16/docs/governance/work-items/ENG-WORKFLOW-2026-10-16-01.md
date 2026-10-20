# Engineering Work Packet — ENG-WORKFLOW-2026-10-16-01

**Status:** IN REVIEW — CI verification succeeded; Vercel preview status remains blocked  
**Task:** Establish the ASAS end-to-end engineering delivery workflow and structural CI guard  
**Request/PR:** [PR #20](https://github.com/asas-erp-saas-1/As/pull/20)  
**Follow-up blocker:** [Issue #21 — Investigate Vercel preview resource provisioning failures](https://github.com/asas-erp-saas-1/As/issues/21)  
**Evidence record:** [ENG-WORKFLOW-2026-10-16-01-EVIDENCE.md](../evidence/ENG-WORKFLOW-2026-10-16-01-EVIDENCE.md)  
**Owner:** Repository operator / Lead Architecture (human merge approval remains required)  
**Executor:** Codex  
**Risk lane:** R1 — documentation/procedure + GATE-06 CI control-plane check  
**Controlling workstream:** GATE-06 — Engineering System, Verification & AI-Agent Governance  
**Base branch:** `platform-architecture-2026`  
**Implementation authorization:** NO — this task adds no application implementation authority.

## 1. Objective

Create a reproducible operational path from task intake to post-merge evidence, and make the workflow's basic document/route wiring checkable by Foundation Verify. The path must operationalize current ASAS authority without replacing the Constitution, Gate Model, Closure Matrix, contracts/registers, or checkpoint.

## 2. Scope and non-goals

**In scope**
- End-to-end delivery procedure: intake, source/authority preflight, task readiness, research/reconciliation, scope control, branch/PR discipline, verification, adversarial review, merge gates, post-merge proof, checkpointing and stop conditions.
- Reusable task-packet and evidence-record templates.
- PR-template integration and mandatory links from AGENTS.md and Master Execution Path.
- Structural script for file/anchor presence and serial-gate consistency.
- Repair the brittle route assertion in Foundation Verify and distinguish active stale-checkpoint routing from historical/audit mentions.
- Run the procedure rollout through the same CI path it establishes.

**Explicit non-goals**
- No application feature/code, executable schema, migration, RLS, security exception, permission-register edit, runtime identity change, Vercel project setting, environment variable, domain/alias, production deploy, or production data operation.
- No gate/C-track closure and no implementation authorization.
- No branch deletion, rebase, reset, force-push, or bulk movement of historical files.

## 3. Authority and dependencies

| Source | Use | Status/limitation |
|---|---|---|
| `AGENTS.md` | Operating contract, task scope and stop conditions | Canonical |
| Engineering Conference Constitution | One path and decision method | Canonical |
| Engineering Conference Gate Model | Serial GATE-00 through GATE-07 semantics | Canonical |
| Engineering Closure Matrix | Gate and track evidence/closure | Canonical |
| Master Execution Path | Downstream Q0–Q13 sequence and current resume loop | Canonical procedure |
| Current session checkpoint | Current gate/status baseline | Read for current state; not edited by this task |
| Existing Foundation Verify workflow | Existing route and repository checks | The route check was demonstrably brittle; CI repair required |
| Vercel preview deployment | Configured PR status | Error is reported as `Resource provisioning failed`; diagnosis is tracked separately in Issue #21 |

The delivery workflow is A4 procedure and is proposed for review. It does not itself authorize R3/R4 work, create gate authority, or treat structural checks as runtime evidence.

**Parallel-PR coordination:** [PR #18](https://github.com/asas-erp-saas-1/As/pull/18) also edits `docs/governance/CANONICAL-ARTIFACT-REGISTER.md` from the same base. The two PRs must not be merged as if independent: after the first lands, refresh the other branch and reconcile register version/date and both additive sections. No change to PR #18's scope is included here.

## 4. Acceptance criteria

| ID | Criterion | Evidence | Status |
|---|---|---|---|
| AC-01 | A complete practical task-to-merge workflow exists and defines Ready/Done, ownership, authority, risk lanes, evidence statuses, stop conditions and post-merge checks. | `ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md` | VERIFIED — file/anchor check passed |
| AC-02 | Reusable task and evidence templates exist with explicit authorization boundaries. | Both templates and CI structural verifier | VERIFIED — file/anchor check passed |
| AC-03 | AGENTS.md, Master Execution Path, PR template, and Canonical Artifact Register route to the workflow. | Latest Foundation Verify and source content checks | VERIFIED |
| AC-04 | CI no longer depends on the literal arrow-joined GATE string; it validates the Constitution statement and all eight gate headings. | Foundation Verify run `38876030032`, commit `3dcd8e767689bd6e554e7b964f65c4378602e25f` | VERIFIED |
| AC-05 | Workflow structural verifier runs in CI and passes. | Step `Verify operational engineering workflow` in run `38876030032` | VERIFIED |
| AC-06 | Vercel status is green or its non-applicability/failure is explicitly dispositioned by the authorized owner. | Current preview deployment returns `ERROR / BUILD_FAILED / Resource provisioning failed`; Issue #21 opened | BLOCKED — owner diagnosis/disposition required |

## 5. Risk assessment and stop conditions

- **Architecture/security:** process only; no authority to override canonical decisions, permission semantics or gate order.
- **Code/CI:** modifies the repository contract workflow; verified through the actual GitHub Actions run.
- **Vercel:** preview deployment status failed before useful build events. Do not change project settings or production target to make this PR green without separate authorization.
- **Merge:** remain Draft/blocked until the Vercel failure is diagnosed or the authorized owner confirms the check is not applicable, and other required PR conditions are satisfied.

## 6. Changed paths

- `docs/governance/ASAS-ENGINEERING-DELIVERY-WORKFLOW-2026.md`
- `docs/governance/ENGINEERING-TASK-PACKET-TEMPLATE-2026.md`
- `docs/governance/ENGINEERING-EVIDENCE-RECORD-TEMPLATE-2026.md`
- `scripts/verify-engineering-workflow.sh`
- `AGENTS.md`
- `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`
- `.github/PULL_REQUEST_TEMPLATE.md`
- `.github/workflows/foundation-verify.yml`
- `docs/governance/CANONICAL-ARTIFACT-REGISTER.md`

## 7. Required handoff

- Keep PR #20 as Draft until checks and review conditions are satisfied.
- Follow Issue #21 for Vercel provisioning diagnosis; do not infer a root cause from the generic provider error.
- After merge, rerun/confirm CI against the merged target commit, verify the procedure and templates exist on `platform-architecture-2026`, update the current checkpoint only if the actual next dependency changes, and attach post-merge evidence.
