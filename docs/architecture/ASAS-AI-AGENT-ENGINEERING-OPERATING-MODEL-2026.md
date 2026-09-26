# ASAS — AI AGENT ENGINEERING OPERATING MODEL 2026

**Artifact ID:** ASAS-AI-AGENT-OPS-2026-001  
**Status:** CANONICAL ENGINEERING OPERATING MODEL  
**Version:** 1.0.0  
**Effective date:** 2026-09-23  
**Canonical branch:** `platform-architecture-2026`  
**Repository:** `asas-erp-saas-1/As`

## 1. Purpose

This artifact defines how ASAS uses AI agents during architecture, product design, implementation, verification and delivery.

The goal is not to maximize the number of agents. The goal is to create a controlled engineering system in which each agent has a bounded responsibility, explicit authority, required evidence, and a deterministic handoff.

The primary engineering executor is **Codex**. Claude is a specialized design/visual collaboration agent and is not the primary repository implementation authority.

## 2. Agent topology

```text
                         FOUNDER / PRODUCT AUTHORITY
                                  │
                                  ▼
                       LEAD ARCHITECT / CONTROL PLANE
                                  │
                 ┌────────────────┼────────────────┐
                 ▼                ▼                ▼
           ARCHITECTURE       DESIGN SYSTEM     RESEARCH
           / DOMAIN           / UX ENGINE        / EVIDENCE
                 │                │                │
                 └───────────────┼────────────────┘
                                 ▼
                           CODEX — LEAD
                       ENGINEERING EXECUTOR
                                 │
              ┌──────────────────┼──────────────────┐
              ▼                  ▼                  ▼
          IMPLEMENTATION      DATABASE/SQL       VERIFICATION
          / REFACTOR          / MIGRATION        / QA / SECURITY
              │                  │                  │
              └──────────────────┼──────────────────┘
                                 ▼
                         INTEGRATION / EVIDENCE
                                 │
                                 ▼
                              RELEASE

             CLAUDE — SPECIALIZED DESIGN COLLABORATOR
                     ↕ Figma / MCP / Design System
```

## 3. Codex is the primary implementation authority

Codex owns repository-writing engineering work once a task is explicitly authorized.

Codex may:

- implement application code;
- create and maintain local database schemas and migrations;
- implement tests;
- repair defects;
- perform repository refactors;
- build architecture-as-code checks;
- integrate approved design artifacts;
- run verification;
- produce evidence;
- prepare controlled integration changes.

Codex must not invent unresolved business semantics or override canonical architecture/contracts.

## 4. Claude's specialized role

Claude is used selectively for high-value design work, especially Figma collaboration and visual/UX reasoning.

Claude may:

- inspect Figma context;
- generate/refine Figma design artifacts when explicitly authorized;
- explore UX alternatives;
- challenge visual consistency;
- help derive design-system patterns;
- review visual fidelity;
- return design decisions to the canonical design contract.

Claude is not the default writer of ASAS application/database code.

A design artifact produced with Claude becomes implementation input only after it is reconciled with the canonical design system and accepted into the repository design contract.

## 5. No-agent-autonomy boundary

No AI agent may independently decide:

- founder-level product scope;
- unresolved bounded-context ownership;
- legal interpretation;
- destructive production database operations;
- production data deletion;
- security exceptions;
- major financial semantic corrections;
- irreversible tenant deletion;
- credential rotation with outage risk;
- commercial commitments;
- production deployment authority unless explicitly granted.

The correct state is `FOUNDER-DECISION-REQUIRED` or `BLOCKED`.

## 6. Agent task contract

Every Codex task must begin from an authorized task packet containing:

```text
Task ID
Objective
Scope
Non-goals
Authority
Inputs
Dependencies
Canonical artifacts
Files allowed to change
Database impact
External systems
Security impact
UX/design impact
Tests
Definition of Done
Evidence required
Rollback/recovery
Stop conditions
```

The agent must stop when a stop condition is reached rather than guessing.

## 7. Research-before-decision protocol

When the repository does not answer a load-bearing engineering question:

```text
Repository
→ Branch history
→ Existing contracts/registers
→ Source package
→ Official documentation/specification
→ Independent authoritative corroboration
→ Alternatives
→ Failure modes
→ Engineering derivation
→ Decision
→ ADR/Contract/Register
→ Verification
```

The v1.6.1 source package is research/provenance material for the lead architect only. It is not direct implementation authority.

## 8. Codex skill stack

