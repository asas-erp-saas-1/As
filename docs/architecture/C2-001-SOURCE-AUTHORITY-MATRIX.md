# ASAS C2-001 — Source Authority Matrix

Status: INVESTIGATING / HARD STOP
Repository: `asas-erp-saas-1/As`
Branch: `foundation/repository-file-organization-v1`
Date: 2026-09-19

## Purpose

This matrix consolidates the distributed source evidence relevant to the canonical domain/context decision. It distinguishes strategic vision, approval claims, accepted source-package decisions, draft domain evidence, implementation decomposition, and repository operating claims. It does not silently convert a source claim into repository canonical state.

## Source matrix

| Source | Role | Authority for | Observed position | Status for C2-001 |
|---|---|---|---|---|
| `ASAS-Complete-Package/MASTER-SPEC.md` v3.3 (2026-09-14) | Latest comprehensive engineering specification | Operating protocol, architecture doctrine, delivery model, current source-package architecture | Explicitly states **nine bounded contexts** and identifies ADR-0002 as the DDD decision | **HIGHEST CURRENT SOURCE-PACKAGE EVIDENCE**; not yet promoted into repo |
| `ASAS-Complete-Package/blueprint/adr/0002-ddd-nine-bounded-contexts.md` v1.0 (2026-09-02) | Accepted source-package ADR | Bounded-context architecture | **Accepted**; nine contexts: Core/Platform, CRM, Sales, Inventory, Finance, Website Studio, Marketing, Analytics, Documents; Scheduling is not a standalone context | **ACCEPTED SOURCE DECISION**; repository promotion/reconciliation required |
| `asas.docx` / Enterprise Architecture Master Directive V4 | Strategic master directive / enterprise vision | Enterprise mission, capability-first philosophy, long-horizon domains, governance, AI, scalability, target operating model | Requires a complete domain/context map but does not establish a canonical numeric context cardinality in the recovered sections | STRATEGIC AUTHORITY; not sufficient alone for cardinality |
| `ASAS_Master_Roadmap` | Phase governance / approval claim | Phase status and required deliverables | States Phase 1.5 Approved v2; names `Domain Model v2 (15 bounded contexts)` and `Context Map v2` as deliverables | **CONFLICTING APPROVAL CLAIM**; must be reconciled against later source-package evidence |
| `ASAS_Enterprise_Domain_Model` | Domain model artifact | Draft domain boundaries, aggregates, domain relationships | Explicitly `Draft`; visible model contains 13 contexts | DRAFT EVIDENCE; not approval proof |
| `ASAS_Context_Map.mermaid` | Domain relationship visualization | Draft context relationships | Corroborates the 13-context draft shape | DRAFT CORROBORATION |
| `ASAS_Master_Implementation_Specification` | Implementation architecture | Module boundaries, schemas, process split, communication rules | Defines 15 modules/schemas | IMPLEMENTATION CLAIM; cannot independently override the accepted source ADR |
| `AGENTS.md` | Repository operating contract | Claude operating rules and repository architecture summary | States 9 bounded contexts and groups Scheduling under CRM | CURRENT REPOSITORY CLAIM; now strongly corroborated by the latest source package, but repo provenance still needs explicit reconciliation |
| `FOUNDATION-EXTERNAL-DEEP-AUDIT-2026-09-18.md` | Audit evidence | Repository risks and control gaps | Confirms C2-001 as open hard stop and recommends ADR before schema work | AUDIT EVIDENCE |

## New source-recovery evidence — 2026-09-19

The uploaded `ASAS-Complete-Package (2).zip` was inspected directly from the project environment. Its `CHECKSUMS.txt` records:

- `MASTER-SPEC.md` SHA-256: `027af4f0226617c0b71608d45e69bcf413a69bbaaf670a26e2e6591d2dd2bf25`
- `blueprint/adr/0002-ddd-nine-bounded-contexts.md` SHA-256: `1d10ad2a713f41819f907d53da238c4fbd80743de8338e191ecec5c415d9e419`

`MASTER-SPEC.md` is dated 2026-09-14 and versioned 3.3. It explicitly states that ASAS is a modular monolith with **nine bounded contexts** and identifies ADR-0002 as the DDD nine-context decision. The recovered ADR itself is marked **Accepted (v1.0)** and names the nine contexts. This is materially stronger evidence than the previously available repository-only AGENTS claim because it supplies an accepted ADR and a newer comprehensive specification.

This does **not** prove that the July Roadmap's separate 15-context Approved-v2 artifacts were never valid. It proves that the current source package contains a later accepted architecture decision that must be reconciled with that older approval claim.

## Authority interpretation

For the current platform-engineering path, the evidence now supports the following working interpretation:

1. `asas.docx` remains the strategic North Star.
2. `MASTER-SPEC.md` v3.3 is the latest comprehensive engineering specification recovered in the source package.
3. Source-package ADR-0002 is an explicit **Accepted** architecture decision for nine bounded contexts.
4. The July Roadmap's 15-context Approved-v2 statement is a conflicting historical approval claim that requires reconciliation; it must not silently override the later accepted source ADR.
5. The 13-context Domain Model remains Draft evidence.
6. The 15-module Implementation Specification is an implementation decomposition and must be mapped to the accepted context model rather than treated as a context count.
7. `AGENTS.md`'s nine-context statement is now corroborated by the later source package, but the repository still needs an explicit canonical reconciliation artifact before the foundation gate can be called closed.

## Recommended canonical direction

**Recommended architecture direction: nine bounded contexts**, using the accepted source-package ADR-0002 as the primary architecture evidence, with Scheduling treated according to the accepted source-package decision rather than promoted to an independent context without a new architectural decision.

The nine-context recommendation must still be converted into a repository-owned reconciliation ADR before C2-001 is marked CLOSED. The reconciliation ADR must explicitly record how the older 15-context roadmap claim and 13-context draft are superseded, historical, or otherwise scoped.

## What can safely proceed

- source/provenance recovery;
- repository governance and CI hardening;
- canonical artifact ownership cleanup;
- readiness/loading-chain improvements;
- architecture evidence indexing;
- non-mutating documentation audits;
- task/schema discrepancy inventory without implementation;
- preparation of the nine-context reconciliation ADR;
- preparation of Context → Module mapping without database mutation.

Still blocked until reconciliation is accepted and verified:

- executable schema implementation;
- Prisma model implementation derived from the unresolved context map;
- migrations;
- database-affecting changes;
- domain implementation whose ownership depends on the unresolved context decision.

## Required C2-001 closure evidence

1. Evidence package including the later accepted source ADR and Master Spec.
2. Repository-owned reconciliation ADR.
3. Explicit treatment of the 15-context roadmap claim and 13-context draft.
4. Canonical nine-context list with responsibilities/non-responsibilities.
5. Context → Module → Aggregate → Schema → Event → Permission ownership mapping.
6. Updated registers/references where the decision changes their authority, with no silent historical deletion.
7. Verification that no active canonical artifact still presents the superseded architecture as current.

## Current conclusion

`C2-001 = SOURCE RECOVERY SUBSTANTIALLY RESOLVED / REPOSITORY RECONCILIATION REQUIRED`

The latest source package provides materially stronger evidence for a **nine-context canonical direction**: an accepted ADR plus a newer comprehensive Master Spec. The repository must now perform the explicit reconciliation step before calling the architecture gate closed.
