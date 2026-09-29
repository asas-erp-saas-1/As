# C02-03 Founder Decision Record — 2026-09-25

## Confirmed answers

| Gate | Decision |
|---|---|
| Q1 Allocation | C + D — hard allocation where required, configurable by project/inventory batch |
| Q2 Hold vs Reservation | C + A — independent Hold exists, workflow may be hybrid |
| Q3 Reservation authority | E — configurable by relationship/project |
| Q4 Attribution conflict | F + manual — configurable rules plus auditable manual adjudication |
| Q5 Multi-party credit | C + D — multiple attribution dimensions + configurable rules |
| Q6 Cancellation/commission | D — governed by commission contract/rule |
| Q7 Override | C — reason-coded, audited override |

## Critical founder addition

The platform must support inventory actors beyond Developers.

A Developer may have an internal sales team. An Agency may own/control/list its own inventory and may also represent Developer inventory. Therefore the inventory domain must be organization-neutral.

## Architectural consequence

The system must distinguish:

- inventory ownership/control
- listing/marketing authority
- selling authority
- allocation authority
- reservation creation authority
- reservation approval authority
- contract authority
- settlement responsibility
- reporting visibility

These authorities may belong to different organizations or actors.

## Example

```text
Developer X
  ├── Internal Sales Team → Project X
  └── Agency A → Project X

Agency A
  ├── Own/Controlled Project Y
  └── Represented Developer Z → Project Z
```

All channels can operate against their applicable authoritative inventory while preserving scoped authorization, attribution, and auditability.

## Status

Founder decisions recorded. Domain contract still requires reconciliation with existing ASAS repository/schema evidence before implementation.
