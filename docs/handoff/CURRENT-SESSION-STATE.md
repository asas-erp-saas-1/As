# ASAS Current Session State

Status: CANONICAL FOUNDATION / ARCHITECTURE ENGINEERING CHECKPOINT
Version: 1.8
Date: 2026-09-20

## Repository
- Canonical repository: `asas-erp-saas-1/As`
- Canonical integration branch: `main`
- Architecture engineering branch: `platform-architecture-2026`
- Parent foundation branch: `foundation/forensic-repository-reconstruction-2026-09-20`
- Current architecture branch: `platform-architecture-2026`
- Architecture changes must merge through reviewed PRs; this branch is the current architecture engineering vehicle.

## Phase
ARCHITECTURE ENGINEERING — H1.3 AGGREGATE / INVARIANT CLOSURE

## Canonical architecture control plane
The 2026 architecture program uses controlled navigation resources:

1. `docs/architecture/ASAS-ENGINEERING-SOURCE-OF-TRUTH-2026.md` — consolidated engineering truth, provenance and routing.
2. `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` — WHAT the target architecture is.
3. `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026-AMENDMENT-001.md` — current proposed authority reconciliation amendment to the Blueprint.
4. `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md` — HOW the architecture is engineered and verified.
5. `docs/architecture/ASAS-ARCHITECTURE-CONTEXT-PROMPT-2026.md` — HOW an AI engineering agent must operate.

Derived evidence/contract companions:
- `docs/architecture/ASAS-CONTEXT-DOMAIN-MODULE-EVIDENCE-MATRIX-2026.md` — context/domain/module evidence mapping; not an independent authority.
- `docs/architecture/ASAS-AGGREGATE-INVARIANT-BOUNDARY-REGISTER-2026.md` — aggregate/invariant/transaction evidence contract; not a schema or implementation authorization.

Supporting registers remain canonical for their own concepts. No competing architecture blueprint should be created without explicit supersession.

## Completed foundation layers
- Repository identity and boundary
- Claude context/operating model
- Branch and PR governance
- Foundation verification contract
- Task graph and task packet model
- Contract reconciliation protocol
- Core lifecycle and capability coverage
- Master execution path
- Foundation gate register and closure protocol
- Canonical artifact register
- Blueprint-derived domain event register
- Blueprint-derived permission register
- Blueprint-derived state-machine register
- Blueprint-derived design token shadow
- Blueprint-derived component contract inventory
- Blueprint source observation manifest
- Phase P task shard with all 9 source tasks
- Declared-vs-observed reconciliation checkpoint
- Forensic repository reality map
- Forensic repository reconstruction audit
- Founder decision register
- Corrected source/register promotion state
- Structural task-register parse and count correction
- Source register structural reconciliation evidence
- 2026 platform architecture blueprint v1.3
- Blueprint authority reconciliation amendment 001
- 2026 architecture engineering roadmap v1.4
- 2026 architecture context prompt v1.4.1
- 2026 context/domain/module evidence matrix v1.0
- consolidated engineering source of truth v1.2
- aggregate/invariant boundary register v1.0

## Source discipline
The v1.6.1 Blueprint/package remains the foundation source baseline for source facts. Repository artifacts are derived shadows unless explicitly promoted by an approved architecture/ADR decision. Existing runtime/database facts require runtime evidence. Architecture defines desired future behavior. External research validates engineering techniques but does not override repository or founder authority.

## Verified source observations
- 119 unique phase task IDs.
- 3 recurring ritual IDs.
- 122 `T-*` identifiers including recurring rituals.
- 59 models, 17 enums, 56 indexes, 22 unique constraints, 19 relation annotations in the source schema contract.
- 103 domain event names across 11 emission modules.
- 50 permission keys across eight persona columns.
- 11 state machines.
- 42 design primitives.

These values are source observations, not architectural quotas.

## Current architecture position
### C2-001 — reclassified
The current evidence supports the nine-context target domain grouping:
`Core / CRM / Sales / Inventory / Finance / Studio / Marketing / Analytics / Documents`.

The historical 15-module artifact is a proposed implementation decomposition whose ADR explicitly awaited founder acceptance. It is not currently an equal-authority competing bounded-context model.

Therefore:
`C2-001 = OPEN ARCHITECTURAL REFINEMENT`

The engineering question is to derive implementation modules from ownership, aggregate boundaries, invariants, consistency, authorization, data ownership, change cadence, failure isolation, scaling behavior and integration cost. The founder is not required to choose an arbitrary number merely to unblock engineering.

