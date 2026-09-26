# Roadmap Amendment 010 — Engineering Conference Path

**Date:** 2026-09-25
**Status:** ACTIVE / CANONICAL AMENDMENT
**Parent:** `docs/architecture/ASAS-ARCHITECTURE-ENGINEERING-ROADMAP-2026.md`
**Companion:** `docs/architecture/ASAS-ENGINEERING-CONFERENCE-PATH-2026.md`

## Purpose

Synchronize the main architecture roadmap with the founder-approved engineering conference decisions and establish the conference as the controlled semantic closure track before implementation authorization.

## Decisions incorporated

1. ASAS is designed as a broad Real Estate Operating System with future SaaS/platform extensibility.
2. The organization model is extensible across Developer, Agency, Brokerage, Property Manager, Investor, Construction Company, Real Estate Marketing Company and future organization types.
3. Initial commercial focus is Developer + Agency + Brokerage.
4. Organization is the business principal.
5. Developer remains authoritative owner/controller of its Project and Inventory resources.
6. Agency/Developer collaboration is represented by a first-class Organization Relationship.
7. Collaboration boundary is **Hybrid D**: Organization Relationship + Project context + Resource Scope. A separate Collaboration Space is reserved, not required.
8. Partner performance visibility is **Hybrid E**: useful project-level performance is visible to the Developer by configurable policy; Agency-private data remains private by default.
9. Employee authorization is **Hybrid D**: organization relationship + team/role scope + project assignment + individual exception.
10. `Visibility follows responsibility` is a canonical UX/security principle.
11. Workspace is an operational/UX container, not an automatic security boundary.
12. Branch is an organizational subdivision, not an automatic tenant/database boundary.
13. Codex is the primary engineering executor; Claude/Figma is the design collaboration path.
14. v1.6.1 is research/provenance input for the lead architect, not implementation authority for coding agents.

## New conference sequence

The roadmap now uses the Engineering Conference Path as the semantic closure workstream:

`C01 Constitution → C02 Organization/Collaboration → C03 Real Estate → C04 CRM → C05 Sales → C06 Finance → C07 Marketing → C08 Studio → C09 Analytics → C10 Documents → C11 Scheduling → C12 Workflow → C13 Integrations → C14 Search/Media/Notifications → C15 Security/Tenancy → C16 Data → C17 Events/Outbox → C18 AI → C19 Design → C20 Codex Engineering → C21 Runtime/Operations → C22 SaaS Evolution`

These are workstreams, not bounded contexts.

## Immediate queue after C02

`Lead Ownership → Assignment → Attribution → Project Inventory Access → Reservation Attribution → Commission Semantics → Developer/Agency Performance Read Models`

## Synchronization rule

When a conference item closes, update the applicable PRD, architecture amendment/baseline, contract/ADR/register, roadmap, checkpoint, and agent context. If no artifact requires a change, record that explicitly in the conference decision log.

## Reopening rule

Any closed decision is reopened when stronger authority, runtime evidence, security/concurrency evidence, legal research, or implementation evidence contradicts its assumptions. The prior decision remains historical; supersession is explicit.

## Gate consequence

No conference decision authorizes code or database mutation by itself. Implementation still requires the applicable architecture/data/security/test/migration/rollback gates to be GREEN.
