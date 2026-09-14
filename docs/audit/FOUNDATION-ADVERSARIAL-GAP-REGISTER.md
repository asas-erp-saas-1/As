# ASAS Foundation Adversarial Gap Register

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized  
**Date:** 2026-09-14  
**Purpose:** independent adversarial review of the ASAS foundation. This register is intentionally broader than the delivered v1.6.1 package and records gaps that must be closed before the architecture can be treated as implementation-grade.

## 1. Review method

This is not a package transcription exercise. The review uses four lenses:

1. **Source reconciliation** — Blueprint/registers/package artifacts must agree.
2. **Failure-mode analysis** — ask how the system fails under concurrency, retries, partial failure, malicious input, tenant mistakes, and operational recovery.
3. **Authoritative external practice** — compare the foundation against current primary/standards sources, especially OWASP, PostgreSQL, Prisma, Supabase, OpenTelemetry and NIST.
4. **Evidence discipline** — a rule is not considered closed merely because prose says it exists; it needs a concrete verification method.

## 2. Findings

### GAP-001 — Reservation concurrency is underspecified
**Severity:** P0

The lifecycle contract defines reservation states, but a production implementation also needs an explicit concurrency invariant for two agents attempting to reserve the same unit at nearly the same time. The architecture must specify the authoritative write-side conflict mechanism, not merely the state transition.

**Required contract:** one transactional command owns the unit/reservation conflict; competing writers must serialize or fail deterministically; a successful reservation must have a database-enforced uniqueness/invariant boundary where appropriate; retry semantics must not create a second winner.

PostgreSQL explicitly supports row-level locking with `FOR UPDATE`, which prevents conflicting writers/lockers from proceeding on the same row until the transaction ends. Prisma also documents interactive transactions and optimistic concurrency control for read-modify-write scenarios. citeturn0search0turn0search5turn0search9

**Evidence required later:** concurrency test with parallel reservation commands proving exactly one winner.

---

### GAP-002 — Idempotency needs a formal storage contract, not only a requirement
**Severity:** P0

The API map says idempotency is required for critical mutations, but the foundation must define the idempotency-key lifecycle: key scope, request fingerprint, actor/tenant binding, result retention, replay behavior, conflict behavior, expiry, and transaction boundary.

**Required contract:** same tenant + actor + operation + idempotency key + compatible request returns the original semantic result; same key with materially different input is a typed conflict; the idempotency record is durable enough to survive retries; external side effects are not duplicated.

Prisma's current transaction guidance explicitly treats idempotent APIs as a read-modify-write technique and distinguishes idempotency from a naive upsert. citeturn0search9

---

### GAP-003 — Transactional outbox needs relay/inbox semantics
**Severity:** P0

The event contract establishes audit + outbox in the mutation transaction, but does not yet close the operational behavior after commit.

**Required contract:** outbox row states, claiming/lease behavior, retry/backoff, dead-letter handling, delivery attempt metadata, consumer idempotency/inbox strategy, poison-message handling, ordering guarantees per aggregate where required, and replay policy.

**Reason:** an outbox without a relay/inbox contract can still produce duplicates, stuck events, unbounded retries, or cross-context corruption.

**Evidence required later:** crash/retry/replay tests and delivery metrics.

---

### GAP-004 — Authorization must cover property-level and object-level controls
**Severity:** P0

The authorization chain is structurally strong, but it currently emphasizes command permission + scope. It must explicitly prevent both object-level authorization failures and unauthorized field mutation/exposure.

OWASP identifies Broken Object Level Authorization and Broken Object Property Level Authorization as core API risks. Object authorization must be checked for every function accessing data by identifier, while property-level controls prevent sensitive fields from being exposed or mass-assigned. citeturn0search1turn0search4turn0search8

**Required contract:** every read/write command declares resource type + object authorization rule + field projection/mutation policy. DTOs must not inherit database shape blindly.

---

### GAP-005 — Sensitive business-flow abuse controls need first-class treatment
**Severity:** P0

Rate limiting alone is insufficient for high-value flows such as public lead creation, reservation attempts, OTP/login, appointment booking, offer submission, webhook ingestion and messaging. OWASP explicitly treats unrestricted access to sensitive business flows as an API risk.

**Required contract:** per-flow abuse model, actor/IP/device/tenant limits where appropriate, replay protection, velocity limits, escalation rules, and business-risk telemetry.

OWASP API Security Top 10 2023 identifies unrestricted access to sensitive business flows and unrestricted resource consumption as separate risks. citeturn0search1turn0search6

---

### GAP-006 — Resource-consumption budgets are not yet architectural contracts
**Severity:** P1

