# ASAS — B.2 / B.3 / B.5 Trigger & Precondition Closure

**Status:** AMBER / SOURCE-BOUNDARY CLOSURE
**Branch:** `feat/foundation-command-registry`
**Authority order:** live DB reality → Blueprint v1.6.1 Chapter 39 contracts → Appendices/registers → chapter prose → existing code → general practice.

## 1. Purpose

This artifact advances foundation closure without inventing lifecycle law. It records what the authoritative v1.6.1 state-machine register actually closes for B.2, B.3 and B.5, what supporting documents add, and exactly where the contract remains open.

The state-machine register is normative for vocabulary and legal lifecycle shape. Supporting BRD/domain documents may explain business intent, but an older or differently-shaped pipeline must not silently override the v1.6.1 register.

## 2. B.2 — Apartment Construction Status

### Normative vocabulary

`NOT_STARTED → IN_CONSTRUCTION → STRUCTURE_COMPLETE → FINISHING → DELIVERY_READY → DELIVERED`

The register closes B.2 as a **linear forward chain**, driven by `milestone.certified` events **per building**. Regressions are forbidden except by a **director-approved change order**.

### Closed semantics

| Concern | Source-backed result |
|---|---|
| State set | Closed; six exact enum values |
| Direction | Forward-only normal path |
| Trigger family | `milestone.certified` |
| Certification scope | Per building |
| Regression | Forbidden normally |
| Exception | Director-approved change order |

### Still OPEN

1. Exact milestone taxonomy and ordering.
2. Which milestone certification maps to each construction-state edge.
3. Whether an apartment state is directly derived from its building milestone, or whether apartment-level certification evidence is also required.
4. Required certifier identity/role and evidence payload.
5. Whether partial building progress can leave units at different construction states.
6. Exact change-order approval command, event and regression edge semantics.
7. Whether `DELIVERED` requires a separate handover/completion condition beyond the final `milestone.certified` event.

**Important consistency finding:** the aggregate is `apartment.construction_status`, while the trigger is specified as a building-scoped `milestone.certified` event. This is a contract relationship that must be made explicit before implementation; it must not be guessed.

## 3. B.3 — Lead Lifecycle Track A

### Normative vocabulary

`NEW, CONTACTED, QUALIFIED, OPPORTUNITY, CUSTOMER, UNQUALIFIED, BAD_TIMING`

The v1.6.1 register closes the normal chain as:

`NEW → CONTACTED → QUALIFIED → OPPORTUNITY → CUSTOMER`

`UNQUALIFIED` and `BAD_TIMING` are terminal. The machine is **system-controlled** and **forward-only**; API-level regressions are forbidden.

### Supporting source evidence

The Phase 1 BRD describes a broader 17-stage customer journey and states that each stage has a required action, responsible user, stall reminder, next recommended action and timestamp. It also says the pipeline serves both property tracks. This is useful business-process evidence, but its 17-stage vocabulary is not identical to the v1.6.1 B.3 machine and therefore must not be mechanically copied into B.3. fileciteturn114file9L1-L3

The enterprise domain model separately describes Lead invariants including one owner, one source/acquisition date, agency ownership, and a transition event for pipeline changes. It also lists `LeadCreated`, `LeadAssigned`, `LeadStageChanged`, `LeadQualified`, and `LeadLost` as key events, but these names differ from the current registered dotted event vocabulary and therefore are evidence, not a replacement event registry. fileciteturn114file0L1-L2

### Closed semantics

| Concern | Source-backed result |
|---|---|
| State set | Closed; seven exact enum values |
| Normal direction | Forward-only |
| Terminal states | `UNQUALIFIED`, `BAD_TIMING` |
| Controller | System-controlled |
| Direct API regression | Forbidden |
| Track separation | B.3 is distinct from B.4 working status |

### Still OPEN

1. Exact event/command trigger for every legal B.3 edge.
2. Preconditions for `CONTACTED`.
3. Preconditions for `QUALIFIED`.
4. Exact definition of entering `OPPORTUNITY`.
5. Exact definition of becoming `CUSTOMER`.
6. Which registered events correspond to each edge, especially `lead.contacted`, `lead.qualified`, `lead.promoted`, and `lead.disqualified`.
7. Whether `UNQUALIFIED` and `BAD_TIMING` require mandatory reason codes in B.3.
8. Whether system automation may perform each transition directly or only evaluate/emit commands for a governed transition.
9. Exact interaction with B.4: tactical working status must not be treated as lifecycle authority.

### Guard against historical pipeline drift

The older BRD's stage list contains `Prospect`, `Qualified`, `Contacted`, `Meeting`, `Interested`, `Offer`, etc. That document is valuable for business intent but cannot be used to add states to the v1.6.1 machine. The correct action is to map intent to the canonical machine or record a product decision if the canonical machine is insufficient.

## 4. B.5 — Opportunity Pipeline

### Normative vocabulary and probabilities

