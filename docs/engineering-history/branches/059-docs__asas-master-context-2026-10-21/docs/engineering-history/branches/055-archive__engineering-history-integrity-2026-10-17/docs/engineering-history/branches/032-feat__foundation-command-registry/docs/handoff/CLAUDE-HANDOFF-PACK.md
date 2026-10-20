# ASAS — Canonical Claude Handoff Pack

**Status:** FOUNDATION CONTROL DOCUMENT  
**Scope:** `asas-erp-saas-1/As` only  
**Rule:** This pack is an execution index, not a substitute for the underlying contracts.

## Mission

Claude is being prepared to build the ASAS Real Estate Operating System, not merely a website. Claude may choose implementation details inside closed contracts; it must not redefine business meaning, ownership, financial truth, security boundaries, or protected founder decisions.

## Authority order

When documents disagree, use this order and STOP on unresolved contradictions:

1. Founder-confirmed decisions recorded in current state.
2. Canonical Blueprint / machine-readable contract package explicitly designated authoritative.
3. Canonical architecture and registers.
4. Implementation task packet.
5. Supporting research/audit documents.
6. Historical drafts/examples — never silently treated as requirements.

No document may silently override a higher authority.

## Required preflight

Before every implementation task Claude must:

- verify repository and current branch;
- load `docs/handoff/ASAS-MASTER-EXECUTION-PATH.md`;
- load `docs/handoff/SESSION_STATE.md`;
- identify the task's gate and dependency status;
- load the exact contract/registers named by the task;
- inspect actual repository code/config before editing;
- verify environment/platform identity if the task touches runtime/database;
- research official current documentation for external technology choices;
- state the evidence basis before implementation.

## Task packet minimum contract

No task is implementation-ready unless it contains:

- Task ID and bounded context;
- objective and explicit non-goals;
- authoritative inputs;
- dependency IDs;
- files/modules expected to change;
- command/permission/state-edge/event mapping where applicable;
- tenant/security boundary;
- validation and invariants;
- transaction boundary;
- idempotency requirement;
- concurrency strategy;
- external side-effect semantics;
- migration impact;
- positive and negative tests;
- observability/evidence requirements;
- rollback or forward-fix plan;
- A0/A1/A2/A3 classification;
- Definition of Done.

## Mandatory implementation sequence

`Inspect → Model → Plan → Implement → Test → Attack → Verify → Record → Commit`

For business mutations:

`Command → Identity → Tenant → Authorization → Idempotency → Validation → Invariant → Transaction → State transition → Audit + Outbox → Response`

## Database rules

- Never use an unverified Supabase project as ASAS reality.
- Never infer the canonical schema from a similarly named project.
- Existing live data is authoritative for existing reality; canonical contracts are authoritative for target behavior.
- Use expand/contract migrations for live evolution.
- No uncontrolled `db push`.
- No destructive reset.
- No deletion of real business records as a logic fix.
- Financial records that are posted are immutable and corrected by compensating entries.
- Every migration requires preflight, execution evidence, invariant checks and recovery consideration.

## Security rules

- Tenant isolation is enforced at the database boundary, not only in UI/server code.
- RLS is never weakened to make a feature work.
- Authorization must be explicit and auditable.
- Secrets never enter source control, logs or client payloads.
- Webhooks require authenticity verification, replay protection and idempotent processing.
- AI tools cannot bypass the same authorization and tenant boundaries as human actors.

## Stop-line rules

Claude must stop and surface evidence when:

- business/legal/financial semantics are undefined;
- canonical documents conflict;
- platform/database identity is unverified;
- a required event/command/permission/context is missing;
- tenant isolation cannot be proven;
- reservation/payment duplication is possible;
- accounting can become unbalanced;
- migration safety cannot be established;
- external-provider authenticity/reconciliation is unclear;
- a decision would be irreversible or materially change ASAS meaning.

## Verification standard

`DONE` requires evidence, not prose claiming success. The task record must identify:

- commands/checks executed;
- test results;
- negative/adversarial results;
- migration/database evidence where applicable;
- security/authorization evidence;
- affected files and commit;
- residual risks or explicit zero-known-risk statement;
- updated session/checkpoint.

## Current gate status

**GATE-00 — BLOCKED:** actual ASAS Vercel/Supabase/database identity has not been independently proven.

Therefore database/application implementation is not yet globally authorized. Foundation documentation and safe closure work may continue.

## Resume protocol

When the founder says **`أكمل عملك على المسار`**:

1. open the Master Execution Path;
2. open Session State;
3. inspect current branch/HEAD;
4. inspect the highest-priority unfinished gate/task;
5. perform the next safe closure action;
6. verify it;
7. update the relevant artifact and Session State;
8. commit atomically;
9. continue until blocked by an A2/A3 decision or external reality.

Do not restart the project and do not ask the founder to restate prior context unless a genuinely new protected decision is required.
