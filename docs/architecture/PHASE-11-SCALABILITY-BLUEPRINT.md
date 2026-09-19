# ASAS Phase 11 — Scalability Blueprint

Status: FOUNDATION DESIGN — PRE-IMPLEMENTATION

## Objective

Define how ASAS evolves from a small deployment to enterprise scale without prematurely introducing distributed-system complexity. The first architecture remains a modular monolith with PostgreSQL as the transactional source of truth; extraction is triggered by measured bottlenecks and bounded-context ownership, not fashion.

This document incorporates the source blueprint's Phase 11 gap list, but treats its capacity/latency/cost figures as planning targets until reproduced by workload evidence.

## Scale bands

| Band | Users | Primary architecture posture | Trigger to move up |
|---|---:|---|---|
| S0 | 1–10 | Single application + managed PostgreSQL | sustained workload or team growth |
| S1 | 10–100 | modular monolith + pooled DB + object storage + observability | DB/app saturation or queueing |
| S2 | 100–1,000 | horizontal app scaling + read optimization + async workers | measured hot paths |
| S3 | 1,000–10,000 | dedicated workers, cache, search, queue infrastructure | workload isolation requirement |
| S4 | 10,000–100,000 | workload partitioning, analytical isolation, stronger SLOs | tenant/workload concentration |
| S5 | 100,000–1,000,000 | selective service extraction, partitioning/sharding where justified | demonstrated database or domain limits |

These are planning bands, not promises of capacity. Capacity must be proven with workload tests.

## Transactional core

PostgreSQL remains authoritative for:

- identity and tenancy facts;
- inventory availability;
- reservations and contractual state;
- receivables and posted financial records;
- audit records.

Caches, search indexes, analytics stores and AI indexes are derived systems and MUST be rebuildable.

## Source-blueprint gap controls

The supplied enterprise blueprint identified seven scalability gaps. They are preserved here as controls rather than treated as permission to add infrastructure prematurely:

1. **Event ordering:** events require a stable aggregate/stream sequence and explicit ordering scope. Global ordering is not assumed.
2. **Idempotency:** every externally retried or asynchronously consumed command/event must have a deterministic idempotency strategy. Financial mutations, contracts and reservations require especially strict duplicate protection.
3. **Rate limiting:** rate limits are capability- and identity-aware, with stricter treatment for authentication, public endpoints, expensive queries and integrations. Limits must be observable and adjustable without changing business invariants.
4. **CQRS/read separation:** write-side transactional truth remains authoritative; read models may be derived for dashboards, search and analytics. CQRS is introduced where measured read/write contention justifies it, not as a universal framework requirement.
5. **Caching:** every cache has an owner, key scope, TTL/invalidation rule, stale-data policy and bypass/fallback behavior. Authorization, financial truth and inventory locking never depend on stale cache state.
6. **Cost control:** infrastructure is measured by compute, database, storage, egress, queues, search/cache, observability, backup/replication and AI inference. Scale changes require a cost/performance record.
7. **Load shedding:** overload behavior is explicit. Non-critical derived work may be delayed or rejected while correctness-critical transactions remain protected. Shedding must never silently discard financial or contractual writes.

## Scaling sequence

1. Correctness and tenant isolation.
2. Query/index optimization.
3. Connection pooling.
4. Horizontal application scaling.
5. Async work queues and idempotent workers.
6. Read-model/cache/search separation.
7. Analytical workload isolation.
8. Partitioning of demonstrably large tables.
9. Selective bounded-context extraction.
10. Sharding only when measured limits justify its operational cost.

## Traffic and capacity model

The original enterprise blueprint describes an evolution from 1 to 1,000,000 users. ASAS must not translate user count directly into infrastructure capacity because real load depends on concurrency, request mix, tenant concentration, read/write ratio, payload size, event fan-out and automation frequency.

Every capacity claim therefore requires a workload profile containing at least:

- concurrent active users;
- requests/second by endpoint class;
- read/write ratio;
- peak-to-average multiplier;
- database transaction rate;
- event publication and consumption rate;
- queue depth and processing rate;
- object-storage ingress/egress;
- search query rate;
- analytics workload;
- AI inference volume;
- tenant concentration assumptions.

The reproducible test output must record p50/p95/p99 latency, error rate, saturation point, queue lag, database utilization, connection utilization, cache hit ratio and cost at the tested load.

## Data scaling

### OLTP

Use normalized transactional models, explicit tenant keys, selective composite indexes, and bounded query shapes. Do not introduce denormalization until a measured query or workload justifies it.

### Analytics

Do not run heavy analytical scans against latency-sensitive transactional paths. Prefer derived reporting models/read replicas or an analytical store when workload evidence requires it.