`QUALIFIED 10`
`VISIT_SCHEDULED 20`
`VISIT_DONE 30`
`OFFER_SENT 50`
`NEGOTIATION 60`
`RESERVATION 80`
`CONTRACT 90`
`WON_PAID 100`
`LOST 0`
`WITHDRAWN 0`

### Closed lifecycle shape

Normal path:

`QUALIFIED → VISIT_SCHEDULED → VISIT_DONE → OFFER_SENT → NEGOTIATION → RESERVATION → CONTRACT → WON_PAID`

`LOST` / `WITHDRAWN` may be reached from any open stage. A reason is mandatory. The register explicitly references F.5 for the reason requirement.

The only sanctioned regression is offer expiry:

`OFFER_SENT → NEGOTIATION`

or

`OFFER_SENT → QUALIFIED`

The regression is audited and frees any hold according to the registered rule.

### Supporting business evidence

The Phase 1 BRD states that the unified customer journey includes visit scheduling, visit completion, offer, negotiation, reservation, contract preparation, payment follow-up and sale closure, and that each stage has required action, responsible user, stall reminder, next action and timestamp. It also explicitly says Track A and Track B are workflow variations inside one pipeline rather than separate pipelines. fileciteturn114file9L1-L3

### Closed semantics

| Concern | Source-backed result |
|---|---|
| Stage vocabulary | Closed; ten exact stages |
| Normal direction | Forward chain |
| Lost/withdrawn | Reachable from any open stage |
| Disposition reason | Mandatory |
| Regression | Only offer-expiry regression |
| Offer expiry result | `NEGOTIATION` or `QUALIFIED` |
| Audit | Required for sanctioned regression |
| Hold effect | Offer-expiry regression frees any hold |
| Stage entry | Must validate previous stage exit criteria |

### Still OPEN

1. Exact exit criteria for every stage.
2. Exact entry predicates for every stage, beyond the general previous-stage exit validation.
3. Which command initiates each stage transition.
4. Which registered event represents each transition.
5. Exact definition of `QUALIFIED` as an opportunity state versus B.3 `QUALIFIED` as a lead lifecycle state.
6. Exact appointment linkage for `VISIT_SCHEDULED` and `VISIT_DONE`.
7. Exact offer-expiry detection rule and timer source.
8. Exact hold relationship: which inventory hold is created, extended, released, or reconciled during each stage.
9. Exact mandatory reason-code vocabulary for `LOST` and `WITHDRAWN`; do not assume F.5 codes until the mapping is explicitly confirmed.
10. Exact semantics of `WON_PAID`: what constitutes paid and which financial evidence is required.
11. Exact relationship between `CONTRACT` and B.7 contract state.

## 5. Cross-machine collision points

### B.3 vs B.4

B.3 is lifecycle truth; B.4 is tactical working status. An inbound engagement can auto-promote B.4 to `CONNECTED`, but this does not by itself establish a B.3 lifecycle transition. This separation is already explicit in the B.4 decision gate.

### B.3 vs B.5

Both contain `QUALIFIED`, but they are different aggregates and different machines. No implementation may infer that changing one automatically changes the other unless the command/event contract explicitly establishes that relationship.

### B.5 vs B.11

`VISIT_SCHEDULED` / `VISIT_DONE` are B.5 stages while appointment lifecycle is B.11. The existence of an appointment event does not, by itself, authorize an opportunity-stage transition until the mapping is closed.

### B.5 vs B.6/B.1

`RESERVATION` is an opportunity stage, B.6 is reservation lifecycle, and B.1 controls apartment commercial status. A single business action may need a coordinated transaction, but the exact cross-aggregate command and transaction boundary remain open.

## 6. Required closure matrix before command implementation

For every B.2/B.3/B.5 legal edge, the normative registry must contain:

`from → to → trigger command/event → actor → preconditions → invariant → authorization → idempotency → concurrency → transaction boundary → audit → canonical event → projection effects → failure taxonomy → negative tests → evidence`

No row is GREEN merely because the state edge itself is known.

## 7. Current verdict

**B.2: AMBER** — lifecycle shape is closed; milestone-to-edge and building-to-apartment semantics remain open.

**B.3: AMBER** — lifecycle shape and controller model are closed; trigger/precondition/event mapping remains open.

**B.5: AMBER** — lifecycle shape, probabilities, disposition rule and sanctioned regression are closed; stage exit/entry criteria and cross-domain mappings remain open.

These are not reasons to invent implementation behavior. They are the exact remaining contract surface.

## 8. Next action

The next foundation pass should close the highest-impact cross-machine contracts rather than create code:

1. B.5 stage exit criteria and event mapping.
2. B.6 reservation ↔ B.1 inventory transaction boundary.
3. B.7 legal generation gate and contract ↔ reservation relationship.
4. B.8 timing/grace/invoice semantics.
5. B.9 approval SLA/delegation.
6. B.11 appointment ↔ B.5 linkage and calendar projection.
7. Then rebuild the command registry from the now-closed semantic surface.

**Implementation remains prohibited in this workstream until material RED/OPEN semantics affecting authorization, money, legal effect, or cross-aggregate consistency are closed.**