# ASAS — Bounded-Context Decision Framework 2026

**Artifact ID:** ASAS-ARCH-RECON-CONTEXT-FRAMEWORK-2026-001  
**Status:** ACTIVE / RECONCILIATION CONTROL  
**Date:** 2026-09-24  
**Branch:** `platform-architecture-2026`  
**Authority:** Architecture coordination artifact; does not override founder decisions, approved ADRs, contracts, or runtime reality.

## 1. Purpose

Provide a repeatable method for resolving the historical 9/13/15 context conflict without selecting a context count by convenience, symmetry, module count, database schema count, or historical document age.

## 2. Core rule

A bounded context is established only when there is sufficient evidence of a coherent domain model and a meaningful semantic/ownership boundary. A module, schema, aggregate, worker, read model, event consumer, or platform capability is not automatically a bounded context.

External DDD research supports this distinction: bounded contexts establish boundaries within which a model and vocabulary remain coherent; context maps make relationships between contexts explicit. citeturn0search0

## 3. Decision dimensions

Each candidate boundary must be evaluated against:

1. **Ubiquitous language divergence** — does the same term acquire materially different meaning?
2. **Business capability ownership** — is there a clear business owner?
3. **Invariant ownership** — does the candidate own rules that must remain internally consistent?
4. **Transaction/consistency boundary** — does it require a distinct consistency boundary?
5. **Lifecycle authority** — does it own a lifecycle rather than merely participate in one?
6. **Data ownership** — does it own authoritative write-side data rather than a projection?
7. **Authorization semantics** — does it require distinct permission/scope rules?
8. **Integration contract** — are stable contracts required to communicate with other models?
9. **Failure isolation** — would independent failure/retry behavior materially matter?
10. **Team/organizational boundary** — only supporting evidence; never sufficient alone.
11. **Scaling characteristics** — only supporting evidence; never sufficient alone.
12. **Historical provenance** — what authoritative source introduced the boundary and why?

## 4. Classification outcomes

Every candidate must receive exactly one current classification:

- `BOUNDED-CONTEXT-CANDIDATE`
- `MODULE-WITHIN-CONTEXT`
- `PLATFORM-CAPABILITY`
- `PROJECTION/READ-MODEL`
- `WORKER/PROCESSOR`
- `INFRASTRUCTURE-CAPABILITY`
- `ARCHITECTURAL-RESERVATION`
- `HISTORICAL-ONLY`
- `CONFLICT`
- `UNVERIFIED`

No candidate is promoted solely because a historical document calls it a context.

## 5. Required evidence packet

Before promotion, capture:

```text
candidate name
provenance
business capability
ubiquitous language
owned invariants
owned aggregates/entities
write commands
authoritative data
state machines
permissions
outgoing/incoming contracts
events
failure/retry semantics
transaction boundary
read models
implementation modules
runtime evidence where applicable
conflicting sources
decision owner
approval status
```

## 6. Negative test

A candidate should normally remain a module/platform capability rather than a bounded context when:

- it has no independent authoritative write model;
- it is primarily orchestration over another context;
- it is only a read/search/analytics projection;
- its rules are entirely owned by another context;
- promotion exists only to make an architecture diagram symmetrical;
- its only justification is a separate database schema or folder.

This is a decision aid, not an automatic rule; contradictory evidence must remain visible.

## 7. Current ASAS candidates

The current nine-context grouping remains a **candidate baseline**, not a verified universal truth:

`Core / CRM / Sales / Inventory / Finance / Studio / Marketing / Analytics / Documents`

Historical 13-context and 15-context claims remain provenance items until their authoritative source and decision evidence are recovered.

Scheduling remains separately blocked by the known ownership conflict and must not be promoted or reassigned silently.

## 8. Required reconciliation sequence

```text
recover authoritative Domain Model / Context Map provenance
→ enumerate every candidate boundary
→ classify each candidate
→ map ownership and invariants
→ map commands and state machines
→ map authoritative data
→ map permissions and tenant scope
→ map events/contracts
→ map implementation modules
→ compare historical and current evidence
→ resolve conflicts through ADR/founder decision where required
→ publish canonical context map
→ only then derive implementation tasks
```

## 9. External architecture principle

Architecture review should optimize for coherent models, explicit boundaries, security, reliability, and operational evidence rather than an arbitrary number of components. Modern architecture guidance likewise treats architecture as a set of explicit trade-offs across operational excellence, security, reliability, performance, cost, and sustainability. citeturn0search1turn0search3

## 10. Current status

`CONTEXT AUTHORITY = OPEN / CONFLICT`

`IMPLEMENTATION PROMOTION = BLOCKED`

`NEXT EVIDENCE = recover authoritative Domain Model v2 / Context Map v2 provenance, then evaluate candidates using this framework`

## 11. Closure rule

The context reconciliation is closed only when:

`authoritative source identified + candidate boundaries classified + ownership/invariants/contracts mapped + conflicts resolved or explicitly escalated + canonical context map published + references reconciled + evidence recorded`

Until then, no context-count claim is implementation authority.
