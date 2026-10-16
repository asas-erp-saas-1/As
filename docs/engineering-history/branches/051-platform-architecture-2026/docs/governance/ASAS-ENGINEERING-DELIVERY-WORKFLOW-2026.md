# ASAS Engineering Delivery Workflow 2026

**Artifact class:** A4 — operational procedure  
**Status:** PROPOSED FOR REVIEW; operative only after acceptance into the canonical branch  
**Version:** 1.0.0  
**Date:** 2026-10-16  
**Owner:** Lead Architecture / Engineering System  
**Repository:** `asas-erp-saas-1/As`  
**Active Engineering Conference line:** `platform-architecture-2026`

> This document makes the existing ASAS control plane executable as a repeatable team workflow. It does not redefine the Constitution, gate semantics, canonical contracts, ADRs, founder decisions, runtime evidence, or authorization. Where this procedure conflicts with higher authority, higher authority wins. It grants no implementation, schema, migration, security-policy, or production permission.

## 1. Purpose and operating rules

Every material change must be traceable from the question to the accepted result:

`Task → authority → scope → evidence → decision/design → change → verification → independent review → merge → post-merge evidence → checkpoint`

The operating rules are:

1. One bounded work item per branch and pull request.
2. The active conference line is `platform-architecture-2026`; GitHub's default branch `main` is not an alternate architecture authority.
3. A newer branch or fuller document is evidence to review, not canonical authority by default.
4. Work may research future gates, but may not skip, redefine, or close gates out of order.
5. No implementation unless the specific slice is explicitly authorized through the applicable GATE-07 process.
6. Status language must distinguish `VERIFIED`, `FAILED`, `BLOCKED`, and `NOT EXECUTED`. Missing evidence is not a pass.
7. If a stop condition is reached, stop the affected path, preserve useful evidence, record the owner and unblock condition, and continue only on independent work that remains authorized.
8. Prefer a small, reversible, reviewable change over a broad refactor or branch merge.

## 2. Canonical control plane and reading order

Before any material repository write, inspect the current branch and head, then read the relevant files in this order:

1. `AGENTS.md` — operating contract and stop conditions.
2. `docs/handoff/CURRENT-SESSION-STATE.md` — sole current checkpoint; confirm it matches current evidence and do not blindly trust stored SHAs.
3. `docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-CONSTITUTION-2026.md` — conference authority and decision method.
4. `docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md` — authoritative gate semantics.
5. `docs/governance/ENGINEERING-CLOSURE-MATRIX-2026.md` — evidence and closure criteria.
6. `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md`, the roadmap, and `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`.
7. `docs/governance/CANONICAL-ARTIFACT-REGISTER.md`, relevant ADRs/contracts/registers, provenance, task packets, code/tests, and runtime evidence for the affected concept.
8. The applicable procedure/skill, including `.agents/skills/asas-engineering/SKILL.md` and specialized skills selected for the task.

Read only the context needed for the task, but never omit a dependency whose authority, security, data, or runtime effect could change the result. If two authoritative sources conflict, record the conflict and stop any change that depends on an unresolved resolution.

## 3. Classify the work before choosing tools

Use the smallest lane that accurately describes the work. The lane is a **risk/scope classification**, not a substitute for the repository's autonomy level, task authorization, or gate state.

| Lane | Typical work | Minimum control |
|---|---|---|
| `R0 — INSPECT` | Read-only discovery, branch/commit comparison, evidence collection, research | Record sources and confidence; no repository/runtime mutation |
| `R1 — DOCS` | Navigation, procedure, non-authoritative documentation, source indexes, provenance records | Preserve authority labels; verify links, provenance, scope, and wording; no implied decision/closure |
| `R2 — ARCHITECTURE` | ADRs, domain contracts, canonical registers, gate/checkpoint status, permissions or event semantics | Named decision owner, explicit alternatives/consequences, impact mapping, conflict review and required ratification |
| `R3 — IMPLEMENTATION` | Application or service code, tests, local adapters, authorized refactoring | Specific GATE-07 slice authorization, approved contracts, local-first implementation, test and review evidence |
| `R4 — PROTECTED CHANGE` | Schema/migrations, RLS, tenant/security policy, financial mutation semantics, secrets, production/runtime/deployment, destructive or irreversible external actions | Separate explicit authorization and designated human/owner approval; preflight, backup/recovery or rollback plan, controlled execution, post-change evidence |

A task can involve more than one lane. Split it when the lanes have different approvers, risk boundaries, release timing, or evidence requirements. In particular, do not combine an architecture decision with implementation merely to reduce PR count.

## 4. Work-item lifecycle

Track workflow state separately from evidence status.

