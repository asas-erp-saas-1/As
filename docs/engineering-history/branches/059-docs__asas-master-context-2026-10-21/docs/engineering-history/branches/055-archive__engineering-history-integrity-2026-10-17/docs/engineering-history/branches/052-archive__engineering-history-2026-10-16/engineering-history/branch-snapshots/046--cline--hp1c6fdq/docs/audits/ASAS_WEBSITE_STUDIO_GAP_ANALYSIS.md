# ASAS Website Studio Gap Analysis

**Repository:** `asas-erp-saas-1/As`  
**Branch:** `platform-architecture-2026`  
**HEAD:** `a9fdfdfe16864881b47b6ec1e8712a3124fdb9dd`

## Scope

This is an audit of what exists in the canonical `As` repository. It does not treat the separate `Asas-website` repository or `asas-web-site` Supabase project as ASAS-OS implementation evidence.

The existing repository audit explicitly states that `Asas-website` and `asas-web-site` are separate/unrelated for this architecture workstream.

## Studio target

Architecture V3 reserves a Website Studio capable of:

`Pages + Templates + Sections + Components + Theme + CMS + Media + SEO + Localization + Forms + Domains + Preview + Publishing + Versions + Analytics + AI Website Builder`

The Studio must share canonical ASAS domain data with CRM/ERP rather than creating duplicated property truth.

## Capability matrix

| Studio capability | Current `As` evidence | Classification | Required production proof |
|---|---|---|---|
| Site Pages | no runtime/page model | MISSING | CRUD + revisions + tenant scope |
| Templates | no implementation | MISSING | template inheritance/instantiation tests |
| Sections | no implementation | MISSING | section schema + renderer |
| Components | design inventory only, no Studio runtime | SCAFFOLDED | component registry + rendering |
| Theme | design tokens exist | SCAFFOLDED | tenant/site theme persistence + renderer |
| CMS | no CMS runtime | MISSING | content model + editor + publication |
| Media | architecture mentions media; no Studio runtime | SCAFFOLDED | secure tenant-aware storage |
| SEO | project/unit SEO fields exist in source semantics | SCAFFOLDED | rendered metadata/canonical/robots/sitemap |
| Localization | Arabic/French/English target documented | SCAFFOLDED | locale fallback + RTL/LTR tests |
| Forms | no public-form runtime | MISSING | lead/form submission + abuse controls |
| Domains | no implementation | MISSING | domain verification + routing |
| Preview | no runtime | MISSING | isolated draft preview |
| Publishing | no runtime | MISSING | atomic publish + audit + rollback |
| Versions | no revision runtime | MISSING | immutable revision history |
| Analytics | event catalog exists | SCAFFOLDED | tenant-safe analytics collection |
| AI Website Builder | no implementation | MISSING | proposal→policy→authorized transaction |

## What the current repository actually contains

### Architecture

The Blueprint defines the Studio as part of the Experience/Product platform and requires shared canonical domain data.

### Design system

`design/design-tokens.json` and `design/component-inventory.md` exist.

These are **design-system artifacts**, not a Website Studio implementation.

### Data contracts

The source schema observations include project/unit content and SEO-related fields. This establishes data vocabulary, not a page builder.

### Event/permission registers

The repository contains derived event and permission registers. These do not prove Studio runtime behavior.

## Critical architectural boundary

Website Studio must not become a second property database.

The canonical flow should be:

`ASAS Domain Data → Studio Content/Presentation Layer → Public Site`

not:

`Studio-owned Projects/Units → separate ERP truth`

The Studio therefore depends on verified canonical Project/Building/Unit ownership, tenancy, media and publication semantics.

## Minimum Studio V1 after internal production

Do not build the full Shopify/Zillow/WooCommerce-level Studio before the ERP core is proven.

The smallest public-capable Studio slice is:

1. Site record linked to tenant/workspace.
2. Project/unit content read models.
3. Page model with draft/published status.
4. Small component/section registry.
5. Theme tokens.
6. Secure media references.
7. Arabic/French/English content support.
8. SEO metadata.
9. Preview.
10. Atomic publish + revision.
11. Lead form → canonical Lead intake.
12. Basic analytics.
13. Domain mapping only when deployment/runtime identity is stable.

Defer:
- AI autonomous page mutation;
- marketplace/app ecosystem;
- advanced visual editor;
- multi-region publishing;
- complex workflow automation;
- enterprise multi-site orchestration.

## Studio production gates

Before public launch:

- tenant isolation test;
- draft/published isolation;
- revision rollback test;
- unauthorized publish rejection;
- secure media access;
- XSS/content sanitization;
- form abuse/rate limiting;
- SEO render test;
- localization/RTL test;
- domain routing test;
- analytics tenant-scope test;
- public smoke test;
- rollback rehearsal.

## Conclusion

**Website Studio implementation status: MISSING in the canonical `As` repository.**

The repository has architectural and design groundwork, but there is no evidence of a functioning Studio. The separate website project must not be silently imported into this architecture audit until repository/runtime identity is explicitly reconciled.
