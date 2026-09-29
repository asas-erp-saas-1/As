# ASAS Internal Production Blockers

**Repository:** `asas-erp-saas-1/As`  
**Branch:** `platform-architecture-2026`  
**HEAD:** `a9fdfdfe16864881b47b6ec1e8712a3124fdb9dd`

## Severity model

- **P0:** blocks production, security or data integrity.
- **P1:** blocks internal production.
- **P2:** blocks public V1.
- **P3:** post-launch / scale / advanced capability.

## P0 blockers

### P0-01 — No executable application
- **Path:** repository root; absence of `src/`, package manifest and runtime entry points.
- **Current behavior:** architecture/control-plane artifacts only.
- **Expected:** executable modular-monolith application.
- **Requirement:** Architecture V3 Experience/Application/Domain planes.
- **Risk:** nothing exists to secure, test or deploy.
- **Fix:** establish the minimum executable application foundation.
- **Validation:** clean checkout → install → build/typecheck → boot.

### P0-02 — Canonical runtime identity is not proven
- **Paths:** `docs/audit/LIVE-DB-REALITY-BASELINE-2026-09-15.md`; current connected Supabase inventory.
- **Current behavior:** prior evidence explicitly rejects `asas-web-site`; `Asas platform` exists but is not proven to be the canonical production runtime and currently has 0 public tables / 0 migrations.
- **Expected:** verified GitHub→Supabase→deployment identity.
- **Requirement:** Gate 00 platform identity.
- **Risk:** any schema/security conclusion could target the wrong system.
- **Fix:** prove project/ref/environment/deployment linkage read-only.
- **Validation:** reproducible identity record with non-secret configuration fingerprints.

### P0-03 — Identity/authentication/authorization runtime absent
- **Paths:** no executable auth files in current tree; `registers/permissions.csv` is design evidence only.
- **Current:** 50 permission keys are registered, but no runtime enforcement.
- **Expected:** server-authoritative identity + deny-by-default authorization.
- **Requirement:** Blueprint §9 / AGENTS.
- **Risk:** privilege escalation / unauthorized mutation.
- **Fix:** implement identity, membership, permission and policy evaluation before business mutations.
- **Validation:** positive/negative authorization integration tests.

### P0-04 — Tenant isolation/RLS not executable
- **Paths:** no application schema/migrations; no canonical DB identified.
- **Current:** tenancy/RLS doctrine only.
- **Expected:** tenant context enforced server-side and at DB layer.
- **Risk:** cross-tenant data disclosure/corruption.
- **Fix:** canonical DB identity, tenant schema, RLS policies, worker/service scope.
- **Validation:** adversarial cross-tenant read/write tests.

### P0-05 — Executable schema/migrations absent
- **Paths:** `schema/asas-contracts.index.json`; absent `schema/asas-contracts.prisma`, migrations directory.
- **Current:** source-derived schema index only.
- **Expected:** versioned executable schema with reproducible migration history.
- **Risk:** uncontrolled data model and impossible deployment reproducibility.
- **Fix:** promote/reconcile schema contract only after runtime identity is proven.
- **Validation:** local database migration replay + schema diff + CI.

### P0-06 — Inventory/reservation integrity absent
- **Paths:** `docs/architecture/ASAS-UNIT-RESERVATION-CONSISTENCY-CONTRACT-2026.md`.
- **Current:** approved logical protocol; no executable enforcement.
- **Expected:** atomic reservation command, concurrency protection, idempotency, audit.
- **Risk:** double reservation/sale and irreversible commercial corruption.
- **Fix:** implement database-enforced reservation boundary.
- **Validation:** parallel race tests, retry tests, rollback tests.

### P0-07 — Financial integrity absent
- **Paths:** `docs/architecture/ASAS-COMMERCIAL-FINANCE-SEMANTIC-RECONCILIATION-2026.md`.
- **Current:** semantics partially reconciled; executable receipt/allocation/ledger enforcement absent.
- **Expected:** immutable financial facts, controlled allocation, deterministic money semantics, reversals.
- **Risk:** incorrect balances, untraceable corrections.
- **Fix:** implement only the authorized launch finance path.
- **Validation:** invariant tests, reversal tests, reconciliation fixtures.

## P1 blockers

### P1-01 — Golden Journey not executable
- **Path:** no application source.
- **Current:** lifecycle exists as architecture.
- **Expected:** Lead→Assignment→Activity→Visit→Offer→Reservation→Contract→Payment Plan→Payment→Receipt→Audit.
- **Risk:** no usable internal operating system.
- **Fix:** implement the smallest vertical slice.
- **Validation:** E2E journey with persistent evidence.