| Work-item state | Entry condition | Exit condition |
|---|---|---|
| `DRAFT` | Idea or finding captured | Work packet is complete enough for triage |
| `READY` | Definition of Ready passes; owner, scope, authority, dependencies, verification and authorization are explicit | Executor starts only within the packet's scope |
| `IN PROGRESS` | Task started and branch opened | Change is ready for review, blocked, or cancelled |
| `BLOCKED` | Missing authority, evidence, dependency, access, or failing required check | Named blocker is resolved with evidence; status is re-evaluated |
| `IN REVIEW` | Change is scoped, self-reviewed, and evidence is attached | Review comments addressed and merge conditions evaluated |
| `VERIFIED` | Required verification passed for the stated scope and target commit | Required approvals and merge conditions are satisfied |
| `MERGED` | Change integrated through the approved PR path | Post-merge checks and checkpoint/index updates completed |
| `CLOSED` | Acceptance criteria, evidence, follow-ups and checkpoint are reconciled | Remains closed unless new evidence triggers reopening |
| `CANCELLED` | Owner explicitly stops the work | Preserve rationale and any reusable evidence |

`VERIFIED` describes the evidence for a specific change at a specific commit. It does not by itself mean a gate, domain, C-track, deployment, or whole project is closed.

## 5. Definition of Ready (required before non-trivial work)

A task is `READY` only when its work packet records:

- a unique task ID and one-sentence outcome;
- business/technical owner and required reviewer/approver;
- work lane R0–R4 and requested autonomy level;
- current gate and the reason the task is permitted now;
- exact scope and explicit non-goals;
- canonical authority sources plus provenance for non-canonical inputs;
- dependencies and their current status;
- expected file/repository/runtime surfaces;
- acceptance criteria stated as observable outcomes;
- a verification plan chosen before implementation;
- security, tenancy, privacy, financial, concurrency, external-side-effect and data-impact assessment as applicable;
- evidence locations and final handoff requirements;
- rollback/forward-fix or recovery plan proportional to risk;
- stop conditions and the person/authority who resolves each protected question.

If these fields cannot be filled truthfully, keep the task `DRAFT` or `BLOCKED`. Do not create placeholder decisions that look approved.

## 6. End-to-end execution procedure

### Step 1 — Resume from repository reality

- Fetch the active branch and current head; inspect the worktree/diff and open PRs that overlap the task.
- Re-read the current checkpoint. Resolve stale or contradictory statements before using them as task inputs.
- Confirm that no newer accepted change has superseded the intended source.
- Record the baseline branch, commit SHA, current status, and files inspected.

**Output:** reproducible baseline and an identified first unresolved dependency.

### Step 2 — Build the task packet

- Complete `ENGINEERING-TASK-PACKET-TEMPLATE-2026.md`.
- Classify the task R0–R4 and define scope/non-goals.
- List the canonical owners and relevant dependencies.
- Define acceptance and evidence before making changes.
- For R2, record decision authority and all downstream impacts. For R3/R4, attach explicit authorization before implementation.

**Output:** reviewed task contract; no implied authority from chat context alone.

### Step 3 — Research and reconcile

- Inspect canonical repository sources, branch history, code/tests/registers and runtime evidence as applicable.
- Research current official/primary external sources for externally verifiable technical gaps.
- Compare alternatives and failure modes for material or hard-to-reverse decisions.
- Record `SOURCE-VERIFIED`, `RUNTIME-VERIFIED`, `TEST-VERIFIED`, `EXTERNALLY-VERIFIED`, `ENGINEERING-DERIVATION`, `PROPOSED`, `CONFLICT`, and `UNVERIFIED` as appropriate.
- Never treat v1.6.1 source-package content or unmerged branch content as implementation authority without reconciliation and promotion.

**Output:** source map, gap/conflict list, decision or explicit blocker.

### Step 4 — Decide the implementation boundary

Before coding or editing canonical controls, state what is changing and what must remain invariant.

For architecture/contract work, record:
`problem → context → evidence → alternatives → decision → rejected options → consequences → owner → affected artifacts → verification → review/reopen trigger`.

For implementation work, map the task at least across:
`requirement → authority → context/owner → contract → invariant → command/query → permission/tenant scope → event/audit → data impact → task → code → tests → evidence`.

**Output:** approved change boundary or a specific decision request.

### Step 5 — Create a task-scoped branch

- Base architecture work on `platform-architecture-2026`, unless an accepted control explicitly directs otherwise.
- Suggested names: `docs/<topic>`, `chore/<topic>`, `adr/<topic>`, `fix/<topic>`, `feat/<topic>`, `security/<topic>`, `ci/<topic>`.
- One task per branch/PR; do not mix unrelated fixes or bundle unrelated branch histories.
- Do not force-push, reset, rebase, delete branches, or rewrite history as routine cleanup.
- Keep commits small and named by intent (Conventional Commit style is recommended: `docs(scope): …`, `fix(scope): …`, `test(scope): …`).

