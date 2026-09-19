# ASAS — Foundation Parallel Workstream Register

**Status:** OPERATIONAL — foundation control document
**Date:** 2026-09-19
**Purpose:** Keep parallel foundation work organized without allowing one stream to silently bypass a blocker in another.

## Operating rule

Parallel work is permitted only when streams have no unsafe dependency on unresolved authority. Database, migration, and application implementation remain frozen until their explicit gates close.

## Workstreams

| ID | Workstream | Current state | Safe parallel action | Hard dependency |
|---|---|---|---|---|
| F1 | Repository organization | IN PROGRESS | Reference/naming/ownership audit | None |
| F2 | Claude handoff | IN PROGRESS | Loading-chain and checkpoint verification | F1 changes must be referenced correctly |
| F3 | Architecture authority | BLOCKED/RESOLVING | Source/provenance/ADR reconciliation | Founder acceptance of ADR-0021 |
| F4 | Context → module ownership | PROPOSED | Build evidence-backed mapping contract | F3 |
| F5 | Task register reconciliation | OPEN | Reconcile counts/provenance without editing to match code | Canonical architecture + controlled sharding authority |
| F6 | Schema contract reconciliation | OPEN | Compare declared contract counts and provenance | Canonical architecture + task traceability |
| F7 | Scalability blueprint | HARDENED | Convert design requirements into future task contracts | Task graph authority |
| F8 | Security/tenancy readiness | OPEN | Audit contracts and evidence only | Architecture + live environment authority for runtime claims |
| F9 | Runtime identity | BLOCKED | Identify Supabase/Vercel environment and evidence requirements | Authorized platform inspection |
| F10 | CI verification | NOT EXECUTED for latest changes | Obtain workflow evidence; do not invent green status | GitHub Actions run |
| F11 | Claude implementation gate | NOT READY | Maintain gate evidence and blockers | F3/F5/F6/F8/F9/F10 |

## Parallelization policy

### Safe now

- Documentation ownership and provenance audits.
- Reference searches.
- Architecture evidence collection.
- Task/schema reconciliation analysis that does not mutate contracts.
- Scalability/security contract review.
- CI inspection and verification planning.

### Not safe now

- Prisma model implementation.
- Database migrations.
- Supabase schema mutation.
- Production deployment.
- Reclassifying canonical architecture solely to satisfy code.
- Creating task IDs solely to make a gate appear complete.

## Evidence states

Use only:

`VERIFIED | PARTIAL | BLOCKED | NOT_EXECUTED`

Do not convert `DOCUMENTED` into `VERIFIED` without executable evidence.

## Next coordinated sequence

1. Founder acceptance / rejection of ADR-0021.
2. If accepted, verify canonical nine-context definitions and context map provenance.
3. Complete Context → Module reconciliation.
4. Reconcile task register using controlled-sharding evidence.
5. Reconcile schema contract counts and ownership.
6. Verify CI on the resulting branch.
7. Reassess GATE-00 and runtime identity.
8. Only then evaluate Claude implementation readiness.
