# ASAS — Context Authority Reconciliation 2026

**Artifact ID:** ASAS-CONTEXT-AUTHORITY-RECONCILIATION-2026  
**Status:** HISTORICAL CONFLICT RECORD — FD-001 SUPERSEDES THE HIGH-LEVEL COUNT STATUS; PROVENANCE / DETAILED OWNERSHIP GAPS REMAIN OPEN  
**Version:** 1.1.0  
**Date:** 2026-09-24  
**Repository:** `asas-erp-saas-1/As`  
**Active branch:** `platform-architecture-2026`

## 1. Purpose

Resolve the bounded-context authority conflict without silently selecting a context count.

This artifact is deliberately corrective: the current nine-context summary must not be treated as fully canonical until the historically claimed approved Domain Model v2 and Context Map v2 are located and provenance-verified.

## 2. Evidence currently established

### 2.1 Current-branch architecture checkpoint

The current checkpoint records nine target contexts:

`Core / CRM / Sales / Inventory / Finance / Studio / Marketing / Analytics / Documents`

It classifies the historical 15-module proposal as implementation evidence rather than equal-authority bounded-context architecture.

This is current control-plane evidence, but it is not by itself proof that the nine-context model superseded the previously claimed approved Phase 1.5 Domain Model v2.

### 2.2 Historical architecture-lineage artifact

`foundation/architecture-lineage-reconciliation-v1` contains `docs/architecture/ARCHITECTURE-LINEAGE-RECONCILIATION.md`.

That artifact states:

- the Master Roadmap claims Phase 1.5 is Approved (v2);
- the claimed deliverables are Domain Model v2 and Context Map v2;
- the roadmap describes 15 bounded contexts;
- an available `ASAS_Enterprise_Domain_Model` is explicitly Draft and contains 13 visible contexts;
- the Master Implementation Specification defines 15 implementation modules and 15 PostgreSQL schemas;
- those categories must not be treated as equivalent.

### 2.3 Historical source-authority ledger

`foundation/source-authority-ledger-v1` contains `docs/architecture/SOURCE-AUTHORITY-LEDGER.md`.

That ledger explicitly states that the exact approved Phase 1.5 Domain Model v2 and Context Map v2 have not been identified, and therefore their contents must remain UNVERIFIED.

### 2.4 Additional historical branch evidence — `foundation/reconcile-context-map-v2`

A dedicated historical branch named `foundation/reconcile-context-map-v2` was inspected on 2026-09-24.

It contains:

- `docs/architecture/CANONICAL-CONTEXT-TO-MODULE-MAP.md`;
- `docs/decisions/ADR-0001-CANONICAL-CONTEXT-MODULE-DECOMPOSITION.md`;
- a 15-module implementation decomposition;
- an ADR proposing adoption of that decomposition.

The ADR is explicitly marked **PROPOSED — awaiting explicit founder acceptance**. Therefore this branch proves that a 15-context/15-module implementation architecture was proposed and documented; it does **not** prove that the missing approved Phase 1.5 Domain Model v2 artifact has been recovered, nor that the ADR was accepted.

The branch's candidate map explicitly states that it is derived and becomes canonical only with ADR-0001 acceptance. Its presence therefore cannot be used to silently close C2-001.

## 3. Authority conclusion

The following statements are simultaneously true and must remain separate:

| Claim | Status |
|---|---|
| Nine-context model exists in current control plane | VERIFIED CURRENT ARTIFACT |
| Nine-context model is the final approved replacement for the claimed v2 model | UNVERIFIED |
| Master Roadmap claims an approved v2 Domain Model with 15 contexts | VERIFIED CLAIM / ARTIFACT UNLOCATED |
| Exact approved 15-context Domain Model v2 | UNVERIFIED |
| Exact approved Context Map v2 | UNVERIFIED |
| Historical draft 13-context model | VERIFIED HISTORICAL SOURCE CLAIM |
| 15 implementation modules | VERIFIED HISTORICAL IMPLEMENTATION SOURCE |
| 15 PostgreSQL schemas | VERIFIED HISTORICAL IMPLEMENTATION SOURCE |
| Historical 15-context/15-module candidate map | VERIFIED HISTORICAL PROPOSAL |
| ADR-0001 accepting the 15-context/15-module proposal | NOT ACCEPTED / FOUNDER DECISION REQUIRED |

Therefore the architecture cannot honestly report `bounded contexts = 9` or `bounded contexts = 15` as a fully reconciled canonical fact yet.

## 4. Corrected canonical position as of 2026-09-24 (superseded for high-level grouping by Section 9)

At the time this record was written (2026-09-24), the approved v2 artifact had not been recovered and no later explicit decision had yet superseded the historical count claim:

