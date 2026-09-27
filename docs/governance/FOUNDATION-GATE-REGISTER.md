# ASAS Foundation / Implementation-Control Register

**Status:** CANONICAL CONTROL REGISTER
**Version:** 2.0.0
**Branch:** `platform-architecture-2026`

## Purpose

This register governs implementation/runtime readiness. It is distinct from the Engineering Conference Gate Model.

Engineering Conference gates are `GATE-00…GATE-07`. This register uses `F0…F13` to prevent numeric gate collisions.

Canonical architecture gate model: `docs/architecture/conference/ASAS-ENGINEERING-CONFERENCE-GATE-MODEL-2026.md`

## Controls

| Control | Area | Current state |
|---|---|---|
| F0 | Repository identity | GREEN |
| F1 | Handoff integrity | AMBER |
| F2 | Contract authority | GREEN |
| F3 | Product/domain spine | AMBER |
| F4 | Task graph | AMBER |
| F5 | Security/tenancy doctrine | AMBER |
| F6 | Platform reality | BLOCKED until live configuration evidence |
| F7 | Database reality | DORMANT until persistence implementation is authorized |
| F8 | CI verification | AMBER |
| F9 | UX/design system | AMBER |
| F10 | Integration contracts | NOT STARTED |
| F11 | Observability/DR | NOT STARTED |
| F12 | Agent execution readiness | NOT AUTHORIZED until GATE-07 |
| F13 | Scale architecture | AMBER |

## Relationship to Engineering Conference

```text
ENGINEERING CONFERENCE
GATE-00 → GATE-01 → GATE-02 → GATE-03 → GATE-04 → GATE-05 → GATE-06 → GATE-07
                                                               ↓
                                                   bounded implementation slice
                                                               ↓
FOUNDATION / IMPLEMENTATION CONTROLS
F0…F13 as applicable
```

F-controls cannot redefine a business or architecture decision owned by the conference.

## Database rule

Creation of the ASAS Supabase project is infrastructure identity, not database implementation. F7 activates only when a persistence slice is authorized.

## Evidence rule

GREEN means demonstrated evidence exists; documentation or intent alone never makes a control GREEN.
