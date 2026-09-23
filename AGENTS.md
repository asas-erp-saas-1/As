# ASAS AI Engineering Operating Contract

## Specification and execution authority

The ASAS repository is governed by its reconciled canonical architecture, approved ADRs, canonical contracts/registers, current runtime evidence where applicable, and the current session checkpoint.

The supplied **ASAS Architecture Blueprint v1.6.1 / source package is a research and provenance source for the lead architect. It is NOT implementation authority for Codex or Claude.**

The authority model is:

### Existing brownfield reality

1. Verified live database/runtime reality
2. Verified repository implementation
3. Approved canonical contracts/registers/ADRs
4. Approved architecture baseline
5. Historical artifacts/source packages
6. Inference

### Desired future behavior

1. Founder/product decisions within founder authority
2. Approved architecture baseline
3. Approved ADRs
4. Canonical contracts/registers
5. Authorized implementation

### External engineering facts

1. Official documentation / standards / primary specifications
2. Authoritative primary engineering sources
3. Reputable technical research
4. Professional secondary sources
5. Community material

Conflicts are recorded and reconciled; they are never silently averaged.

## Codex-first execution model

**Codex is the primary ASAS engineering executor.**

Codex owns authorized repository-writing work including:

- application implementation;
- local database/schema engineering;
- forward migrations;
- tests;
- CI and architecture-as-code;
- refactoring;
- integration;
- verification and evidence.

Claude is a **specialized design/visual collaboration agent**, primarily for Figma, UX, design-system refinement and visual review. Claude is not the default ASAS repository/database implementation writer.

The operating model is defined in:

`docs/architecture/ASAS-AI-AGENT-ENGINEERING-OPERATING-MODEL-2026.md`

The design/code continuity contract is:

`docs/design/ASAS-DESIGN-TO-CODE-CONTINUITY-CONTRACT-2026.md`

## v1.6.1 source-package rule

Use v1.6.1 to:

- discover historical rationale;
- identify missing concerns;
- generate research questions;
- compare candidate architectures;
- identify risks and alternative designs.

Do not promote v1.6.1 directly into implementation.

Required path:

```text
v1.6.1 source package
→ lead-architect research
→ repository/branch/runtime evidence
→ official/authoritative corroboration
→ contradiction analysis
→ engineering decision
→ ADR / contract / register / roadmap
→ explicit implementation authorization
→ Codex
```

The governing record is:

`docs/architecture/ASAS-SOURCE-PACKAGE-ROLE-AND-DECISION-2026.md`

## Non-negotiables

- Inspect reality before schema-touching work.
- Extend; never rewrite production data without an explicit approved migration plan.
- Every mutation is authorization-gated and deny-by-default.
- Lifecycle state changes use canonical state-machine transitions; no arbitrary status setters.
- Money uses integer minor units with explicit currency/rounding policy; posted financial records are immutable.
- Multi-tenant isolation is enforced at the data layer as defense-in-depth, not only in UI/API code.
- Auditability is mandatory for material state changes.
- Public website, Studio, CRM, ERP and integrations share canonical domain data rather than duplicated truths.
- Research before non-trivial implementation; evidence before claims; tests before delivery.
- Architecture and database design precede implementation.
- Local development and verification precede controlled cloud/runtime integration.

## Engineering gap-completion protocol

When a required artifact, contract, register, implementation detail, verification method, or engineering decision cannot be found in the available project sources, do not stop at "missing" and do not fabricate it as if it were sourced truth.

Use this escalation sequence:

1. Exhaust authoritative repository sources, including the canonical branch, relevant branches, handoff files, registers, contracts, ADRs, tests, CI, scripts, and implementation evidence.
2. Search repository history/branches where available and trace provenance before importing information.
3. Research current authoritative external sources when the gap concerns a framework, protocol, security control, database behavior, service contract, standards-based practice, or other externally verifiable engineering fact.
4. Compare multiple credible sources where consequential; prefer official documentation, standards, primary technical specifications and established professional references.
5. Apply independent engineering reasoning, DDD/domain analysis, threat modeling, database/concurrency analysis, reliability engineering and adversarial review to derive the smallest defensible solution.
6. Clearly label derived material as `ENGINEERING-DERIVATION` or `PROPOSED`, distinguish it from repository evidence, and record provenance.
7. If the gap crosses founder authority, legal interpretation, production-data safety, financial semantics, security exceptions, or another protected boundary, stop at `FOUNDER-DECISION-REQUIRED` or `BLOCKED` rather than guessing.
8. Convert justified derived knowledge into a canonical contract, ADR, register, test or architecture rule only when that artifact has a clear owner and authority.
9. Verify the resulting artifact against implementation, tests and other authoritative sources before claiming closure.

## Evidence classification

Every material claim must be classified where relevant as one of:

- `SOURCE-VERIFIED`
- `RUNTIME-VERIFIED`
- `TEST-VERIFIED`
- `EXTERNALLY-VERIFIED`
- `ENGINEERING-DERIVATION`
- `PROPOSED`
- `UNVERIFIED`
- `PARTIAL`
- `OPEN`
- `CONFLICT`
- `BLOCKED`
- `FOUNDER-DECISION-REQUIRED`
- `ARCHITECTURAL RESERVATION — NOT IMPLEMENTATION REQUIREMENT`

Never claim VERIFIED merely because a document exists.

## Working loop

```text
Locate task
→ load required context
→ inspect current reality
→ exhaust authoritative sources
→ research external gaps when justified
→ reason / derive where necessary
→ record provenance
→ contract-first design
→ authorized implementation by Codex
→ fresh verification
→ adversarial review
→ reconcile affected artifacts
→ report exact evidence
```

Do not claim VERIFIED unless execution evidence exists. Use `VERIFIED / FAILED / BLOCKED / NOT_EXECUTED`.

## Agent stop conditions

Stop and escalate when:

- product scope is unresolved;
- bounded-context ownership is unresolved;
- financial semantics are ambiguous;
- tenant/security authority is unclear;
- a destructive production operation is proposed;
- a legal interpretation is required;
- an external side effect is irreversible or insufficiently authorized;
- a design decision conflicts with domain truth;
- the task exceeds its authorized scope.

## Repository policy

- One coherent task per branch/PR unless bounded Codex coordination is explicitly enabled.
- No force-push, reset, destructive migration, or deletion of production data.
- Do not silently change product scope; founder-level decisions must be recorded.
- Keep architecture modular-monolith-first unless evidence requires another boundary.
- Do not create duplicate canonical artifacts merely because a gap was discovered; locate the canonical owner first.
- Historical evidence must be preserved unless explicit governance authorizes archival/removal.
- Parallel agent work must use explicit boundaries and must not create competing canonical truth.
