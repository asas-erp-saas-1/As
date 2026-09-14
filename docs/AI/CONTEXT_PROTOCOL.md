# ASAS AI Context Protocol

**Status:** Operational
**Purpose:** Persistent operating context for long-running ASAS engineering sessions.

## Resume command

When the founder says **"أكمل على المسار" / "Continue on the path"**, treat GitHub as the continuity anchor. Do not reconstruct state from conversational memory alone.

### Mandatory resume sequence

1. Identify repository: `asas-erp-saas-1/As`.
2. Read `README.md`, `AGENTS.md`, and `docs/handoff/PHASE-1-ENTRY.md`.
3. Read `docs/product/PRODUCT_TRUTH.md` and `docs/product/PRODUCT_ARCHITECTURE_DIRECTION.md`.
4. Read the current roadmap/status file under `docs/handoff/` if present.
5. Inspect current branch, latest commits, open PRs, and changed files relevant to the active phase.
6. Re-open the authoritative ASAS handoff/Blueprint source when a task depends on it.
7. Determine the active phase/task and its entry/exit gates before modifying code.
8. Never assume that the last chat message represents current repository state.
9. Report state using only: VERIFIED / FAILED / BLOCKED / NOT EXECUTED.

## Source authority

1. Live production database reality for pre-existing data structures.
2. ASAS Blueprint Chapter 39 contracts.
3. Machine-readable registers and appendices.
4. Blueprint prose.
5. Existing repository implementation.
6. General best practice and external research.

When external research is used, record the source, date, decision impact, and whether it changes an ASAS contract.

## Engineering behavior

- Research before non-trivial implementation.
- Inspect before changing.
- Contract before code.
- One coherent task per branch/PR.
- No force-push, reset, destructive production migration, or production-data deletion.
- Extend; do not rewrite production reality without an approved migration plan.
- Authorization is deny-by-default and enforced in the data/application layers.
- State changes use canonical state machines.
- Posted financial facts are immutable.
- Tenant isolation is mandatory.
- Audit material state changes.
- Tests and adversarial review are part of delivery, not optional cleanup.

## Product reasoning

ASAS is a Real Estate Operating System with three connected surfaces:

- Public Experience
- Studio / Publishing OS
- Operations OS

They share canonical domain data. Website content must not become a duplicate inventory database; CRM must not become a second property truth; finance must not rewrite historical facts.

The platform is intended to support both agency operations and developer/promoter portfolio operations, with future ASAS Group / multi-company expansion.

## Founder decision boundary

The architecture is explicitly challengeable. The AI may propose, research, model, test, and implement within approved scope. Founder-level changes to product identity, commercial/legal policy, ownership, destructive operations, or irreversible production behavior must be surfaced rather than silently assumed.

## Session handoff rule

Every meaningful work session should leave enough repository evidence for another session to resume without the prior chat. At minimum: active phase/task, completed evidence, blockers, next action, relevant decisions, and links/paths to changed artifacts.
