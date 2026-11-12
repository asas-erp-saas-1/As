# Early-stage engineering semantic reconciliation — 2026-10-17

## Purpose and scope

The full branch snapshots and unique historical blob recovery now preserve early documents that were not present in the active root. This review is the first semantic pass over eight foundational artifacts from the early `feat/foundation-event-permission-command-closure` snapshot (snapshot order 001; source tree head `5c2021eaf5402e6316687b5bd99a6047d40387b9`). It compares each artifact with the current canonical control plane and later contracts, rather than assuming absence means loss or treating an old document as approved.

This is a **targeted initial review**, not a line-by-line adjudication of every one of the 173 paths. No historical artifact has been promoted by this review.

## Findings that change the next engineering step

### 1. Authorization permission keys exist, but command-level traceability is not proven

The active `registers/permissions.csv` has 50 permission records and 8 role/persona columns. That matches the shape stated in the historical authorization traceability document. But the permission register by itself does not prove that every mutating command and route has a permission, scope/ABAC guard, explicit deny behavior, tenant check, audit requirement and negative tests. The later B.6 command/event/transaction matrix still uses `OPEN_COMMAND:*` placeholders and marks exact command/event mappings open.

**Conclusion:** retain the early authorization traceability file as valuable evidence; build and verify a current command → permission → route → scope/ABAC → audit → test crosswalk. This is a P0 issue; do not infer closure from having 50 permission keys.

### 2. Mutation ordering has a material cross-document discrepancy

The old API map defines the universal mutation order as:

`request identity → tenant/workspace → permission → scope/ABAC → idempotency → input validation → domain command → transaction → audit/outbox → response`

The later idempotency catalog currently describes a different order:

`validate key → acquire/check idempotency record → authorize → validate → domain mutation → state transition → audit → required outbox rows → finalize idempotency result → commit`

These may be reconcilable—for example by separating safe key-format validation and lookup from execution of the protected business command—but the repository must have one explicit accepted contract. **Do not let implementation teams infer the order from either candidate in isolation.** The contract must also define whether any unauthenticated caller can probe a prior idempotency result, how tenant/actor/operation scope is applied, and when the stored result becomes visible.

### 3. Domain topology remains open

The early Domain Contracts Map says there are nine bounded contexts and places scheduling inside CRM. Current architecture artifacts provide more refined domain contracts and a Blueprint, but the live `OPEN-CONTRACT-CONFLICTS.md` still records C2-001 (context/module decomposition) and C2-001-S (Scheduling ownership) as open decisions. The historical map therefore helps discover assumptions but cannot close these boundaries by itself.

**Conclusion:** crosswalk historical entities, commands and ownership into current contract files, then close the existing conflict records with explicit evidence/authority. Preserve unresolved scope as open.

### 4. State-machine edge evidence is useful, but exact closure is not achieved by file presence

The historical State-Machine Edge Closure Register explicitly separates `CLOSED`, `OPEN` and `DERIVED`, and permits implementation only for source-supported `CLOSED` edges. The current machine register and Blueprint still need to be the authoritative basis. The current reservation consistency contract is marked **accepted semantic contract; implementation gated**, while the separate reservation state-machine contract remains **proposed — implementation blocked** and says exact state/transaction details remain open.

These statuses are not automatically contradictory: one accepts consistency invariants while the other withholds implementation authority for the exact lifecycle. They must remain distinct. Rebuild edge-level state/trigger/actor/precondition/transaction/audit/outbox evidence from the current machine register and approved contracts; do not promote old `CLOSED` labels without checking current authority.

### 5. The old and current gate taxonomies must not be conflated

The early Foundation Master Closure Program defines **14 dimensions G00–G13** (source/reality, ownership, state machines, commands, authorization, concurrency, events, finance, data governance, security, UX, AI/integrations, reliability, quality/release). The current Engineering Conference Gate Model defines **eight serial gates GATE-00–GATE-07**. These are different abstractions. In particular, G00 and GATE-00 are not automatically the same thing.

**Conclusion:** retain the old program as a completeness checklist, then create an explicit many-to-many crosswalk from each dimension to the current gate, canonical evidence, status and owner. Do not rename or close gates based only on matching numbers.

