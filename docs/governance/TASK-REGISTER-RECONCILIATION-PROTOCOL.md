# Task Register Reconciliation Protocol

- **Status:** CANONICAL OPERATIONAL PROTOCOL — foundation workstream
- **Date:** 2026-09-19
- **Scope:** Reconcile the source task register against repository task shards without changing task meaning by inference.
- **Repository:** `asas-erp-saas-1/As`

## Purpose

The current source observation records 119 task entries across phases P–11 plus 3 recurring rituals, while older repository contracts state 114 tasks. This protocol defines how the discrepancy is resolved without editing a register to make counts agree with implementation.

## Authority order

1. Source Blueprint/package task register and its provenance evidence.
2. Approved task/phase contracts and ADRs.
3. Repository task shards explicitly derived from the source.
4. Historical summaries and earlier counts.
5. Implementation code — evidence of implementation, never authority for task existence or meaning.

## Required reconciliation record

For every task entry, capture:

- Task ID
- source phase
- source location
- repository location, if present
- source text hash/provenance where available
- repository status: PRESENT / MISSING / DUPLICATE / DIVERGENT / HISTORICAL
- canonicality status
- dependencies
- files allowed / forbidden
- definition of done
- verification/evidence contract
- conflict notes

## Count reconciliation

Do not change `114` to `119` merely to make a document green.

First establish:

1. exact source entry count;
2. exact unique Task IDs;
3. duplicate IDs or duplicate semantic entries;
4. recurring rituals and whether they are included in the declared total;
5. phase P–11 cardinality by source;
6. repository shard cardinality by phase;
7. missing and extra repository entries;
8. whether any five-entry delta is legitimate source evolution, duplicated material, or an observation error.

Only after this evidence exists may the canonical declared total be updated.

## No implementation consequence yet

This reconciliation is a control-plane activity. It does not authorize application code, Prisma schema changes, migrations, Supabase mutations, or deployment.

## Closure criteria

The discrepancy can be CLOSED only when:

- every source task ID has a disposition;
- every repository task entry has provenance;
- recurring rituals are explicitly separated from delivery-task totals;
- duplicate/missing/divergent entries are resolved or explicitly accepted as historical;
- the canonical task index and dependent loading documents agree;
- Foundation Verify passes with the new state;
- the checkpoint records the evidence.

## Next action

Build the machine-readable reconciliation manifest from the source register and repository shards, then compare IDs and phase counts before changing any canonical register or handoff count.

## Stop conditions

STOP and escalate if:

- two source artifacts of equal authority disagree materially;
- a task ID would need to be invented or renamed;
- a historical task would need deletion without provenance;
- reconciliation would require changing product scope;
- implementation code is being used to justify a task contract.
