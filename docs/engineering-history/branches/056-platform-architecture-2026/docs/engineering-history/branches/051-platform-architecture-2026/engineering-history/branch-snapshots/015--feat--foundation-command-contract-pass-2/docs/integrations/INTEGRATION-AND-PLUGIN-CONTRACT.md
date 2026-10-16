# ASAS Real Estate OS — Integration & Plugin Contract

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.

## 1. Principle

Integrations extend ASAS; they do not become sources of truth. Provider APIs are untrusted external dependencies and are isolated behind adapters.

## 2. Adapter boundary

Each provider integration must expose an explicit application-facing port. Provider SDK types must not leak into domain contracts.

Canonical flow:

`provider → adapter → validation/signature → idempotency → application command → domain mutation → audit/outbox → provider response`

## 3. Credential lifecycle

Credential metadata is tenant-scoped and permission-protected. Secrets live only in approved secret storage. The application stores only the minimum reference/metadata necessary for lifecycle and rotation.

Required lifecycle: connect → validate → active → rotate/reauthorize → suspended/error → revoke.

## 4. Webhook contract

Every webhook-capable provider must define:

- signature verification;
- endpoint/integration binding;
- provider event identifier;
- timestamp/replay policy where supported;
- schema validation;
- idempotent processing;
- retry/dead-letter behavior;
- observable delivery state.

A webhook never directly edits a domain table outside the governed application command path.

## 5. Retry semantics

Retries must be bounded, observable and safe. Classify failures as transient, permanent or unknown. Never retry permanent validation/authentication failures indefinitely.

## 6. Calendar / scheduling

Scheduling remains a Core-hosted submodule. External calendars contribute availability/busy information; they do not replace ASAS appointment truth. Sync failure must be visible and must not silently rewrite an internally confirmed business appointment.

## 7. Marketing providers

Ad/social providers feed leads and attribution through idempotent ingestion. Raw provider IDs and relevant payload fingerprints are retained according to the data-retention contract so reconciliation is possible.

## 8. Plugin contract

A future plugin must declare, before installation:

- plugin identity/version;
- publisher/source;
- requested permissions;
- requested data scopes;
- events consumed;
- commands/actions exposed;
- UI extension points;
- webhook/external endpoints;
- secret requirements;
- tenant isolation model;
- uninstall/revocation behavior.

Plugin permissions are deny-by-default and must never inherit unrestricted administrator authority merely because the installing user is an administrator.

## 9. UI extension points

Plugins may extend governed surfaces through registered slots/components/actions. They must not inject arbitrary navigation, CSS or privileged scripts into the application shell without an explicit security/design contract.

## 10. Data ownership

Tenant data remains owned by the tenant. Plugin access is purpose-limited and revocable. Export, deletion/retention and audit implications must be defined before a plugin becomes production-eligible.

## 11. Integration observability

Expose integration health, last successful sync, failure count, delivery lag, retry state and actionable failure reason. Secrets and sensitive provider payloads must not be exposed in operational dashboards.

## 12. Acceptance

An integration is production-ready only when signature, idempotency, retry, authorization, tenant isolation, secret handling, failure recovery and audit behavior are tested. A plugin is not production-ready until its requested capabilities and uninstall/revocation semantics are reviewed.