### Search

Search indexes are projections. Every projection needs a rebuild strategy, versioning, lag visibility and a source-of-truth reference.

### Files

Large media and documents belong in object storage with metadata in PostgreSQL. Never make the database the binary archive.

## Caching

Caching is allowed only where invalidation semantics are explicit. Financial truth, authorization decisions and inventory locks cannot depend on stale cache state.

## Queues, events and backpressure

All asynchronous consumers must be idempotent. Events require stable identifiers, causation/correlation metadata, tenant scope and retry/dead-letter semantics. Transactional outbox is preferred for database-to-event publication.

Queue classes may be prioritized by business criticality, but the policy must protect correctness-critical operations first. Analytics and other derived work may be delayed under pressure. A queue threshold must have a documented response: throttle, defer, shed, scale or alert.

No event is silently dropped because of overload. Poison messages move to a controlled dead-letter path with operator visibility and replay semantics.

## Fault tolerance and circuit breaking

External dependencies and non-transactional workers require bounded retries, timeout budgets and circuit-breaking where repeated failure would amplify load. Fallback behavior must be explicit.

A cache failure falls back to an authoritative source where safe. An AI failure falls back to deterministic product behavior. A derived projection failure does not corrupt transactional state. Payment, reservation and contract failures must remain visible and recoverable rather than silently downgraded.

## AI scaling

AI workloads are isolated from the transactional request path. AI outputs are recommendations or derived intelligence unless an explicit governed workflow authorizes an action. Model version, input provenance, confidence and resulting action/evidence must be auditable.

AI cost controls include request budgets, role/capability limits, caching of safe repeatable inference, batching of non-critical work and explicit human approval for governed actions.

## Reliability targets

The source blueprint proposes planning targets such as API response under 200 ms, dashboard load under 1 s, event processing under 500 ms and AI inference around 1–3 s. These are **not accepted service guarantees** at this stage. They become capability-specific SLO candidates only after workload definition, measurement source selection and representative tests.

The source blueprint also proposes RPO 5–15 minutes and RTO below 1 hour as enterprise targets. These remain planning targets until backup, restore and failure drills demonstrate them.

## SLO model

Define SLOs per critical capability rather than one global latency number:

- authentication;
- inventory availability;
- reservation mutation;
- payment recording;
- CRM interaction;
- public website read;
- document generation;
- asynchronous automation.

Each SLO must specify latency, availability, error budget, measurement source, traffic class and exclusion rules.

## Cost controls

At each scale band track:

- compute;
- database;
- storage;
- egress;
- search/cache;
- queues/workers;
- observability;
- AI inference;
- backups/replication.

The enterprise blueprint's cost drivers are explicitly preserved: AI inference, event throughput, database writes and storage growth. Optimization levers include caching where safe, batching, reducing unnecessary AI calls and controlling event payload growth. These are hypotheses until measured against real workload data.

## Extraction rule

A bounded context may become a separate service only when at least one is demonstrated:

- independent scaling requirement;
- independent availability requirement;
- independent deployment cadence;
- clear ownership boundary;
- failure isolation benefit;
- technology/runtime isolation need.

Extraction must preserve contracts, tenant propagation, auditability, idempotency and operational ownership.

## Anti-premature-distribution rule

No Kubernetes, Kafka, service mesh, database sharding or microservice split is a foundation prerequisite. They are later options activated by evidence.

## Phase 11 task requirements

The canonical task graph must eventually contain task packets for:

- representative workload definition;
- baseline load test;
- database saturation test;
- connection-pool saturation test;
- queue/backpressure test;
- idempotency and duplicate-delivery test;
- cache failure/invalidation test;
- projection rebuild test;
- overload/load-shedding test;
- dependency failure/circuit-breaker test;
- backup/restore and RPO/RTO drill;
- cost-per-load-band measurement;
- extraction-readiness assessment.

These are task requirements, not permission to execute them before the applicable foundation and implementation gates are green.

## Phase 11 exit criteria

Phase 11 is architecturally accepted when:

- scale bands are mapped to measurable triggers;
- transactional source-of-truth boundaries are explicit;
- event ordering scope is explicit;
- idempotency is explicit;
- rate limiting and overload behavior are defined;
- cache/search/analytics rebuildability is defined;
- queue retry/dead-letter/backpressure behavior is defined;
- SLO/SLI definitions exist;
- DR targets are labelled as targets until tested;
- cost dimensions are measurable;
- service extraction criteria are explicit;
- the canonical task graph contains the required load/reliability task packets.

No capacity claim is accepted without a reproducible workload and evidence artifact.
