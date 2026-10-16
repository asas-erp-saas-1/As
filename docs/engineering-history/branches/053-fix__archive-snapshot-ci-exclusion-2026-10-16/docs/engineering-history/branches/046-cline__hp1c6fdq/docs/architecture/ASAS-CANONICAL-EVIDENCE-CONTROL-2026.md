# ASAS — Canonical Evidence Control 2026

**Status:** PROPOSED / CONTROL-PLANE ARTIFACT
**Authority:** Governance/control artifact; does not override Founder decisions, approved architecture, live runtime/database reality, or canonical registers.
**Purpose:** Provide one auditable routing point for architectural evidence, provenance, conflicts, and implementation authorization.
**Canonical branch:** `platform-architecture-2026`
**Created:** 2026-09-20

## 1. Non-negotiable rule

ASAS does not treat a document, branch, generated register, implementation, or external source as authoritative merely because it exists or is newer.

Every load-bearing claim follows:

`source → provenance → authority class → reconciliation → decision → verification evidence`

Unverified claims remain **UNVERIFIED**. Conflicting sources remain **CONFLICT** until the appropriate authority resolves them. Unsafe implementation remains **BLOCKED**.

## 2. Authority routing

### Existing brownfield reality

`LIVE RUNTIME / LIVE DATABASE > REPOSITORY IMPLEMENTATION > APPROVED CONTRACT / REGISTER > APPROVED ARCHITECTURE > HISTORICAL ARTIFACT > INFERENCE`

### Desired future behavior

`FOUNDER-APPROVED PRODUCT DECISION > APPROVED ARCHITECTURE BASELINE > APPROVED ADR > CANONICAL CONTRACT / REGISTER > IMPLEMENTATION`

A conflict is never silently averaged or repaired by changing one source to match another.

## 3. Source classes

| Class | Meaning | Can define desired behavior? | Can prove existing reality? |
|---|---|---:|---:|
| Founder/Product decision | Explicit product/business authority | YES | NO |
| Approved architecture | Desired system architecture | YES | NO |
| Approved ADR | Explicit architectural decision | YES | NO |
| Canonical contract/register | Executable architectural specification | YES within scope | PARTIAL |
| Repository implementation | Code/configuration actually committed | NO unless explicitly promoted | YES for committed state |
| Live runtime/database | Running system reality | NO | YES |
| Evidence | Test/query/inspection result | NO | YES for the claim tested |
| Historical artifact | Prior state or rationale | NO | Historical only |
| External research | Technical/regulatory evidence | NO | Only for the external fact studied |
| Inference | Analyst conclusion | NO | NO — requires verification |

## 4. Canonical architectural baseline

The current V3 document is an **architecture candidate under forensic reconciliation**, not automatic implementation authority. Its strong retained principles include:

- modular monolith first;
- nine canonical bounded contexts;
- platform capabilities separated from bounded contexts;
- transactional outbox and idempotent consumers;
- server-side authorization and tenant isolation;
- state-machine-controlled lifecycle mutation;
- integer money representation and immutable posted ledger semantics;
- evidence before closure;
- brownfield database reality takes precedence for existing schema.

These are retained only where corroborated by the repository's governance/register evidence.

## 5. Current known architecture findings

| Finding | Status | Rule |
|---|---|---|
| Nine bounded contexts | SUPPORTED | Do not create contexts merely to match module counts. |
| Fifteen modules | NOT EQUIVALENT TO CONTEXTS | Treat as implementation/capability representation until provenance proves otherwise. |
| Scheduling ownership | OPEN / POTENTIAL CONFLICT | Do not silently move ownership. |
| Building aggregate boundary | UNVERIFIED | Building is a domain concept; aggregate status is not inferred. |
| Offer state machine | OPEN / MISSING FROM CURRENT STATE REGISTER | Events do not automatically define a state machine. |
| Live DB identity | BLOCKED until direct runtime evidence | Documentation cannot substitute for introspection. |
| Canonical readiness artifact | OPEN | Consolidate only after provenance review. |
| Task/schema sharding discrepancies | OPEN | Pending controlled sharding must not be treated as canonical implementation authority. |

## 6. Register integrity baseline

The external audit independently verified the following repository artifacts at the time of that audit:

- `registers/events.json`: 103 events / 11 groups;
- `registers/permissions.csv`: 50 permission keys × 8 personas;
- `registers/state-machines.json`: 11 state machines;
- `design/component-inventory.md`: 42 primitives.

The same audit identified task and schema discrepancies in artifacts explicitly marked as pending controlled sharding. Those discrepancies must be reconciled before those artifacts are promoted to canonical implementation authority.

## 7. Context loading

Every implementation session must establish:

`repository identity → branch → commit → AGENTS.md → current checkpoint → governance → architecture → relevant contracts/registers → live schema when applicable → task → implementation → verification`

Deprecated session-state references must not be used as active loading instructions.

## 8. Research protocol

For load-bearing external facts:

`question → primary source → current version/date → corroboration → applicability → decision/ADR → review date`

Priority:

1. official documentation / standards / regulators;
2. vendor engineering documentation;
3. authoritative research;
4. reputable secondary analysis;
5. community sources as hypothesis only.

External research is evidence, not permission to alter ASAS product semantics.

## 9. Branch provenance protocol

A branch is not an authority class.

For every historical branch considered:

`branch → head commit → relevant paths → diff from canonical branch → unique evidence → classification`

Classification must be one of:

`CURRENT | HISTORICAL EVIDENCE | DUPLICATE | CONFLICT | ORPHAN | UNVERIFIED`

Branches must not be deleted merely because they are old. Deletion requires provenance review and explicit repository-maintenance authorization.

## 10. Implementation authorization gate

No schema or application implementation is authorized solely because a contract document exists.

Minimum path:

`architecture closure → contract closure → invariant/state/event/permission reconciliation → schema authority → implementation task authorization → code → tests → evidence`

Production changes require the separate runtime, backup/restore, migration, security, and deployment gates.

## 11. Founder boundary

Escalate rather than guess on:

- unresolved product scope;
- unresolved bounded-context ownership;
- legal interpretation;
- destructive database strategy;
- financial correction semantics;
- autonomous AI authority;
- tenant deletion;
- credential/domain/DNS changes carrying material outage or ownership risk;
- commercial commitments.

## 12. Closure definition

A finding is **CLOSED** only when:

`root cause identified + corrective action + references updated + verification passed + evidence captured + no conflicting canonical artifact remains`

Allowed states:

`VERIFIED | PARTIAL | BLOCKED | NOT_EXECUTED | OPEN | CONFLICT | UNVERIFIED`

Never substitute `ready`, `done`, `final`, or `probably` for evidence.

## 13. Current execution focus

1. Reconstruct the canonical artifact map.
2. Reconcile branch provenance without deleting evidence.
3. Resolve context-loading drift.
4. Reconcile Building ownership/boundary.
5. Reconcile Offer state/command/permission/event semantics.
6. Reconcile Finance payment/receipt/ledger semantics.
7. Resolve Scheduling ownership through evidence and ADR/founder decision where required.
8. Close architecture gates before schema programming.

## 14. Evidence ledger

This artifact is a routing/control document. Detailed evidence belongs in the relevant audit, contract, ADR, register, test output, or runtime inspection record. Do not duplicate those artifacts here.

**Last review:** 2026-09-20
**Next review trigger:** any change to canonical architecture, authority hierarchy, register promotion, branch governance, or implementation authorization.