### 6. Adversarial findings are distributed across specialized audits, several of which remain partial

The historical Adversarial Gap Register’s topics were subsequently split into specific documents: concurrency/race catalog, idempotency catalog, outbox/inbox contract, reservation/hold/deposit atomicity, finance correctness, and security threat baseline. However the inspected copies themselves carry explicit `HISTORICAL CANDIDATE` metadata; the idempotency catalog is **PARTIAL / P0**, the outbox/inbox contract is **PARTIAL / P0**, and the reservation atomicity matrix is **OPEN / P0 / implementation-gated**. They remain useful evidence, not closure proof.

Open details called out by these files include idempotency storage/retention/derivation; outbox retry/backoff/retention/replay/dead-letter policy; and transaction/locking evidence for reservation races. Before using dated recommendations, verify current provider capabilities, the actual database schema/runtime and the accepted domain rules.

### 7. Current agent context supersedes old resume paths

The early AI Context Protocol and Engineering Prompt share durable principles with current `AGENTS.md`, the canonical Architecture Context Prompt, the Source of Truth and the Engineering Conference Constitution. Yet the early protocol points at older handoff/product-truth paths and an older source hierarchy. The current context explicitly declares `docs/handoff/CURRENT-SESSION-STATE.md` the sole current checkpoint and relegates `SESSION_STATE.md` to legacy compatibility.

**Conclusion:** keep early prompts archived as provenance and source for missing quality checks, but do not reactivate them as the controlling agent instructions.

## Artifact-by-artifact disposition

| Historical artifact | Initial finding | Disposition |
|---|---|---|
| `docs/AI/CONTEXT_PROTOCOL.md` | Mostly superseded as operating route; durable invariants survive in the current control plane | Retain as evidence; no reactivation |
| `docs/AI/ENGINEERING_PROMPT.md` | Mostly superseded prompt; reusable QA checklist may contain gaps | Retain and cross-check quality gates |
| `docs/architecture/API-CONTRACT-MAP.md` | Partial coverage; request-order and route-to-command mapping are not closed | P0 reconciliation required |
| `docs/architecture/AUTHORIZATION-TRACEABILITY.md` | 50-key register exists; command-level traceability remains unproven | P0 reconciliation required |
| `docs/architecture/DOMAIN-CONTRACTS-MAP.md` | Partial replacement; C2-001/C2-001-S remain open | No promotion; close conflicts |
| `docs/architecture/STATE-MACHINE-EDGE-CLOSURE-REGISTER.md` | Valuable edge inventory; current legal edges/implementation status require revalidation | Rebuild from authoritative registers |
| `docs/architecture/FOUNDATION-MASTER-CLOSURE-PROGRAM.md` | Reusable 14-dimension completeness model; different from current eight-gate model | Crosswalk required |
| `docs/audit/FOUNDATION-ADVERSARIAL-GAP-REGISTER.md` | Findings split across specialized candidate audits; P0 contracts still partial/open | Consolidate evidence and closure states |

The machine-readable version is `EARLY-STAGE-SEMANTIC-RECONCILIATION-2026-10-17.csv`. Each row includes the source blob SHA, current counterparts, identified gap, priority, next action and explicit disposition.

## Concrete next actions

1. Close the P0 API mutation-envelope and permission traceability discrepancies as a single contract, using the 50-key permission register and negative test matrix.
2. Rebuild a state-machine edge matrix for all 11 registered machines, with explicit `CLOSED / OPEN / DERIVED` evidence and no arbitrary promotion.
3. Crosswalk the 14 legacy closure dimensions to the current eight Engineering Conference gates without conflating them.
4. Consolidate the P0 concurrency, idempotency, transactional outbox, finance and security findings into the canonical review queue with owners and acceptance evidence.
5. Resolve C2-001, C2-001-S, and C2-002 through the existing authority/decision route. They are not closed by this archive work.

## Safety boundary

This pass is documentation and historical reconciliation only. It does not change runtime code, schema, migrations, RLS or business behavior; it does not authorize implementation; and it does not claim GATE-00/GATE-01 or C03 are closed. Every unresolved item remains open until a decision and evidence are recorded.