The platform targets 100,000 leads and large media inventories, but the foundation does not yet define bounded pagination, maximum query cost, export limits, upload limits, report limits, bulk-operation limits, webhook payload limits, or background-job budgets.

**Required contract:** every externally reachable collection and expensive operation has a bounded resource envelope; privileged bulk operations require explicit authorization and asynchronous execution where appropriate.

OWASP identifies unrestricted resource consumption as a widespread API risk. citeturn0search6

---

### GAP-007 — Audit immutability and tamper evidence are not sufficiently specified
**Severity:** P0

The architecture requires audit, but a high-trust real-estate/finance system needs a stronger contract: who can read, who can append, whether application users can ever update/delete audit rows, retention, actor provenance, correlation/causation IDs, and tamper detection.

**Required contract:** append-only audit semantics at the database/service boundary; privileged operational access separated from business mutation permissions; audit records carry actor, tenant, action, aggregate, before/after or change summary, reason where required, correlation and causation; deletion/retention is governed and evidenced.

---

### GAP-008 — Finance requires explicit accounting invariants beyond “double-entry”
**Severity:** P0

“Immutable double-entry” is directionally correct but not yet enough for implementation. The foundation must explicitly define: balanced journal-entry invariant, debit/credit sign convention, account period behavior, posting vs draft semantics, reversal mechanics, currency/scale policy, rounding authority, allocation invariants, negative/overpayment rules, refund linkage, close/reopen authorization, and idempotent receipt posting.

**Required contract:** no posted journal entry can be edited; corrections happen through compensating entries; every posted entry balances exactly; receipt allocation cannot exceed available amount; financial commands are concurrency-safe and auditable.

---

### GAP-009 — Money and currency model needs a global contract
**Severity:** P0

The product correctly requires integer DZD centimes, but the future global platform target means the foundation must define whether DZD-centime is a product-wide storage rule or a currency-specific representation. It also needs currency code, minor-unit handling, FX policy, rounding authority, and display/locale separation.

**Required contract:** monetary value = integer minor units + ISO currency; no floating-point persistence; calculation precision and rounding rules are explicit; display formatting never changes stored value.

---

### GAP-010 — Time, timezone and calendar semantics are not closed
**Severity:** P1

Appointments, reservation expiry, payment due dates, campaigns and scheduled publishing depend on time semantics. Algeria-first does not justify implicit server-local time.

**Required contract:** persisted instants use UTC; tenant/workspace has an explicit IANA timezone; date-only business concepts remain date-only; DST/calendar conversion is explicit; expiry calculations use authoritative server time; client clocks are never trusted for authorization or financial expiry.

---

### GAP-011 — Data lifecycle, PII classification and retention need an explicit contract
**Severity:** P0

The threat model recognizes customer data and PII, but the foundation needs a field/data-classification model and lifecycle policy.

**Required contract:** classify identity/contact/financial/legal/media/integration-secret data; define retention, deletion/anonymization, export, access logging, purpose limitation, sensitive-field masking, and backup-retention behavior. “Delete” must distinguish business deletion, legal retention, anonymization and physical purge.

---

### GAP-012 — Secrets and integration credentials need a concrete trust boundary
**Severity:** P0

The integration contract must explicitly distinguish ordinary configuration from secrets, define encryption/storage, rotation, revocation, access audit, redaction, and outbound request isolation.

**Required contract:** credentials are never returned in normal DTOs/logs/events; secret-bearing operations are separately authorized; webhook signing secrets and OAuth tokens have lifecycle state; SSRF protections apply to configurable outbound URLs.

OWASP's API security catalogue includes SSRF, security misconfiguration and unsafe consumption of APIs as explicit risks. citeturn0search17

---

### GAP-013 — Webhook security needs replay and canonical-signature semantics
**Severity:** P0

“Webhook management” is not sufficient. Incoming webhooks need signature algorithm/version, canonical payload bytes, timestamp tolerance, replay identifier, secret rotation, event allowlist, tenant binding and idempotent processing.

**Required contract:** verify signature before parsing trusted business content where feasible; reject stale/replayed requests; persist delivery identity; process exactly-once semantically even when transport is at-least-once.

---

### GAP-014 — Observability needs a platform-wide correlation contract
**Severity:** P1

The quality baseline mentions observability but does not yet establish a complete telemetry vocabulary. The system has domain events, API requests, background jobs, integrations and AI operations that must be correlated.

**Required contract:** request ID, trace ID, tenant/workspace ID, actor ID where safe, command name, aggregate ID, event ID, job ID, integration ID and error category are consistently correlated without leaking PII/secrets.

