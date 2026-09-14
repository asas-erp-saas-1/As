# ASAS Security Control Matrix

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.
**Authority:** Blueprint v1.6.1, AGENTS.md, threat model, IAM/API contracts.

## Purpose

Turn security principles into explicit controls that Claude must implement and prove. A control is not considered satisfied because code exists; it requires negative evidence where applicable.

## Control matrix

| Area | Mandatory control | Required proof |
|---|---|---|
| Tenant isolation | authoritative tenant context + PostgreSQL RLS | cross-tenant read/write attack suite |
| Authorization | centralized deny-by-default evaluator | positive/negative matrix for role + scope |
| Routes | every protected route mapped to permission | build-time unmapped-route failure |
| Sessions | opaque high-entropy tokens, hashed at rest, secure cookie, expiry/revocation | session lifecycle + theft/replay tests |
| Privilege changes | privilege/session rotation and revocation behavior | active-session revocation test |
| Impersonation | explicit permission, actor + subject trace | audit evidence for every action |
| Input validation | schema validation at every untrusted boundary | malformed/fuzz-style boundary tests |
| Object access | tenant + authorization check before object use | BOLA/IDOR negative tests |
| Idempotency | tenant/operation-bound keys on retryable mutations | duplicate and retry-after-success tests |
| Webhooks | signature verification + provider binding + deduplication | forged/replayed payload tests |
| Public forms | abuse controls, consent, attribution, safe output | rate-limit + hostile-input tests |
| Uploads | type/size/content validation, isolated storage, safe rendering | malicious file/content tests |
| External URLs | SSRF-safe allowlist/network policy | internal-address rejection tests |
| Secrets | platform secret stores; no client/log exposure | secret scan + log redaction inspection |
| Finance | immutable posted facts + governed reversals | attempted mutation must fail |
| Inventory | DB-enforced single reservation winner | PostgreSQL concurrency test |
| Audit | append-only integrity + actor/tenant context | tamper attempt + chain verification |
| Events | transactional outbox for canonical mutations | rollback proves no orphan event |
| Dependencies | lockfile + security review + documented exceptions | CI scan evidence |
| AI | same tenant/auth/domain boundaries as human actions | unauthorized tool/action tests |

## Security review order

1. Identify assets and trust boundaries.
2. Identify attacker-controlled inputs.
3. Verify tenant resolution.
4. Verify authorization and scope.
5. Verify state/invariant enforcement.
6. Verify persistence/database controls.
7. Verify audit/outbox behavior.
8. Verify retry/replay behavior.
9. Verify observability/redaction.
10. Record residual risk and owner.

## Stop-the-line

Immediately block a task when it requires weakening RLS, bypassing AuthorizationService, trusting client tenant/role metadata, exposing secrets, accepting unsigned provider events, adding arbitrary status setters, mutating posted financial facts, or introducing destructive data changes without an approved recovery plan.

## Claude requirement

For every security-sensitive task, the pre-implementation packet must name the threat, trust boundary, control layers, negative tests, and evidence. The post-implementation packet must state exactly which controls were verified, failed, blocked, or not executed.
