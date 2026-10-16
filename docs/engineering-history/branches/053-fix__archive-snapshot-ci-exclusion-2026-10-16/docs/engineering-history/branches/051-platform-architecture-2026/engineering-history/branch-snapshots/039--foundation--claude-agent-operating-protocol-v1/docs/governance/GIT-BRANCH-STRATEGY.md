# ASAS Git Branch Strategy

**Repository:** `asas-erp-saas-1/As`
**Status:** Canonical repository governance

## Objective

Keep `main` stable and reviewable while giving Claude Code isolated, task-scoped workspaces. Branches represent bounded work, not arbitrary sessions.

## Branch hierarchy

- `main` — canonical integration branch. No routine direct development.
- `foundation/*` — architecture, contracts, governance, repository controls, and pre-implementation foundations.
- `design/*` — UX, design system, Figma contracts and design implementation specifications.
- `feat/*` — bounded product capabilities or vertical slices.
- `fix/*` — corrections to an already implemented capability.
- `refactor/*` — behavior-preserving structural changes.
- `chore/*` — tooling, CI, documentation, dependency and maintenance work.
- `hotfix/*` — exceptional production-critical corrections; requires explicit human review.

## Naming

Use lowercase kebab-case and a stable task identifier when one exists:

`feat/CRM-014-lead-assignment`
`foundation/ARCH-003-command-kernel-contract`
`design/UX-007-property-detail`
`fix/CRM-014-assignment-race`

Do not use `final`, `new`, `test`, dates, personal names, or sequential meaningless suffixes.

## Branch lifecycle

`main → branch → inspect → implement → verify → PR → review → merge → delete`

A branch must have one bounded objective and one Definition of Done. If scope expands materially, split the work rather than turning the branch into a mini-project.

## Claude operating rule

Claude works from a task branch created from the latest approved `main` (or from an explicitly approved parent branch for stacked work). Claude must not force-push, delete protected branches, rewrite shared history, or merge its own work unless explicitly authorized by repository governance.

For independent tasks, prefer one branch per task. For tightly dependent work, stacked branches are permitted only when each branch remains independently reviewable.

## Main protection

`main` should require pull requests, required CI/status checks, resolved conversations, and review appropriate to the sensitivity of the change. Force pushes and deletion must be disabled. Administrative bypass should be disabled where the GitHub plan/ruleset capability permits.

Sensitive paths should use CODEOWNERS/review ownership once the responsible owners are established.

## Merge policy

Prefer squash merge for small task branches when a concise history is desirable. Preserve merge commits when a release or dependency topology makes the branch structure materially useful. Never merge failing or unverifiable work merely to unblock another task.

## Task-to-branch contract

Every implementation branch must reference:

- Task ID
- bounded context
- parent/base branch
- authoritative contracts
- non-goals
- expected files/modules
- security/tenant boundary
- validation and invariants
- tests
- Definition of Done

## Prohibited patterns

- direct routine commits to `main`
- force-push on `main` or shared branches
- destructive reset
- branch names that conceal scope
- mixing unrelated bounded contexts in one task branch
- merging because code "looks right" without evidence
- treating a branch as a substitute for a task specification
