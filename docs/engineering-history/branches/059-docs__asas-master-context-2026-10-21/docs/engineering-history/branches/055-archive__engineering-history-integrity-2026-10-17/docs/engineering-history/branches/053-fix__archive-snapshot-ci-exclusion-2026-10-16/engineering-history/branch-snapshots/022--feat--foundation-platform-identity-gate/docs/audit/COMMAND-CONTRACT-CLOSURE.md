# ASAS — Canonical Command Contract Closure

**Status:** OPEN — command obligations are normalized; canonical command names and several policy semantics remain source-open.
**Branch:** `feat/foundation-command-registry`
**Purpose:** establish the contract surface that every authoritative mutation must satisfy before application code is implemented.

## 1. Non-negotiable mutation path

Every protected business mutation must resolve through:

`Command → Identity → Tenant → Authorization → Idempotency → Validation → Domain invariant → Transaction → State transition → Audit + Outbox → Response`

A UI action, API route, workflow step, integration callback or AI tool is not itself business authority. Each must invoke the canonical command path.

## 2. Authority rule

The existing permission register supplies permission keys and source role/scope grants. It does **not** define a complete command vocabulary. Therefore this artifact deliberately does not invent canonical command names.

Until a command is closed, its identifier is represented as `OPEN_COMMAND:<semantic-action>` in this document. These labels are obligations/placeholders, not registered event IDs and not proposed final API names.

## 3. Required command contract

Every command must eventually define:

| Field | Required |
|---|---|
| Canonical command ID/name | YES |
| Owning bounded context | YES |
| Aggregate/root | YES |
| Actor identity | YES |
| Tenant/workspace scope | YES |
| Required permission(s) | YES |
| Object/property authorization | YES where applicable |
| ABAC predicate | YES where applicable |
| Approval requirement | YES where applicable |
| Input schema | YES |
| Preconditions | YES |
| Domain invariants | YES |
| Idempotency key derivation | YES where mutation/retry can repeat |
| Concurrency strategy | YES where competing writes exist |
| Transaction boundary | YES |
| State edge(s) | YES where lifecycle changes |
| Canonical event(s) | YES where event contract requires |
| Audit classification | YES |
| Outbox behavior | YES where event is required |
| Public/private exposure | YES |
| Failure/error taxonomy | YES |
| Negative tests | YES |
| Evidence artifact | YES |

## 4. Permission → command obligation matrix

The following matrix closes the **authorization obligation** without pretending that final command names have been decided.

| Permission | Required command obligation | Special contract |
|---|---|---|
| lead.read | OPEN_COMMAND:read_lead | scope + PII boundary |
| lead.create | OPEN_COMMAND:create_lead | public ingestion idempotency where applicable |
| lead.update | OPEN_COMMAND:update_lead | ownership/scope |
| lead.delete | NO AUTHORIZED COMMAND REGISTERED | retention/anonymization/merge must be resolved instead of physical deletion |
| lead.transfer | OPEN_COMMAND:transfer_lead | manager/director/ceo scope |
| lead.export | OPEN_COMMAND:export_leads | scoped export + audit |
| lead.pii.read | OPEN_COMMAND:read_lead_pii | distinct PII authorization |
| activity.read | OPEN_COMMAND:read_activity | ownership/team/org scope |
| appointment.create | OPEN_COMMAND:create_appointment | appointment state machine |
| apartment.read | OPEN_COMMAND:read_apartment | assigned/branch/org/public projection distinction |
| apartment.create | OPEN_COMMAND:create_apartment | inventory ownership |
| apartment.update | OPEN_COMMAND:update_apartment | property authorization |
| apartment.hold.create | OPEN_COMMAND:create_apartment_hold | concurrency + expiry |
| apartment.price.override | OPEN_COMMAND:override_apartment_price | threshold + approval + audit |
| apartment.marketing.publish | OPEN_COMMAND:publish_apartment_marketing | public/private projection |
| opportunity.read | OPEN_COMMAND:read_opportunity | ownership/team/org scope |
| offer.create | OPEN_COMMAND:create_offer | stage/ownership preconditions |
| offer.discount.request | OPEN_COMMAND:request_offer_discount | threshold/approval |
| reservation.create | OPEN_COMMAND:create_reservation | single-winner concurrency + idempotency |
| reservation.cancel | OPEN_COMMAND:cancel_reservation | request vs decision authority |
| contract.read | OPEN_COMMAND:read_contract | restricted contractual data |
| contract.generate | OPEN_COMMAND:generate_contract | legal validation gate |
| approval.decide | OPEN_COMMAND:decide_approval | value/role/approval policy |
| paymentplan.read | OPEN_COMMAND:read_payment_plan | client/owner/accounting scope |
| paymentplan.manage | OPEN_COMMAND:manage_payment_plan | accounting authority |
| receipt.record | OPEN_COMMAND:record_receipt | deposit/payment semantics + duplicate protection |
| refund.request | OPEN_COMMAND:request_refund | financial workflow |
| refund.approve | OPEN_COMMAND:approve_refund | amount-sensitive approval |
| ledger.read | OPEN_COMMAND:read_ledger | accounting boundary |
| period.close | OPEN_COMMAND:close_accounting_period | propose vs final authority |
| commission.read | OPEN_COMMAND:read_commission | owner/team/org scope |
| commission.payout.approve | OPEN_COMMAND:approve_commission_payout | propose vs approve separation |
| campaign.manage | OPEN_COMMAND:manage_campaign | marketing scope |
| campaign.audience.sync | OPEN_COMMAND:sync_campaign_audience | data egress/consent |
| message.send.approve | OPEN_COMMAND:approve_message_send | team/marketing approval semantics |
| integration.manage | OPEN_COMMAND:manage_integration | admin-only + credential boundary |
| webhook.manage | OPEN_COMMAND:manage_webhook | signature/replay/security |
| calendar.connect | OPEN_COMMAND:connect_calendar | self-scoped identity ownership |
| studio.draft | OPEN_COMMAND:draft_studio_page | version state machine |
| studio.publish | OPEN_COMMAND:publish_studio_page | review/public projection |
| media.manage | OPEN_COMMAND:manage_media | object ownership + media security |
| report.operational | OPEN_COMMAND:read_operational_report | derived read authority only |
| report.finance | OPEN_COMMAND:read_finance_report | accounting boundary |
| report.executive | OPEN_COMMAND:read_executive_report | executive scope |
| user.invite | OPEN_COMMAND:invite_user | REQUEST vs YES semantics |
| role.assign | OPEN_COMMAND:assign_role | REQUEST vs YES + privileged access |
| workflow.manage | OPEN_COMMAND:manage_workflow | orchestration, not domain truth |
| settings.platform | OPEN_COMMAND:manage_platform_settings | admin boundary |
| audit.read | OPEN_COMMAND:read_audit | immutable evidence access |
| copilot.use | OPEN_COMMAND:use_copilot | never transitive mutation authority |

