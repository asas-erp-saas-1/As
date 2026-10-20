# ASAS — B.4 Lead Working Status: Evidence Boundary & Decision Gate

**Status:** RED / FOUNDER DECISION REQUIRED FOR LEGAL GRAPH
**Machine:** B.4 — Lead working status (Track A2)
**Aggregate:** `lead.working_status`
**Authority:** Blueprint v1.6.1 Chapter 16.1 / Appendix B / `state-machines.json`

## 1. Purpose

This document records the maximum B.4 closure that can be achieved from the authoritative v1.6.1 material without inventing business semantics.

The objective is **not** to manufacture a plausible CRM workflow. It is to distinguish:

- semantics explicitly established by the source;
- consequences that are structurally implied but are not legal transition rules;
- unresolved founder/product decisions that must be frozen before the command kernel can claim complete lifecycle coverage.

## 2. Normative state vocabulary

The state enum is character-for-character normative:

`NEW`
`ATTEMPTED_TO_CONTACT`
`CONNECTED`
`WORKING`
`VISIT_SCHEDULED`
`UNREACHABLE`
`UNQUALIFIED`
`BAD_TIMING`
`RECYCLED`

No additional state may be introduced by implementation merely to make a workflow convenient.

## 3. What the authoritative source actually closes

### 3.1 Ownership model

B.4 is **rep-controlled**. It is the tactical working-status track, distinct from Track A (`lead.lifecycle_stage`) and Track B (`opportunity.stage`).

### 3.2 Inbound engagement rule

The source explicitly states that **any inbound engagement auto-promotes working status to `CONNECTED`**.

The blueprint specifically describes an inbound WhatsApp reply or answered call as sufficient to move a lead out of the attempted-contact condition. The same engagement also participates in scoring/SLA automation.

### 3.3 Separation from lifecycle stage

B.4 must not be treated as a substitute for Track A. An inbound engagement changes the tactical working status; it does **not** by itself promote `lifecycle_stage`.

The blueprint's CRM engineer contract explicitly asks why inbound WhatsApp auto-promotes working status but never lifecycle stage. This separation is therefore a design guard, not an implementation convenience.

### 3.4 Rep-controlled does not mean unrestricted setter

The package's universal state-machine rule remains authoritative: lifecycle mutations use legal transitions, authorization, preconditions, audit, and the corresponding domain event. `rep-controlled` therefore identifies who may cause permitted B.4 changes; it does not authorize arbitrary writes to the status column.

## 4. What is NOT closed by the source

The v1.6.1 machine register gives B.4 only the statement:

> `Rep-controlled; any inbound engagement auto-promotes to CONNECTED.`

It does **not** enumerate a transition table. Therefore the following cannot be declared normative without an explicit product decision or authoritative amendment:

1. `NEW → ATTEMPTED_TO_CONTACT` trigger and command.
2. Whether `NEW → CONNECTED` is legal for inbound engagement, or whether the rule requires an intermediate state.
3. `ATTEMPTED_TO_CONTACT → CONNECTED` trigger semantics beyond the inbound rule.
4. `CONNECTED → WORKING` entry condition.
5. `WORKING → VISIT_SCHEDULED` relation to B.11 appointment creation/confirmation.
6. Legal exits from `CONNECTED`, `WORKING`, or `VISIT_SCHEDULED` to `UNREACHABLE`, `UNQUALIFIED`, `BAD_TIMING`, or `RECYCLED`.
7. Whether `UNREACHABLE`, `UNQUALIFIED`, and `BAD_TIMING` are terminal in B.4 or recyclable dispositions.
8. Exact re-entry rules from disposition states into `RECYCLED`, `NEW`, `CONNECTED`, or `WORKING`.
9. Whether a new inbound engagement from any disposition state always forces `CONNECTED`.
10. Mandatory reason codes for each disposition and whether the existing Appendix F.5 lost/cancellation reasons apply (they should not be assumed to apply to B.4).
11. Whether `VISIT_SCHEDULED` means appointment requested, appointment confirmed, or either.
12. Whether cancellation/no-show of an appointment changes B.4 automatically and, if so, to which state.
13. How B.4 changes interact with Track A promotions (`lead.contacted`, `lead.qualified`, `lead.promoted`, `lead.disqualified`).
14. Whether automated SLA/cadence jobs may change B.4 or only create activities/alerts.
15. Whether reassignment, ownership transfer, leave, suspension, or offboarding causes a B.4 transition.

