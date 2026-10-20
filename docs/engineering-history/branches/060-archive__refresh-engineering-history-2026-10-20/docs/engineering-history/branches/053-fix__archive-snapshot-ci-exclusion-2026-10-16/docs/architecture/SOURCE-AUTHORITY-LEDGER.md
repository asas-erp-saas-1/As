# ASAS Source Authority Ledger — Domain Architecture

**Status:** CONTROLLED / RECONCILIATION REQUIRED  
**Purpose:** Prevent architectural drift by distinguishing claims about approved artifacts from artifacts that are actually present and verifiable.

## 1. Current authority observations

| Artifact / claim | Evidence available | Status | Rule |
|---|---|---|---|
| Phase 1.5 Domain Model v2 | Master Roadmap states `Approved (v2)` and says deliverables are Domain Model v2 + Context Map v2 with 15 bounded contexts | CLAIMED APPROVED; SOURCE ARTIFACT NOT IDENTIFIED | Do not synthesize missing v2 content |
| `ASAS_Enterprise_Domain_Model` dated 2026-07-21 | File is explicitly `Draft — for stakeholder review`; its visible bounded-context table contains 13 named contexts | VERIFIED SOURCE; NOT APPROVED V2 | Treat as historical/draft evidence only |
| `ASAS_Context_Map.mermaid` | Companion context map exists and represents the draft model | VERIFIED SOURCE; NOT APPROVED V2 | Do not promote to canonical |
| Master Implementation Specification | Defines 15 implementation modules and 15 PostgreSQL schemas | VERIFIED LATER-PHASE DESIGN SOURCE | Use for Phase 2.1 implementation architecture, not as proof of Domain Model v2 |
| 9-context wording in repository governance | Exists as a summary-level architectural statement | DRIFT CANDIDATE | Reconcile against the approved v2 artifact when identified |

## 2. Non-negotiable reconciliation rule

A later document that says an artifact is approved does not substitute for the missing artifact itself. Until the exact approved Domain Model v2 and Context Map v2 are located, their contents must remain **UNVERIFIED**.

Do not:

- invent the missing contexts;
- infer the missing contexts from the 15 implementation modules;
- merge the draft 13-context model with later modules silently;
- edit registers merely to make counts agree;
- use live database assumptions as architectural authority.

## 3. Required closure evidence

C2-001 can move to `RESOLVED` only when all of the following exist:

1. Exact Domain Model v2 artifact identified by path/name/version/date.
2. Approval status is independently evidenced.
3. Exact Context Map v2 artifact identified.
4. Complete context inventory extracted without inference.
5. Context → module mapping documented separately where it is a Phase 2.1 derivation.
6. Aggregates, events, permissions, state machines, and tasks are traceable to the authoritative source.
7. Any obsolete 8/9/13-context artifacts are explicitly classified as historical, superseded, or explanatory.
8. Reconciliation report records all differences and their disposition.

## 4. State machine for architecture evidence

`UNLOCATED → LOCATED → EXTRACTED → PROVENANCE_VERIFIED → RECONCILED → CANONICAL`

A missing approval artifact remains `UNLOCATED` regardless of how confidently another document describes it.

## 5. Boundary with implementation

This ledger is architectural governance only. It authorizes no application-code changes, database migrations, schema creation, data mutation, deployment, or production configuration.

## 6. Source-derived facts

The Master Roadmap explicitly says Phase 1.5 is approved (v2), delivers a Domain Model v2 with 15 bounded contexts and Context Map v2, and that Phase 2.1 depends on those outputs. The available Domain Model file itself is marked Draft and asks for stakeholder review before Phase 2. These two facts must coexist in the ledger until the exact approved v2 artifact is located.
