# ASAS Foundation Execution Roadmap

Status: CANONICAL OPERATIONAL ROADMAP
Repository: `asas-erp-saas-1/As`
Phase: FOUNDATION HARDENING / PRE-IMPLEMENTATION
Owner: Founder + implementation agent under repository contracts
Last reviewed: 2026-09-19

## 1. Purpose

This document converts the current ASAS foundation state into one controlled execution path from repository hardening to Claude Code implementation authorization.

It is an operational roadmap, not a replacement for the Blueprint, product decisions, architecture contracts, task packets, or live platform evidence.

The governing rule is:

`Evidence → Authority → Contract → Verification → Implementation → Proof → Closure`

No implementation step may bypass an unresolved higher-authority conflict.

## 2. Current baseline

The repository is in `FOUNDATION HARDENING — BLUEPRINT DERIVATION / PRE-IMPLEMENTATION`.

Verified foundation layers include repository identity/boundary, Claude handoff/operating model, branch/PR governance, foundation verification, task graph/task packets, contract reconciliation protocol, gate/closure model, canonical artifact/register layer, Blueprint-derived registers, source observation manifest, repository inventory/ownership map, and the Claude context pack.

Foundation Verify is currently recorded as passed on the foundation branch. This does not mean the foundation is closed or that the branch is merged to `main`.

The current checkpoint records these unresolved items:

- `C2-001` — bounded-context/module decomposition conflict.
- `C2-002` — live database/runtime reality not yet accepted as verified.
- task-register discrepancy — declared 114 vs observed 119.
- schema-contract discrepancy — declared 59/16/15 vs observed 59/17/56.
- security/tenancy readiness remains dependent on canonical domain decomposition.

## 3. Authority model

When sources conflict, use:

1. approved source / Blueprint authority;
2. current governance and operating contracts;
3. canonical registers and current checkpoint;
4. reconciled architecture contracts;
5. approved product requirements;
6. repository implementation;
7. historical/reference artifacts;
8. inference only as explicitly labeled inference.

Live database/runtime evidence is authoritative for current reality, not for desired future architecture.

A derived register never outranks its source.

## 4. Execution gates

### F0 — Repository and control-plane integrity

Status: VERIFIED with continuing drift surveillance.

Exit evidence:
- canonical repository identity confirmed;
- current checkpoint exists and is unique;
- active Claude loading chain is coherent;
- naming/ownership/reference controls are executable;
- Foundation CI passes.

### F1 — Canonical artifact and reference integrity

Status: VERIFIED on current foundation work, subject to continued CI enforcement.

Required controls:
- no active reference to deprecated `SESSION_STATE.md`;
- canonical artifact register agrees with actual derived artifacts;
- historical compatibility artifacts remain identifiable and non-authoritative;
- readiness documents have one explicit owner or documented relationship.

### F2 — Architecture reconciliation / C2-001

Status: BLOCKED.

Required output:
- one approved Context Map;
- bounded-context IDs and responsibilities;
- module mapping explicitly separated from context boundaries;
- aggregate ownership;
- schema ownership;
- command/event ownership;
- dependency direction;
- permission/tenant authority;
- worker/read-model ownership;
- provenance and ADR for every split, merge, rename, or exception.

Hard rule: never infer context cardinality from module/schema cardinality.

### F3 — Product scope reconciliation

Status: OPEN.

Required output:
- explicit MVP scope;
- V1/V2/V3/V4 boundaries;
- Enterprise/Future boundary;
- excluded capabilities recorded;
- every MVP capability mapped to an approved task and contract.

AI, construction automation, multi-company, multi-country, advanced accounting, and other enterprise capabilities remain future unless an authoritative source explicitly promotes them.

### F4 — Task graph and contract reconciliation

Status: OPEN.

Required work:
- reconcile declared vs observed task counts;
- preserve task IDs/provenance;
- complete phase 0–11 task coverage and recurring rituals;
- ensure each implementation task has scope, owner, files allowed/forbidden, dependencies, DoD, acceptance evidence, stop conditions, and closure evidence;
- resolve duplicate or stale task references.

No count is normalized merely to make documents agree.

### F5 — Non-executable schema contract

Status: OPEN / BLOCKED on F2 where ownership is affected.

Required output:
- canonical model inventory;
- enum inventory;
- relations;
- constraints;
- indexes;
- ownership;
- tenant boundary;
- lifecycle/state ownership;
- source provenance;
- explicit difference between target contract and live database reality.

The schema contract is design evidence only. It is not a migration and not proof of live database state.

### F6 — Security and tenancy readiness

Status: OPEN / dependent on F2.

Required output:
- identity authority;
- authorization model;
- permission matrix mapping;
- tenant isolation model;
- RLS ownership;
- audit requirements;
- secret handling;
- input validation;
- privileged-operation boundaries;
- financial mutation controls.

Application filtering alone is not accepted as tenant isolation.

### F7 — Platform identity / runtime reality (GATE-00)

Status: BLOCKED until intentionally captured evidence is available.

Required evidence before any schema-affecting operation:
- canonical repository identity;
- verified Supabase project identity;
- verified environment mapping;
- verified Vercel project/environment identity where applicable;
- explicit separation of development/preview/production;
- backup/recovery evidence before production mutation;
- technical pre-flight guard against wrong-project targeting.

