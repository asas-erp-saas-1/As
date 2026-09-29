# ASAS — MASTER EXECUTION PATH 2026 — AMENDMENT 002

**Artifact ID:** ASAS-MASTER-EXECUTION-PATH-A002  
**Status:** CANONICAL EXECUTION-PATH AMENDMENT  
**Version:** 1.0.0  
**Effective date:** 2026-09-23  
**Applies to:** `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`  
**Canonical branch:** `platform-architecture-2026`

## 1. Execution authority correction

The primary downstream engineering executor is **Codex**.

The prior generic wording `Claude Code or another autonomous engineering agent` must be interpreted as:

```text
Lead Architecture
→ explicit authorization
→ Codex
→ implementation
→ independent verification
```

Claude is a specialized Figma/design collaborator and is not the default repository implementation agent.

## 2. Updated execution topology

```text
Q0 CONTROL PLANE
      ↓
Q1 DOMAIN / CONTRACT CLOSURE
      ↓
Q2 DATA / SECURITY CONTRACTS
      ↓
Q3 DESIGN SYSTEM + FIGMA ACCEPTANCE
      ↓
Q4 TASK PACKET AUTHORIZATION
      ↓
Q5 CODEX IMPLEMENTATION
      ↓
Q6 FRESH VERIFICATION
      ↓
Q7 ADVERSARIAL / SECURITY / UX REVIEW
      ↓
Q8 LOCAL INTEGRATION
      ↓
Q9 CONTROLLED RUNTIME INTEGRATION
      ↓
Q10 RELEASE EVIDENCE
```

This is an overlay on the existing Q0–Q13 route, not a replacement of domain dependencies.

## 3. Design-to-code handoff

For UI work:

```text
Figma / UX
→ design contract
→ acceptance
→ Figma MCP / Code Connect context when available
→ Codex
→ browser render
→ viewport/RTL/accessibility verification
→ visual correction
→ evidence
```

Claude may assist the Figma stage. Codex owns the resulting repository implementation.

## 4. Database handoff

For database work:

```text
Canonical domain contract
→ schema contract
→ local database design
→ Codex implementation
→ migration replay
→ constraint/RLS/concurrency tests
→ independent verification
→ only then controlled runtime integration
```

No agent may use a live database as an undocumented design scratchpad.

## 5. Verification separation

Critical implementation should receive a fresh verification pass that is not based solely on the implementer's claim.

Required evidence may include:

- tests;
- type/build checks;
- static analysis;
- browser/E2E evidence;
- security/authorization tests;
- database/RLS tests;
- concurrency/idempotency tests;
- migration replay;
- visual comparison;
- traceability evidence.

## 6. Agent stop conditions

Stop and return to architecture when:

- implementation reveals an unresolved domain semantic;
- Figma conflicts with accepted product behavior;
- a required component has no canonical owner;
- a migration requires destructive production behavior;
- tenant/security authority is unclear;
- financial semantics are ambiguous;
- the task exceeds its authorized scope.

## 7. Toolchain principle

Use the best verified tool for the bounded job.

Potential integrations include:

- Figma MCP;
- Figma Code Connect;
- browser automation;
- repository/CI tooling;
- database tooling;
- security/static analysis;
- external official documentation through MCP or web research.

Tool availability never changes architecture authority.

## 8. Resume behavior

On `Continue / أكمل العمل على المسار`:

1. load the current checkpoint;
2. load the base execution path and this amendment;
3. load the current roadmap/context control plane;
4. identify the first unresolved dependency;
5. select the correct agent/tool for that dependency;
6. execute only within authorization;
7. verify independently;
8. record evidence;
9. update the checkpoint and applicable canonical/amendment artifacts.

Never restart the project merely because the agent topology changed.
