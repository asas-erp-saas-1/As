# ASAS — Architecture Cross-Source Reconciliation Record

**Artifact ID:** ASAS-AUDIT-XSR-2026-09-20-001  
**Status:** CANONICAL EVIDENCE RECORD  
**Date:** 2026-09-20  
**Branch:** `platform-architecture-2026`  
**Purpose:** Record the evidence used during continuation of the architecture engineering path without converting conflicting evidence into an implementation decision.

## 1. Repository branch reality

`main` and `platform-architecture-2026` are distinct refs. The architecture branch is 80 commits ahead of `main` and has no commits behind it at the time of comparison. The architecture branch contains the 2026 architecture control-plane artifacts, including the Source of Truth, Blueprint, Roadmap, Context Prompt, evidence matrix, domain contracts, audit records and governance updates.

**Implication:** architecture work must continue on `platform-architecture-2026`; `main` remains the canonical integration branch according to the current checkpoint.

## 2. Source package verification

The supplied `ASAS-AI-PACKAGE-v1.6.1` was inspected locally. Its handoff contains:

- Blueprint v1.6.1 PDF/DOCX;
- AGENTS.md;
- ADR-0001 through ADR-0020;
- registers for events, permissions, state machines and tasks;
- target Prisma contract;
- design tokens/component inventory;
- research and implementation skills;
- runbooks.

The source package is provenance evidence and the Blueprint is the declared normative source. Repository shadows must not silently override it.

## 3. Scheduling authority conflict — confirmed

The supplied Blueprint v1.6.1 explicitly states that the Scheduling engine is the **CRM context's scheduling submodule**, including the intended module path `src/modules/crm/scheduling/`.

The supplied `ADR-0018` states that Scheduling is a **Core-hosted submodule**, while the current `AGENTS.md` states that Scheduling is a CRM scheduling submodule.

Therefore this is a genuine authority conflict, not merely a naming variation.

### Classification

`FOUNDER DECISION REQUIRED`

### Prohibited inference

Do not create or relocate Scheduling modules, schemas, events, permissions, persistence ownership or dependency rules until an explicit ADR confirms the canonical owner or supersedes ADR-0018.

## 4. Context/module decomposition

The historical candidate map contains 15 implementation modules. The current architecture control plane distinguishes this from the nine high-level domain contexts.

The correct architectural distinction remains:

`Bounded Context ≠ Implementation Module ≠ Aggregate ≠ Database Schema ≠ Read Model ≠ Worker ≠ Event Consumer`

The numerical difference is not itself a defect. Individual ownership decisions remain subject to semantic evidence and contract closure.

## 5. Building evidence

Current architecture evidence supports the hierarchy:

`Project → Building → Unit`

and places construction-lite tracking within Inventory because its purpose is unit readiness and payment-milestone truth.

No verified evidence was found that authorizes a standalone Building bounded context or a new Building state machine. Therefore Building remains a domain concept with an open aggregate/persistence boundary.

### Status

`OPEN / IMPLEMENTATION BLOCKED`

## 6. Event/permission/state register status

The architecture branch contains derived machine shadows:

- `registers/events.json` — 103 events / 11 emission groups;
- `registers/permissions.csv` — 50 permission keys / 8 persona columns;
- `registers/state-machines.json` — 11 state machines.

Presence of a register is not evidence of runtime enforcement. Each register remains a derived shadow of the Blueprint and must be reconciled before implementation.

## 7. External engineering corroboration

Current external evidence used during this continuation:

- GitHub documentation confirms branches are separate development lines and supports compare-based inspection of branches/commits. GitHub rulesets/branch protections can enforce pull requests, status checks, signed commits and force-push restrictions, but repository configuration must be verified separately.
- OWASP guidance supports deny-by-default and server-side authorization as baseline controls.
- PostgreSQL documentation supports row-level locking as a concurrency primitive; no specific Building locking mechanism is selected by this evidence.

External sources validate engineering techniques; they do not override ASAS product or architecture authority.

## 8. Current engineering decision

Continue the path in this order:

1. Building source/branch reconciliation;
2. Offer state/permission/event closure;
3. Payment/Receipt/Allocation/Ledger semantic closure;
4. explicit Scheduling founder decision / ADR confirmation or supersession;
5. command → aggregate → permission → state → event traceability;
6. query/read-model contracts;
7. task packet derivation;
8. schema promotion only after the architecture gates permit it.

## 9. Implementation boundary

This record authorizes documentation, reconciliation and evidence work only. It does not authorize application code, Prisma schema promotion, migrations, live database changes, production configuration or autonomous financial/AI mutations.
