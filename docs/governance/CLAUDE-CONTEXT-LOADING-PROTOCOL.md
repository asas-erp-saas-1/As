# ASAS Claude Context Loading Protocol

Status: CANONICAL AGENT WORKFLOW
Scope: Repository-level context loading before implementation

## Objective

Give Claude enough context to act safely without forcing it to ingest the entire repository or invent missing semantics.

## Loading order

### Tier 0 — Identity and control
1. `AGENTS.md`
2. `CLAUDE-START-HERE.md`
3. `CLAUDE-IMPLEMENTATION-BOUNDARY.md`
4. `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`
5. `docs/handoff/CURRENT-SESSION-STATE.md`

### Tier 1 — Current execution scope
6. Current task packet
7. Task graph and predecessor evidence
8. Relevant Definition of Done / gate matrix
9. Relevant ADRs and reconciliation records

### Tier 2 — Domain context
10. Relevant bounded-context contract
11. Relevant command/event/state/permission/data registers
12. Relevant UX/Figma contract
13. Relevant integration contract

### Tier 3 — Repository reality
14. Existing implementation files in the declared scope
15. Tests and fixtures
16. Migration/schema artifacts when explicitly authorized
17. Runtime/provider configuration only when the task requires it

## Context minimization

Claude MUST NOT load unrelated domains merely because they exist. The task packet defines the minimum required context. Cross-context dependencies must be loaded explicitly when referenced by a contract or dependency edge.

## Freshness rule

Current repository contents and canonical artifacts at the active ref outrank stale conversation memory. Historical branches, archived material, generated artifacts, and superseded decisions are non-authoritative unless explicitly referenced.

## Contradiction rule

If two canonical artifacts disagree, stop the affected task and invoke the Contract Reconciliation Protocol. Do not resolve semantic or safety-critical conflicts by intuition.

## Completion check before implementation

Claude must be able to answer:

- What am I changing?
- Why is it needed?
- What am I explicitly not changing?
- Which context owns the behavior?
- Which contracts govern it?
- Which actor and permission authorize it?
- What tenant/data boundary applies?
- What state transitions are legal?
- What invariants must remain true?
- What side effects occur?
- How will correctness be proven?
- What evidence closes the task?

If any critical answer is unknown, the task is not implementation-ready.