OpenTelemetry defines semantic conventions across traces, metrics, logs and events specifically to make telemetry consistently named and cross-correlatable. citeturn0search3turn0search7turn0search10

---

### GAP-015 — SLO/SLA and operational objectives are missing
**Severity:** P1

The foundation has quality gates but not yet measurable service objectives.

**Required contract:** availability target by surface, API latency objectives, background-event freshness, notification delivery objectives, backup RPO/RTO, error-budget policy and alert thresholds.

These objectives are necessary to turn “production ready” from a qualitative claim into an operationally testable state.

---

### GAP-016 — Disaster recovery needs RPO/RTO and restore verification
**Severity:** P0

The closure gate correctly blocks on production identity and restore evidence, but the architecture should also state the target RPO/RTO and the exact restore-validation sequence.

Supabase documents daily backups by plan and Point-in-Time Recovery for finer-grained recovery, and notes that restoration makes the project inaccessible during the restore process. citeturn0search14

**Required contract:** backup source, retention, off-site/export strategy, RPO, RTO, restore owner, restore environment, post-restore integrity checks and periodic restore drill cadence.

---

### GAP-017 — Migration safety needs expand/contract and rollback semantics
**Severity:** P0

The migration baseline/drift requirement is good, but implementation safety needs explicit treatment of irreversible changes, backfills, dual-read/write transitions, long-running locks, index creation, destructive column changes, rollback feasibility and deployment ordering.

**Required contract:** every migration classifies itself as reversible, forward-only or destructive; destructive operations require explicit approval and backup evidence; large backfills are resumable and observable; application/schema compatibility is preserved during rolling deployment.

---

### GAP-018 — Tenant isolation requires negative-test matrices, not only RLS policies
**Severity:** P0

RLS is a database boundary, but the complete isolation contract must cover every access path: direct table reads, joins, RPC/functions, storage objects, search indexes, caches, exports, background jobs, event consumers and admin/support tooling.

**Required contract:** tenant context cannot be supplied solely as an untrusted client parameter; every data path is tested for cross-tenant read/write leakage; privileged service roles are explicitly scoped and audited.

Supabase documents RLS as a database-level authorization layer, but the architecture must still verify every path that can bypass or circumvent ordinary table access. citeturn0search14

---

### GAP-019 — Search/index projections need ownership and freshness semantics
**Severity:** P1

The architecture names search as a platform capability/projection, but it does not yet define source-of-truth ownership, index rebuild strategy, tenant filtering, stale-read expectations, deletion propagation, or authorization at query time.

**Required contract:** search is never authoritative; indexed records carry tenant identity and authorization-safe fields; rebuilds are deterministic; stale results are acceptable only where explicitly documented.

---

### GAP-020 — Cache invalidation and authorization interaction are unspecified
**Severity:** P1

Future dashboards, public pages and Studio will naturally introduce caching. Cached content must not outlive permission changes or tenant boundaries in unsafe ways.

**Required contract:** every cache has owner, key scope, TTL/invalidation rule, sensitivity class and authorization model; permission/tenant changes invalidate affected private caches; public cache never contains private tenant data.

---

### GAP-021 — File/media security and lifecycle need a dedicated contract
**Severity:** P1

Studio and Documents require more than object storage references.

**Required contract:** MIME/type validation, size limits, filename normalization, malware scanning strategy, image transformation policy, private/public bucket rules, signed URL TTL, tenant scoping, deletion/retention, derivative lineage and metadata stripping where required.

---

### GAP-022 — AI governance needs tool-level data egress controls
**Severity:** P0

The AI governance correctly forbids bypassing authorization, but an AI copilot can still cause data leakage through retrieval, prompts, logs, tool arguments or third-party model providers.

**Required contract:** tool-level permissions; tenant-scoped retrieval; sensitive-field redaction; prompt/output retention policy; provider data-use policy; action confirmation for high-impact commands; complete AI action audit trail; no secret exposure to model context.

---

### GAP-023 — Domain command catalog is still too implicit
**Severity:** P1

The current authorization matrix is structurally defined, but implementation will be safer if every mutation has a canonical command identifier, owner context, aggregate, permission, preconditions, transaction boundary, state transition, emitted events, idempotency class and error set.

**Required artifact:** a command registry generated/reconciled from the authoritative tasks and state/event registers, with zero orphan commands and zero permissionless mutations.

---

### GAP-024 — Contract versioning and compatibility policy needs explicit rules
**Severity:** P1

Event versioning is named, but the architecture must define additive vs breaking changes, deprecation windows, consumer compatibility, API versioning, schema evolution and replay compatibility.

**Required contract:** event versions are immutable; breaking changes create new versions/IDs according to policy; consumers declare supported versions; replay uses the event schema valid for the stored event; API breaking changes require explicit versioning/migration policy.

