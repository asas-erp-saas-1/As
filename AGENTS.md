# ASAS AI Engineering Operating Contract

## Specification authority

The ASAS Enterprise Architecture Blueprint v1.6.1 and its handoff package are the baseline specification. The authority chain is:

1. Live database reality for pre-existing production tables
2. Blueprint Chapter 39 contracts (`schema/asas-contracts.prisma`)
3. Blueprint appendices and machine-readable registers
4. Blueprint chapter prose
5. Existing repository patterns
6. General best practice

Never edit a register merely to make it agree with code already written.

## Non-negotiables

- Inspect reality before schema-touching work.
- Extend; never rewrite production data without an explicit approved migration plan.
- Every mutation is authorization-gated and deny-by-default.
- Lifecycle state changes use the canonical state-machine transitions; no arbitrary status setters.
- Money is integer DZD centimes and posted financial records are immutable.
- Multi-tenant isolation must be enforced at the data layer, not only in UI/API code.
- Auditability is mandatory for material state changes.
- Public website, Studio, CRM, ERP and integrations share canonical domain data rather than duplicated truths.
- Research before non-trivial implementation; evidence before claims; tests before delivery.

## Engineering gap-completion protocol

When a required artifact, contract, register, implementation detail, verification method, or engineering decision cannot be found in the available project sources, do not stop at "missing" and do not fabricate it as if it were sourced truth.

Use this escalation sequence:

1. Exhaust authoritative repository sources, including the canonical branch, relevant branches, handoff files, registers, contracts, ADRs, tests, CI, scripts, and implementation evidence.
2. Search connected repository history/branches where available and trace provenance before importing information.
3. Research current authoritative external sources when the gap concerns a framework, protocol, security control, database behavior, cloud/service contract, standards-based practice, or other externally verifiable engineering fact.
4. Compare multiple credible sources where the matter is consequential; prefer official documentation, standards, primary technical specifications, and established professional references.
5. Apply independent engineering reasoning, DDD/domain analysis, threat modeling, database/concurrency analysis, reliability engineering, and adversarial review to derive the smallest defensible solution.
6. Clearly label derived material as `ENGINEERING DERIVATION` or `PROPOSED`, distinguish it from repository evidence, and record the reasoning/provenance.
7. If the gap crosses founder authority, legal interpretation, production-data safety, financial semantics, security exceptions, or another protected decision boundary, stop at `FOUNDER DECISION REQUIRED` or `BLOCKED` rather than guessing.
8. Convert justified derived knowledge into a canonical contract, ADR, register, test, or architecture rule only when that artifact has a clear owner and authority.
9. Verify the resulting artifact against implementation, tests, and other authoritative sources before claiming closure.

The objective is not merely to locate existing information. The objective is to reconstruct engineering truth safely when evidence is incomplete, while never disguising inference as fact.

## Evidence classification

Every material claim must be classified where relevant as one of:

- `SOURCE-VERIFIED`
- `RUNTIME-VERIFIED`
- `TEST-VERIFIED`
- `EXTERNALLY-VERIFIED`
- `ENGINEERING-DERIVATION`
- `PROPOSED`
- `UNVERIFIED`
- `CONFLICT`
- `BLOCKED`
- `FOUNDER-DECISION-REQUIRED`

External research supplements project authority; it does not silently override project-specific contracts or founder decisions.

## Working loop

Locate task → load required context → inspect current reality → exhaust authoritative sources → research external gaps when justified → reason and derive where necessary → record provenance → plan → contract-first design → implement the smallest coherent change → run tests/verification → adversarial review → reconcile affected artifacts → report exact evidence.

Do not claim VERIFIED unless execution evidence exists. Use: VERIFIED / FAILED / BLOCKED / NOT EXECUTED.

## Repository policy

- One coherent task per branch/PR.
- No force-push, reset, destructive migration, or deletion of production data.
- Do not silently change product scope; founder-level product decisions must be recorded.
- Keep architecture modular-monolith-first unless evidence requires a different boundary.
- Do not create duplicate canonical artifacts merely because a gap was discovered; first locate the canonical owner and extend it when appropriate.
- Historical evidence must be preserved unless an explicit governance decision authorizes archival/removal.