**Output:** isolated change surface with a known base SHA.

### Step 6 — Make the smallest coherent change

- Change only the files needed to satisfy the acceptance criteria.
- Preserve historical artifacts and provenance. Prefer indexed references or explicit supersession pointers over bulk moves.
- Update all affected canonical owners in the same PR when the changes are inseparable; otherwise create explicit dependent tasks.
- Never edit a register to make it agree with an implementation that conflicts with its authority.
- Do not invent a runtime fact, test result, approval, permission, environment identity, or gate closure.

**Output:** reviewable diff within the task boundary.

### Step 7 — Verify locally and proportionally to risk

Choose all applicable checks; write down non-applicable checks with a reason rather than leaving ambiguous blanks.

| Change | Minimum verification |
|---|---|
| R0 research | Sources, URLs/refs, dates, methods, contradictions and confidence recorded |
| R1 documentation | Path/link checks, spelling/structure, authority labels, source provenance, status consistency, repository checks |
| R2 architecture | R1 checks plus decision ownership, affected ADR/contract/register consistency, invariants, cross-context consequences, unresolved conflicts and required owner approval |
| R3 implementation | Formatting/lint, typecheck/build, unit/domain tests, integration/E2E as relevant, negative/error paths, security/tenant tests, migration checks only if authorized |
| R4 protected change | R3 checks as relevant plus independent owner approval, exact target identity, preflight/backup/rollback, least-privilege execution, no-secret logs, post-change integrity and recovery verification |

For stateful/commercial flows, specifically assess legal/illegal transitions, concurrency/races, idempotency, retry/replay, audit evidence, money invariants and failure compensation. For multi-tenancy, test negative cross-tenant access; UI-only checks are insufficient.

**Output:** reproducible command/check results attached to the exact tested commit.

### Step 8 — Independent/adversarial review

Ask a reviewer who did not author the change to challenge, proportional to risk:

- whether the correct source and authority were used;
- missing invariants, race windows, stale-state assumptions, permissions or tenant escapes;
- incomplete failure/retry/rollback behavior;
- drift in references, canonical registers, schemas, events or checkpoints;
- accidental scope expansion, secret leakage, unsafe defaults and misleading status claims;
- whether evidence actually supports each acceptance criterion.

For protected changes, obtain the designated human/owner approval; an agent's self-review is not a substitute.

**Output:** no unresolved blocking findings, or an explicit `BLOCKED` decision with owner and next condition.

### Step 9 — Prepare and review the pull request

The PR must include:
- task packet/issue and work lane;
- objective, scope and non-goals;
- authority sources and decision references;
- files changed and the reason for each;
- verification commands, exact outcomes, commit SHA and CI run links;
- failed, blocked, not-run and non-applicable checks explicitly identified;
- risks, rollout/rollback and post-merge verification;
- current checkpoint/gate impact, if any.

Keep the PR in **Draft** until the scope is stable and verification evidence is available. Request the correct owners for R2/R4 changes; do not infer a reviewer from file ownership that has not been confirmed.

### Step 10 — Apply merge gates

Do not merge unless all apply:

1. Base branch and scope are correct; the PR contains one coherent task.
2. All required acceptance criteria have evidence.
3. Required CI checks are green on the current PR head.
4. Any configured deployment/preview check is green, or its non-applicability is explicitly confirmed by the owner. An unexplained `failure` is not a pass.
5. Required code/architecture/security/data owners have approved.
6. No unresolved blocking review thread or authority conflict remains.
7. Canonical artifacts, indexes and checkpoint updates are included where required.
8. Merge method follows repository policy; no force-push or bypass used to mask a failing gate.

A mergeable GitHub flag is not equivalent to satisfying these conditions. If repository branch protection is not enabled, the workflow still requires these criteria; settings configuration is a separate administrative action.

### Step 11 — Post-merge verification

- Record the merge commit SHA and actual target branch.
- Confirm required CI on the merged result; for implementation/release tasks, run the approved post-merge smoke/integration/recovery checks.
- Verify affected canonical paths and links on the target branch, not only on the feature branch.
- For deployments, verify commit → provider project → environment → runtime identity, health, smoke checks and rollback readiness. Never infer production identity from a preview URL.
- For schema/data changes, record the approved migration, pre/post checks, backup/recovery status and exact environment; never use production as a design sandbox.

**Output:** post-merge evidence tied to the resulting commit and target environment.

### Step 12 — Converge records and close the task

