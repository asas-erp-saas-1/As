# ASAS Architecture Implementation Matrix

**Repository:** `asas-erp-saas-1/As`  
**Branch:** `platform-architecture-2026`  
**HEAD:** `a9fdfdfe16864881b47b6ec1e8712a3124fdb9dd`  
**Target:** ASAS Architecture V3 / Platform Architecture Blueprint v1.5.0

## Classification legend

- **IMPLEMENTED** — executable implementation exists and evidence can be inspected.
- **PARTIAL** — some executable or contract evidence exists, but the requirement is incomplete.
- **SCAFFOLDED** — architecture/register/contract exists, runtime enforcement does not.
- **MISSING** — required implementation/artifact is absent.
- **CONTRADICTORY** — current evidence conflicts.
- **UNVERIFIED** — cannot be proven from available evidence.

## Matrix

| Architecture requirement | Target | Current repository reality | Classification | Evidence / path | Required proof |
|---|---|---|---|---|---|
| Modular monolith | One deployable with explicit internal boundaries | Only architecture docs | SCAFFOLDED | `docs/architecture/ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT-2026.md` | executable module map + build |
| Experience plane | Public/operations/mobile/API surfaces | No app tree | MISSING | repository tree | running app |
| Application/Decision plane | commands, queries, policies, workflows | no implementation | MISSING | repository tree | executable services |
| Domain plane | governed domain ownership | contracts/registers only | SCAFFOLDED | architecture docs/registers | domain code + tests |
| Platform kernel | identity, tenancy, auth, audit, events, media, notifications | no runtime | SCAFFOLDED | Blueprint | executable kernel |
| PostgreSQL data plane | controlled relational persistence | executable schema/migrations absent | MISSING | `schema/asas-contracts.index.json` only | schema + migration replay |
| Identity | authoritative server identity | absent | MISSING | no application files | auth integration + tests |
| Tenancy | Platform→Org→Workspace→Branch→Membership | target only | SCAFFOLDED | Blueprint §9 | tenant context + isolation tests |
| Authorization | deny-by-default, server-side | permission register only | SCAFFOLDED | `registers/permissions.csv` | policy engine + negative tests |
| RLS | defense-in-depth tenant isolation | canonical DB unknown | UNVERIFIED | no executable DB in repo | pg policies + cross-tenant tests |
| Audit | material mutations auditable | doctrine only | SCAFFOLDED | Blueprint / audit docs | append-only audit path |
| State machines | no arbitrary status setters | 11 registered | SCAFFOLDED | `registers/state-machines.json` | command transition tests |
| Inventory | availability correctness | no implementation | MISSING | repository tree | DB invariants + tests |
| Reservation | lock/reverify/idempotency | logical protocol only | SCAFFOLDED | Unit/Reservation contract | race test + transaction evidence |
| Offer | controlled lifecycle | contract partial | PARTIAL | `ASAS-OFFER-DOMAIN-CONTRACT-2026.md` | closed state/permission/event contract |
| Contract | lifecycle foundations | no implementation | MISSING | repository tree | executable aggregate/service |
| Payment plan | schedule semantics | source contract only | SCAFFOLDED | finance reconciliation | runtime reconciliation tests |
| Receipt | allocation/reconciliation | source semantics only | SCAFFOLDED | finance reconciliation | runtime receipt/allocation |
| Ledger | immutable double-entry where authorized | no implementation | MISSING | architecture only | ledger invariants + reversal tests |
| Idempotency | critical commands safe to retry | no implementation | MISSING | repository tree | duplicate-command tests |
| Transactions | aggregate mutation atomicity | no app | MISSING | repository tree | DB transaction evidence |
| Outbox | atomic event intent | architecture only | SCAFFOLDED | Blueprint / event register | outbox schema + consumer tests |
| Events | 103 source-derived event contracts | register only | SCAFFOLDED | `registers/events.json` | runtime producers |
| API | authenticated/authorized/versioned | no API | MISSING | repository tree | route inventory + security tests |
| File/storage security | tenant-aware controlled media | no canonical runtime | MISSING | repository tree | signed/private storage tests |
| Secrets | environment-safe secret handling | no deployment | UNVERIFIED | repository tree | secret provenance audit |
| Logging | structured logs | no runtime | MISSING | repository tree | log evidence |
| Observability | SLI/SLO/runtime telemetry | no runtime | MISSING | Blueprint only | dashboard/alerts |
| Backups | recoverable production data | runtime unknown | UNVERIFIED | no canonical DB identity | backup policy + evidence |
| Restore | tested recovery | no runtime | UNVERIFIED | no canonical DB identity | restore rehearsal |
| CI | repository foundation checks | foundation workflow passes | PARTIAL | `.github/workflows/foundation-verify.yml` | app build/test pipeline |
| CD | application deployment | absent | MISSING | no deployment config | reproducible deploy |
| Automated tests | unit/integration/contract/RLS | absent | MISSING | repository tree | test suite + CI |
| E2E | golden journey | absent | MISSING | repository tree | browser test |
| Performance | measured workloads | absent | UNVERIFIED | no app | load evidence |
| i18n | Arabic/French/English | target only | SCAFFOLDED | Blueprint | executable locale tests |
| RTL/LTR | bi-directional UI | target only | SCAFFOLDED | Blueprint | visual/browser evidence |
| Public website | public runtime | not in `As` | UNVERIFIED | current tree | canonical deployment identity |
| Website Studio | full publishing platform | absent | MISSING | current tree | Studio runtime |
| SEO | metadata/canonical/robots | contract fields only | SCAFFOLDED | source semantics | rendered SEO validation |
| Publishing | controlled publication | no runtime | MISSING | current tree | publish transaction + rollback |
| Versioning | draft/published revisions | no runtime | MISSING | current tree | version model + tests |
| Domains | tenant/site domain management | absent | MISSING | current tree | DNS/domain control path |
| Analytics | event/attribution | source register only | SCAFFOLDED | Blueprint | runtime collection + tenant scope |
| AI Website Builder | governed AI actions | absent | MISSING | current tree | proposal→policy→transaction pipeline |
| SaaS isolation | cross-tenant protection | target only | SCAFFOLDED | Blueprint | adversarial isolation suite |

## Architecture conflicts / open decisions

### C2-001 — contexts vs implementation modules

The current Blueprint supports the nine-context target and explicitly treats the historical 15-module decomposition as proposed implementation evidence. The issue is therefore not a count-ranking problem; the unresolved work is ownership and boundary evidence.

### Scheduling

Current checkpoint marks Scheduling ownership **OPEN / FOUNDER DECISION REQUIRED**. No implementation ownership should be inferred.

### Building

Building contract is open and implementation blocked. Existing live schema evidence from a separate website project must not be imported as ASAS-OS evidence.

### Finance

Source semantics support:

`Contract → PaymentPlan / schedule items → Receipt → ReceiptAllocation → Finance/Ledger where authorized`

No standalone Payment aggregate should be invented solely from the word “Payment” in the lifecycle.

## Promotion rule

A row can move from SCAFFOLDED/UNVERIFIED to IMPLEMENTED only after executable evidence is produced. Documentation edits do not close runtime gates.
