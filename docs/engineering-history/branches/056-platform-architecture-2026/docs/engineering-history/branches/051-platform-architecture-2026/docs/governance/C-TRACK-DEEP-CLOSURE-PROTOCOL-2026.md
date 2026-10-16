# ASAS — C-TRACK DEEP CLOSURE PROTOCOL 2026

**Status:** CANONICAL OPERATING RULE
**Branch:** `platform-architecture-2026`
**Scope:** C01–C22 Engineering Conference tracks
**Mission state:** PRE-IMPLEMENTATION / ARCHITECTURE ENGINEERING

## 1. Purpose

This protocol exists to prevent premature closure of any Engineering Conference C-track. A C-track is not closed because its narrative is strong, a semantic baseline exists, or an implementation is blocked. Closure requires evidence that the track's full decision surface has been reconciled against the canonical architecture, governance, dependent tracks, runtime reality where applicable, and independent review.

The founder's explicit operating requirement is preserved: previously worked C-tracks remain OPEN until a deliberate deep-closure review proves that the track is complete and internally consistent.

## 2. Authority

The active conference Gate Model defines C01–C22 as Engineering Conference tracks. C-tracks feed the serial gates; they do not replace GATE-00…GATE-07 and do not authorize implementation by themselves.

Canonical authority chain:

`Founder/Product Constitution → Architecture → Contracts → Registers → Repository → Runtime → Evidence`

The database is authoritative for existing brownfield reality. Documentation must never be changed merely to make it agree with implementation or runtime.

## 3. Mandatory per-track loop

Every C-track must pass the following sequence individually. Do not batch-close tracks merely because they share a bounded context.

```text
L0 Reality Lock
→ L1 Locate
→ L2 Load
→ L3 Scope / Questions
→ L4 Research & Verify
→ L5 Model / Decide
→ L6 Prove / Cross-check
→ L6.5 Reconcile
→ Independent Red Team
→ Closure Review
→ Evidence Lock
```

The ASAS L0–L7 operating loop is retained. For conference work, implementation is replaced by architecture/model/decision work until GATE-07 authorizes implementation.

## 4. Required loading before a track decision

At L1/L2 the agent must load, as applicable:

- `AGENTS.md` / canonical governance instructions;
- current `CURRENT-SESSION-STATE.md`;
- Engineering Conference Constitution;
- Engineering Conference Gate Model;
- Architecture V3;
- Source of Truth and Canonical Artifact Register;
- Domain Engineering Track Register;
- Closure Matrix;
- relevant Master Specification chapters/appendices;
- relevant task packet and ADRs;
- relevant events, permissions and state-machine registers;
- relevant skills from `docs/skills/INDEX.md`;
- last three lessons from `docs/memory/lessons.md`;
- relevant research artifacts and current external primary sources.

For unfamiliar territory, the research protocol is mandatory: question → primary source → current version/date → alternative evidence → decision → ADR/research note → review/expiration date.

## 5. Evidence classes

Every material statement must be classified:

- `FOUNDER-DECIDED`
- `ARCHITECTURE-CANONICAL`
- `CONTRACT-CANONICAL`
- `REGISTER-VERIFIED`
- `REPOSITORY-VERIFIED`
- `RUNTIME-VERIFIED`
- `EXTERNAL-SOURCE-VERIFIED`
- `INFERRED`
- `PROPOSED`
- `UNVERIFIED`
- `BLOCKED`

No `INFERRED`, `PROPOSED`, or `UNVERIFIED` item may silently become a closed decision.

## 6. Deep-closure dimensions

A C-track cannot be closed until all applicable dimensions are explicitly marked CLOSED, NOT APPLICABLE with evidence, or BLOCKED with a named dependency.

1. Mission and scope
2. Actors and authority
3. Domain objects and ownership
4. Ontology objects/properties/links/actions
5. Lifecycle/state machines
6. Invariants and business rules
7. Commands and queries
8. Events and event ownership
9. Permissions, tenancy and data classification
10. Contracts and integration boundaries
11. Persistence implications / brownfield reality
12. Cross-domain dependencies
13. Regulatory/legal dependencies where applicable
14. UX/operational implications where applicable
15. Analytics/lineage implications
16. AI opportunities and AI authority limits
17. Failure modes and adversarial cases
18. Performance/scalability implications
19. Observability/audit requirements
20. Migration/backward-compatibility implications
21. Research freshness and source quality
22. Canonical artifact ownership
23. Test/evidence strategy
24. Independent review

