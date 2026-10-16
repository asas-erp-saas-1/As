# ASAS — Engineering Build Orders & Autonomous Construction System

**Status:** Foundation planning contract.
**Purpose:** Convert the architecture into executable, dependency-aware construction orders so Claude can work independently without guessing business semantics.

## 1. Build-order philosophy

A build order is a controlled unit of engineering work with:

`purpose → prerequisites → source contracts → implementation boundary → invariants → tests → evidence → exit gate`

A build order is not a feature wishlist and not a prompt to generate code blindly.

## 2. Global dependency graph

```text
REALITY
  ↓
IDENTITY / TENANCY / AUTHORIZATION
  ↓
COMMAND KERNEL
  ↓
TRANSACTION + IDEMPOTENCY + AUDIT + OUTBOX
  ↓
STATE MACHINES + DOMAIN INVARIANTS
  ↓
DOMAIN VERTICAL SLICES
  ↓
WORKFLOWS / INTEGRATIONS
  ↓
UI / STUDIO / PUBLIC EXPERIENCE
  ↓
ANALYTICS / AI
  ↓
SCALE / RELIABILITY / COST
```

A downstream layer must not hide defects in an upstream layer.

## 3. Required construction artifacts

Before broad implementation, the repository should progressively acquire:

1. canonical command registry
2. state-machine transition registry
3. event producer/consumer matrix
4. permission/object/property/ABAC matrix
5. domain invariant catalog
6. idempotency key catalog
7. concurrency/race catalog
8. outbox/inbox contract
9. data classification/retention matrix
10. public/private projection matrix
11. integration contract registry
12. AI tool/action registry
13. UX golden-journey traceability
14. engineering evidence matrix

These are control artifacts, not bureaucracy. They make autonomous implementation safe.

## 4. Build-order template

Every order should contain:

```yaml
id: BO-XXX
name: "..."
priority: P0|P1|P2
status: BLOCKED|READY|IN_PROGRESS|VERIFYING|DONE
owner: Claude|Founder|Shared
source_contracts: []
prerequisites: []
allowed_scope: []
forbidden_scope: []
commands: []
state_edges: []
permissions: []
events: []
invariants: []
data_changes: []
integration_effects: []
tests: []
evidence: []
escalation_triggers: []
rollback: []
```

If a field cannot be determined from authoritative sources, mark it `OPEN` rather than inventing it.

## 5. Core build orders

### BO-001 — Repository and reality baseline

**Goal:** establish what actually exists.

Verify:
- repository/branch
- application presence/absence
- package versions
- environment identity
- migration history
- database identity
- generated artifacts
- CI state
- deployment identity

**Exit:** reality report is reproducible.

### BO-002 — Foundation contract closure

Close:
- state-machine edges
- event matrix
- permission matrix
- command registry
- invariant matrix
- idempotency
- concurrency
- outbox/inbox

**Exit:** no implementation-critical unknown is hidden as prose.

### BO-003 — IAM kernel

Build only after Phase P/0 gates pass.

Must prove:
- authentication
- tenant resolution
- role/grant evaluation
- scope
- deny overrides
- ABAC
- command authorization
- audit
- negative tests

### BO-004 — Domain command kernel

Create the standard mutation path.

Required properties:
- typed command
- authenticated actor
- tenant context
- permission decision
- idempotency handling where applicable
- domain validation
- transaction boundary
- canonical state transition
- audit
- outbox

### BO-005 — Inventory

Golden journey:

`Project → Building → Unit → publish → hold → reservation → release/sold`

Special focus:
- reservation single winner
- price override authorization
- commercial vs construction status separation

### BO-006 — CRM

Golden journey:

`Lead created → assigned → contacted → qualified → opportunity → activity/appointment`

Special focus:
- ownership/scope
- PII boundary
- duplicate/merge
- follow-up SLA
- public lead idempotency

### BO-007 — Sales

Golden journey:

`Opportunity → Offer → Approval → Reservation → Contract`

Special focus:
- discount thresholds
- approval chain
- reservation concurrency
- state-machine legality

### BO-008 — Finance

Golden journey:

`Payment plan → due → receipt → allocation → commission → ledger`

Special focus:
- integer money
- immutable postings
- balanced entries
- duplicate payment protection
- period close

### BO-009 — Studio / Publishing

Golden journey:

`Draft → Review → Publish → public page → CTA → attributed lead`