### P1-02 — No automated application tests
- **Path:** no `tests/` or application test tree.
- **Expected:** unit, integration, contract, RLS and concurrency tests.
- **Risk:** regressions in high-integrity domains.
- **Fix:** tests before production authorization.
- **Validation:** CI-enforced test suite.

### P1-03 — No E2E suite
- **Path:** repository tree.
- **Expected:** browser-level golden journey.
- **Risk:** UI/API/database integration defects remain invisible.
- **Fix:** one deterministic internal-production E2E journey first.
- **Validation:** clean-environment run in CI.

### P1-04 — Foundation CI is not application CI
- **Path:** `.github/workflows/foundation-verify.yml`.
- **Current:** current HEAD has a successful Foundation Verify run.
- **Expected:** build/typecheck/test/schema/security checks.
- **Risk:** repository can be “green” while application code is broken.
- **Fix:** add application checks when executable tooling exists.
- **Validation:** CI on PR and protected branch.

### P1-05 — Runtime error/logging/observability absent
- **Paths:** no application runtime.
- **Expected:** structured logs, error boundaries, correlation IDs, health checks and SLO evidence.
- **Risk:** incidents cannot be diagnosed.
- **Fix:** minimum operational telemetry.
- **Validation:** forced error and trace through a golden command.

### P1-06 — Backup/restore unverified
- **Paths:** canonical runtime unknown.
- **Expected:** backup policy plus tested restore and integrity verification.
- **Risk:** irreversible data loss.
- **Fix:** establish runtime identity, backup configuration and restore rehearsal.
- **Validation:** restore into isolated environment and reconcile counts/checksums.

### P1-07 — Idempotency/transaction/outbox runtime absent
- **Paths:** architecture docs/registers only.
- **Expected:** transactional mutation + idempotency + durable event intent.
- **Risk:** duplicate reservation/payment/event effects.
- **Fix:** implement reusable command transaction boundary.
- **Validation:** repeated request/retry/crash-window tests.

### P1-08 — Deployment reproducibility absent
- **Paths:** no executable deployment configuration.
- **Expected:** reproducible build/deploy/rollback with environment separation.
- **Risk:** cannot safely promote internal production.
- **Fix:** minimal deployment pipeline after local proof.
- **Validation:** clean deploy from immutable commit.

## P2 blockers

### P2-01 — Website Studio absent
**Path:** repository root.  
**Current:** no Studio runtime.  
**Expected:** pages/templates/sections/components/theme/CMS/media/forms/preview/publishing.  
**Risk:** public V1 cannot be operated as a platform.  
**Fix:** only after internal production core is proven.  
**Validation:** draft→preview→publish→rollback.

### P2-02 — Publishing/versioning absent
**Expected:** controlled draft/published versions and rollback.  
**Validation:** immutable revision test and publication audit.

### P2-03 — Domain management absent
**Expected:** tenant/site domain lifecycle and safe verification.  
**Validation:** staging custom-domain flow.

### P2-04 — Public runtime identity absent
**Expected:** canonical public deployment linked to repository and environment.  
**Validation:** deployment metadata and smoke tests.

### P2-05 — Public CMS/forms/media governance absent
**Expected:** tenant-aware forms/media and secure storage.  
**Validation:** storage authorization and public/private access tests.

### P2-06 — SEO runtime absent
**Expected:** rendered metadata, canonical URLs, robots and sitemap behavior.  
**Validation:** crawl/render assertions.

### P2-07 — i18n/RTL executable validation absent
**Expected:** Arabic/French/English and RTL/LTR with real UI tests.  
**Validation:** browser snapshots/interaction tests at mobile and desktop widths.

## P3 blockers

### P3-01 — Performance evidence absent
Load/workload behavior cannot be measured before executable runtime exists.

### P3-02 — Advanced analytics/telemetry incomplete
Source events exist, but runtime collection, attribution and tenant-safe analytics are absent.

### P3-03 — AI Website Builder absent
Advanced capability; not an internal-production prerequisite.

### P3-04 — Scale/extraction evidence absent
No evidence currently justifies independent deployables, Kafka, Kubernetes, multi-region or microservices.

## Top 10 blockers

1. Executable application absent.
2. Canonical runtime identity unproven.
3. Auth/authorization runtime absent.
4. Tenant isolation/RLS runtime absent.
5. Executable schema/migrations absent.
6. Inventory/reservation correctness absent.
7. Finance integrity runtime absent.
8. Golden Journey not executable.
9. Automated/E2E tests absent.
10. Operational deployment/backup/observability evidence absent.

## Exact execution order

`P0-02 → P0-01 → P0-05 → P0-03 → P0-04 → P0-06 → P0-07 → P1-01 → P1-07 → P1-02 → P1-03 → P1-05 → P1-06 → P1-08`

Do not start Website Studio work before the P0/P1 internal-production gates are GREEN.
