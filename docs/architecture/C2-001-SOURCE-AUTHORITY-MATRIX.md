# ASAS C2-001 — Source Authority Matrix

Status: INVESTIGATING / HARD STOP
Repository: `asas-erp-saas-1/As`
Branch: `foundation/repository-file-organization-v1`
Date: 2026-09-19

## Purpose

This matrix consolidates the distributed source evidence relevant to the canonical domain/context decision. It does not invent or promote a bounded-context cardinality. Its purpose is to distinguish strategic vision, approved-claim evidence, draft domain evidence, implementation decomposition, and repository operating claims.

## Source matrix

| Source | Role | Authority for | Observed position | Status for C2-001 |
|---|---|---|---|---|
| `asas.docx` / Enterprise Architecture Master Directive V4 | Strategic master directive / enterprise vision | Enterprise mission, capability-first philosophy, long-horizon domains, governance, AI, scalability, target operating model | Requires a complete domain/context map but does not establish a canonical numeric context cardinality in the recovered sections | STRATEGIC AUTHORITY; not sufficient alone for cardinality |
| `ENTERPRISE_BLUEPRINT_V2.md` | Enterprise architecture blueprint | Target architecture direction and broad DDD framing | Defines 8 broad bounded-context-style areas in the recovered artifact; also proposes modular enterprise monolith | REFERENCE; cannot override later approved-v2 claim without provenance |
| `ASAS_Master_Roadmap` | Phase governance / approval claim | Phase status and required deliverables | States Phase 1.5 Approved v2; names `Domain Model v2 (15 bounded contexts)` and `Context Map v2` | STRONG APPROVAL CLAIM; underlying artifacts not recovered |
| `ASAS_Enterprise_Domain_Model` | Domain model artifact | Draft domain boundaries, aggregates, domain relationships | Explicitly `Draft`; visible model contains 13 contexts | DRAFT EVIDENCE; not approval proof |
| `ASAS_Context_Map.mermaid` | Domain relationship visualization | Draft context relationships | Corroborates the 13-context draft shape | DRAFT CORROBORATION |
| `ASAS_Master_Implementation_Specification` | Implementation architecture | Module boundaries, schemas, process split, communication rules | Defines 15 modules/schemas and states one per Domain-Model bounded context | IMPLEMENTATION CLAIM; requires validation against approved Domain Model v2 |
| `AGENTS.md` | Repository operating contract | Claude operating rules and repository architecture summary | States 9 bounded contexts and groups Scheduling under CRM | CURRENT REPOSITORY CLAIM; must be reconciled, not silently promoted |
| `FOUNDATION-EXTERNAL-DEEP-AUDIT-2026-09-18.md` | Audit evidence | Repository risks and control gaps | Confirms C2-001 as open hard stop and recommends ADR before schema work | AUDIT EVIDENCE |

## Key finding

The broadest and earliest enterprise directive (`asas.docx`) is useful as the strategic North Star because it explicitly frames ASAS as an enterprise real-estate operating system and calls for business-capability, domain, event, workflow, data, AI, security, scalability, and governance layers. It does **not**, in the recovered evidence, provide a final numeric bounded-context decision.

The later roadmap is the strongest evidence that a 15-context Domain Model v2 was intended to be approved, because it explicitly records Phase 1.5 as Approved v2 and names the 15-context Domain Model v2 and Context Map v2 as deliverables.

The available Domain Model artifact contradicts that status at the artifact level: it is explicitly Draft and presents the 13-context model.

The Implementation Specification is later in time and technically detailed, and it defines 15 modules/schemas. However, it cannot independently prove that those 15 modules are the approved bounded-context model; its own statement that the modules are one per Domain-Model bounded context must be checked against the missing approved Domain Model v2.

## Authority rule derived from the evidence

For C2-001:

1. Use `asas.docx` as the strategic enterprise North Star.
2. Treat the Roadmap's 15-context statement as an explicit approval claim requiring artifact/provenance recovery.
3. Treat the 13-context Domain Model and Context Map as Draft domain evidence, not canonical approval.
4. Treat the 15-module Implementation Specification as an implementation decomposition that requires domain-authority validation.
5. Treat the `AGENTS.md` 9-context statement as a repository-operating claim requiring reconciliation with later architecture claims.
6. Do not derive a canonical context list from arithmetic, filename similarity, or module count.

## What can safely proceed while C2-001 remains open

The following may continue because they do not require unresolved context ownership:

- source/provenance recovery;
- repository governance and CI hardening;
- canonical artifact ownership cleanup;
- readiness/loading-chain improvements;
- architecture evidence indexing;
- non-mutating documentation audits;
- task/schema discrepancy inventory without implementation;
- live-environment identity verification that does not mutate the database.

The following remain blocked:

- executable schema implementation;
- Prisma model implementation derived from the unresolved context map;
- migrations;
- database-affecting changes;
- domain implementation whose ownership depends on the unresolved context decision.

## Required C2-001 closure evidence

Either:

### Path A — Provenance recovery

Recover:

- approved `Domain Model v2`;
- approved `Context Map v2`;
- version/date/owner;
- explicit approval record;
- relationship to the roadmap's Approved v2 claim.

### Path B — Authorized architecture ADR

If Path A cannot be completed, the authorized architecture decision must establish:

- canonical bounded-context IDs and names;
- responsibilities and non-responsibilities;
- aggregate ownership;
- module mapping;
- schema ownership;
- event/command ownership;
- synchronous/asynchronous boundaries;
- tenancy/security authority;
- worker/read-model classification;
- rejected alternatives;
- downstream impact on tasks, contracts, registers, and implementation.

## Current conclusion

`C2-001 = BLOCKED / SOURCE RECOVERY INCOMPLETE`

The evidence supports a clear distinction between **strategic vision**, **approval claim**, **draft domain model**, and **implementation decomposition**. It does not yet support an honest canonical numeric context decision.