## 7. Closure states

Use these states exactly:

`OPEN` — work remains.

`IN REVIEW` — all primary work is present but independent review is running.

`SEMANTICALLY CLOSED` — domain meaning and major decisions are resolved; this is NOT implementation authorization.

`CONTRACT CLOSED` — contracts/registers/invariants are reconciled and canonical.

`EVIDENCE CLOSED` — required evidence exists and has been independently checked.

`IMPLEMENTATION BLOCKED` — architecture may be closed while a later Gate or external dependency blocks implementation.

`CLOSED` — only after semantic, contract, evidence and independent-review criteria are satisfied.

## 8. Re-open rule

A closed C-track must reopen if any of the following appears:

- contradictory canonical artifact;
- runtime evidence contradicts the decision;
- new regulatory requirement changes the rule;
- dependent C-track introduces an incompatible contract;
- architecture ADR changes the ownership boundary;
- critical failure mode was omitted;
- source becomes stale or is superseded;
- independent reviewer finds an unhandled material gap.

Closure is therefore reversible by evidence, not by convenience.

## 9. Special rule for C03–C06

The previous ASAS work on C03–C06 is preserved. It must be reviewed, not discarded.

Current recovered provenance:

```text
C03 → Real Estate
C04 → CRM
C05 → Sales
C06 → Finance
```

C03 remains OPEN until its brownfield/persistence reconciliation and all applicable deep-closure dimensions are proven. Runtime evidence alone does not close the domain.

C05/C06 semantic closure does not authorize implementation. Their later Gate dependencies remain binding.

## 10. Cross-track closure

After individual track closure, run an explicit cross-track review. At minimum, review:

```text
C03 ↔ C04
C03 ↔ C05
C03 ↔ C06
C04 ↔ C05
C05 ↔ C06
Commercial Core ↔ Documents
All domains ↔ Identity/Tenancy/Authorization/Audit/Events
```

No track is finally closed if a dependent track exposes a contradiction in its ownership, state, event, permission, contract, or invariant model.

## 11. Agent operating discipline

Agents must not:

- fabricate a mapping, table, API, event, permission or legal rule;
- close a track to make the roadmap look green;
- modify registers to match implementation;
- skip a required source because a prior decision appears plausible;
- treat a previous assistant answer as authority;
- silently resolve founder-decision items;
- create schema/code/migrations while the applicable Gate forbids implementation;
- weaken a CI or verification rule to obtain closure.

When blocked: diagnose → search → inspect repository → inspect runtime where authorized → research primary sources → test alternatives → identify exact blocker → record it.

## 12. Definition of C-track done

A C-track is CLOSED only when the closure record contains:

- track identity and scope;
- loaded source set;
- decision inventory;
- unresolved-question inventory with zero unowned critical questions;
- evidence classification for every material decision;
- canonical artifact references;
- dependency map;
- cross-track review result;
- red-team findings and dispositions;
- research freshness record;
- closure decision and reviewer evidence;
- next Gate handoff;
- lesson/skill contribution or explicit none-with-justification.

## 13. Relationship to Gates

C-track closure does not advance Gates automatically.

```text
C-track finding
→ GATE-02 topology
→ GATE-03 contracts/invariants
→ GATE-04 security/data governance
→ GATE-05 experience/integration/operations
→ GATE-06 engineering verification/AI governance
→ GATE-07 implementation authorization
```

The applicable Gate must independently satisfy its own closure criteria.

## 14. Current execution rule

The active conference must work one C-track stage at a time when performing deep closure. Do not advance to the next C-track merely because the current one has a preliminary semantic baseline.

For the current checkpoint, the next work item is C03 deep forensic reconciliation, followed by C03 independent review. Only after C03 reaches a justified closure state should the conference advance to the next C-track work item.

**Implementation authorization remains false.**
