# C03 Source Reconciliation Queue

Status: `OPEN`

This queue is the working control list for reconciling previously produced C03 material before closure.

## Queue

### 1. Real Estate resource model
- Verify Project, Building, Floor, Unit semantics against current V3.
- Confirm identity, ownership, tenancy, lifecycle, invariants, actions, events, and permissions.
- Status: `OPEN`

### 2. Project / Building / Floor / Unit research
- Reconcile research findings with canonical contracts and current architecture.
- Identify stale or superseded conclusions.
- Status: `OPEN`

### 3. Listing / Mandate / Property branch
- Confirm brokerage semantics remain separate from developer/project inventory semantics.
- Confirm handoff into commercial model.
- Status: `OPEN`

### 4. Reservation / Hold / concurrency
- Verify the one-active-winner invariant and its relationship to C05 Sales.
- Confirm database, transaction, idempotency, expiration, audit, and outbox requirements.
- Status: `OPEN`

### 5. Persistence provenance
- Current runtime reality is separately recorded.
- Historical deleted/removed persistence artifacts are not yet proven absent.
- Status: `OPEN`

### 6. Cross-domain C03–C06 evidence
- Classify shared research as cross-domain evidence rather than assigning it to C03 by filename.
- Reconcile Finance and Sales dependencies without closing C03 prematurely.
- Status: `OPEN`

### 7. Red-team review
- Attack identity, tenancy, lifecycle, concurrency, data integrity, authorization, auditability, and AI authority assumptions.
- Status: `NOT STARTED`

### 8. Independent closure review
- Must be performed after the reconciliation queue is materially complete.
- Closure is allowed only if no blocking contradiction remains and evidence is archived.
- Status: `NOT STARTED`

## Closure rule

C03 is not closed by completion of documentation. It closes only after source reconciliation, contradiction resolution, red-team review, and independent closure review satisfy the project governance rules.
