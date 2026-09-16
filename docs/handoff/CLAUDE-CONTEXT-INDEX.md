# ASAS — Claude Context Index

## Read order

1. `AGENTS.md`
2. `docs/handoff/CLAUDE-START-HERE.md`
3. `docs/handoff/CLAUDE-IMPLEMENTATION-BOUNDARY.md`
4. `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`
5. `docs/handoff/CURRENT-SESSION-STATE.md`
6. Current task packet
7. Dependencies named by the task
8. Canonical registers/contracts
9. Architecture/decisions relevant to the task
10. Research and supporting evidence

## Context loading rule

The Master Execution Path and Current Session State are mandatory canonical handoff files. If either is missing, stale, or internally inconsistent with repository reality, Claude MUST treat handoff integrity as blocked and repair/reconcile the handoff before implementation.

Do not load the entire repository indiscriminately and infer requirements from volume. Load the smallest authoritative context necessary for the task, then inspect affected implementation files and dependencies.

## Conflict rule

If two sources conflict, follow the authority order in `AGENTS.md` and the current canonical handoff. If the conflict cannot be resolved from those authorities, stop and record it rather than choosing by intuition.

## Historical material

Historical drafts, examples, old repository notes and similarly named or separate projects may provide context only. They are not implementation authority unless explicitly promoted by a current decision/contract.

## Source-package rule

The uploaded/source ASAS package is an input to the architecture process, not a file that must be copied wholesale into GitHub. Only validated, canonical, operationally useful artifacts should enter this repository, and their provenance must be recorded.

## Resume rule

When the operator says `أكمل عملك على المسار`, reload this index, then the Master Execution Path and Current Session State from the current repository ref before selecting the next task. Do not rely on conversational memory as the checkpoint.