Codex work should use the strongest applicable engineering capabilities rather than one generic prompt:

### Discovery
- repository forensics;
- architecture/provenance analysis;
- branch and commit comparison;
- source authority reconciliation.

### Architecture
- DDD/bounded contexts;
- aggregate and invariant design;
- state-machine modeling;
- event and command contracts;
- tenancy/security architecture;
- database architecture.

### Implementation
- contract-first coding;
- typed validation;
- modular boundaries;
- migrations;
- tests;
- dependency hygiene.

### Verification
- independent code review;
- adversarial testing;
- security review;
- concurrency testing;
- RLS/tenant testing;
- visual/browser testing;
- performance and recovery verification.

### Governance
- architecture-as-code;
- stale-reference detection;
- canonical artifact validation;
- task/contract traceability;
- evidence capture.

## 9. Parallel Codex work

Parallelism is optional and bounded.

Use one Codex task by default. Use parallel tasks only for substantial, independently bounded verticals with low coordination cost.

The repository's Codex Coordinator rules apply when coordination is enabled. Shared files, generated maps, schema artifacts and other singular outputs must be serialized at the write boundary.

No agent may create a competing architecture truth simply because it owns a parallel lane.

## 10. Design-to-code operating loop

```text
PRODUCT INTENT
→ UX / INFORMATION ARCHITECTURE
→ DESIGN TOKENS
→ COMPONENT CONTRACTS
→ FIGMA DESIGN
→ VISUAL REVIEW
→ DESIGN ACCEPTANCE
→ FIGMA MCP / CODE CONNECT CONTEXT
→ CODEX IMPLEMENTATION
→ BROWSER RENDER
→ VISUAL COMPARISON
→ ACCESSIBILITY / RESPONSIVE QA
→ CODE CORRECTION
→ DESIGN RE-VERIFICATION
→ ACCEPTED
```

Design is not accepted because a screenshot looks similar. The implementation must preserve structure, interaction states, responsive behavior, accessibility and design-system usage.

## 11. Figma integration policy

Figma is a design context and design-system integration surface, not the business-domain authority.

The preferred integration pattern is the official Figma MCP server with Codex, using design context and Code Connect where available.

Remote Figma MCP is preferred by Figma for broad feature access; desktop MCP is an alternative for supported local workflows.

Code Connect should be introduced after the ASAS component library is stable enough to map real code components to published Figma components.

Figma facts are externally verified from official Figma documentation; they are not assumed from screenshots or model memory.

## 12. Design-system acceptance

Before a screen is implementation-authorized, verify:

- token usage;
- component ownership;
- typography;
- spacing;
- responsive breakpoints;
- RTL/LTR behavior;
- Arabic/French/English content behavior;
- keyboard/focus behavior;
- loading/empty/error states;
- validation states;
- data density;
- accessibility;
- motion where applicable;
- dark/light or product theme rules where applicable;
- real-data stress behavior.

## 13. Database agent discipline

Codex may design and build the local executable schema after architecture gates close.

The sequence is:

```text
Domain contract
→ Schema contract
→ Local database
→ Forward migration
→ Replay from clean baseline
→ Constraint tests
→ RLS tests
→ Concurrency tests
→ Backup/restore rehearsal where applicable
→ Evidence
```

Remote production schema is never used as an undocumented design playground.

## 14. Verification separation

The same agent that implements a change should not be the only evidence used to declare it correct.

For critical work:

```text
Codex implementation
→ fresh verification pass
→ adversarial review
→ targeted tests
→ integration evidence
→ gate decision
```

A passing typecheck is not proof of domain correctness.

## 15. Evidence ledger

Every material AI-assisted change must leave traceable evidence:

```text
Task
→ Source/Authority
→ Decision
→ Changed artifacts
→ Tests
→ Verification
→ Commit
→ Gate status
```

No conversational claim substitutes for repository evidence.

## 16. Failure posture

When uncertain:

1. classify the uncertainty;
2. identify what evidence is missing;
3. research if it is an engineering knowledge gap;
4. create an ADR/contract if a decision is required;
5. stop if authority is required from the founder;
6. never convert uncertainty into implementation by assumption.

## 17. Operating principle

The objective is not zero human involvement.

The objective is **zero avoidable ambiguity** before an agent crosses an authority boundary.

```text
Humans decide what must remain a human decision.
Architects decide architecture within delegated authority.
Codex executes authorized engineering.
Claude specializes in design/visual collaboration.
Verification proves what actually works.
Evidence closes the loop.
```
