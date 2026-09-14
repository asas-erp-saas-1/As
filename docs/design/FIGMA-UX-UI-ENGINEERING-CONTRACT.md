# ASAS Figma ↔ UX/UI Engineering Contract

**Purpose:** make UX/UI, Figma, design-system engineering and implementation a single controlled workflow for ASAS.

## 1. Source-of-truth hierarchy

1. Founder/product decisions
2. ASAS Blueprint + contracts/registers
3. Approved ADRs
4. ASAS design tokens + component registry
5. Approved Figma design artifacts
6. Implementation
7. Screenshots/rendered runtime evidence

Figma is not allowed to silently redefine domain behavior, authorization, state machines, financial rules or canonical data.

## 2. Figma file architecture

Recommended file structure:

- `00 — Cover / Product Principles`
- `01 — Foundations / Variables`
- `02 — Foundations / Typography`
- `03 — Foundations / Spacing & Layout`
- `04 — Components`
- `05 — Patterns`
- `10 — Public Experience`
- `20 — Studio`
- `30 — Operations`
- `40 — Mobile Field OS`
- `50 — Empty / Error / Permission States`
- `60 — Prototype / Golden Journeys`
- `90 — Archive`

## 3. Variables

Every color, typography, spacing, radius and semantic state used by product UI should resolve to an ASAS token.

Do not create Figma-only values when an equivalent ASAS token exists.

Variable collections should distinguish:

- primitive tokens
- semantic tokens
- component tokens where necessary
- light/dark operation surfaces
- locale/direction-independent layout values

Theme overrides are constrained by the Blueprint: tenant theming may override accent/radius within the approved contract; accessibility floors for surface/text/status remain protected.

## 4. Components

The component registry is governed. Figma components should map to implementation components by stable name/ID/documentation.

Every component should define:

- anatomy
- properties/variants
- states
- size/density variants
- keyboard behavior
- focus behavior
- loading/disabled/error behavior
- RTL mirroring rules
- mobile adaptation
- accessibility semantics
- token dependencies
- implementation mapping

Examples:

`Button / primary / md / loading`
`DataTable / dense / selected`
`Drawer / end / open`
`StatusBadge / warning`
`MoneyInput / DZD / invalid`
`PhoneInput / DZ / RTL`
`UnitStatusTimeline / commercial+construction`

## 5. Screen design contract

Every important screen must include frames for:

- default/data
- loading
- empty first-run
- filtered-empty
- permission denied
- validation error
- server error
- destructive confirmation
- success/confirmation
- long content
- mobile/tablet/desktop where applicable
- Arabic RTL
- French/English LTR

For data-heavy screens also design:

- 25 rows
- 100+ rows
- pagination/filtering
- long names
- long numbers/prices
- missing media
- partial failure

## 6. UX specification before visual polish

For each screen, document:

- primary user persona
- job-to-be-done
- primary outcome
- secondary outcomes
- critical information
- primary CTA
- secondary actions
- dangerous actions
- permission requirements
- navigation entry points
- exit points
- system-generated next action
- analytics events
- failure recovery

## 7. Real-estate UX patterns

### Unit workspace
Header: project/building/unit identity + commercial status + construction status.

Main: key facts, price, surface, floor, typology, availability, media/floor plan.

Secondary: price history, status timeline, holds/reservations, linked leads/opportunities, activity/audit.

Actions must be permission-aware and state-machine-aware.

### Lead workspace
Identity + contact normalization → source/UTM → lifecycle/working state → owner/team → next action → activity timeline → visits → opportunities → WhatsApp/phone actions.

### Reservation workspace
Unit identity → eligibility → hold/reservation state → expiry → financial obligation → approval → audit → next step.

### Studio editor
Page tree → canvas/section selection → property inspector → responsive preview → autosave status → preview → approval → publish → version history.

Never hide unsaved state.

## 8. Golden journeys

Design and validate at least:

1. Public project → unit → WhatsApp lead.
2. Public project → unit → form lead → CRM qualification.
3. Lead → visit scheduling → appointment confirmation.
4. Qualified opportunity → offer → reservation.
5. Reservation → contract → payment schedule.
6. Payment schedule → receipt → allocation → finance.
7. Inventory manager → project → building → unit → status/price change.
8. Studio editor → draft → preview → publish → public page.
9. Admin → user → role/scope → permission review.
10. Admin → audit log → trace mutation.

## 9. Figma MCP operating model

Use the official Figma MCP integration with Claude Code for structured design context rather than screenshot-only prompting. Figma's current official guidance supports Claude Code, structured access to variables/components/layout, Code Connect alignment, and write-back to native Figma content through the remote MCP server.

Preferred direction:

`Figma → Claude context → implementation`

and, where approved:

`runtime UI → Figma editable layers → design review`

The remote Figma MCP server is the preferred integration; the desktop server is reserved for cases that specifically require local/enterprise behavior.

## 10. Figma-to-code acceptance

A Figma-derived implementation is accepted only when:

- correct frame/node was inspected
- correct variables/components were identified
- responsive behavior matches the design intent
- typography/spacing/token mapping is correct
- RTL is correct
- interaction states exist in code
- loading/error/empty states are implemented even if not shown in the happy-path mock
- accessibility passes
- runtime screenshot comparison passes within the approved visual-diff threshold
- no unauthorized design-token drift exists

## 11. Code-to-Figma acceptance

When exporting live UI back into Figma for review:

- preserve semantic component mapping where possible
- annotate known runtime-only states
- never treat generated visual output as a replacement for canonical design tokens
- record intentional differences
- update the Figma source when the product design decision changes

## 12. Visual QA matrix

Minimum viewport matrix:

| Class | Widths | Direction |
|---|---:|---|
| Mobile | 360, 390, 430 | AR + LTR |
| Tablet | 768, 834, 1024 | AR + LTR |
| Desktop | 1280, 1440, 1728, 2560 | AR + LTR |

Critical visual checks:

- no clipping
- no horizontal overflow
- correct drawer/modal anchoring in RTL
- table density remains usable
- focus ring visible
- status never color-only
- Arabic glyph shaping/line height correct
- numeric columns aligned/tabular
- mixed Arabic/Latin identifiers use bidi isolation
- mobile CTA remains reachable

## 13. Design review gates

Before implementation: UX review.

Before merge: visual review + accessibility review.

After merge: runtime smoke + visual regression.

After significant product change: Figma source and component registry reconciliation.

## 14. Anti-patterns

Never:

- code from screenshots while ignoring Figma structure
- copy arbitrary pixel values into CSS
- duplicate components instead of extending the registry
- design only happy paths
- postpone RTL until the end
- treat mobile as a shrunken desktop
- use color alone for state
- invent interaction behavior that contradicts domain contracts
- let Figma become an undocumented second source of truth
