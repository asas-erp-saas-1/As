# ASAS Blueprint Register Ingestion Plan

Status: FOUNDATION WORKSTREAM — CONTROLLED DERIVATION

## Objective

Convert the approved Blueprint's machine-readable contract layer into repository artifacts without copying the source package blindly and without inventing missing detail.

## Authority

The Blueprint is the source of record. Repository registers are derived executable shadows. A register cannot override the Blueprint.

## Workstreams

1. Tasks — preserve permanent task IDs, scope, dependencies, contracts, acceptance evidence, gate requirements, and recurrence metadata.
2. Events — preserve event names, envelope, emission group, versioning and idempotency semantics.
3. Permissions — preserve permission keys, personas, scope and deny-by-default semantics.
4. State machines — preserve exact state vocabulary and legal transitions.
5. Schema — preserve the consolidated target model as a non-executable design contract until reconciliation is complete.
6. Design system — preserve token and component contracts separately from implementation.

## Controlled extraction rule

Do not create a placeholder that looks complete. If source material is unavailable or ambiguous, record `PENDING_EXTRACT`, `UNVERIFIED`, or `CONFLICT` with provenance.

## Validation before canonical promotion

- Source version identified.
- Every permanent ID accounted for.
- No duplicate IDs.
- No unresolved internal references.
- Counts reconcile with the source.
- Cross-register references resolve.
- State/event/permission names match exactly where the Blueprint requires exact vocabulary.
- Schema models/enums/indexes reconcile with Chapter 39 and Appendix W.
- Provenance and extraction date recorded.
- Foundation gate register updated with evidence.

## Current checkpoint

Events, permissions, state machines and design-system shadows are already present on the canonical path. The task and consolidated schema bodies remain intentionally gated because the complete source bodies have not been independently extracted into this repository in a way that permits lossless validation.

## Non-goals

This workstream does not create application code, migrations, live tables, production configuration, or deployment changes.
