# ASAS Real Estate OS — API Contract Map

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.

## 1. API surface hierarchy

ASAS has three application-facing patterns:

- **Server Actions:** internal authenticated UI mutations/queries when a browser-to-application boundary is sufficient.
- **`/api/v1`:** explicit authenticated API contracts for application/integration consumers.
- **`/api/public/v1`:** intentionally public endpoints for website conversion and public experiences.

Do not create ad-hoc route families.

## 2. Universal request contract

Every mutation resolves, in this order:

`request identity → tenant/workspace → permission → scope/ABAC → idempotency → input validation → domain command → transaction → audit/outbox → response`

The UI cannot be the security boundary.

## 3. Authorization contract

A protected endpoint must declare its permission resource/action and required scope. Authorization is evaluated centrally. Missing mapping means deny; an unmapped protected route is a CI failure.

Never authorize from editable client metadata such as role labels, hidden fields or UI state.

## 4. Tenant contract

Every tenant-owned read/write must carry an authoritative tenant/workspace context. Database RLS is mandatory defense in depth. A tenant mismatch is an authorization failure, not a normal empty result.

Cross-tenant administrative operations require explicit contract scope and auditability.

## 5. Input/output contract

Inputs are schema-validated at the boundary. Domain objects are not hydrated directly from untrusted request bodies.

Responses must expose stable business identifiers and machine-readable error codes. Do not leak SQL errors, provider credentials, stack traces or internal authorization details.

## 6. Idempotency

Idempotency is required for externally retryable mutations, especially:

- public lead capture,
- reservation requests,
- payment/receipt ingestion,
- webhooks/provider events,
- integration commands,
- publication actions with external side effects.

The idempotency key must be bound to tenant + operation semantics. A retry must return the original business result or a deterministic duplicate response.

## 7. Error taxonomy

At minimum distinguish:

- validation failure,
- unauthenticated,
- unauthorized / insufficient scope,
- tenant mismatch,
- not found,
- illegal state transition,
- conflict / race winner,
- duplicate idempotent request,
- domain invariant violation,
- dependency unavailable,
- rate limited,
- internal fault.

UI behavior must be mapped per class; generic "Something went wrong" is not an acceptable enterprise contract for recoverable business errors.

## 8. Transaction contract

A command that changes canonical state and emits a domain/integration event must commit its business mutation and outbox record atomically. External provider calls do not occur inside the database transaction unless an approved, documented exception exists.

## 9. Query contract

Queries are side-effect free. They may use projections/read models and server-side pagination/filtering. Large inventory/CRM datasets must not be loaded into the browser wholesale.

Queries must never be used to infer authorization that the authorization service/database does not enforce.

## 10. Public API contract

Public endpoints must assume hostile input and automated abuse. They require:

- strict schema validation,
- tenant/page/project/unit binding,
- rate limiting,
- spam/abuse controls,
- consent capture where required,
- safe error responses,
- idempotency for lead creation,
- attribution preservation,
- observability without logging sensitive payloads.

Public unit/project data is a projection of approved/published state.

## 11. Example command contract: Create Reservation

`CreateReservation` must receive the actor/context, apartment identity, eligibility information required by policy, requested reservation facts and idempotency key.

Execution contract:

1. authenticate;
2. resolve tenant/workspace;
3. authorize reservation action and scope;
4. validate input;
5. acquire the database-enforced inventory winner/hold semantics;
6. verify commercial/construction eligibility and approval policy;
7. create reservation transition;
8. write audit record;
9. write outbox event in the same transaction;
10. return canonical reservation state.

A competing request must deterministically lose without corrupting inventory or creating two active winners.

## 12. Example public command: Capture Lead

`CaptureLead` maps the public page/project/unit/session/campaign/UTM context to the tenant-owned CRM lead. It must not accept an arbitrary tenant ID from the browser as authoritative.

The result must preserve source attribution and return only the minimum data needed for the public UX.

## 13. Contract tests

Every API family must have tests for:

- valid request,
- malformed request,
- missing identity,
- wrong tenant,
- insufficient permission,
- insufficient scope,
- duplicate idempotency key,
- concurrent mutation where relevant,
- dependency failure,
- audit/outbox side effects,
- safe error serialization.

## 14. Versioning

Breaking external contract changes require an explicit version/ADR decision. Internal refactors must preserve application behavior. Never silently change semantics because a client is convenient to update.
