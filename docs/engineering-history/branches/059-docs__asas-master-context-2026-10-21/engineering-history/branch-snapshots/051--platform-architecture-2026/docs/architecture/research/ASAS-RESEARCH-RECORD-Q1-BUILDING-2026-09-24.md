# ASAS — RESEARCH RECORD: Q1 BUILDING 2026-09-24

**Research ID:** ASAS-RESEARCH-Q1-BUILDING-2026-09-24  
**Status:** ACTIVE / DECISION SUPPORT  
**Branch:** `platform-architecture-2026`  
**Question:** What is the correct domain and persistence treatment of Building in ASAS before schema engineering?

## 1. Research-first question

Do not assume that the existence of a real-estate concept named `Building` implies:

- a bounded context;
- an aggregate root;
- a database table;
- a dedicated state machine;
- a natural key;
- a direct tenant key;
- a separate deployable.

The objective is to derive the minimum model that correctly represents the product and its invariants while preserving future extensibility.

## 2. Independent engineering research

### DDD / bounded contexts

Bounded Contexts are strategic model boundaries used to keep a large domain internally consistent and make relationships between models explicit. They are not synonymous with database tables or application folders.

**External evidence:** Martin Fowler, Bounded Context; Domain-Driven Design.  
Reference: `https://martinfowler.com/bliki/BoundedContext.html`

### DDD / aggregates

An aggregate is a domain consistency boundary with an aggregate root; external references target the root and transactions should not cross aggregate boundaries casually.

**External evidence:** Martin Fowler, DDD Aggregate.  
Reference: `https://martinfowler.com/bliki/DDD_Aggregate.html`

### Relational identity and constraints

PostgreSQL supports primary keys, unique constraints and foreign keys as database-level mechanisms for identity and referential integrity. Composite uniqueness is valid when the domain requires uniqueness of a combination rather than of an individual attribute.

**External evidence:** PostgreSQL constraints documentation.  
Reference: `https://www.postgresql.org/docs/current/ddl-constraints.html`

### Security verification

OWASP ASVS provides a structured basis for verifying web-application security controls, including architecture/design and authentication/authorization concerns.

**External evidence:** OWASP ASVS 5.0.0 project documentation.  
Reference: `https://owasp.org/projects/asvs`

## 3. Alternative models considered

### A — Building as bounded context

Rejected as unsupported by current ASAS evidence. There is no demonstrated Building-specific ubiquitous language boundary or independent capability requiring a context boundary.

### B — Building as independent aggregate root

Not authorized. A Building-specific transactionally protected invariant has not been demonstrated. Construction milestones may reference buildings, but current state-machine evidence keeps the commercial construction state on the Apartment/Unit side.

### C — Building as entity inside Real Estate / Inventory

Current strongest candidate. It provides durable structural identity without prematurely creating an independent consistency boundary.

### D — Building as pure derived value

Insufficient for the product target if buildings are independently identifiable portfolio structures used in navigation, reporting, construction grouping and inventory hierarchy. However, this remains a possible persistence outcome if complete brownfield evidence proves the concept is entirely derived.

### E — Building as read model only

Not supported by current product intent, which treats Project → Building → Unit as a business hierarchy rather than merely a reporting projection.

## 4. ASAS source validation

### Founder product truth

Historical founder-confirmed product direction states that a promoter portfolio is populated as `projects → buildings → units`, while the exact commercial/legal representation must follow validated domain contracts rather than UI invention.

Source: `foundation/reconcile-context-map-v2/docs/product/PRODUCT_TRUTH.md`.

### Current architecture analysis

`ASAS-BUILDING-DOMAIN-DECISION-ANALYSIS-2026.md` currently supports:

- Real Estate / Inventory ownership;
- Building as an Entity candidate with durable identity;
- no independent Building aggregate root yet;
- one Project per Building as the initial target direction, pending contract closure;
- Floor as structural hierarchy if required;
- Unit as commercial/reservation consistency boundary;
- no independent Building state machine;
- tenant scoping required but physical tenant-key representation open.

### Historical module candidate

`foundation/reconcile-context-map-v2` contains a 15-module candidate architecture. Its Property & Inventory module owns Projects and Units, but the aggregate baseline does not establish Building as an independent aggregate. The candidate itself is explicitly proposed pending ADR-0001 acceptance.

This historical artifact therefore supports the conservative direction but cannot be treated as current approval.

### Current source observations

The current evidence register records Building-adjacent persistence references including `ProjectMilestone.building_id` and `LedgerEntry.building_id`, while the measured 59-model source contract contains no standalone Building model. `Apartment` carries project/floor-related fields and construction state; `FloorPlan` carries project ownership.

These are source observations, not live-database proof.

## 5. Engineering conclusion

The most defensible current model is:

`Real Estate / Inventory → Project → Building (structural Entity candidate) → Floor (structural level if required) → Unit aggregate`

with:

- Building durable identity required conceptually;
- Unit retaining commercial/reservation consistency ownership;
- Building not promoted to a bounded context;
- Building not promoted to an independent aggregate root;
- no independent Building state machine;
- no Building microservice;
- no schema creation until persistence reconciliation closes.

This is a **provisional architecture decision**, not implementation authorization.

## 6. What remains unproven

- whether Building already exists in brownfield persistence under another name;
- exact Project → Building cardinality in existing data;
- exact Building → Floor → Unit cardinality;
- durable identity/uniqueness key;
- rename semantics;
- move semantics;
- archive semantics;
- tenant-key persistence path;
- permission mapping;
- historical-data reconstruction requirements;
- live database representation.

## 7. Next evidence action

Execute the existing forensic trace plan:

`ASAS-Q1-BUILDING-PERSISTENCE-TRACE-PLAN-2026.md`

Classify every relevant occurrence as:

`AUTHORITATIVE DOMAIN REFERENCE | PERSISTED FK | REPORTING DIMENSION | DERIVED VALUE | LEGACY | TEST FIXTURE | DOCUMENTATION | UNKNOWN`

Then reconcile repository implementation, migration history, historical branches, generated types, API/query references and—only when runtime credentials/identity are verified—live schema introspection.

## 8. No implementation authorization

This research record authorizes no schema, migration, endpoint, event, permission or code change. Its purpose is to improve the decision before implementation.

## 9. Evidence state

`SUPPORTED DIRECTION / PERSISTENCE OPEN / IMPLEMENTATION BLOCKED`
