# ASAS Claude Context Loading Protocol

Status: CANONICAL AGENT WORKFLOW  
Scope: Repository-level context loading for architecture and implementation work

## Objective

Give ASAS agents enough context to act safely without forcing them to ingest the entire repository or invent missing semantics.

This protocol applies to **every material engineering task**, including the pre-implementation Engineering Conference. It is not limited to code implementation.

## Loading order

### Tier 0 — Identity and control
1. `AGENTS.md`
2. `docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-CONSTITUTION-2026.md`
3. `docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md`
4. `docs/handoff/CURRENT-SESSION-STATE.md`
5. `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`
6. `CLAUDE-START-HERE.md` and any repository-local boundary file explicitly named by the active task

### Tier 1 — Current execution scope
7. Current task packet
8. Task graph and predecessor evidence
9. Relevant Definition of Done / gate matrix
10. Relevant ADRs and reconciliation records

### Tier 2 — Architecture and domain context
11. `ASAS-ARCHITECTURE-V3.md`
12. Relevant architecture/context/roadmap/source-of-truth artifacts
13. Relevant bounded-context contract
14. Relevant command/event/state/permission/data registers
15. Relevant UX/Figma contract
16. Relevant integration contract

### Tier 3 — Repository reality
17. Existing implementation files in the declared scope
18. Tests and fixtures
19. Migration/schema artifacts only when the current gate and task explicitly authorize them
20. Runtime/provider configuration only when the task requires it

## Context minimization

Agents MUST NOT load unrelated domains merely because they exist. The task packet defines the minimum required context. Cross-context dependencies must be loaded explicitly when referenced by a contract or dependency edge.

## Freshness rule

Current repository contents and canonical artifacts at the active engineering line `platform-architecture-2026` outrank stale conversation memory. Historical branches, archived material, generated artifacts, and superseded decisions are non-authoritative unless explicitly referenced for provenance.

No engineering task may switch to `main` or another branch merely because a provider, repository default, or historical document names it differently. Branch mismatch is recorded and reconciled through GATE-00.

## Contradiction rule

If two canonical artifacts disagree, stop the affected task and invoke the Contract Reconciliation Protocol. Do not resolve semantic or safety-critical conflicts by intuition.

## Conference gate rule

Before implementation is authorized, the agent must identify the first unresolved Engineering Conference gate:

`GATE-00 → GATE-01 → GATE-02 → GATE-03 → GATE-04 → GATE-05 → GATE-06 → GATE-07`

Later-gate research may inform an earlier decision, but no agent may close or bypass the first unresolved gate.

## Completion check before implementation

Before implementation, the agent must be able to answer:

- What am I changing?
- Why is it needed?
- What am I explicitly not changing?
- Which gate authorizes this work?
- Which context owns the behavior?
- Which contracts govern it?
- Which actor and permission authorize it?
- What tenant/data boundary applies?
- What state transitions are legal?
- What invariants must remain true?
- What side effects occur?
- How will correctness be proven?
- What evidence closes the task?

If any critical answer is unknown, the task is not implementation-ready and must be `BLOCKED` or `FOUNDER-DECISION-REQUIRED` as appropriate.
