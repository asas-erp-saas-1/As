# ASAS Foundation Consistency Audit

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.
**Date:** 2026-09-14
**Scope:** Blueprint v1.6.1, machine-readable registers, ADRs, current repository contracts, UX/Figma contracts.

## 1. Purpose

This audit checks whether the current foundation can be handed to an implementation operator without silently resolving contradictions during coding.

The audit is intentionally conservative: a contradiction is recorded rather than "fixed" by inference. The founder remains the decision owner for product scope, domain boundaries, new events, and other Tier-C changes.

## 2. Executive verdict

**FOUNDATION: SUBSTANTIALLY SPECIFIED, BUT NOT YET CONTRACT-CONSISTENT.**

The remaining work is no longer broad architecture design. It is contract normalization and traceability.

No application code, schema, migration, deployment, or production mutation is required to resolve the findings below.

## 3. Findings

### F-01 — Bounded-context count and boundary model conflict

**Severity:** BLOCKER before domain implementation.

The v1.6.1 ADR-0002 defines nine bounded contexts: Identity/Core, CRM, Sales, Finance, Inventory, Studio, Marketing, Scheduling, Analytics, plus the public-site face. The package's event register separately states that its 11 event-routing groups are not the nine bounded contexts and that Studio/Marketing are merged while Approvals/Workflow/Notifications are platform engines.

The current repository Domain Contracts Map instead presents eight contexts and combines Reservations & Contracts and Integrations & Scheduling, while not explicitly modeling Analytics or the public-site face as bounded contexts.

**Required action:** do not silently choose one model. Produce a founder-approved canonical context map and explicitly classify each item as bounded context, submodule, platform engine, projection, or product surface.

**Recommended direction:** retain the modular-monolith architecture but normalize the vocabulary around the Blueprint's nine-context decision, while explicitly documenting that some contexts are hosted as submodules/engines rather than services.

### F-02 — State-machine structure is incomplete

The register contains 11 machines, but only B.1 has a fully structured transition table. B.2–B.11 contain prose/linear transition descriptions in the machine-readable register.

The current Domain Contracts Map already acknowledges this and requires canonicalization before implementation where the register requires structured transitions.

**Required action:** before implementing lifecycle services, convert every governed machine to an exhaustive structured transition representation containing: machine ID, state set, legal edge, trigger/command, actor class, authorization requirement, reason requirement, side effects, emitted event, terminal/reversible semantics, and idempotency behavior.

### F-03 — Event vocabulary is not normalized

The machine-readable event register uses dotted identifiers such as `apartment.published`, `reservation.created`, `receipt.allocated`, and `page.published`. The repository Domain Contracts Map uses PascalCase names such as `ApartmentCreated`, `ReservationConfirmed`, `ReceiptRecorded`, and `PagePublished`.

There is currently no explicit canonical mapping document defining whether these are aliases, different event layers, or distinct events.

**Required action:** establish one canonical event identity grammar and a mapping table where legacy/register names differ from domain-facing names. Every emitted event must resolve to exactly one registered event identity and version.

### F-04 — Permission-to-command coverage is implicit

The permission register contains 50 permissions, but the Domain Contracts Map lists commands such as construction-status transition, hold release/expiry, reservation approval/confirmation/expiry, contract activation, payment-schedule generation, receipt allocation, ledger posting, calendar synchronization and provider delivery recovery without a formal command → permission → scope mapping.

Broad permissions may legitimately authorize several commands, but that must be explicit rather than inferred by the implementation operator.

**Required action:** create an authorization traceability matrix for every mutating command with resource.action permission, minimum scope, ABAC predicates, deny behavior, audit requirement, and applicable personas.

### F-05 — Event register versus domain contract coverage is incomplete

The event register contains 103 events across 11 routing groups. The current domain contract lists only a selected subset of events per context. The relationship between the complete event register and the smaller domain-contract list is not explicitly stated.

**Required action:** classify all registered events as one of: canonical domain event, integration event, platform event, notification event, projection/telemetry event, or deprecated/legacy. Only canonical domain events may be treated as lifecycle facts by domain code.

### F-06 — UX command traceability needs to become machine-checkable

The UX contract correctly defines the workflow chain `Persona → Job → Entry → Screens → States → Permission → Command → Domain event → Feedback → Next best action → Exit`, and the Golden Journeys use this model. However, there is not yet a durable matrix connecting each critical journey action to the exact command, permission, state machine and event identity.

**Required action:** create a journey/action traceability matrix for J1–J12. This is especially mandatory for J5 reservation race, J6 finance, J7 publishing, and J10 permissions administration.

### F-07 — Figma contract is strong, but design-to-domain linkage must be explicit

The Figma contract correctly prevents Figma from redefining domain behavior and requires mapping variables/components/states to implementation. The remaining gap is an explicit screen-action contract showing which UI action invokes which governed command and which server-authoritative result/state is rendered.

**Required action:** each critical Figma flow must carry stable screen/action identifiers that resolve to a UX journey action and domain command. This prevents a visually correct screen from implementing an incorrect business mutation.

### F-08 — Package verification claim is not backed by the delivered verifier artifact

The delivered package contains 69 checksum entries, 119 tasks, 103 events, 50 permission rows, 11 state machines, 42 component-inventory rows, 59 Prisma models and 17 enums. A search of the delivered package found no verification script matching the package's claimed verifier artifact.

**Required action:** treat the measured counts as observed facts and the claimed verifier script as **MISSING / NOT VERIFIED** until the artifact is supplied or the package documentation is corrected.

### F-09 — Repository identity must remain authoritative

The package contains its own repository-oriented guidance, while the founder has explicitly established `asas-erp-saas-1/As` as the canonical repository. The repository contract correctly states that historical `Asas-website` material is excluded.

**Required action:** implementation must use the repository identity recorded in `SESSION_STATE.md`, never infer identity from package naming or similarly named historical repositories.

## 4. Required normalization order

1. Canonical bounded-context map.
2. Canonical state-machine transition registry.
3. Canonical event identity + version map.
4. Command → permission → scope/ABAC matrix.
5. Domain command → event → state-machine traceability.
6. Golden Journey action → command → permission → event → UI-state traceability.
7. Figma screen/action IDs → UX actions → governed commands.
8. Package verification claims reconciled with measured artifacts.

This order matters because UX and implementation should not be used to discover domain truth after coding has started.

## 5. Stop conditions

Do not begin feature implementation if any of the following remains unresolved:

- two competing bounded-context definitions;
- an implementation-critical state machine lacks exhaustive transitions;
- a mutating command has no explicit authorization mapping;
- an emitted event is not registered/versioned;
- a critical UX action cannot be traced to a governed command;
- a Figma interaction contradicts the domain contract;
- package verification claims are presented as evidence without the underlying artifact.

## 6. Evidence required from Claude later

For each normalized contract, Claude must provide exact file paths and tests proving:

- state transition coverage;
- authorization matrix coverage;
- event registration/version coverage;
- tenant isolation;
- audit/outbox atomicity;
- UX command mapping;
- Figma/design-token mapping for UI tasks;
- accessibility/RTL/responsive evidence;
- migration/drift evidence where database behavior is involved.

## 7. Current decision posture

The findings above are **architecture-contract findings**, not implementation tasks. Claude must stop at a Tier-C decision whenever resolving them would change product scope, bounded-context ownership, money/legal semantics, security posture, or canonical domain events.

The founder can therefore approve the normalization direction without authorizing application implementation.