A documented warning is insufficient after the previous project-identity near-miss.

### F8 — Database safety readiness

Status: BLOCKED on F7 and relevant architecture/schema gates.

Required sequence:

`introspection → backup/restore evidence → drift inventory → target comparison → ADR/decision → migration plan → rehearsed verification → authorized implementation`

Destructive migration, reset, drop, rewrite, or production data editing is prohibited without explicit authorization and the required evidence.

### F9 — Claude implementation readiness

Status: NOT READY.

Entry criteria:
- F0–F8 applicable gates GREEN or explicit documented exception;
- architecture conflicts affecting the slice resolved;
- product scope explicit;
- task packet complete;
- contracts authoritative;
- runtime identity verified for the slice;
- migration/security/tenant impact understood;
- verification plan executable;
- allowed/forbidden blast radius defined.

Claude receives bounded implementation slices, not an unrestricted mandate to "build ASAS".

## 5. Implementation sequence after foundation closure

Once F9 is satisfied, implementation proceeds in bounded slices:

1. Platform Kernel — identity, tenancy, organizations, authorization, audit, files, notifications, configuration.
2. Real Estate Core — developers/promoters, projects, buildings, units, inventory, pricing, availability.
3. CRM & Sales — leads, contacts, opportunities, activities, visits, options, reservations, contracts.
4. Finance — receivables, payments, allocations, accounting controls, financial auditability.
5. Operations — construction/progress, delivery, handover, SAV where approved in scope.
6. Digital Experience — website/CMS/property pages/forms/CTA/WhatsApp/SEO/analytics.
7. Integrations — only justified external providers.
8. Analytics — operational/commercial/financial/executive reporting.

Each slice uses:

`Inspect → Plan → Verify → Implement → Prove → Converge → Report`

## 6. Claude task packet minimum

Every authorized slice must state:

- task ID;
- bounded context + owner;
- objective and non-goals;
- authoritative sources;
- files allowed;
- files forbidden;
- dependencies;
- actors and permissions;
- tenant/data boundary;
- state transitions;
- commands/events;
- invariants;
- transaction boundary;
- concurrency/idempotency requirements;
- audit requirements;
- external side effects and failure handling;
- migration impact;
- UX/accessibility/localization impact;
- acceptance tests;
- evidence artifacts;
- rollback/recovery where relevant.

## 7. Required repository deliverables before Claude authorization

The following must exist, be current, and have one clear owner:

- current session checkpoint;
- master execution path;
- canonical artifact register;
- architecture/context reconciliation ADR;
- canonical Context → Module map;
- product-scope matrix;
- reconciled task catalog;
- non-executable schema contract;
- permission/state/event contracts;
- security/tenancy contract;
- platform identity/GATE-00 evidence;
- database drift baseline;
- Foundation/implementation gate matrix;
- Claude implementation-readiness decision.

## 8. Explicit non-goals during foundation

Do not:

- build application features to fill gaps;
- write Prisma models solely to make the schema look complete;
- reset/recreate Supabase;
- perform destructive migrations;
- deploy production;
- introduce microservices/Kafka/Kubernetes without an approved architectural requirement;
- turn read models/workers into bounded contexts without ownership evidence;
- convert historical documents into canonical authority;
- close gates based on documentation alone.

## 9. Closure protocol

A gate is closed only with:

`Definition → Artifact → Verification → Evidence → Reference/Register update → No unresolved contradiction → Closure record`

Allowed states:

`VERIFIED | PARTIAL | BLOCKED | NOT_EXECUTED`

Never use informal states such as `probably done`, `looks good`, or `almost ready`.

## 10. Next actions

Execute in this order:

1. Build the C2-001 evidence/reconciliation package from authoritative sources.
2. Record the required Founder/Product Architecture decision as an ADR; do not invent the decision.
3. Produce the canonical Context → Module ownership map from that decision.
4. Reconcile task IDs/counts and complete the task packet layer.
5. Reconcile the non-executable schema contract against the authoritative Blueprint/source observations.
6. Close security/tenancy dependencies against the canonical decomposition.
7. Finish platform identity/GATE-00 with technical evidence and pre-flight protection.
8. Establish database drift/backup/restore evidence without destructive mutation.
9. Run the complete Claude implementation-readiness gate.
10. Authorize only the first bounded implementation slice.

## 11. Decision boundary

The implementation agent has authority to execute verified technical work inside an approved task boundary.

The founder/authorized product architect retains decisions over:

- product scope;
- canonical business semantics;
- bounded-context decomposition when unresolved;
- tenant/business ownership decisions;
- legal/residency choices;
- spending/plan changes;
- irreversible production/data operations.

When such a decision is missing, the agent records the blocker and prepares evidence/options; it does not silently choose.

## 12. Definition of success

The foundation is ready for Claude Code when Claude can enter the repository and answer, from repository evidence alone:

- Where am I?
- What is canonical?
- What is current?
- What is historical?
- What is the approved product scope?
- Who owns each business concept?
- What may I modify?
- What may I not modify?
- What contracts govern this task?
- What proves completion?
- What must make me stop?
- Which runtime/database environment am I authorized to touch?

Until those answers are mechanically and evidentially reliable, implementation authorization remains closed.
