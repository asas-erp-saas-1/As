# ASAS Claude Context Loading Protocol

Status: CANONICAL AGENT WORKFLOW
Scope: Repository-level context loading before implementation

## Objective

Give Claude enough context to act safely without forcing it to ingest the entire repository or invent missing semantics.

## Loading order

### Tier 0 — Identity and control
1. `AGENTS.md`
2. `docs/handoff/CLAUDE-START-HERE.md`
3. `docs/handoff/CLAUDE-IMPLEMENTATION-BOUNDARY.md`
4. `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`
5. `docs/handoff/CURRENT-SESSION-STATE.md`
6. `docs/governance/CANONICAL-ARTIFACT-REGISTER.md`
7. `docs/handoff/CLAUDE-PROJECT-CONTEXT-PACK.md`

### Tier 1 — Current execution scope
8. Current task packet
9. Task graph and predecessor evidence
10. Relevant Definition of Done / gate matrix
11. `docs/governance/FOUNDATION-READINESS-AUTHORITY.md` when evaluating implementation readiness
12. `docs/handoff/CLAUDE-IMPLEMENTATION-READINESS-MASTER.md` when evaluating implementation readiness
13. Relevant ADRs and reconciliation records

### Tier 2 — Domain context
14. Relevant bounded-context contract
15. Relevant command/event/state/permission/data registers
16. Relevant UX/Figma contract
17. Relevant integration contract

### Tier 3 — Repository reality
18. Existing implementation files in the declared scope
19. Tests and fixtures
20. Migration/schema artifacts when explicitly authorized
21. Runtime/provider configuration only when the task requires it

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

## Naming consistency rule

`docs/handoff/CURRENT-SESSION-STATE.md` is the sole current execution checkpoint. Any historical `SESSION_STATE.md` artifact is compatibility/history only and must not be loaded as current state.

## Canonical-artifact rule

Before relying on a named contract, Claude MUST check `docs/governance/CANONICAL-ARTIFACT-REGISTER.md`. A referenced artifact that is marked `NOT PRESENT`, `BLOCKED`, or otherwise non-canonical MUST NOT be fabricated from memory, prose, or implementation code. The task must follow the register's unlock condition or escalate through the reconciliation protocol.

## Context-pack rule

`docs/handoff/CLAUDE-PROJECT-CONTEXT-PACK.md` is an orientation layer. It is intentionally comprehensive but non-authoritative. It must never override `AGENTS.md`, the current session checkpoint, canonical contracts, approved decisions, validated registers, or verified repository/runtime evidence.
