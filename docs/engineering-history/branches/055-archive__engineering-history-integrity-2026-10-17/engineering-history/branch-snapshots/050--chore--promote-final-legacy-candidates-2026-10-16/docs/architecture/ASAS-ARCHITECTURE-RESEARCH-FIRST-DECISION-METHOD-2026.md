# ASAS — RESEARCH-FIRST ARCHITECTURE DECISION METHOD 2026

**Artifact ID:** ASAS-ARCH-METHOD-2026-001  
**Status:** CANONICAL OPERATING METHOD  
**Version:** 1.0.0  
**Effective date:** 2026-09-24  
**Owner:** Lead Architecture / Founder authority boundary  
**Branch:** `platform-architecture-2026`  
**Authority:** Operational method subordinate to approved product decisions, architecture, ADRs, contracts, registers and verified runtime reality.

## 1. Purpose

ASAS architecture work must not become a document-following exercise. Sources may be incomplete, stale, contradictory, over-specified, or technically wrong. The architect therefore uses two complementary modes:

1. **Research-first expansion:** independently investigate the engineering problem, current technologies, standards, mature architectural patterns, failure modes, alternatives and implementation constraints.
2. **Source validation:** return to ASAS repository, branches, source packages, contracts, registers, code and runtime evidence to determine what is actually supported, what conflicts, what can be adopted, and what must remain open.

The method is deliberately cyclical rather than linear.

## 2. Core loop

```text
PROBLEM / GOAL
    ↓
RESEARCH
    ↓
EXPAND THE SOLUTION SPACE
    ↓
MODEL ALTERNATIVES + FAILURE MODES
    ↓
FORM ENGINEERING HYPOTHESES
    ↓
RETURN TO ASAS SOURCES
    ↓
TRACE PROVENANCE + AUTHORITY
    ↓
COMPARE AGAINST REALITY
    ↓
REJECT / ADAPT / DERIVE
    ↓
ENGINEERING DECISION
    ↓
CONTRACT / ADR / REGISTER / ROADMAP
    ↓
VERIFY
    ↓
UPDATE SOURCE OF TRUTH
    ↓
NEXT DEPENDENCY
```

A source is not ignored because external research produced a better idea. External research is not accepted merely because it is modern. The decision must survive both engineering scrutiny and ASAS authority reconciliation.

## 3. Research-first does not mean source-last

The sequence is not:

`read source → obey source`.

Nor is it:

`research web → invent new architecture`.

The correct sequence is:

`expand independently → test the idea against authoritative evidence → preserve conflicts → derive only what is justified → canonicalize the result`.

## 4. Research depth levels

### R0 — Routine

Use when the question is already fully covered by a current canonical ASAS contract and no material uncertainty exists.

Action: validate source, proceed.

### R1 — Technical gap

Use when ASAS lacks a necessary engineering fact.

Action: official documentation → primary source → corroboration where risk warrants → ASAS impact analysis.

### R2 — Architecture uncertainty

Use when multiple valid designs exist.

Action: research patterns → alternatives → failure modes → operational consequences → fit to ASAS constraints → decision record.

### R3 — High-risk decision

Use for finance, security, tenancy, concurrency, persistence, migrations, AI authority, recovery, production operations or irreversible changes.

Action: multi-source research + adversarial analysis + explicit evidence + independent verification + ADR/contract. Stop at founder/legal authority boundaries.

## 5. Research questions

For each material problem ask:

- What are we actually trying to guarantee?
- What is the failure mode if we get it wrong?
- What assumptions are hidden in the current ASAS material?
- What alternatives exist?
- What are the transaction and consistency boundaries?
- What owns the business rule?
- What data is authoritative?
- What must remain immutable?
- What must be idempotent?
- What happens under concurrency?
- What happens after partial failure?
- What happens during replay/recovery?
- What security boundary is crossed?
- What tenant boundary is crossed?
- What operational burden does the design create?
- Can the design be tested locally?
- Can CI enforce the critical rule?
- What evidence would prove the decision wrong?

## 6. External research hierarchy

```text
Official documentation / standards
    > Primary engineering source
    > Authoritative research
    > Reputable technical analysis
    > Community material
```

Prefer current stable documentation. Record publication/version date for load-bearing claims. Community material may expose practical failure modes but cannot by itself establish normative architecture.

## 7. ASAS evidence hierarchy

For brownfield reality:

```text
LIVE DATABASE / LIVE RUNTIME
    > REPOSITORY IMPLEMENTATION
    > APPROVED CONTRACT / REGISTER
    > APPROVED ARCHITECTURE
    > HISTORICAL ARTIFACT
    > INFERENCE
```

For desired behavior:

```text
FOUNDER / PRODUCT DECISION
    > APPROVED ARCHITECTURE
    > APPROVED ADR
    > CANONICAL CONTRACT / REGISTER
    > IMPLEMENTATION
```

External research validates engineering technique but cannot override ASAS authority.

## 8. Hypothesis discipline

During research, distinguish:

- **FACT:** directly evidenced.
- **SUPPORTED:** supported by multiple reliable sources but not yet ASAS-authoritative.
- **ENGINEERING-DERIVATION:** reasoned conclusion required to complete an engineering gap.
- **PROPOSED:** candidate design awaiting authority.
- **CONFLICT:** authoritative claims disagree.
- **UNVERIFIED:** evidence is insufficient.
- **BLOCKED:** safe implementation cannot proceed.