---

### GAP-025 — Testing strategy needs property/invariant tests, not only example tests
**Severity:** P0

The quality matrix needs explicit invariant testing for the highest-risk business rules.

**Required tests:** tenant isolation matrix, state-machine transition exhaustiveness, authorization deny matrix, reservation race, finance balance invariant, allocation invariant, idempotency replay, webhook replay, outbox retry, migration compatibility, audit append-only behavior, AI tool authorization and public abuse limits.

NIST's Secure Software Development Framework emphasizes integrating security practices into the SDLC rather than treating security as a final inspection step. citeturn0search19turn0search22

---

### GAP-026 — Supply-chain and dependency governance needs a release contract
**Severity:** P1

The foundation does not yet define dependency update policy, lockfile integrity, vulnerability thresholds, provenance, secret scanning, SBOM expectations, CI permission minimization and release artifact integrity.

**Required contract:** pinned/reproducible dependency policy, automated security scanning, reviewed dependency changes, least-privilege CI tokens, artifact provenance and release evidence.

---

### GAP-027 — Public/private surface separation needs an explicit data exposure matrix
**Severity:** P0

The product has Public Experience, Studio and Operations OS. The boundary must specify exactly which fields can cross from private domain records into public publication, including media, prices, inventory status, contact details, analytics and SEO metadata.

**Required artifact:** public projection allowlist per aggregate. Public APIs must never serialize internal domain objects wholesale.

OWASP's property-level authorization guidance directly supports treating response shape as an authorization concern. citeturn0search4

---

### GAP-028 — Notification delivery semantics are underspecified
**Severity:** P1

Notifications are a platform capability but affect appointments, reservations, payments, approvals and marketing.

**Required contract:** notification intent vs delivery, provider retry, deduplication, user preferences, quiet hours/timezone, consent where required, template versioning, localization, failure state and auditability.

---

### GAP-029 — Analytics/event data must not become an alternate business truth
**Severity:** P1

The platform target includes analytics and reporting. The foundation should explicitly state which metrics are authoritative, how late events are handled, how corrections/reversals affect metrics, and whether reports query transactional tables or projections.

**Required contract:** operational truth remains in owning bounded contexts; analytics is derived; metric definitions have owners and versions; financial metrics reconcile to ledger sources.

---

### GAP-030 — Founder/product decision traceability needs a formal ADR gate
**Severity:** P1

The architecture is intentionally challengeable. That is good, but challengeable architecture requires a durable decision protocol so Claude or future agents cannot silently change product semantics.

**Required contract:** material changes require ADR/decision record containing problem, evidence, alternatives, decision, consequences, affected contracts, migration impact and founder approval status.

## 3. Priority closure order

The gaps should not be addressed as a flat backlog.

### Wave A — correctness and trust boundaries
GAP-001, 002, 003, 004, 007, 008, 009, 012, 013, 016, 017, 018, 022, 025, 027.

### Wave B — operational reliability
GAP-006, 010, 014, 015, 019, 020, 021, 024, 028, 029.

### Wave C — engineering governance
GAP-023, 026, 030.

## 4. Closure rule

A gap is **CLOSED** only when all three exist:

1. normative contract/documentation;
2. implementation owner and verification method;
3. executable or otherwise objective evidence when implementation becomes authorized.

Until then the status must remain **OPEN**, **BLOCKED**, **NOT EXECUTED**, or **NOT VERIFIED**. Documentation alone cannot convert a runtime risk into a green gate.

## 5. External evidence used in this adversarial pass

- OWASP API Security Top 10: authorization, sensitive business flows and resource consumption. citeturn0search1turn0search6turn0search8
- OWASP Authorization and property-level authorization guidance. citeturn0search2turn0search4
- PostgreSQL explicit row-level locking. citeturn0search0
- Prisma transaction/idempotency/OCC guidance. citeturn0search5turn0search9
- OpenTelemetry semantic conventions for correlated telemetry. citeturn0search3turn0search7turn0search10
- Supabase backup/PITR operational behavior. citeturn0search14
- NIST SSDF secure-development practices. citeturn0search19turn0search22

## 6. Verdict

The v1.6.1 package is a strong architectural input, but it is **not sufficient evidence for a 99.999% implementation-ready foundation**. The most important newly identified issues are not missing screens or technologies; they are **concurrency, idempotency, event delivery semantics, property/object authorization, financial invariants, data lifecycle, tenant-negative testing, recovery objectives, public/private projection boundaries, and AI data-egress controls**.

The foundation must be hardened around these failure modes before its closure gate can be upgraded.
