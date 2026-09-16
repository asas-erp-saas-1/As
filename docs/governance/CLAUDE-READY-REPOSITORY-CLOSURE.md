# ASAS Claude-Ready Repository Closure Standard

## Objective

Declare the repository structurally ready for Claude Code only when the engineering environment is internally coherent, not merely because documentation exists.

## Required closure gates

### R1 — Canonical identity
- Repository is `asas-erp-saas-1/As`.
- `main` is the default integration branch.
- No alternate ASAS repository is treated as implementation authority.

### R2 — Handoff integrity
- `AGENTS.md` exists and is authoritative.
- `CLAUDE-START-HERE.md` exists.
- `CLAUDE-IMPLEMENTATION-BOUNDARY.md` exists.
- `ASAS-MASTER-EXECUTION-PATH.md` exists on the handoff branch/ref.
- `CURRENT-SESSION-STATE.md` exists and is current.
- Context index points to every mandatory handoff artifact.

### R3 — Repository map
- Every top-level engineering area has a declared owner/purpose.
- Placement rules prevent duplicate sources of truth.
- Application directories remain intentionally empty until implementation authorization.

### R4 — Contract/governance
- Authority order is explicit.
- Contradiction classes and escalation rules are explicit.
- Task packet schema is explicit.
- Task closure evidence is explicit.
- Branch/PR lifecycle is explicit.

### R5 — Verification
- Foundation CI validates repository integrity and governance constraints.
- Implementation CI is added only after the application stack is canonical.
- Required checks are not invented before their commands actually exist.

### R6 — Git discipline
- `main` is treated as canonical integration truth.
- Implementation uses short-lived task-scoped branches.
- PR review is mandatory for changes entering `main` once repository rules are administratively enabled.
- Force-push and destructive branch operations are prohibited by policy.

### R7 — Domain readiness is task-scoped
- A repository may be structurally Claude-ready while individual domain slices remain BLOCKED.
- Claude must never infer that repository readiness authorizes database/runtime/production work.

## Final declaration vocabulary

Use exactly one status per gate:

- `VERIFIED` — objective evidence exists.
- `PARTIAL` — controls exist but the required downstream action is not safe yet.
- `BLOCKED` — an external/contract prerequisite remains unresolved.
- `NOT_EXECUTED` — the check has not been run.

## Important distinction

**Repository-ready for Claude** does not mean **production-ready for ASAS**.

Repository readiness means Claude has a trustworthy engineering workspace and operating contract. Runtime/database readiness remains a separate gate requiring verified platform reality.
