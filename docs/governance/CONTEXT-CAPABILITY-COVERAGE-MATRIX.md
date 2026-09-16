# ASAS Context / Capability Coverage Matrix

Status: FOUNDATION WORKING CONTRACT — PRE-IMPLEMENTATION

This matrix is deliberately a coverage control, not a claim that every capability is already fully specified. A capability remains BLOCKED until its owner, contract, permissions, states, events, data boundary, and verification evidence exist.

| Capability family | Owner | Contract | Permission | State | Events | Data boundary | Verification | Status |
|---|---|---|---|---|---|---|---|---|
| Identity & access | Identity | Required | Required | Required | Required | Tenant-aware | Required | OPEN |
| Tenancy / organizations | Tenancy | Required | Required | Required | Required | Hard isolation | Required | OPEN |
| Promoters / client organizations | Organizations | Required | Required | Required | Required | Tenant-scoped | Required | OPEN |
| Projects / buildings / units | Real Estate | Required | Required | Required | Required | Tenant-scoped | Required | OPEN |
| Inventory availability | Real Estate | Required | Required | Required | Required | Tenant-scoped | Concurrency required | OPEN |
| Leads / contacts | CRM | Required | Required | Required | Required | Tenant-scoped | Required | OPEN |
| Opportunities / pipeline | CRM | Required | Required | Required | Required | Tenant-scoped | Required | OPEN |
| Activities / visits | CRM | Required | Required | Required | Required | Tenant-scoped | Required | OPEN |
| Options | Sales | Required | Required | Required | Required | Inventory boundary | Idempotency + concurrency | OPEN |
| Reservations | Sales | Required | Required | Required | Required | Inventory + tenant | Idempotency + concurrency | OPEN |
| Contracts / VSP / legal | Contracts | Required | Required | Required | Required | Tenant-scoped | Legal workflow tests | OPEN |
| Receivables / payment | Finance | Required | Required | Required | Required | Tenant-scoped | Ledger integrity | OPEN |
| Accounting | Finance | Required | Required | Required | Required | Tenant-scoped | Double-entry invariants | OPEN |
| Construction / delivery | Project Ops | Required | Required | Required | Required | Tenant-scoped | Workflow tests | OPEN |
| SAV / after-sales | After-sales | Required | Required | Required | Required | Tenant-scoped | SLA/workflow tests | OPEN |
| Website / CMS | Digital Experience | Required | Required | Required | Required | Publishable projection | E2E + preview | OPEN |
| Marketing / attribution | Marketing | Required | Required | Required | Required | Tenant-scoped | Attribution tests | OPEN |
| Calendar / communications | Engagement / Integrations | Required | Required | Required | Required | Tenant-scoped | Retry/reconciliation | OPEN |
| External integrations | Integration Boundary | Required | Required | Required | Required | Provider IDs internalized | Contract + retry tests | OPEN |
| Documents | Documents | Required | Required | Required | Required | Tenant-scoped | Access/audit tests | OPEN |
| Audit / governance | Governance | Required | Required | Required | Required | Append-only semantics | Tamper/evidence tests | OPEN |
| Reporting / analytics | Analytics | Required | Required | Required | Required | Read-model boundaries | Metric contract tests | OPEN |

## Coverage rule

A row cannot become READY merely because a table or UI exists. READY requires traceability from business intent through command/state/event/permission/data and into executable verification.

## Cross-context rule

If a capability crosses two or more bounded contexts, the matrix must identify the authoritative owner and the contract used at the boundary. Shared database tables are not, by themselves, a valid ownership model.

## Completion states

- OPEN: identified, not fully reconciled.
- READY: contract and dependencies reconciled; implementation may be scheduled.
- IMPLEMENTING: active bounded task exists.
- VERIFYING: implementation exists and evidence is being collected.
- CLOSED: acceptance evidence and traceability are complete.
- BLOCKED: a hard conflict, missing authority, security issue, or unresolved prerequisite prevents safe implementation.