**Historical finding as of 2026-09-24: bounded-context count OPEN / CONFLICT. See Section 9 for the subsequent FD-001 decision.**

The nine-context model is the **current candidate architecture representation**, not an implementation authorization.

The 15-context claim is a **historical approved-artifact claim whose source artifact is missing/unverified**.

The 13-context model is **historical draft evidence**.

The 15-module model is **implementation architecture evidence** and must not be converted into bounded contexts by counting.

The historical `foundation/reconcile-context-map-v2` branch contains a **proposed** 15-context/15-module candidate decomposition. Because its ADR is still `PROPOSED — awaiting explicit founder acceptance`, it is evidence of a candidate decision, not an accepted architectural authority.

## 5. Prohibited actions

Until reconciliation closes, agents MUST NOT:

- invent missing contexts to reach 15;
- delete the nine-context model merely because an older source claims 15;
- promote the 13-context draft to canonical;
- equate 15 modules with 15 contexts;
- promote the historical candidate map merely because it exists on a branch;
- create aggregates, permissions, events, schemas, APIs, or tasks solely from context-count assumptions;
- rewrite historical artifacts to make counts agree;
- close C2-001 based only on documentation presence.

## 6. Required closure path

`Locate approved v2 artifact → verify provenance → extract exact context inventory → compare with current nine-context candidate → compare with historical 13-context draft → compare with historical 15-context candidate proposal → separate modules/capabilities → reconcile splits/merges/renames → map aggregates/events/permissions/tasks → record decision → update canonical source of truth → verify references → close C2-001`

If the approved v2 artifact cannot be recovered, the missing authority must be escalated as a founder/architecture decision rather than reconstructed by inference.

## 7. Implementation gate

This conflict blocks implementation decisions that depend on unresolved context ownership.

It does not block unrelated repository governance, evidence collection, static verification, design-system research, or other architecture work whose ownership is already established.

## 8. Provenance

- Current `platform-architecture-2026` checkpoint: `docs/handoff/CURRENT-SESSION-STATE.md` v3.8.
- Historical `foundation/architecture-lineage-reconciliation-v1`: `docs/architecture/ARCHITECTURE-LINEAGE-RECONCILIATION.md`.
- Historical `foundation/source-authority-ledger-v1`: `docs/architecture/SOURCE-AUTHORITY-LEDGER.md`.
- Historical `foundation/reconcile-context-map-v2`: `docs/architecture/CANONICAL-CONTEXT-TO-MODULE-MAP.md` and `docs/decisions/ADR-0001-CANONICAL-CONTEXT-MODULE-DECOMPOSITION.md`.
- GitHub branch comparison performed 2026-09-24.

**Classification:** `CONFLICT / AUTHORITY RECONCILIATION REQUIRED`


## 9. Supersession update — 2026-10-17

### What is now decided

On 2026-09-26, the Founder Decision Register recorded **FD-001 — CLOSED / ARCHITECTURE DECIDED**. The current canonical high-level grouping is nine contexts: Core, CRM, Sales, Inventory, Finance, Website Studio, Marketing, Analytics and Documents. FD-001 explicitly distinguishes bounded contexts from implementation modules, aggregates, schemas, read models, workers and event consumers.

Therefore, the older statement in Sections 3–6 that the *current high-level context count itself* must remain open is superseded by FD-001. This is an explicit decision, not an inference from the newer branch or the absence of another file.

### What is not recovered or closed

- The exact historically claimed approved Phase 1.5 Domain Model v2 / Context Map v2 artifacts remain **UNLOCATED / UNVERIFIED**. FD-001 does not create those files or prove their contents.
- The historical 13-context draft and 15-module implementation proposal remain preserved evidence, not competing current authority.
- Detailed module/context/aggregate/schema/persistence/event/permission ownership and the relevant C-track contracts remain subject to evidence and closure.
- The missing path `docs/architecture/ASAS-ARCHITECTURE-V3.md` remains a separately documented missing-source/owner-resolution gap. Do not fabricate it or infer its contents from amendments.

### Scheduling cross-reference

Scheduling ownership was separately decided by **FD-002** and accepted **ADR-0021** on 2026-09-26: Core-hosted platform capability. The downstream persistence trace, contract, permission, event, audit and verification work remains open; the decision does not authorize a schema.

### Authority

For current high-level context grouping, use `docs/governance/FOUNDER-DECISIONS.md#fd-001`. For Scheduling owner, use `docs/governance/FOUNDER-DECISIONS.md#fd-002` and `docs/architecture/decisions/ADR-0021-SCHEDULING-OWNERSHIP-2026-09-26.md`. This historical reconciliation file preserves its earlier analysis and this explicit supersession record; it does not silently erase provenance.
