# ASAS — ENGINEERING CONFERENCE CONSTITUTION 2026

**Status:** CANONICAL / ACTIVE
**Version:** 1.0.0
**Effective:** 2026-09-27
**Repository:** `asas-erp-saas-1/As`
**Sole engineering line:** `platform-architecture-2026`

## 1. Purpose

This is the single operating constitution for the ASAS Engineering Conference. It governs how architecture is researched, reconciled, decided, recorded, verified and eventually authorized for implementation.

It does not replace Architecture V3, the Source of Truth, contracts, registers or runtime evidence. It determines how those authorities are loaded and used together.

## 2. One path

The project has one engineering path:

```text
PLATFORM IDENTITY
→ ARCHITECTURE AUTHORITY
→ DOMAIN TOPOLOGY / ONTOLOGY
→ CONTRACTS / INVARIANTS / BEHAVIOR
→ PLATFORM KERNEL / SECURITY / TENANCY / DATA GOVERNANCE
→ EXPERIENCE / INTEGRATION / OPERATIONS
→ ENGINEERING SYSTEM / VERIFICATION / AI GOVERNANCE
→ SLICE-SPECIFIC IMPLEMENTATION AUTHORIZATION
→ CONTROLLED IMPLEMENTATION
→ RUNTIME EVIDENCE
→ PRODUCTION
```

The first seven stages are `GATE-00` through `GATE-07` in the canonical Engineering Conference Gate Model.

No parallel implementation path, alternate gate sequence, or conversational shortcut is authoritative.

## 3. One source hierarchy

For existing brownfield reality:

```text
Verified runtime/database
→ verified repository implementation
→ approved contracts/registers/ADRs
→ approved architecture
→ historical/source package
→ inference
```

For desired future behavior:

```text
Founder/product decision
→ approved architecture
→ ADRs
→ contracts/registers
→ authorized implementation
```

For external engineering facts:

```text
Official/current primary source
→ standard/regulator/vendor documentation
→ authoritative research
→ professional secondary source
→ community material
```

Conflicts are recorded; they are never silently averaged.

## 4. One decision method

Every material architecture question follows:

```text
QUESTION
→ SCOPE / IMPACT
→ REPOSITORY EVIDENCE
→ CURRENT PRIMARY RESEARCH
→ ALTERNATIVES
→ FAILURE MODES / THREATS
→ ASAS SOURCE RECONCILIATION
→ DECISION
→ ADR / CONTRACT / REGISTER IMPACT
→ ADVERSARIAL REVIEW
→ VERIFICATION METHOD
→ EVIDENCE
→ CHECKPOINT
```

A decision is not complete because a paragraph was written. It is complete when its owner, consequences, verification and canonical home are explicit.

Hard-to-reverse decisions receive deeper analysis before authorization; architecture review is continuous rather than a one-time ceremony.

## 5. One canonical artifact rule

One concept has one canonical owner.

Examples:

| Concept | Canonical owner |
|---|---|
| Architecture | `docs/architecture/ASAS-ARCHITECTURE-V3.md` |
| Engineering gate model | `docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md` |
| Engineering constitution | this document |
| Execution path | `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md` |
| Session checkpoint | `docs/handoff/CURRENT-SESSION-STATE.md` |
| Architecture context | `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` |
| Source of Truth | `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md` |
| Roadmap | `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` |
| Engineering gap completion | `architecture/governance/ASAS-ENGINEERING-GAP-COMPLETION-PROTOCOL-2026.md` |
| Agent engineering procedure | `.agents/skills/asas-engineering/SKILL.md` + conference skill |
| Implementation readiness | downstream `IG-*` artifacts |

Duplicates must become pointers, be consolidated into the canonical owner, or be explicitly historical.

## 6. C-tracks are subordinate inputs, not competing paths

C01–C22 are conference/domain tracks. They do not create an alternative engineering route.

A C-track may research and model a domain independently where useful, but its output must be reconciled through the applicable Engineering Conference gates before implementation.

Example:

```text
C03 domain decision
→ GATE-02 semantic reconciliation
→ GATE-03 contract/invariant reconciliation
→ GATE-04 security/data-governance consequences
→ GATE-07 bounded implementation authorization
```

The same rule applies to C04, C05, C06 and later tracks.

## 7. Agent control model

Every agent task must have:

- role;
- current gate;
- exact scope;
- non-goals;
- allowed tools;
- source hierarchy;
- evidence class requirements;
- stop conditions;
- verification method;
- output location;
- checkpoint requirement.

Agents must not create a new architecture path because a source is inconvenient, a later task is interesting, or an implementation appears easy.

Agents may research ahead of the current gate, but they may not close or bypass a gate out of sequence.

High-risk, irreversible, founder/product, legal, financial, security-exception and destructive production decisions require human control as defined by V3/AGENTS.

## 8. Continue protocol

When the operator says `Continue`, `continue`, `أكمل`, or `أكمل العمل على المسار`:

1. load this constitution;
2. load `CURRENT-SESSION-STATE.md`;
3. load the canonical gate model;
4. load V3, Source of Truth, Context Prompt and Roadmap;
5. inspect the active branch and HEAD;
6. identify the first unresolved gate dependency;
7. inspect the canonical artifacts and provenance relevant to that dependency;
8. research material external gaps with current authoritative sources;
9. reconcile contradictions;
10. make the smallest authorized change;
11. verify the change;
12. update canonical state and evidence;
13. stop at the next genuine blocker or continue to the next unblocked dependency.

Never restart from conversational memory.

## 9. Gate closure

A gate is GREEN only when:

```text
Decision
→ Artifact
→ Owner
→ Dependencies
→ Invariants
→ Verification
→ Evidence
→ Known deferrals
→ Checkpoint
```

all exist and no critical contradiction remains.

`Discussed ≠ decided ≠ contracted ≠ verified ≠ implemented ≠ production-ready`.

A closed gate reopens when stronger evidence, a new invariant, a security finding, runtime contradiction, legal requirement, material performance result, concurrency finding or architecture change invalidates the closure.

## 10. Pre-implementation boundary

Until GATE-07 authorizes a specific slice:

- no application implementation is implied;
- no production schema construction is implied;
- no migration is implied;
- no RLS implementation is implied;
- no feature is promoted merely because its domain research is complete.

Infrastructure existence (GitHub, Vercel, Supabase) is not implementation authorization.

## 11. Evidence vocabulary

Use only these states where applicable:

`SOURCE-VERIFIED | RUNTIME-VERIFIED | TEST-VERIFIED | EXTERNALLY-VERIFIED | ENGINEERING-DERIVATION | PROPOSED | UNVERIFIED | PARTIAL | OPEN | CONFLICT | BLOCKED | FOUNDER-DECISION-REQUIRED`

Never use `VERIFIED` merely because documentation exists.

## 12. Success condition

The objective is not to produce the largest number of documents. The objective is a coherent architecture whose semantics, contracts, security, operations and engineering controls make incorrect implementation difficult, detectable, unreleasable without evidence, and recoverable when failures occur.
