# ASAS — ARCHITECTURE ENGINEERING ROADMAP 2026 — AMENDMENT 002

**Artifact ID:** ASAS-ARCH-ROADMAP-2026-A002  
**Status:** CANONICAL ROADMAP AMENDMENT  
**Version:** 1.0.0  
**Effective date:** 2026-09-23  
**Applies to:** `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md`  
**Canonical branch:** `platform-architecture-2026`

## 1. Decision

ASAS adopts a **Codex-first engineering execution model**.

Codex is the primary AI engineering executor for:

- architecture implementation;
- repository code;
- local database engineering;
- migrations;
- tests;
- CI;
- integration;
- controlled delivery.

Claude is a specialized design/visual collaboration agent, primarily for Figma workflows and UX/design-system refinement.

This amendment supersedes any roadmap wording that treats Claude Code as the default implementation executor.

## 2. Revised engineering order

```text
REALITY
→ PROVENANCE
→ AUTHORITY
→ RECONCILIATION
→ DOMAIN MODEL
→ CONTRACTS
→ DATA CONTRACT
→ SECURITY / TENANCY
→ DESIGN SYSTEM
→ FIGMA EXPERIENCE ENGINEERING
→ DESIGN ACCEPTANCE
→ LOCAL PLATFORM
→ CODEX IMPLEMENTATION
→ INDEPENDENT VERIFICATION
→ INTEGRATION
→ RUNTIME EVIDENCE
→ PRODUCTION
```

## 3. Agent responsibility model

| Area | Lead Architecture | Codex | Claude/Figma |
|---|---|---|---|
| Architecture decisions | Owns within authority | Executes approved decisions | Input only when design implications exist |
| Product semantics | Founder boundary | Must not invent | Must not invent |
| Domain contracts | Owns closure | Implements | No authority |
| Database architecture | Owns contract | Primary builder | No authority |
| Application code | Reviews/authorizes | Primary builder | Not default |
| Tests/CI | Defines gates | Primary builder/executor | No authority |
| UX architecture | Coordinates | Implements accepted design | Specialized design collaborator |
| Figma | Reviews acceptance | Can consume via MCP | Primary design surface |
| Visual QA | Defines criteria | Executes browser/render verification | Provides visual/design review |
| Production | Gate authority | Executes only authorized release work | No authority |

## 4. Design engineering becomes a first-class gate

H6 is no longer a generic design step. It must produce an accepted design contract before critical UI implementation.

The minimum sequence is:

`UX model → design tokens → component contract → Figma → visual review → design acceptance → Codex implementation → visual verification`

See:

`docs/design/ASAS-DESIGN-TO-CODE-CONTINUITY-CONTRACT-2026.md`

## 5. Agent skill requirements

Codex must be operated with the strongest applicable skills for the task, including repository forensics, architecture, DDD, database engineering, security, testing, browser verification, design integration and adversarial review.

Parallel Codex tasks remain bounded and optional. They must not create competing canonical decisions.

See:

`docs/architecture/ASAS-AI-AGENT-ENGINEERING-OPERATING-MODEL-2026.md`

## 6. Figma integration

Figma MCP and Code Connect are approved integration mechanisms when configured and verified.

They do not become business/domain authority.

The preferred pattern is:

```text
Figma design system
→ Figma MCP / Code Connect context
→ Codex
→ repository implementation
→ browser verification
→ visual reconciliation
```

## 7. Local-first development remains mandatory

Architecture, design contracts, code and database foundation should be constructed and verified locally before controlled cloud/runtime integration.

Cloud services are integration targets, not prerequisites for engineering truth.

## 8. Revised implementation gate

A coding task is not ready merely because architecture is complete.

For UI work, both must be closed:

`ARCHITECTURE AUTHORIZATION + DESIGN ACCEPTANCE`

For backend/database work:

`ARCHITECTURE AUTHORIZATION + CONTRACT CLOSURE + DATA/SECURITY GATES`

## 9. Zero-avoidable-error principle

Absolute zero defects cannot be promised in software engineering.

ASAS instead targets **zero avoidable ambiguity before execution** and requires defects to be:

`prevented where possible → detected early → isolated → tested → evidenced → recoverable`

This is the professional engineering interpretation of the project's quality objective.

## 10. Resume rule

On every continuation, the agent must load this amendment together with the base roadmap, Context Prompt, Master Execution Path and current checkpoint.

The first unresolved dependency remains the next work item. The agent must not restart the architecture because the agent topology changed.
