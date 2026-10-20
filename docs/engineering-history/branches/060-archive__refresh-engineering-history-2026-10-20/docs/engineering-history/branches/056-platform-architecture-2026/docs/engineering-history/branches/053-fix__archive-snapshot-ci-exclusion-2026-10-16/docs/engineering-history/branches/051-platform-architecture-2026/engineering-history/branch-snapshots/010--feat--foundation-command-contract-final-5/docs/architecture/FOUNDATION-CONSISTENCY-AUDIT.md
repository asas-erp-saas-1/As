# ASAS Foundation Consistency Audit

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.
**Date:** 2026-09-14
**Scope:** Blueprint v1.6.1, machine-readable registers, ADRs, current repository contracts, UX/Figma contracts and current primary-source technology research.

## 1. Purpose

This audit checks whether the foundation can be handed to an implementation operator without silently resolving contradictions during coding.

The audit is conservative: contradictions are recorded rather than fixed by inference. Founder remains the decision owner for product scope, domain boundaries, new events and other Tier-C changes.

## 2. Executive verdict

**FOUNDATION: SUBSTANTIALLY SPECIFIED; CONTRACT NORMALIZATION IS NOW THE REMAINING HARDENING LAYER.**

The broad architecture is sufficiently defined. The work now is to make vocabulary and traceability mechanically unambiguous before business-feature implementation.

## 3. Findings

### F-01 — Repository context map was inconsistent with the Blueprint operating protocol

**Severity:** BLOCKER before domain implementation.

The package's AGENTS operating protocol explicitly defines nine bounded contexts: Core, CRM, Sales, Inventory, Finance, Website Studio, Marketing, Analytics and Documents. It also explicitly states that Scheduling is hosted as a CRM submodule and that the context map remains nine. fileciteturn99file0L2-L2

The repository Domain Contracts Map previously presented eight contexts and combined Reservations & Contracts with Integrations & Scheduling while omitting Analytics and Documents as explicit contexts.

**Resolution performed:** `docs/architecture/CONTEXT-MAP-CANONICALIZATION.md` was added and `DOMAIN-CONTRACTS-MAP.md` was updated to use the nine-context classification. Scheduling is now explicitly CRM-hosted; public website is explicitly a product surface; integrations/workflow/notifications/audit/search are explicitly classified as platform capabilities or projections.

**Remaining gate:** verify this classification against the exact Blueprint/ADR artifact during Gate 00 before implementation. If the authoritative artifact differs, stop rather than silently editing the register.

### F-02 — State-machine structure is incomplete

The register contains 11 canonical machines. The implementation contract requires exhaustive transition representation rather than UI-derived status logic.

**Resolution performed:** `STATE-MACHINE-NORMALIZATION.md` now defines the canonical 11-machine set and the required transition record: edge, trigger/command, actor, permission, scope, preconditions, reason, side effects, audit, event, terminal/reversible semantics, idempotency and conflict behavior.

**Remaining gate:** populate/verify exact transitions from Appendix B/register before implementing each machine. No transition is invented by the implementation operator.

### F-03 — Event vocabulary requires one canonical identity

The register uses dotted event identities while the repository contract previously used PascalCase labels.

**Resolution performed:** `EVENT-TAXONOMY-CONTRACT.md` establishes the registered dotted identifier as the canonical wire/event identity. PascalCase is allowed only as an in-code symbol mapping one-to-one to the registered identity/version.

### F-04 — Permission-to-command coverage is implicit

The 50 permission keys and eight personas are the authorization source of record, but commands require explicit mapping to permission, scope and ABAC semantics.

**Resolution performed:** `AUTHORIZATION-TRACEABILITY.md` defines the required command authorization record and negative test matrix. Exact permission keys are intentionally not invented; they must be resolved against Appendix A.

### F-05 — Event register versus domain-contract coverage requires classification

The 103 registered events must be explicitly classified rather than assuming every event listed in a context summary is a canonical domain event.

**Resolution performed:** `EVENT-TAXONOMY-CONTRACT.md` defines the required event classes and producer/consumer rules.

### F-06 — UX command traceability must become explicit

The Golden Journey contract is strong, but critical actions need stable command/permission/event linkage.

**Resolution:** `CONTRACT-TRACEABILITY-MATRIX.md` remains the required structure; the next implementation-readiness pass must populate exact IDs for J1–J12 from the authoritative registers.

### F-07 — Figma/domain linkage must be explicit

The Figma contract correctly prevents Figma from redefining domain behavior. Current Figma documentation confirms that the official MCP server provides structured access to variables/components/layout and supports Claude Code; the remote server is the preferred general setup. citeturn0search1turn0search13

**Resolution:** preserve Figma as structured design context and add stable screen/action IDs to the critical journey traceability rows. Figma remains subordinate to product/domain/token contracts.

### F-08 — Package verification claim is not backed by the delivered verifier artifact

Measured package facts remain: 69 checksum entries, 119 tasks, 103 events, 50 permission rows, 11 state machines, 42 component-inventory rows, 59 Prisma models and 17 enums. The claimed verifier script was not found in the delivered package.

**Status:** MISSING / NOT VERIFIED. Do not treat the prose claim as evidence.

### F-09 — Repository identity must remain authoritative

Canonical repository is `asas-erp-saas-1/As`. Historical `Asas-website` material is explicitly excluded from the current project.

**Status:** RESOLVED in repository session state and Claude execution contract.

## 4. External research conclusions

Current primary-source research produced no architectural reason to change the foundation:

- Figma officially supports structured MCP access for Claude Code and recommends remote MCP for most users. citeturn0search1turn0search15
- Current Next.js documentation continues to support the App Router/server-component model used by the foundation. citeturn0search4
- Current Prisma documentation reinforces migration/drift verification and reproducible migration history. citeturn0search2turn0search5turn0search12
- Current Supabase documentation reinforces RLS as database-level defense in depth and explicit policy testing. citeturn0search0turn0search16

These facts are recorded separately in `docs/research/FOUNDATION-TECHNOLOGY-RESEARCH-2026-09.md`.

## 5. Normalization order

1. Canonical bounded-context classification — completed as repository contract, pending Gate 00 source reconciliation.
2. State-machine normalization contract — completed; exact transitions remain register-derived.
3. Event identity/version contract — completed.
4. Command → permission → scope/ABAC contract — completed structurally; exact matrix remains Appendix-A-derived.
5. Domain command → event → state-machine traceability — next population pass.
6. Golden Journey action → command → permission → event → UI-state traceability — next population pass.
7. Figma screen/action → UX action → command linkage — next population pass.
8. Package verification claim reconciliation — remains blocked on missing verifier artifact/document correction.

## 6. Stop conditions

Do not begin feature implementation if any of the following remains unresolved:

- authoritative context source contradicts repository classification;
- an implementation-critical state machine lacks exhaustive transitions;
- a mutating command has no explicit authorization mapping;
- an emitted event is not registered/versioned;
- a critical UX action cannot be traced to a governed command;
- a Figma interaction contradicts the domain contract;
- package verification claims are presented as evidence without the underlying artifact.

## 7. Current decision posture

The normalization documents are **contracts for future implementation**, not implementation authorization. Any change to bounded-context ownership, money/legal semantics, security posture, or canonical events remains Tier-C.