- Update affected registers, indexes, dependency states, task graph and the sole current checkpoint.
- Label what is canonical, proposed, historical, superseded, blocked, or not executed.
- Close only the task whose own acceptance criteria are met; do not close a gate/C-track because a task merged.
- Create a follow-up task for non-blocking discoveries and a blocker record for unresolved protected questions.
- Store the final evidence record using `ENGINEERING-EVIDENCE-RECORD-TEMPLATE-2026.md`.

**Output:** clear next dependency and a resumable handoff.

## 7. Evidence and status contract

Every material check records:
- exact branch and commit SHA;
- command, workflow/check name or verification method;
- environment/target identity where relevant (never secret values);
- timestamp and result;
- concise output/log link or durable artifact path;
- owner/reviewer where required;
- failure, limitation, skipped/non-applicable checks and their rationale.

Use these exact evidence states:

- `VERIFIED` — the stated check ran against the stated commit/target and passed.
- `FAILED` — the check ran and failed.
- `BLOCKED` — it could not run or proceed because a named dependency/authority/access condition is missing.
- `NOT EXECUTED` — no check was run; do not imply pass.

An overall task may be considered `VERIFIED` only if all required checks passed and there are no unresolved blocking review findings. Otherwise report the exact blocked/failed/not-executed subset.

## 8. Stop and escalation rules

Stop the affected operation for any of the following:
- unresolved product/founder decision, financial semantics, legal meaning or bounded-context ownership;
- unclear authorization, tenant isolation, permission authority, or security exception;
- absent required GATE-07 slice authorization;
- unknown repository/runtime/provider/environment identity;
- an unapproved schema, migration, production data or irreversible external side effect;
- conflict between canonical contracts/registers/ADRs or between repository and runtime reality;
- missing critical evidence, dependency, rollback or designated approval;
- a failed required check, untrusted source, or inability to inspect the exact target.

The blocker record must contain `what is blocked / why / evidence / owner / required decision or action / next review trigger`. Continue only with work independent of the blocker.

## 9. Operational cadence

### At task start
- reload the checkpoint and active branch;
- inspect open PRs and recent accepted changes relevant to the task;
- choose the first unblocked dependency;
- set a baseline SHA and task packet.

### At each meaningful checkpoint
- state the task/work-item status and evidence status separately;
- reconcile the diff against the packet;
- record new risks, conflicts and next dependency;
- do not report work that is pending as if it has already been completed.

### At PR review
- inspect the diff and source/authority, not only the PR summary;
- verify required checks against the latest head;
- review exact output for failed checks;
- preserve failed-check history while recording a verified repair.

### At close
- confirm merge/post-merge evidence;
- update canonical indexes/checkpoint;
- state remaining blockers and next task;
- preserve a durable evidence record.

## 10. Definition of Done

A work item is done only when all applicable criteria are true:

- [ ] Task packet has a unique ID, owner, lane, scope and non-goals.
- [ ] Authority sources and dependencies are identified.
- [ ] Required decisions/ratifications are explicit and recorded.
- [ ] The diff stays within the approved scope.
- [ ] Canonical pointers, affected registers and documentation are reconciled.
- [ ] Required checks were run against the exact change and their evidence is available.
- [ ] Independent/adversarial review is complete to the risk level.
- [ ] Required owners approved; required CI/deployment checks are dispositioned.
- [ ] PR was merged through the approved path (unless the task is intentionally a blocked review).
- [ ] Post-merge checks and checkpoint/index updates are complete.
- [ ] Remaining defects and follow-up tasks have owners and states.

A draft PR with failing checks can be a valid review artifact, but it is **not** a completed/verified delivery.

## 11. Relationship to existing ASAS controls

This procedure operationalizes; it does not replace:
- `AGENTS.md` and the Engineering Conference Constitution;
- the canonical Gate Model and Engineering Closure Matrix;
- the Master Execution Path and sole session checkpoint;
- canonical ADRs, contracts and machine-readable registers;
- the explicit schema promotion protocol;
- repository/task-specific implementation authorization.

The Engineering Conference gates remain serial. The downstream Q0–Q13 path remains downstream; this procedure does not authorize skipping any gate or pulling implementation forward.

## 12. First rollout and maintenance

This procedure is rolled out through a dedicated, task-scoped PR. The rollout itself must pass the same checks it establishes. Its CI validator may check that the control files and required policy anchors exist; it must not manufacture proof that a human approval, deployment, gate closure or runtime operation occurred.

After adoption:
- use the task-packet template for each material task;
- use the PR template for every pull request;
- attach an evidence record for every material task;
- review this procedure after material governance changes, repeated CI false positives, or an incident showing the workflow missed a control;
- change the procedure through a reviewed PR and update its version/date only when accepted.
