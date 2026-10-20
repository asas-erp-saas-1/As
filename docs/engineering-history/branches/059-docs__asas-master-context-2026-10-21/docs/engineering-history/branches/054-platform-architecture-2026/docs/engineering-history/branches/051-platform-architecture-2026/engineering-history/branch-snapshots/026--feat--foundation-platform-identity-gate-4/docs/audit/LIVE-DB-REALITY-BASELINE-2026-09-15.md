# ASAS — Live DB Reality Baseline — 2026-09-15

**Status:** EVIDENCE / P0 / foundation-gating  
**Repository:** `asas-erp-saas-1/As`  
**Branch under review:** `feat/foundation-command-registry`  
**Environment inspected:** connected Supabase project `asas-web-site`  
**Database:** PostgreSQL 17 (GA; reported engine version 17.6.1.127)

## 1. Scope

This is a read-only reality inspection performed before any B.6 schema/application implementation. No DDL, DML, migration, deployment, branch creation, reset, or production mutation was performed.

## 2. Live public schema

The current `public` schema contains 19 application tables:

- `projects`
- `apartments`
- `media`
- `leads`
- `seo`
- `analytics_events`
- `admin_profiles`
- `developers`
- `project_amenities`
- `newsletter_subscriptions`
- `buildings`
- `project_images`
- `apartment_images`
- `site_content`
- `admin_users`
- `admin_sessions`
- `videos`
- `lead_notes`
- `audit_logs`
- `login_rate_limits`

The connected database also contains Supabase-managed schemas (`auth`, `storage`, `realtime`, `vault`, `cron`, `pgmq`, `supabase_migrations`). Those are platform infrastructure, not ASAS B.6 domain ownership.

## 3. Critical B.6 reality finding

**No B.6 reservation/hold/payment/finance/outbox/inbox domain tables are present in the inspected live database.**

In particular, the live `public` table inventory contains no authoritative tables named or evidently dedicated to:

- reservations
- holds
- payment intents/payments
- receipts
- refunds
- payment allocations
- ledger/journal entries
- accounting periods
- commissions
- outbox
- inbox/webhook deduplication
- external payment mappings

Therefore the current live database cannot be used as evidence that the B.6 target model already exists in production.

This is a major foundation boundary: the Blueprint/register contract is currently ahead of the live database for B.6.

## 4. Existing inventory reality

`public.apartments` exists and currently has 8 rows. Its current columns include:

- `id` UUID primary key
- `project_id` UUID
- `building_id` UUID nullable
- `apartment_number`
- `unit_number`
- `price` numeric
- `status` text default `AVAILABLE`
- publication/media/catalog fields

RLS is enabled.

`public.projects` exists with 7 rows and references apartments/buildings/leads/media/analytics through foreign keys. RLS is enabled.

`public.buildings` exists with 3 rows and references projects; apartments reference buildings. RLS is enabled.

### B.1/B.6 consequence

The live `apartments.status` field is a text status with a default, but the live schema does not demonstrate enforcement of the canonical B.1 transition graph or B.6 single-winner reservation semantics. The presence of a status column must **not** be treated as proof of state-machine enforcement.

## 5. Existing CRM reality

`public.leads` exists with 4 rows. It contains project/apartment references and a text `status` defaulting to `NEW`, plus attribution and assignment fields.

This is useful evidence for existing website/CRM seed reality but does not establish the canonical B.3/B.4 state machines or the full tenant/authorization model required by the Blueprint.

## 6. Existing audit reality

`public.audit_logs` exists with 86 rows and fields including actor email/role, action, entity type/id/slug, before/after JSONB, IP address, user agent and timestamp.

This table is **not** evidence of the canonical tamper-evident audit chain required by the foundation contract. It has no demonstrated hash-chain/version/causation/correlation contract in this inspection.

Do not retrofit B.6 assumptions into this table without explicit schema/reality reconciliation.

## 7. Existing authentication/admin reality

The live database contains:

- `public.admin_users` — 2 rows, email/password-hash/role/active fields.
- `public.admin_sessions` — 4 rows, token/user/session fields.
- `public.admin_profiles` — 0 rows, FK to `auth.users`.

