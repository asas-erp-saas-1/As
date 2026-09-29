---
name: asas-conference-engineering
description: Control ASAS architecture-conference work, gate sequencing, source reconciliation, research, ADRs, evidence, and agent stop conditions before implementation authorization.
---

# ASAS Engineering Conference Skill

This skill is mandatory for architecture-conference work. It does not replace `AGENTS.md`, V3, the canonical gate model, or founder authority.

## Mission

Engineer the ASAS platform architecture before implementation. Keep one path, one authority chain, one canonical owner per concept, and one evidence-based checkpoint.

## Mandatory load order

```text
AGENTS.md
→ docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-CONSTITUTION-2026.md
→ docs/handoff/CURRENT-SESSION-STATE.md
→ docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md
→ docs/architecture/ASAS-ARCHITECTURE-V3.md
→ docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md
→ docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md
→ docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md
→ relevant C-track artifacts
→ relevant provenance/research
```

Do not load historical `docs/handoff/SESSION_STATE.md` as active state.

## Gate discipline

Only the first unresolved gate is active for implementation work.

```text
GATE-00 → GATE-01 → GATE-02 → GATE-03 → GATE-04 → GATE-05 → GATE-06 → GATE-07
```

Research may inspect future gates. It may not close, bypass or authorize around them.

## Research method

```text
Question
→ current primary source
→ alternative evidence
→ applicability
→ contradiction analysis
→ failure modes
→ ASAS reconciliation
→ decision
→ ADR/contract/register
→ verification
```

Current external facts must be sourced; AI memory is not authority for current versions, vendor behavior or legal requirements.

## C-track routing

C01–C22 are inputs to the gate system, not parallel implementation paths.

For a C-track finding, identify:

1. semantic/domain consequence;
2. context/ontology impact;
3. contract/invariant impact;
4. security/tenancy/data-governance impact;
5. experience/integration/operations impact;
6. implementation authorization impact.

Do not write schema/code merely because a C-track discussion is complete.

## Agent authority

Before acting, record:

- role;
- gate;
- scope;
- non-goals;
- tools;
- evidence requirements;
- stop conditions;
- verification;
- output location.

Agents may inspect, research, reconcile and draft within scope. They must stop for founder decisions, unresolved semantics, protected security/tenant decisions, financial/legal interpretation, destructive actions, irreversible external effects or missing critical evidence.

## Required work product

Every material conference task leaves:

`Question → Evidence → Decision → Canonical artifact → Verification → Checkpoint`

If no repository artifact needs changing, record the conclusion in the canonical research/decision owner rather than creating a duplicate document.

## Definition of done

A conference task is complete only when:

- the correct gate is identified;
- source hierarchy was followed;
- contradictions were reconciled or explicitly blocked;
- alternatives and failure modes were considered where material;
- the decision has one canonical owner;
- downstream impacts are recorded;
- verification is defined and, where possible, executed;
- CURRENT-SESSION-STATE is updated when the checkpoint materially changes.

## Prohibitions

Never:

- invent product semantics;
- invent runtime/database facts;
- silently promote source-package content to authority;
- create duplicate canonical documents;
- bypass a gate because implementation looks easy;
- treat a passing document check as runtime verification;
- expose secrets;
- modify production data;
- use a different branch as a hidden work path;
- claim completion without evidence.
