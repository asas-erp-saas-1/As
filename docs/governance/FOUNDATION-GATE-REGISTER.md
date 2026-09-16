# ASAS Foundation Gate Register

Status: CANONICAL CONTROL REGISTER

## Purpose

This register is the single operational view of whether ASAS is safe to hand to an implementation agent. A gate is GREEN only when its evidence exists in the repository or an explicitly approved external system and the evidence is current enough for the gate's policy.

A document that merely claims a condition is true is not evidence that the condition is true.

## Gate states

- GREEN — acceptance evidence exists and the gate may be relied upon.
- AMBER — substantially defined, but evidence or reconciliation remains.
- RED — known defect/conflict prevents progression.
- BLOCKED — cannot be verified safely with the currently available authority/access.
- NOT STARTED — no sufficient work has been performed.

## Foundation gates

| Gate | Area | Exit evidence | Current state |
|---|---|---|---|
| G0 | Repository identity | Canonical repo identity, branch policy, no alternate implementation target | GREEN |
| G1 | Handoff integrity | Start Here, master path, session state, context index resolve on canonical branch | AMBER |
| G2 | Contract authority | Authority hierarchy + reconciliation protocol + records | GREEN |
| G3 | Product/domain spine | Capability map, bounded contexts, lifecycle spine, ownership rules | AMBER |
| G4 | Task graph | Canonical task registry, dependency graph, packet format, closure rules | AMBER |
| G5 | Security/tenancy doctrine | IAM, tenancy, authorization, audit, financial invariants reconciled | AMBER |
| G6 | Platform reality | Verified GitHub/Supabase/Vercel environments, IDs, access, deployment topology | BLOCKED until verified against live systems |
| G7 | Database reality | Live schema introspection, drift report, backup/restore evidence, migration authority | BLOCKED until live DB verification |
| G8 | CI verification | Foundation checks plus application checks appropriate to actual stack | AMBER |
| G9 | UX/design system | Role UX, navigation, tokens, accessibility, RTL/LTR and responsive contracts | AMBER |
| G10 | Integration contracts | Google/WhatsApp/email/calendar/maps/payment/etc. ownership, auth, limits, failure semantics | NOT STARTED |
| G11 | Observability/DR | logs, metrics, traces, alerts, backup, restore drill, RPO/RTO evidence | NOT STARTED |
| G12 | Claude autonomy | Task packet + branch + checks + permissions + stop conditions proven | BLOCKED until G1-G8 closure |
| G13 | Scale architecture | Phase 11 capacity model, bottlenecks, partitioning, caching, queues, cost controls | AMBER |

## Hard rule

G6 and G7 cannot be declared GREEN from repository documentation alone. The source doctrine explicitly makes live schema/reality the arbiter and requires verification before schema-touching work. This register therefore refuses to convert architectural intent into operational fact.

## Progression rule

No implementation task may enter execution authority A2/A3 while G1, G2, G5, G6, or G7 is RED/BLOCKED for a dependency relevant to that task.

A blocked gate may be bypassed only through an explicit founder decision recorded as an escalation; the bypass does not turn the gate GREEN.

## Closure evidence format

Every GREEN gate must link to:

1. authoritative artifact;
2. verification result;
3. date/time of verification;
4. verifier/agent identity;
5. scope and limitations;
6. unresolved risks;
7. next re-verification trigger.

## Anti-gaming rule

Never change a gate to GREEN because the implementation "should" satisfy it. GREEN means demonstrated, not intended.
