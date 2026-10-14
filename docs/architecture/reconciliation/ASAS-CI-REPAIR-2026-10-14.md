# ASAS — CI Control-Plane Repair 2026-10-14

**Status:** BLOCKED — requires `workflows` permission to apply
**Artifact class:** A4 procedure / owner action record
**Related finding:** F-15 in `docs/architecture/reconciliation/ASAS-ARCHITECTURE-INTEGRITY-REVIEW-2026-10-14.md`
**Patch file:** `docs/architecture/reconciliation/ASAS-CI-REPAIR-2026-10-14.patch`

## 1. Why this artifact exists

`.github/workflows/foundation-verify.yml` is **red** on
`platform-architecture-2026` for every recorded push (runs `37168808023`,
`37168783671`, 2026-10-04). The job fails at the first broken step, which masked
a second broken step behind it.

The repair could not be pushed from the authoring session because the GitHub App
used by the automation is not permitted to modify workflow files:

```text
! [remote rejected] cline/hp1c6fdq -> cline/hp1c6fdq
  (refusing to allow a GitHub App to create or update workflow
   `.github/workflows/foundation-verify.yml` without `workflows` permission)
```

The repair is therefore preserved as a reviewable patch rather than applied.

## 2. Root causes

**Root cause 1 — brittle assertion (observed failure).**
Step "Verify single engineering conference route" asserted the literal string
`GATE-00 → GATE-01 → … → GATE-07` inside
`docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-CONSTITUTION-2026.md`.
That string has never existed in the Constitution, which declares the route in
stage names and maps them to the gate IDs in prose (line 33: "The first seven
stages are `GATE-00` through `GATE-07` in the canonical Engineering Conference
Gate Model."). Reproduced locally: the `grep -Fq` fails.

**Root cause 2 — over-broad prohibition (latent, masked).**
Step "Verify canonical session state references repository-wide" searched the
whole repository for `docs/handoff/SESSION_STATE.md`. Three legitimate
references exist:

- `.agents/skills/asas-conference-engineering/SKILL.md` — a procedural
  **prohibition** ("Do not load historical `docs/handoff/SESSION_STATE.md` as
  active state");
- `.github/workflows/foundation-verify.yml` — the check's own text;
- `docs/audit/FORENSIC-REPOSITORY-RECONSTRUCTION-2026-09-20.md` — historical
  provenance evidence.

Once root cause 1 is fixed, this step fails next.

## 3. Repair

1. Replace the punctuation-specific route assertion with semantic assertions:
   the Constitution must reference the Gate Model, declare `GATE-00` and
   `GATE-07`, and declare the no-parallel-route rule.
2. Scope the session-state prohibition so it targets **routing** rather than
   **provenance**. The check now excludes audit evidence
   (`docs/audit/**`, `docs/audits/**`), reconciliation evidence
   (`docs/architecture/reconciliation/**`) and the workflow itself, and filters
   out lines that are prohibitions about the legacy file rather than
   instructions to use it. A genuine regression — routing work to
   `docs/handoff/SESSION_STATE.md` as current state — still fails the check
   (verified by a negative test).
3. Add a step that runs `scripts/verify-architecture-integrity.sh` (already
   committed on this branch), enforcing Phase C track indexes, ADR register
   coverage/uniqueness, and internal reference integrity with an explicit
   known-gap allowlist.

**No canonical A1 text was edited to make a check pass.** The Constitution is
unchanged; the check was corrected to match the canonical claim.

## 4. Apply instructions

```bash
cd <repository root>
git checkout platform-architecture-2026
git apply docs/architecture/reconciliation/ASAS-CI-REPAIR-2026-10-14.patch
```

The patch applies to the workflow revision present at
`fdb7e06fdc1818755440cdd72e21ad2b46fd3e48`. If the workflow has moved, apply the
three edits manually as described in §3.

## 5. Verification status

| Check | Result |
|---|---|
| All 10 workflow run-blocks executed locally **with** the patch | `PASS` (0 failures) |
| Failing step reproduced locally **without** the patch | `FAIL` (reproduces CI) |
| Negative test of the new integrity step (bogus reference injected) | `FAIL` as designed (exit 1) |
| Negative test of the session-state rule (routing doc pointing at the legacy file) | `FAIL` as designed — provenance exclusions do not blind the check |
| GitHub-side re-run after applying the patch | `NOT_EXECUTED` |

Until the patch is applied, CI remains red and the new integrity check runs only
when invoked manually:

```bash
bash scripts/verify-architecture-integrity.sh
```

## 6. The patch file is the single source

The exact diff is kept in one place and is **not** duplicated inside this
document, so the two cannot drift:

`docs/architecture/reconciliation/ASAS-CI-REPAIR-2026-10-14.patch`

It contains three changes: the semantic route assertion, the new
`scripts/verify-architecture-integrity.sh` step, and the routing-scoped
session-state check. It was regenerated on 2026-10-14 after the session-state rule
was corrected, because the first version would have flagged this document's own
provenance discussion of the legacy file.

Read it before applying:

```bash
cat docs/architecture/reconciliation/ASAS-CI-REPAIR-2026-10-14.patch
```