## 5. Evidence-backed behavioral facts that must remain intact

The following are safe to carry forward into the next design layer because they are explicitly supported by the blueprint:

- The dual-track lead model exists to prevent tactical work state from corrupting funnel/lifecycle analytics.
- Inbound WhatsApp engagement is an engagement event and auto-promotes B.4 to `CONNECTED`.
- Answered calls are also described as inbound/engagement evidence for the same promotion behavior.
- Engagement can add score and arm SLA timers.
- The lead remains a single guest/buyer record; working status is not a duplicate lead lifecycle.
- The CRM engineer must implement the dual-track model without exposing `lifecycle_stage` to direct writes.

These facts do **not** constitute an unlisted B.4 edge table.

## 6. Required founder decision packet

To turn B.4 from RED to GREEN, the authoritative contract must supply a complete edge matrix with, at minimum:

| Required field | Decision required |
|---|---|
| From | one of the nine registered states |
| To | one of the nine registered states |
| Trigger | command or registered event |
| Actor | rep/system/inbound channel/approved automation |
| Preconditions | exact predicates |
| Reason | required/optional + reason-code vocabulary |
| Re-entry | whether a disposition may return to active work |
| Track-A effect | none / exact lifecycle transition/event |
| Appointment effect | none / create / confirm / cancel / reschedule linkage |
| SLA effect | start/stop/rearm/pause |
| Cadence effect | start/stop/resume/reset |
| Score effect | exact registered engagement/scoring consequence |
| Audit | actor, reason, causation/correlation requirements |
| Domain event | exact registered event ID |
| Idempotency | derivation/storage rule where applicable |
| Authorization | permission + scope + ABAC + deny override |

## 7. Decision questions — minimal set

The founder/product authority only needs to decide the following semantic questions; engineering should not silently answer them:

### Q1 — Active work path
What is the intended legal active sequence among:

`NEW → ATTEMPTED_TO_CONTACT → CONNECTED → WORKING → VISIT_SCHEDULED`

Are all five edges mandatory, or may reps skip states?

### Q2 — Failed-contact dispositions
From which active states may the rep choose:

`UNREACHABLE`, `UNQUALIFIED`, `BAD_TIMING`?

### Q3 — Recycling
What exact states may enter `RECYCLED`, and what event/command returns a recycled lead to active work?

### Q4 — Inbound override
Does **any** inbound engagement from **any** B.4 state force `CONNECTED`, including `UNREACHABLE`, `BAD_TIMING`, `UNQUALIFIED`, and `RECYCLED`?

### Q5 — Appointment coupling
Does B.4 become `VISIT_SCHEDULED` on appointment request or only on appointment confirmation?

### Q6 — Appointment failure
What happens to B.4 after cancellation or no-show? No automatic transition should be assumed until decided.

### Q7 — Track-A coupling
Which, if any, B.4 transitions emit the Track-A lifecycle events `lead.contacted`, `lead.qualified`, `lead.promoted`, or `lead.disqualified`? The two tracks must remain independently governed.

### Q8 — Automation authority
May SLA/cadence automation change B.4 directly, or may automation only create activities/notifications while the rep controls status?

## 8. Implementation prohibition until decision closure

Until the above semantics are frozen, implementation must not:

- add an inferred B.4 transition graph;
- expose a generic `setWorkingStatus`/status setter;
- infer terminality from state names;
- couple appointment status to B.4 without a contract;
- reuse Track-A transition rules for B.4;
- reuse Appendix F.5 reason codes without explicit mapping;
- create new B.4 events merely to fill missing edges;
- let AI/copilot infer or mutate B.4 outside the canonical command/authorization path.

## 9. Closure verdict

**B.4 remains RED.**

This is not an engineering failure. It is an authoritative-contract gap. The correct action is to preserve the gap, surface the minimum product decisions, and prevent implementation from converting an unspecified tactical vocabulary into accidental business law.

Once the decision packet is answered, the next artifact should be a normative B.4 edge matrix that is traceable to registered events, permissions, idempotency, concurrency, audit, and the Track-A/B.11 cross-domain effects.