## 5. State-edge obligations

A command that changes canonical lifecycle state must identify exactly one registered legal edge or an explicitly documented multi-aggregate transaction containing only legal edges.

Current mandatory mappings include:

- apartment publish → B.1 `DRAFT → AVAILABLE` → `apartment.published`
- apartment hold → B.1 `AVAILABLE → HELD` → `apartment.held`
- deposit recording → B.1 `HELD → RESERVED` → `deposit.recorded`
- hold expiry/release → B.1 `HELD → AVAILABLE` → `hold.expired` / `hold.released`
- contract signed → B.1 `RESERVED → CONTRACTED` → `contract.signed`
- reservation cancellation → B.1 `RESERVED → CANCELLED` → `reservation.cancelled`
- apartment sold → B.1 `CONTRACTED → SOLD` → `apartment.sold`
- contract termination → B.1 `CONTRACTED → CANCELLED` → `contract.terminated`
- apartment release → B.1 `CANCELLED → AVAILABLE` → `apartment.released`

B.2–B.11 exact edge closure remains required before implementation of commands against those machines.

## 6. High-risk authorization contracts

### Price override
`apartment.price.override` is not a boolean role check. The command must evaluate the configured threshold policy, actor scope, required approval and audit requirements. Exact threshold interpretation beyond the registered role bands remains OPEN.

### Discount
`offer.discount.request` initiates a governed approval path. It does not grant the actor final discount authority.

### Reservation cancellation
The source permission matrix distinguishes `REQUEST` from `YES`. Therefore the command contract must distinguish request initiation from final cancellation authority.

### Refund
`refund.request` and `refund.approve` are separate commands. Approval is amount-sensitive and must preserve financial invariants.

### User invitation / role assignment
`user.invite` and `role.assign` contain REQUEST/YES semantics. The implementation must not interpret REQUEST as direct privileged mutation.

### Copilot
`copilot.use` authorizes the AI capability only. Any tool that proposes or executes a business command must independently satisfy the exact authorization chain for that command.

## 7. Command-to-event rule

A command does not invent an event name. If its business mutation has a registered event, it emits the exact registered dotted event ID and version through the transactional outbox boundary.

Required invariant:

`command success + committed state mutation + required outbox record = one transaction`

A failed/rolled-back command must not leave a durable business event claiming a mutation that did not commit.

## 8. Idempotency rule

Any externally retryable mutation must define a deterministic idempotency boundary before implementation. Reservation, payment/receipt, public lead ingestion, webhook processing and integration-triggered mutations are P0 examples.

The exact key derivation and retention period remain OPEN until the dedicated idempotency contract is closed.

## 9. Concurrency rule

Commands touching scarce inventory or competing financial state must define database-level concurrency behavior. Application-level checks alone are insufficient.

P0:
- reservation single winner
- stale hold expiry cannot overwrite a newer reservation
- duplicate receipt/payment cannot create duplicate financial effect

Exact lock/constraint/retry strategy remains OPEN until the concurrency catalog is closed.

## 10. Public/private command boundary

Public forms, public project/unit pages, attribution capture and contextual WhatsApp/CTA flows may create controlled public-domain inputs, but they do not receive internal CRM/finance/HR authority.

Public commands must terminate in an explicit public projection/input contract and then enter the same governed domain path.

## 11. AI command boundary

AI is a caller of governed capabilities, not a privileged role.

Required path:

`AI tool → authenticated user/session → tenant → tool scope → canonical command → permission → ABAC → approval → invariant → transaction → audit/outbox`

No AI tool may directly write authoritative domain storage.

## 12. Command registry closure gate

This artifact becomes GREEN only when every `OPEN_COMMAND:*` resolves to:

`canonical ID → owner → aggregate → input → permission → scope → ABAC → approval → preconditions → invariant → idempotency → concurrency → transaction → state edge → event → audit/outbox → negative tests → evidence`

Until then, application implementation remains downstream of the unresolved contract surface.

## 13. Next closure sequence

1. Close B.2–B.11 exact transition graphs.
2. Resolve canonical command IDs from authoritative contract/design decisions.
3. Complete command ↔ permission ↔ ABAC ↔ approval mappings.
4. Close idempotency catalog.
5. Close concurrency/race catalog.
6. Close outbox/inbox delivery contract.
7. Then construct the executable command kernel.