This confirms that the current deployed database still contains an existing website/admin authentication surface alongside Supabase Auth infrastructure. It does not prove conformance with the canonical ASAS identity/tenant/role/grant kernel.

## 8. RLS reality

All inspected public application tables report RLS enabled.

Supabase security advisors additionally report 13 public tables with RLS enabled but no RLS policies, including `admin_users`, `admin_sessions`, `apartments` media/catalog tables, `audit_logs`, `buildings`, `developers`, `leads` notes and platform-content tables.

This is a security finding for the existing website schema and reinforces the foundation rule that RLS must be verified at the data layer rather than inferred from the RLS-enabled flag.

No remediation was applied during this read-only inspection.

## 9. Current migration history

The connected project reports migrations through:

- `20260912005029 align_publication_defaults`

Earlier migrations include catalog/core creation, Prisma alignment, public RLS hardening, CRM/catalog indexes, admin bootstrap and login/session contract fixes.

The migration history therefore describes an evolving website/catalog schema, not an implemented B.6 finance/reservation kernel.

## 10. Security advisor evidence

Current security advisor findings include:

1. **13 × RLS enabled with no policy** — INFO/EXTERNAL.
2. **Vector extension in public schema** — WARN/EXTERNAL.
3. **Leaked password protection disabled** — WARN/EXTERNAL.

Performance advisor retrieval failed with a Supabase MCP network error during this inspection. No performance conclusion is drawn from that failed call.

## 11. B.6 reconciliation result

| Contract area | Live DB evidence | Status |
|---|---|---|
| Apartment inventory root | `public.apartments` exists | PRESENT / legacy reality |
| Canonical B.1 enforcement | not demonstrated | OPEN |
| Reservation aggregate | absent | BLOCKED |
| Hold identity/version | absent | BLOCKED |
| Payment/deposit aggregate | absent | BLOCKED |
| Receipt/allocation | absent | BLOCKED |
| Refund workflow | absent | BLOCKED |
| Ledger/journal | absent | BLOCKED |
| Accounting period | absent | BLOCKED |
| Outbox | absent | BLOCKED |
| Inbox/webhook dedup | absent | BLOCKED |
| External payment mapping | absent | BLOCKED |
| Canonical tenant boundary | not demonstrated in inspected public schema | BLOCKED |
| Tamper-evident audit chain | not demonstrated | BLOCKED |
| B.6 concurrency constraints | not demonstrated | BLOCKED |

## 12. Architectural conclusion

The live database is currently a **website/catalog/CRM-adjacent production reality**, not the completed ASAS Real Estate OS kernel described by Blueprint v1.6.1.

That distinction is now evidence-backed.

The correct next step is **not** to infer B.6 tables from the current website schema and not to patch reservation logic into `apartments.status` alone. The B.6 domain must be introduced through the contract-first path after its remaining business/legal/finance decisions are closed and after the production migration strategy is explicitly designed around existing data.

## 13. Migration/reality implications

Any future B.6 implementation must account for:

- existing apartment/project/building rows;
- existing `apartments.status` values;
- existing RLS policies and policy gaps;
- existing audit log semantics;
- existing admin authentication surface;
- coexistence with Supabase Auth;
- expand/contract migration safety;
- backfill and invariant validation before activation;
- rollback/forward-fix strategy.

No destructive rewrite of the existing catalog is authorized by this artifact.

## 14. Foundation gate update

**B.6 remains implementation-blocked.**

The live DB inspection has closed one major unknown: the B.6 domain is not already present in the connected production database.

The next closure work should therefore focus on:

1. reconcile the Blueprint B.6 conceptual model against the actual repository schema/registers;
2. close exact B.6 command/event identities;
3. close finance policy decisions that affect deposit/refund/posting;
4. define the provider-neutral payment intent/external payment contract;
5. define the migration-safe aggregate/constraint strategy;
6. only then produce an implementation-ready schema/migration design.

**No production database change was made by this inspection.**
