# ASAS Real Estate OS — Threat Model & Security Baseline

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.

## 1. Security objective

Protect tenant-owned real-estate, customer, financial and operational data while preserving auditable business workflows. Security is a platform property inherited by every module.

## 2. Primary assets

- tenant/workspace identity and permissions;
- customer/lead/contact data;
- inventory, prices and availability;
- reservations/contracts;
- payment and accounting records;
- media, floor plans and unpublished Studio content;
- integration credentials and webhook trust;
- audit logs and business events;
- AI context/tool permissions.

## 3. Threat priorities

### Tenant breakout / BOLA / IDOR
Every object lookup must be tenant-scoped and authorization-aware. Never trust object IDs from the client as proof of ownership.

### Privilege escalation
Roles, scopes and ABAC decisions come from the authorization kernel. User-editable profile fields never determine privilege.

### Session compromise
Use opaque high-entropy session tokens, secure cookie attributes, expiry, privilege rotation, lockout/rate limits and revocation. Never store raw session tokens when the contract requires hashed storage.

### Reservation race
Treat competing reservation requests as a concurrency problem. Database constraints/transaction semantics must guarantee one winner.

### Financial tampering
Posted ledger facts and receipts are immutable. Corrections are represented by governed reversals. No UI or API may provide an update/delete path around this rule.

### Webhook forgery/replay
Verify provider signatures before business processing, bind events to the expected integration, deduplicate provider event IDs/idempotency keys, and record processing outcome.

### Public endpoint abuse
Rate-limit authentication and public lead surfaces; validate schemas; minimize returned data; preserve consent/attribution; prevent tenant selection by untrusted browser fields.

### Studio XSS/content injection
Treat rich text, embeds, uploaded media, HTML fragments and third-party scripts as hostile inputs. Define an explicit allowlist/sanitization policy before implementation. Published content must not silently gain arbitrary server capabilities.

### SSRF / unsafe external fetch
Any server-side URL fetching (media import, integrations, previews) requires an explicit allowlist and network-safety policy. Do not let user-controlled URLs reach internal services or metadata endpoints.

### Secret leakage
Credentials belong in approved secret stores. Never commit, render client-side, log, or expose integration credentials. Logs must redact sensitive fields.

### Supply-chain risk
Pin/lock dependencies, review security advisories, run secret/dependency scanning, and record exceptions rather than silently ignoring findings.

## 4. Defense-in-depth baseline

`Browser → route/application authorization → domain invariants → transaction/constraints → PostgreSQL RLS → audit/outbox → observability`

No single layer is allowed to be the sole control for tenant isolation or critical authorization.

## 5. Upload/media baseline

Media handling must specify file type validation, size limits, storage isolation, authorization, filename/content handling, malware/scanning strategy where appropriate, cache/publication semantics and safe rendering. Floor plans and unpublished project assets are tenant-controlled data until explicitly published.

## 6. Logging baseline

Logs should answer what happened without becoming a second database of secrets or sensitive customer data. Include correlation/request identifiers and actor/tenant context where safe. Redact credentials, session tokens and unnecessary personal/financial payloads.

Audit logs are distinct from operational logs: audit records are governed business evidence and require stronger integrity guarantees.

## 7. AI security boundary

AI can assist reasoning and retrieval but cannot bypass authorization, tenant isolation, domain commands, financial invariants or audit requirements. Any tool capable of mutation must execute through the same governed application services as human actions.

## 8. Security review checklist

Before a security-sensitive PR is accepted:

- threat and trust boundaries reviewed;
- tenant isolation tested;
- authorization tested for positive and negative cases;
- input/output schemas validated;
- secrets handling reviewed;
- rate limits assessed;
- audit requirements satisfied;
- failure/retry/replay behavior tested;
- dependency/security scan reviewed;
- residual risks documented.

## 9. Stop conditions

Stop and escalate for any request to weaken RLS, bypass the authorization kernel, expose secrets, disable security gates, accept an untrusted provider event as authoritative, or introduce a destructive security/data change without an approved plan.
