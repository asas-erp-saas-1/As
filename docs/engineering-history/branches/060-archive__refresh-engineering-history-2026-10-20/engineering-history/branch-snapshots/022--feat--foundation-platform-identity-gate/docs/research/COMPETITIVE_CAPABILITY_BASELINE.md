# Competitive Capability Baseline — Initial Research

**Date:** 2026-09-14
**Status:** Initial research; not a feature-copy specification.

## Odoo

Odoo demonstrates the value of an integrated suite: website builder, CRM, sales, accounting, inventory, appointments and other business apps share a platform. Its website tooling includes responsive editing, SEO, analytics, social integration, forms and integrations; its real-estate positioning combines listings, CRM, appointments, documents, sales and finance. This validates ASAS's desire for one connected system, but ASAS should specialize the model around real-estate inventory and the property-to-sale lifecycle rather than reproduce generic ERP modules. [Official sources: Odoo Website, Website Features, Real Estate Agency]

## HubSpot

HubSpot's current platform combines marketing, sales, service, content and data management around a shared CRM. Its official material emphasizes a single customer source of truth, automation, lead scoring, reporting and AI assistance. This supports making ASAS's CRM event/history layer central and connecting marketing activity directly to revenue and property context. [Official sources: HubSpot CRM and Products]

## Zoho

Zoho CRM currently emphasizes stage-enforced processes, multichannel communication including WhatsApp/social/email/SMS, automation, analytics, AI and teamspaces for non-sales functions. This supports a role-specific workspace model in ASAS: users should get the tools required for their task without exposing unrelated operational complexity. [Official source: Zoho CRM documentation]

## Oracle Fusion

Oracle's current Fusion positioning emphasizes unified enterprise data across finance, projects, procurement, risk, sales, service and marketing, with governance, permissions, workflows and AI/agentic capabilities operating over governed enterprise context. This supports ASAS's long-term direction toward an integrated operational system rather than isolated apps. [Official sources: Oracle Fusion Applications, ERP Finance, Oracle CX/AI]

## ASAS differentiation derived from the research + source package

The strongest pattern is not "more modules." It is **connected context**:

**Property context + customer context + commercial context + financial context + marketing context + operational permissions + audit context**.

ASAS should make that connection native to the real-estate lifecycle. For example, an apartment page should not merely generate a lead: the lead should retain the exact project/unit/campaign/session context, enter the CRM, become an opportunity, reserve the same canonical unit, generate contractual/payment obligations, and later feed revenue/collection/commission/analytics views.

The uploaded ASAS package already points in this direction through the shared inventory model, event catalog, Studio, marketing attribution, reservations, finance and audit contracts. The founder's new direction strengthens it by making the public Studio and enterprise operating system one product rather than separate projects.

## Research caveat

This document records capability observations from official product sources and the uploaded ASAS specification. It does not claim that ASAS can or should reproduce every feature of these products. Detailed parity/capability mapping will be performed before the corresponding architecture or implementation phase.