Special focus:
- versioning
- rollback as new version
- content sanitization
- public/private boundary
- media lifecycle

### BO-010 — Sales Representative / People capability

**Dependency:** `docs/architecture/SALES-REPRESENTATIVE-HR-LIFECYCLE.md`

Sequence:

`Demand → Candidate → Application → Interview/Assessment → Offer → Acceptance → Preboarding → Hire → Onboarding → Active → Leave/Transfer/Promotion/Suspension → Offboarding → Termination`

Special focus:
- employee vs user identity
- employment vs access state
- sales assignment history
- handover on leave/offboarding
- compensation/commission separation
- restricted HR data
- authorization independence

Do not implement missing HR policy by assumption.

### BO-011 — Documents

Govern:
- version
- ownership
- classification
- access
- retention
- expiry
- generated vs uploaded distinction

### BO-012 — Integrations

All integrations must be adapters.

Require:
- credential isolation
- signature verification
- replay protection
- idempotency
- retry/dead-letter
- rate limits
- provider failure handling
- observability

### BO-013 — Workflow engine

Workflow is orchestration, not business truth.

Domain commands own business state. Workflows call commands and react to events.

Required:
- durable execution state
- retries
- compensation where applicable
- approval steps
- timeout/expiry
- idempotency
- audit

### BO-014 — Analytics

Separate:
- operational truth
- derived projections
- analytical aggregates
- forecasts

Analytics must never silently become a write authority for operational data.

### BO-015 — AI operating layer

AI capabilities are classified:

1. read-only insight
2. recommendation
3. workflow initiation
4. governed command execution

Higher levels require progressively stronger authorization/evidence.

AI must never receive implicit `ALL` scope merely because the human invoking it has broad access.

### BO-016 — Reliability and scale

Only after correctness is proven.

Cover:
- query budgets
- indexes
- caching
- queue backpressure
- load shedding
- rate limiting
- projections
- SLOs
- RPO/RTO
- restore drills
- cost budgets

## 6. Cross-cutting engineering orders

These run alongside domain work when their prerequisites are met:

- **SEC-001:** tenant-negative tests
- **SEC-002:** object/property authorization
- **SEC-003:** public/private exposure audit
- **SEC-004:** webhook verification/replay
- **SEC-005:** secret/credential boundary
- **DATA-001:** classification/retention
- **DATA-002:** migration expand/contract
- **OBS-001:** trace/correlation/logging
- **OBS-002:** business probes/outbox lag
- **UX-001:** accessibility baseline
- **UX-002:** RTL/LTR baseline
- **UX-003:** golden journey visual validation
- **PERF-001:** server/client budget enforcement
- **QA-001:** seeded-defect gate testing

## 7. Autonomous task selection algorithm

When Claude is authorized to continue independently:

1. list all READY build orders
2. discard orders whose prerequisites are not green
3. rank by P0 → P1 → P2
4. within priority, choose the dependency that unblocks the most downstream work
5. prefer a vertical slice over isolated CRUD
6. execute until DONE or escalation trigger
7. update evidence/state
8. repeat

This prevents Claude from spending days polishing a low-risk UI while a P0 authorization or concurrency defect remains unresolved.

## 8. Evidence standard

Every completed order must answer:

- What contract was implemented?
- What exact behavior was tested?
- What negative behavior was tested?
- What security boundary was proven?
- What concurrency/retry behavior was proven?
- What migration evidence exists?
- What UI evidence exists?
- What observability exists?
- What remains OPEN?

## 9. Stop-the-line conditions

Stop all downstream work if any of these are observed:

- tenant isolation failure
- unauthorized protected-route access
- two winners for one reservable unit
- unbalanced financial posting
- duplicate non-idempotent mutation
- audit record can be silently rewritten
- event emitted without durable state mutation when contract requires atomicity
- migration cannot be safely rolled back/forward under the approved strategy
- AI can bypass authorization
- public endpoint exposes restricted/private data
- critical accessibility failure on a golden journey
- production reality is unknown where correctness depends on it

## 10. Relationship to founder decisions

Founder decides **what the business means**.

Claude decides **how to implement an already-decided meaning safely**.

When the meaning is missing, Claude records the gap and stops only the dependent work; it may continue unrelated READY work.

## 11. Completion model

The project is not “built” when modules exist. It is built when the chain is proven:

`contract → command → authorization → invariant → transaction → state → audit/outbox → projection → UX → evidence`

That chain is the minimum unit of trustworthy ASAS engineering.
