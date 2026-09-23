---
name: asas-security-ai-safety
description: Threat-model and verify ASAS tenancy, authorization, RLS, API security, AI tool boundaries and sensitive-data protections.
---

# Security and AI Safety

## Threat model

Always consider tenant escape, IDOR, privilege escalation, mass assignment, injection, XSS, CSRF, webhook forgery/replay, secret exposure, PII leakage, financial manipulation, reservation races, API abuse, cross-tenant analytics and prompt/tool injection.

For each material threat record:
`attack path → control → enforcement layer → test → evidence → residual risk → owner`.

## Authorization

Deny by default. Authorize server-side before sensitive access. Evaluate tenant/scope before loading protected data. Never trust client-provided role, tenant, organization, branch or approval claims.

## AI authority

```text
Intent → Proposal → Tool Request → Policy → Caller Authorization → Domain Service → Transaction → Audit → Event
```

AI must inherit caller authority and may not widen scope, bypass domain services, mutate authoritative finance/reservation/contract data directly or perform destructive operations without explicit authorization.

## Webhooks and integrations

Require authentication/signature verification, replay protection, idempotency, bounded retries, safe error handling and tenant attribution.

## Security closure

Do not call a security control complete because code exists. Require adversarial tests and evidence for the enforcement layer that actually protects the asset.