### C2-002 — Scheduling
Historical `ADR-0018` accepted Scheduling as a Core/CRM-hosted capability. The 2026 architecture reopened the question.

Therefore:
`C2-002 = OPEN / PROPOSED SUPERSESSION`

The historical ADR remains evidence. No implementation ownership change is authorized until the decision is explicitly reaffirmed or superseded through the proper ADR path.

## H1.3 aggregate/invariant work
The new derived contract is:
`docs/architecture/ASAS-AGGREGATE-INVARIANT-BOUNDARY-REGISTER-2026.md`

Current source-supported aggregate candidates include Lead, Client, Project, Unit, Listing, Visit, Reservation, Contract, PaymentSchedule/Installment, CommissionRule, CommissionRecord, Agency, Branch, User and NotificationPreference.

Source material describes CommunicationLog, Attachment, Activity/Timeline/Audit, Search and Reporting differently; they are not promoted to aggregates merely because they are named concepts.

Critical open boundaries:
1. Unit ↔ Reservation atomic consistency.
2. Offer ownership/invariants.
3. Payment vs PaymentSchedule vs Receipt semantics.
4. Building ownership/invariants.
5. Scheduling ownership.

## Current blockers
- Canonical ASAS live database/project identity is not verified.
- Executable schema promotion is not complete.
- Full task packets are not yet derived from source task records.
- Application implementation authorization is not granted.
- Security/RLS runtime enforcement is not evidenced.
- Production implementation authorization is not granted.

## Gate status
G0 GREEN — repository identity/checkpoint evidence
G1 AMBER — authority reconciliation ongoing
G2 AMBER — domain grouping supported; module decomposition remains open; Scheduling reopening remains open
G3 AMBER — aggregate/invariant contract active; critical ownership boundaries unresolved
G4 AMBER — invariant doctrine exists; executable enforcement absent
G5 AMBER — state-machine register exists; runtime enforcement absent
G6 BLOCKED — event implementation absent
G7 BLOCKED — executable authorization absent
G8 BLOCKED — live tenancy/RLS absent
G9 AMBER — security doctrine exists; executable evidence absent
G10 BLOCKED — live DB identity and executable schema absent
G11 PARTIAL — foundation CI exists; current architecture commits require fresh status evidence
G12 BLOCKED — application observability/recovery evidence absent
G13 BLOCKED — live backup/restore evidence absent
G14 AMBER — AI safety doctrine exists; executable tooling absent
G15 BLOCKED — implementation authorization absent

## H1 evidence work
Completed:
- context/domain/module evidence matrix;
- aggregate/invariant boundary register;
- Blueprint authority reconciliation amendment;
- SOT reconciliation;
- roadmap/prompt synchronization.

These artifacts do not authorize implementation.

## Research evidence incorporated
Current external research has been used to refine the architecture baseline for DDD/domain-first boundaries, modular-monolith evolution, PostgreSQL transaction isolation and locking, Supabase local migration workflows, GitHub status-check evidence, and OWASP AI excessive-agency controls.

External sources validate engineering patterns; they do not close ASAS gates by themselves.

## Hard stop
No application feature implementation, production schema mutation, migration deployment, destructive operation, production configuration change, or autonomous financial/AI mutation is authorized until the relevant architecture gates are closed.

## Next execution sequence
1. Close the Unit ↔ Reservation atomic consistency boundary.
2. Define Offer ownership and invariants without inventing persistence structures.
3. Reconcile Payment vs PaymentSchedule vs Receipt semantics.
4. Define Building ownership and invariants.
5. Map critical invariants to state machines, permissions and events.
6. Resolve or explicitly reaffirm Scheduling through ADR.
7. Derive command/query contracts.
8. Promote the executable schema contract only after ownership/security gates permit it.
9. Establish reproducible local database and application foundation.
10. Run architecture CI and capture evidence.
11. Verify canonical runtime identity before remote introspection.
12. Authorize the first bounded vertical implementation slice only after dependencies and gates are GREEN.

## Continuation rule
On continuation, load this checkpoint plus the Source of Truth, Blueprint, Blueprint Amendment 001, Roadmap, Context Prompt, Evidence Matrix, Aggregate/Invariant Register, then the open-conflict/founder-decision documents and relevant registers. Resume from the first unresolved dependency. Do not restart from conversation history and do not treat historical artifacts as current authority.
