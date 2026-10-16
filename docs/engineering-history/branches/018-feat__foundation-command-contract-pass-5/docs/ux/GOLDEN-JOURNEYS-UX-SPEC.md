# ASAS Real Estate OS — Golden Journeys UX Specification

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.

## 1. UX contract

Every important workflow is specified as:

`Persona → Job → Entry → Screens → States → Permission → Command → Domain event → Feedback → Next best action → Exit`

The screen is not the source of truth; the domain command is.

## 2. Golden journeys

### J1 — Executive portfolio overview
**Persona:** Direction/CEO
**Job:** understand inventory, pipeline, collections and exceptions quickly.
**Experience:** executive overview → KPI/drill-down → exception queue → owner/action → underlying record.
**States:** loading, partial data, empty, stale, error, unauthorized.

### J2 — Commercial lead qualification
**Persona:** Commercial
**Job:** turn a new lead into a qualified opportunity.
**Experience:** lead queue → lead profile → qualification → source/UTM → owner → next activity → WhatsApp/contact action.
**Must preserve:** tenant, attribution, audit and lifecycle state.

### J3 — Schedule and complete visit
**Persona:** Agent/Commercial
**Job:** schedule a visit without calendar conflict and record outcome.
**Experience:** lead/opportunity → availability → appointment → confirmation → visit outcome → next action.
**Failure:** external calendar unavailable must not silently erase the internal appointment truth.

### J4 — Inventory search and unit detail
**Persona:** Commercial
**Job:** find a sellable unit and understand why it is/is not actionable.
**Experience:** project/building/unit table → filters → unit drawer/page → floor plan/media → price → commercial/construction state → allowed actions.

### J5 — Reservation race
**Persona:** Commercial + approver
**Job:** reserve an eligible unit safely.
**Experience:** unit → reservation request → approval/eligibility → hold/reservation → countdown/expiry → payment plan → audit timeline.
**Critical:** losing a concurrency race must be explicit and recoverable; never show a false success.

### J6 — Contract to collection
**Persona:** Accounting/Finance
**Job:** understand contractual obligation and collected balance.
**Experience:** contract → schedule → due item → receipt → allocation → balance → ledger/reconciliation.
**Critical:** posted financial facts cannot be edited through the UI.

### J7 — Studio publish
**Persona:** Publisher/Manager
**Job:** publish a project/unit page safely.
**Experience:** page tree → section editor → responsive preview → SEO/CTA/form bindings → draft save → preview → approval → publish → version history.
**Critical:** published version and rollback semantics are visible.

### J8 — Public project/unit conversion
**Persona:** prospective buyer
**Job:** understand property and request action.
**Experience:** project/unit page → media/floor plan → contextual CTA → lead form/WhatsApp → consent → confirmation.
**Must carry:** project/unit/source/campaign/UTM/landing-page/session context where available.

### J9 — Marketing attribution
**Persona:** Marketing
**Job:** connect spend to qualified leads and conversions.
**Experience:** campaign → source/UTM → leads → attribution touches → conversion → spend/ROI view.

### J10 — User/permission administration
**Persona:** Administrator/Manager
**Job:** grant the least privilege needed and understand effective access.
**Experience:** organization tree → user → roles/grants → scope → effective permissions → audit history → revoke.
**Critical:** effective permission explanation must reflect deny overrides and scope rules.

### J11 — Integration recovery
**Persona:** Administrator/Operations
**Job:** understand and recover a failed provider delivery.
**Experience:** integration → delivery queue → failed event → reason → retry/replay policy → result → audit.

### J12 — Post-sale/SAV
**Persona:** SAV/Post-sale
**Job:** manage a customer issue against the correct contract/unit context.
**Experience:** customer → contract/unit → issue → assignment → SLA/task → resolution → history.

## 3. Universal screen-state matrix

Every critical screen must explicitly design:

`loading | skeleton | populated | empty | filtered-empty | error | no-permission | stale | offline/dependency-degraded where relevant | destructive-confirmation | success`

No critical action may rely on color alone. Error states must explain what happened, whether the operation committed, and what the user can safely do next.

## 4. Enterprise interaction rules

- Preserve filters and user orientation across route/drawer transitions.
- Use progressive disclosure for complex reservation/finance workflows.
- Prefer side panels for contextual inspection when it avoids losing table position.
- Long tables use server-side filtering/pagination and virtualization where required.
- Keyboard navigation is a first-class path.
- Focus is moved deliberately after modal/drawer transitions and restored on close.
- Destructive/irreversible actions require explicit confirmation and explain consequences.
- Optimistic UI is forbidden for mutations whose correctness depends on server-side race/invariant outcomes unless the UX clearly reconciles the authoritative result.

## 5. Responsive and localization contract

Critical journeys are reviewed at 360–430, 768–1024 and 1280–2560 widths. `ar-DZ` is primary RTL; French/English are LTR. Reusable layout uses logical properties, not physical left/right assumptions.

Arabic is designed, not merely translated. Mixed identifiers, phone numbers, codes and property references must remain legible with appropriate bidirectional isolation.

## 6. Figma handoff contract

For each critical journey, Figma should contain:

- approved flow map;
- screen/frame identifiers;
- component/variant mapping;
- token references;
- responsive variants;
- RTL counterpart where applicable;
- interaction states;
- content examples representative of production density;
- error/empty/no-permission states;
- annotations for business rules that cannot be inferred visually.

Claude must use the selected Figma design context when implementing a Figma-derived screen and must perform rendered visual comparison afterward.

## 7. UX acceptance

A journey is accepted only when the happy path and critical failure paths are demonstrated, authorization is correct, state feedback is unambiguous, accessibility is validated, Arabic/RTL behavior is reviewed, responsive behavior is acceptable, and the resulting UI remains faithful to the approved design-system contract.
