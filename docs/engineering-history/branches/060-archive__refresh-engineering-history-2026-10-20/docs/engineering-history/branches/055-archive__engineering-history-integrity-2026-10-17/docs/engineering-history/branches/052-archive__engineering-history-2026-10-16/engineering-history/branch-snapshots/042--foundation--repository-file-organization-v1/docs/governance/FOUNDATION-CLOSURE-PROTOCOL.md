# ASAS Foundation Closure Protocol

Status: CANONICAL CONTROL POLICY

## Principle

A foundation gate is closed by evidence, not by document volume or confidence.

## Closure sequence

### Step 1 — Scope
Identify the gate, affected contexts, dependencies and blast radius.

### Step 2 — Authority
List the authoritative sources and identify contradictions. Apply the Contract Reconciliation Protocol.

### Step 3 — Reality
Where the gate concerns an external system, live data, runtime, provider, or environment, inspect the actual system. Repository prose cannot substitute for runtime evidence.

### Step 4 — Contract
Ensure the relevant domain contract, command/event/state/permission/data rules and acceptance criteria are explicit.

### Step 5 — Verification
Run the gate-specific checks. A check must test the property being claimed, not merely execute successfully.

### Step 6 — Evidence
Record immutable references to outputs: commit, CI run, query result, test artifact, provider response, restore drill, screenshot, or equivalent evidence.

### Step 7 — Adversarial review
Attempt to invalidate the claim. Test unauthorized access, tenant crossover, stale data, duplicate requests, concurrent mutation, partial failure, retry, rollback and boundary conditions when applicable.

### Step 8 — Closure
Only after Steps 1–7 succeed may the gate be marked GREEN.

## Evidence freshness

Each gate defines its own freshness. Live provider configuration, deployment state, access, pricing, API behavior and operational metrics are time-sensitive and must be rechecked when they become load-bearing. Historical documentation is never treated as live evidence without verification.

## Blocked-gate policy

A BLOCKED gate remains BLOCKED. Do not rename it GREEN because the blocker is inconvenient. Create an escalation with:

- exact blocker;
- evidence;
- attempts made;
- safe alternatives;
- required authority/input;
- consequence of proceeding;
- recommended next action.

## Dependency rule

A gate cannot close if a prerequisite gate is unresolved and materially affects its evidence.

## Implementation authorization

A2/A3 implementation authority requires the relevant foundation gates to be GREEN or explicitly approved as a documented exception. Exceptions are risk acceptances, not gate closures.

## Final pre-Claude gate

Claude receives implementation authority only when:

1. repository identity is unambiguous;
2. canonical handoff chain resolves;
3. contract authority is reconciled;
4. task graph is executable;
5. security/tenant invariants are explicit;
6. actual platform/database reality is verified for the implementation scope;
7. CI can detect regressions relevant to the stack;
8. rollback/incident boundaries are defined;
9. no unresolved C2/C3 contract conflict affects the first implementation wave.

## Required closure record

Every closed gate must update `docs/governance/FOUNDATION-GATE-REGISTER.md` and the session checkpoint with evidence and the next dependency. A gate is never closed only in conversation.