Never write a hypothesis into a canonical contract as though it were a fact.

## 9. Alternative analysis

For material architecture choices, compare alternatives against at least:

`correctness / consistency / security / tenancy / operability / failure recovery / testability / maintainability / performance / cost / implementation complexity / reversibility / future extraction`

Do not rank alternatives by aesthetics or novelty alone.

## 10. Source-return gate

After research, return to ASAS sources and explicitly check:

1. current Blueprint;
2. Source of Truth;
3. Roadmap;
4. Context Prompt;
5. current checkpoint;
6. relevant contracts;
7. relevant registers;
8. relevant ADRs;
9. implementation;
10. historical branches/commits when provenance matters;
11. source packages;
12. live runtime/database only when authorized.

The research result is accepted only after this comparison.

## 11. Decision gate

A decision may be canonicalized only when:

```text
problem defined
+ research adequate for risk
+ alternatives considered
+ ASAS authority identified
+ contradictions exposed
+ implementation consequences understood
+ security/tenancy implications understood
+ test/evidence strategy defined
+ decision owner identified
```

Founder/legal/production destructive/major financial/security-exception decisions remain outside autonomous authority.

## 12. Artifact placement

Every accepted conclusion goes to its natural canonical owner:

| Conclusion type | Canonical destination |
|---|---|
| product behavior | PRD / product decision |
| architecture structure | Blueprint |
| architecture choice | ADR |
| domain behavior | Domain Contract |
| event | Event Register |
| permission | Permission Register |
| invariant | Invariant/Boundary Register |
| schema truth | Schema Contract / Reconciliation |
| engineering route | Roadmap |
| agent behavior | Context Prompt / Agent Operating Model |
| skill requirement | Skills Catalog / `.agents/skills/` |
| current execution state | Current Session State |
| research evidence | Research record / Evidence Register |
| cross-artifact routing | Source of Truth |

Do not duplicate the same decision in multiple canonical owners. Other documents reference the owner.

## 13. Research record

Every material research cycle should record:

```text
Research ID
Question
Date
Problem / task
ASAS sources inspected
External sources inspected
Current-version status
Key findings
Alternative designs
Failure modes
ASAS conflicts
Decision
Confidence / evidence state
Affected canonical artifacts
Verification required
Review trigger
```

## 14. Engineering-learning rule

If ASAS lacks a required skill or knowledge area, the architect must learn it before delegating the implementation.

Examples include:

- PostgreSQL concurrency and transaction semantics;
- database migration/baselining;
- DDD strategic/tactical modeling;
- application security verification;
- secure SDLC;
- AI tool authorization;
- distributed/event reliability;
- observability and recovery engineering;
- accessibility and internationalization;
- design-system engineering;
- performance engineering;
- testing strategy.

Learning creates engineering knowledge. It does not automatically create project authority.

## 15. Agent handoff rule

Codex receives implementation work only after the architecture process has produced an authorized task packet.

Claude is primarily used for Figma/UX/design-system collaboration. Design output becomes implementation authority only after acceptance into the design/code continuity contract.

Agents may challenge a task when evidence contradicts the task. They must not silently expand scope.

## 16. Verification loop

```text
DECISION
 → IMPLEMENTATION OR DOCUMENTATION CHANGE
 → STRUCTURAL CHECK
 → REFERENCE CHECK
 → TEST / STATIC CHECK / CI
 → INDEPENDENT REVIEW
 → EVIDENCE CAPTURE
 → CANONICAL CHECKPOINT
```

For high-risk changes, require adversarial review or an independent verification pass.

## 17. Research stop conditions

Stop and mark `BLOCKED`, `CONFLICT`, or `FOUNDER-DECISION-REQUIRED` when:

- authority cannot be established;
- the live system identity is uncertain;
- destructive action would be required;
- financial semantics remain materially ambiguous;
- tenant/security ownership is unclear;
- legal interpretation is required;
- evidence cannot establish correctness;
- the proposed design would silently override a higher-authority decision.

## 18. Method maintenance

This method itself is subject to review. New engineering discoveries may add research depth, evidence requirements, skills, verification gates or artifact types.

Changes to this method must be recorded in the roadmap, context prompt and Source of Truth routing metadata, then captured in the current checkpoint.

## 19. Current external research baseline — 2026-09-24

Current external research used to validate the method includes:

- DDD bounded contexts are used to divide large models while preserving explicit interrelationships and consistent models. citeturn0search2
- PostgreSQL documents explicit row-level locking for concurrency situations where ordinary MVCC does not provide the required behavior, and documents deadlock risks and consistent lock ordering. citeturn0search6
- OWASP ASVS provides a basis for testing web-application security controls and currently identifies ASVS 5.0.0 as the latest stable version on its project page. citeturn0search9
- NIST SSDF provides a secure-development lifecycle framework, and NIST's current publications page lists SP 800-218 Rev. 1 / SSDF 1.2 as an initial public draft while SP 800-218 1.1 remains final. Therefore ASAS should use stable normative material for mandatory controls and explicitly label drafts as research input. citeturn0search0turn0search3turn0search10

These sources validate engineering method principles only. They do not establish ASAS-specific runtime facts.
