# ASAS Phase 11 — Scalability Blueprint

Status: FOUNDATION DESIGN — PRE-IMPLEMENTATION

## Objective

Define how ASAS evolves from a small deployment to enterprise scale without prematurely introducing distributed-system complexity. The first architecture remains a modular monolith with PostgreSQL as the transactional source of truth; extraction is triggered by measured bottlenecks and bounded-context ownership, not fashion.

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

## Queues and events

All asynchronous consumers must be idempotent. Events require stable identifiers, causation/correlation metadata, tenant scope and retry/dead-letter semantics. Transactional outbox is preferred for database-to-event publication.

## AI scaling

AI workloads are isolated from the transactional request path. AI outputs are recommendations or derived intelligence unless an explicit governed workflow authorizes an action. Model version, input provenance, confidence and resulting action/evidence must be auditable.

## Reliability targets

Initial RPO/RTO targets from the source blueprint are planning targets, not verified service guarantees. They become contractual only after backup, restore and failure drills demonstrate them.

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

Each SLO must specify latency, availability, error budget and measurement source.

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

Scale decisions require a cost/performance record. Never introduce infrastructure solely because a competitor uses it.

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

## Phase 11 exit criteria

Phase 11 is architecturally accepted when:

- scale bands are mapped to measurable triggers;
- transactional source-of-truth boundaries are explicit;
- cache/search/analytics rebuildability is defined;
- queue idempotency is defined;
- SLO/SLI definitions exist;
- DR targets are labelled as targets until tested;
- cost dimensions are measurable;
- service extraction criteria are explicit;
- load-test tasks exist in the canonical task graph.

No capacity claim is accepted without a reproducible workload and evidence artifact.
