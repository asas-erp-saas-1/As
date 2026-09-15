# ASAS Session State

**Repository:** `asas-erp-saas-1/As`  
**Active branch:** `feat/foundation-command-registry`  
**Last updated:** 2026-09-15

## Founder mission — primary objective

The primary mission of this workstream is **to prepare and harden every condition required for Claude to autonomously develop the ASAS application code and database safely and professionally**.

This is not an endless documentation phase. Foundation work exists to remove ambiguity and establish executable contracts, reality evidence, safety gates, task packets and autonomy rules so that Claude can enter implementation with maximum useful autonomy and minimum founder interruption.

The target operating loop is:

`Foundation → verified platform reality → implementation-ready contracts → Claude executes code + DB → tests → adversarial verification → evidence → next task`

Claude must be allowed to implement A0/A1 work autonomously once the relevant gate is closed. Founder intervention is reserved for protected A2/A3 decisions.

## Canonical project identity

- Canonical repository: `asas-erp-saas-1/As`.
- `asas-erp-saas-1/Asas-website` is a separate/unrelated project and must never be used as evidence for this repository.
- Supabase project `asas-web-site` (`xwokfufeeodobkuaxvgx`) is also a separate/unrelated project and must never be treated as the database for `As`.
- Actual Supabase project identity for `As` is **NOT VERIFIED**.
- Actual Vercel project identity for `As` is **NOT VERIFIED**.

## Current repository state

- The repository is intentionally bootstrap/documentation-first; application implementation has not yet been authorized in this workstream.
- The architecture, domain/state/event/permission contracts, adversarial catalogs, integration strategy and Claude autonomy contract have been substantially prepared.
- The previous live-database baseline contained an incorrect platform identity assumption. It has now been explicitly corrected in `docs/audit/LIVE-DB-REALITY-BASELINE-2026-09-15.md`.
- No claim about the `As` production database schema may be made until the correct Supabase project is verified.

## Foundation work completed

- Canonical nine-context architecture established.
- Product truth and architecture direction established.
- State-machine normalization and edge-closure work established for B.1–B.11, with source-open items preserved.
- Event taxonomy and traceability work established for the registered event set.
- Permission/authorization traceability established structurally.
- Domain invariant, command, idempotency, concurrency and outbox/inbox contracts established.
- Finance correctness contract established.
- B.4 remains a founder/product decision gate because its exact legal transition graph is not authoritative in the source material.
- B.6 reservation/hold/deposit atomicity has been modeled as a high-risk implementation gate.
- Algeria payment feasibility has been researched; provider commitment remains open.
- External integration ecosystem has been researched and formalized as provider-neutral capability adapters.
- Claude autonomous execution contract, engineering build orders, persona/pillar autonomy model and task-packet approach are in place.

## Critical correction

The prior inspection of Supabase project `asas-web-site` must be treated as **invalid for `As`**. Its tables, row counts, RLS findings, migration history and security-advisor results are not evidence about the canonical ASAS repository.

No production schema conclusion should be based on that project.

## Current highest-priority task

**GATE-00 — PLATFORM IDENTITY + REALITY RECONCILIATION**

Before schema/code implementation:

1. Identify the actual Supabase project for `As`.
2. Identify the actual Vercel project for `As`, if applicable.
3. Prove the linkage between repository, deployment and database without exposing secrets.
4. Inspect the actual database read-only.
5. Reconcile actual schema/migrations against canonical contracts.
6. Establish backup/restore evidence and environment classification.
7. Produce the implementation baseline that Claude can safely use.

After GATE-00, continue the highest-priority implementation-blocking contract closure rather than restarting the architecture.

## Execution readiness rule

The purpose of the remaining foundation work is to reach a state where Claude can receive a bounded task packet and autonomously:

`inspect → research → model → implement code/schema when authorized → test → attack → verify → commit → update evidence → continue`

Do not create speculative application code merely to demonstrate activity. Conversely, do not keep documentation open after an A0/A1 implementation path is sufficiently specified.

## Protected founder decisions

Claude must stop only for decisions involving, among other things:

- business/legal/financial semantics;
- data ownership or tenant model changes;
- new bounded contexts or canonical events;
- new permissions with material business effect;
- employment/HR policy;
- external provider commitments with material lock-in/cost;
- privileged AI mutation authority;
- destructive or irreversible production data changes;
- material security posture changes.

Everything else should be solved autonomously when contracts and evidence are sufficient.

## Explicit current boundary

Until GATE-00 is passed and the relevant implementation gate is explicitly opened:

- documentation, research and contract refinement are allowed;
- application implementation is not authorized;
- database schema/migrations are not authorized;
- production mutation/deployment is not authorized.

Once the founder opens implementation, this boundary changes: Claude is expected to execute the approved code/database roadmap autonomously under the autonomy contract.

## Resume rule

When the founder says `أكمل عملك على المسار`, verify `asas-erp-saas-1/As`, load this state plus the closure/audit/register/autonomy/build-order/persona-pillar/integration contracts, then continue the highest-priority unblocked task. Never switch to `Asas-website` or any similarly named project.
