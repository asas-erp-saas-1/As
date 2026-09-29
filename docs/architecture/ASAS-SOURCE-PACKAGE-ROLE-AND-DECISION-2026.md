# ASAS — SOURCE PACKAGE ROLE & ARCHITECTURE DECISION 2026

**Artifact ID:** ASAS-ARCH-DECISION-SOURCE-PACKAGE-ROLE-2026-001  
**Status:** CANONICAL GOVERNANCE DECISION  
**Version:** 1.0.0  
**Effective date:** 2026-09-22  
**Canonical branch:** `platform-architecture-2026`  
**Repository:** `asas-erp-saas-1/As`

## 1. Decision

The supplied **ASAS Architecture Blueprint v1.6.1 / source package** is classified as an **additional engineering research and provenance source for the lead architecture process**.

It is **NOT** an implementation authority for Claude Code, Codex, or any autonomous coding agent.

Claude Code/Codex must consume the reconciled repository control plane and explicitly authorized contracts/tasks. They must not treat v1.6.1 as an instruction to implement its architecture, module counts, infrastructure choices, scalability claims, database model, or future roadmap.

## 2. Why this decision exists

The source package contains valuable historical design knowledge, including domain ideas, enterprise capabilities, scalability considerations, AI governance, security concepts and product evolution. It also contains claims that are broader than the currently verified repository state and includes architecture inflation such as premature microservices, multi-region infrastructure and million-user deployment assumptions.

Therefore its value is primarily:

```text
Research evidence
+ historical provenance
+ candidate design knowledge
+ gap discovery
+ alternative analysis
```

not:

```text
implementation specification
```

## 3. Correct information flow

```text
v1.6.1 / source package
        ↓
Lead Architect research + forensic comparison
        ↓
corroboration / contradiction analysis
        ↓
engineering decision
        ↓
ADR / canonical contract / register / roadmap
        ↓
explicit implementation authorization
        ↓
Claude Code / Codex
```

The source package never bypasses the middle layers.

## 4. Agent boundary

Claude Code/Codex MUST NOT infer implementation requirements directly from:

- source-package chapter numbers;
- historical context counts;
- proposed infrastructure topology;
- scalability tiers;
- claimed readiness states;
- proposed database models;
- historical technology selections;
- future platform capabilities.

If an implementation task references v1.6.1, the task must instead point to the reconciled canonical artifact and contract that resulted from architectural review.

## 5. Architect authority

The lead architecture process MAY use v1.6.1 to:

- discover missing concerns;
- compare architectural alternatives;
- identify historical rationale;
- generate research questions;
- challenge current assumptions;
- derive improved designs;
- identify security/reliability gaps;
- inform future architectural reservations.

Any derived conclusion MUST be labelled `ENGINEERING-DERIVATION` until independently verified or promoted through the appropriate ADR/contract authority.

## 6. Contradiction rule

When v1.6.1 conflicts with current verified repository/runtime evidence:

```text
DO NOT force repository to match v1.6.1
DO NOT silently rewrite v1.6.1
DO NOT call either side "correct" without provenance
CLASSIFY CONFLICT
DETERMINE AUTHORITY
CREATE DECISION / ADR WHEN REQUIRED
```

For brownfield reality, runtime/database evidence remains authoritative for what exists.

For desired future behavior, founder-approved product decisions and approved architecture/contracts govern implementation.

## 7. Scope inflation rule

The source package's future capabilities are treated as:

`ARCHITECTURAL RESERVATION — NOT IMPLEMENTATION REQUIREMENT`

unless an approved canonical roadmap/contract/task explicitly promotes them.

This applies especially to:

- microservices;
- Kubernetes;
- Kafka/event-bus infrastructure beyond current needs;
- multi-region;
- global-scale claims;
- autonomous finance;
- autonomous AI actions;
- marketplace;
- construction ERP expansion;
- global data lake;
- holding-company platform.

## 8. Research protocol

For a material gap:

```text
Repository evidence
→ source-package evidence
→ historical branch evidence
→ official technical/legal sources
→ authoritative corroboration
→ alternatives
→ failure-mode analysis
→ engineering derivation
→ ADR/contract
→ test/evidence
```

The lead architect is responsible for making the engineering decision when it is within architecture authority. Founder escalation is reserved for founder-level scope, unresolved product ownership, legal interpretation, irreversible financial semantics, destructive production operations, security exceptions and other explicitly protected decisions.

## 9. Current consequence

The repository control plane remains the only implementation route:

```text
Blueprint
→ Roadmap
→ Context Prompt
→ Master Execution Path
→ Canonical Contracts / Registers
→ Authorized Task Packets
→ Claude Code / Codex
```

v1.6.1 sits beside this chain as a **research/provenance input to the architect**, not inside the execution chain.

## 10. Verification

This decision is satisfied when:

- active implementation documents do not instruct Claude Code/Codex to treat v1.6.1 as executable authority;
- source-package references are clearly classified as research/provenance;
- promoted decisions appear in canonical ADRs/contracts/registers;
- future-only capabilities remain non-authoritative until explicitly promoted;
- contradictions remain visible and traceable.

**Decision:** APPROVED FOR ARCHITECTURE GOVERNANCE.
