# ASAS Architecture Lineage & Reconciliation Contract

**Status:** Proposed / evidence-driven working artifact  
**Scope:** Foundation hardening before implementation  
**Repository:** `asas-erp-saas-1/As`  

## 1. Purpose

This document establishes the reconciliation method for ASAS architecture sources before any architectural artifact is promoted to canonical implementation authority.

It exists because the available source set contains different architectural layers and versions. The repository must preserve that lineage rather than silently flattening them.

## 2. Source Authority Observed

### 2.1 Master Roadmap

The Master Roadmap states that Phase 1.5 is **Approved (v2)** and describes its deliverables as **Domain Model v2 (15 bounded contexts)** and **Context Map v2**. It also states that Phase 2.1 depends on those bounded contexts, aggregates, and event stream.

**Evidence class:** source requirement / roadmap declaration.

### 2.2 Available Enterprise Domain Model

The available `ASAS_Enterprise_Domain_Model` is explicitly marked **Draft — for stakeholder review**. Its visible bounded-context section enumerates 13 contexts, including Lead & CRM, Property & Inventory, Visit Management, Reservation & Contract, Payment & Finance, Commission & Payout, Communication, Identity & Access, Notification, Document & Attachment, Activity/Timeline/Audit, Search, and Reporting & Analytics.

**Evidence class:** observed source artifact; not sufficient by itself to prove the approved v2 artifact.

### 2.3 Master Implementation Specification

The implementation specification defines 15 implementation modules and 15 PostgreSQL schemas. It includes additional implementation areas such as Collaboration & Extensibility, Calendar & Scheduling, and Workflow & Automation Engine.

**Evidence class:** implementation architecture specification.

## 3. Non-Equivalence Rules

The following concepts MUST NOT be treated as synonymous without explicit evidence:

- Bounded Context != implementation module
- implementation module != PostgreSQL schema
- PostgreSQL schema != aggregate boundary
- worker != bounded context
- read model != business-rule owner
- event consumer != event owner
- source claim != verified runtime fact

In particular, the existence of 15 implementation modules does not prove that there are exactly 15 bounded contexts.

## 4. Current Lineage Model

```text
Approved Phase-1 requirements
        |
        v
Roadmap declaration: Phase 1.5 v2 / 15 contexts
        |
        +-----------------------------+
        |                             |
        v                             v
Available Domain Model          Context Map v2
(Draft artifact)                (not yet located/verified)
        |                             |
        +-------------+---------------+
                      v
              Reconciliation
                      |
                      v
             Phase 2.1 architecture
                      |
                      v
          Implementation modules
                      |
                      v
            Persistence architecture
```

## 5. Required Reconciliation Questions

Before C2-001 can close, the evidence set must answer:

1. What exact file/version is the approved Phase 1.5 Domain Model v2?
2. What exact file/version is the approved Context Map v2?
3. Which 15 bounded contexts are authoritative?
4. For each context, what is its responsibility and aggregate ownership?
5. Which implementation module represents it, if any?
6. Which modules are projections, workers, infrastructure, or shared capabilities rather than domain contexts?
7. Where did each split, merge, rename, or addition originate?
8. Which tasks, permissions, events, state machines, and schema contracts are affected?

## 6. Reconciliation Status

| Layer | Current status | Promotion rule |
|---|---|---|
| Phase 1 requirements | Source-approved per roadmap | Existing authority |
| Phase 1.5 approved-v2 claim | Declared by roadmap | Requires artifact provenance |
| Available Domain Model | Draft | Cannot become canonical alone |
| Context Map v2 | Not verified in available source set | Must be located or recovery-controlled |
| 15 implementation modules | Specified | Cannot redefine domain boundaries |
| Canonical Context→Module Map | Blocked | Requires reconciliation |
| Task traceability | Blocked for affected items | Requires canonical boundaries |
| Schema traceability | Blocked for affected items | Requires canonical ownership |
| Live DB authority | Separate blocker | Requires runtime evidence |

## 7. Evidence State Machine

Every architecture claim should move through:

`UNLOCATED → LOCATED → EXTRACTED → PROVENANCE_VERIFIED → RECONCILED → CANONICAL`

No state may be skipped.

## 8. Claude Enforcement Rules

Until the relevant reconciliation gates are closed, Claude Code MUST:

- read the current checkpoint before acting;
- distinguish source facts from derived inferences;
- preserve conflicting evidence rather than overwriting it;
- stop when a task depends on unresolved architecture authority;
- never infer missing bounded contexts from module names alone;
- never treat a documented schema as proof of the live database;
- never perform destructive database or Git operations to resolve ambiguity;
- record evidence and affected task IDs when a conflict is discovered.

## 9. Closure Criteria

C2-001 may be considered closed only when all of the following exist in the repository:

- verified approved Domain Model v2 artifact or a formally approved recovery artifact;
- verified Context Map v2 or formally approved recovery artifact;
- canonical Context→Module map;
- aggregate/schema/event/permission/task traceability for affected areas;
- explicit treatment of every split/merge/rename/addition;
- verification checklist and evidence references;
- updated project checkpoint showing the blocker as closed.

Until then, implementation remains downstream of this gate.
