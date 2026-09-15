# ASAS — Complete Event Traceability Closure Matrix

**Status:** OPEN — exhaustive register coverage, implementation semantics intentionally unresolved where the v1.6.1 event register does not specify them.
**Authority:** `02-HANDOFF/registers/events.json` / Blueprint v1.6.1 Appendix C.
**Purpose:** Prevent Claude from inventing event producers, consumers, payloads, transaction boundaries, or retry semantics while still giving every registered event an explicit implementation slot.

## 1. Canonical envelope

The v1.6.1 register defines the envelope fields as:
`eventId`, `eventName`, `eventVersion`, `occurredAt`, `actorId`, `aggregateType`, `aggregateId`, `payload`, `correlationId`, `causationId`.
`causationId` is optional when the event was triggered by handling another event.
Consumers are required to be idempotent and deduplicated by `(eventId, handler)`.
Events use the transactional outbox and are committed with the business change in one DB transaction (N6).

## 2. Closure rule

The register supplies the canonical event identity and module/emission lane. It does **not** supply all implementation metadata. Therefore every unresolved cell below is deliberately `OPEN`.

No engineer or AI agent may convert `OPEN` into a guessed contract merely to unblock code.

Required closure dimensions:

1. registered ID
2. event version
3. event class
4. producer context
5. aggregate
6. triggering command
7. state edge
8. consumers
9. transaction boundary
10. outbox requirement/order
11. idempotency derivation
12. retry/dead-letter behavior
13. causation/correlation propagation
14. tenant/workspace context
15. payload classification
16. audit relationship
17. compatibility/deprecation policy

## 3. Exhaustive 103-event inventory

| # | Registered event ID | Register module/lane | Version | Class | Producer | Aggregate | Trigger command | State edge | Consumers | Tx boundary | Outbox | Idempotency | Retry/DLQ | Causation/correlation | Tenant context | Payload class | Audit | Compatibility | Status |
|---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | `apartment.published` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | B.1 edge exists | OPEN | OPEN | REQUIRED by register | OPEN | OPEN | REQUIRED envelope | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 2 | `apartment.held` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | B.1 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 3 | `hold.expired` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | B.1 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 4 | `hold.released` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | B.1 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 5 | `apartment.reserved` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | B.1 relationship OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 6 | `apartment.released` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | B.1 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 7 | `apartment.contracted` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 8 | `apartment.sold` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | B.1 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 9 | `apartment.blocked` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | B.1 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 10 | `apartment.unblocked` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | B.1 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 11 | `apartment.off_marketed` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | B.1 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 12 | `apartment.back_on_market` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | B.1 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 13 | `apartment.price_changed` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 14 | `milestone.certified` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | B.2 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 15 | `change_order.approved` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | B.2 exception related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 16 | `project.published` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 17 | `project.unpublished` | Inventory | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 18 | `lead.created` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | B.3/B.4 entry relationship OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII boundary OPEN | OPEN | OPEN | OPEN |
| 19 | `lead.merged` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII | OPEN | OPEN | OPEN |
| 20 | `lead.assigned` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 21 | `lead.contact_attempted` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | B.4 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 22 | `lead.contacted` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | B.4 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 23 | `lead.qualified` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | B.3/B.4 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 24 | `lead.disqualified` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | B.3 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 25 | `lead.status_changed` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | B.3/B.4 semantics OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 26 | `lead.promoted` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | B.3 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 27 | `lead.score_changed` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 28 | `activity.logged` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | OPEN | OPEN | OPEN | OPEN |
| 29 | `appointment.requested` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | B.11 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 30 | `appointment.confirmed` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | B.11 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 31 | `appointment.rescheduled` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | B.11 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 32 | `appointment.cancelled` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | B.11 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 33 | `appointment.no_show` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | B.11 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 34 | `appointment.completed` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | B.11 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 35 | `conversation.message_received` | CRM | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII | OPEN | OPEN | OPEN |
| 36 | `opportunity.created` | Sales | OPEN | OPEN | OPEN | OPEN | OPEN | B.5 entry related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 37 | `opportunity.stage_changed` | Sales | OPEN | OPEN | OPEN | OPEN | OPEN | B.5 | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | internal | OPEN | OPEN | OPEN |
| 38 | `offer.created` | Sales | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial/commercial | OPEN | OPEN | OPEN |
| 39 | `offer.submitted` | Sales | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial/commercial | OPEN | OPEN | OPEN |
| 40 | `offer.approved` | Sales | OPEN | OPEN | OPEN | OPEN | OPEN | approval-related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial/commercial | OPEN | OPEN | OPEN |
| 41 | `offer.rejected` | Sales | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial/commercial | OPEN | OPEN | OPEN |
| 42 | `offer.expired` | Sales | OPEN | OPEN | OPEN | OPEN | OPEN | B.5 sanctioned regression related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial/commercial | OPEN | OPEN | OPEN |
| 43 | `reservation.created` | Sales | OPEN | OPEN | OPEN | OPEN | OPEN | B.6 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial/commercial | OPEN | OPEN | OPEN |
| 44 | `reservation.cancelled` | Sales | OPEN | OPEN | OPEN | OPEN | OPEN | B.6 edge exists | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial/commercial | OPEN | OPEN | OPEN |
| 45 | `contract.generated` | Sales | OPEN | OPEN | OPEN | OPEN | OPEN | B.7 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | legal/financial | OPEN | OPEN | OPEN |
| 46 | `contract.signed` | Sales | OPEN | OPEN | OPEN | OPEN | OPEN | B.7 related; B.1 trigger | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | legal/financial | OPEN | OPEN | OPEN |
| 47 | `contract.notarized` | Sales | OPEN | OPEN | OPEN | OPEN | OPEN | B.7 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | legal/financial | OPEN | OPEN | OPEN |
| 48 | `contract.terminated` | Sales | OPEN | OPEN | OPEN | OPEN | OPEN | B.7 terminal related; B.1 trigger | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | legal/financial | OPEN | OPEN | OPEN |
| 49 | `paymentplan.installed` | Finance | OPEN | OPEN | OPEN | OPEN | OPEN | B.8 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial | OPEN | OPEN | OPEN |
| 50 | `installment.due` | Finance | OPEN | OPEN | OPEN | OPEN | OPEN | B.8 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial | OPEN | OPEN | OPEN |
| 51 | `installment.overdue` | Finance | OPEN | OPEN | OPEN | OPEN | OPEN | B.8 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial | OPEN | OPEN | OPEN |
| 52 | `deposit.recorded` | Finance | OPEN | OPEN | OPEN | OPEN | OPEN | B.1/B.6 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial | OPEN | OPEN | OPEN |
| 53 | `payment.recorded` | Finance | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial | OPEN | OPEN | OPEN |
| 54 | `receipt.allocated` | Finance | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial | OPEN | OPEN | OPEN |
| 55 | `refund.requested` | Finance | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial/PII | OPEN | OPEN | OPEN |
| 56 | `refund.approved` | Finance | OPEN | OPEN | OPEN | OPEN | OPEN | approval-related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial/PII | OPEN | OPEN | OPEN |
| 57 | `refund.paid` | Finance | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial/PII | OPEN | OPEN | OPEN |
| 58 | `ledger.posted` | Finance | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial | OPEN | OPEN | OPEN |
| 59 | `period.closed` | Finance | OPEN | OPEN | OPEN | OPEN | OPEN | B.8/Finance related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial | OPEN | OPEN | OPEN |
| 60 | `commission.accrued` | Finance | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial/HR | OPEN | OPEN | OPEN |
| 61 | `commission.clawed_back` | Finance | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial/HR | OPEN | OPEN | OPEN |
| 62 | `commission.paid_out` | Finance | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | financial/HR | OPEN | OPEN | OPEN |
| 63 | `approval.requested` | Approvals | OPEN | OPEN | OPEN | OPEN | OPEN | B.9 entry | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | internal/financial/PII depending operation | OPEN | OPEN | OPEN |
| 64 | `approval.granted` | Approvals | OPEN | OPEN | OPEN | OPEN | OPEN | B.9 | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | internal/financial/PII depending operation | OPEN | OPEN | OPEN |
| 65 | `approval.rejected` | Approvals | OPEN | OPEN | OPEN | OPEN | OPEN | B.9 | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | internal/financial/PII depending operation | OPEN | OPEN | OPEN |
| 66 | `approval.escalated` | Approvals | OPEN | OPEN | OPEN | OPEN | OPEN | B.9 | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | internal/financial/PII depending operation | OPEN | OPEN | OPEN |
| 67 | `approval.delegated` | Approvals | OPEN | OPEN | OPEN | OPEN | OPEN | B.9 | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | internal/PII | OPEN | OPEN | OPEN |
| 68 | `user.created` | Core | OPEN | OPEN | OPEN | OPEN | OPEN | Core IAM related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII | OPEN | OPEN | OPEN |
| 69 | `user.suspended` | Core | OPEN | OPEN | OPEN | OPEN | OPEN | Core IAM related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/security | OPEN | OPEN | OPEN |
| 70 | `role.granted` | Core | OPEN | OPEN | OPEN | OPEN | OPEN | Core IAM related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | security/internal | OPEN | OPEN | OPEN |
| 71 | `role.revoked` | Core | OPEN | OPEN | OPEN | OPEN | OPEN | Core IAM related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | security/internal | OPEN | OPEN | OPEN |
| 72 | `session.started` | Core | OPEN | OPEN | OPEN | OPEN | OPEN | Core IAM related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | security/PII | OPEN | OPEN | OPEN |
| 73 | `session.revoked` | Core | OPEN | OPEN | OPEN | OPEN | OPEN | Core IAM related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | security | OPEN | OPEN | OPEN |
| 74 | `audit.chain_verified` | Core | OPEN | OPEN | OPEN | OPEN | OPEN | Audit capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | security/evidence | OPEN | OPEN | OPEN |
| 75 | `workflow.run_started` | Workflow | OPEN | OPEN | OPEN | OPEN | OPEN | Workflow capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | internal | OPEN | OPEN | OPEN |
| 76 | `workflow.step_completed` | Workflow | OPEN | OPEN | OPEN | OPEN | OPEN | Workflow capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | internal | OPEN | OPEN | OPEN |
| 77 | `workflow.failed` | Workflow | OPEN | OPEN | OPEN | OPEN | OPEN | Workflow capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | internal/error | OPEN | OPEN | OPEN |
| 78 | `page.drafted` | Studio / Marketing | OPEN | OPEN | OPEN | OPEN | OPEN | B.10 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | content/internal | OPEN | OPEN | OPEN |
| 79 | `page.submitted` | Studio / Marketing | OPEN | OPEN | OPEN | OPEN | OPEN | B.10 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | content/internal | OPEN | OPEN | OPEN |
| 80 | `page.published` | Studio / Marketing | OPEN | OPEN | OPEN | OPEN | OPEN | B.10 related | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | public/internal boundary | OPEN | OPEN | OPEN |
| 81 | `page.rolled_back` | Studio / Marketing | OPEN | OPEN | OPEN | OPEN | OPEN | B.10 rollback semantics | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | content/internal | OPEN | OPEN | OPEN |
| 82 | `theme.updated` | Studio / Marketing | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | content/internal | OPEN | OPEN | OPEN |
| 83 | `media.uploaded` | Studio / Marketing | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | media/security | OPEN | OPEN | OPEN |
| 84 | `campaign.launched` | Studio / Marketing | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | marketing/internal | OPEN | OPEN | OPEN |
| 85 | `campaign.completed` | Studio / Marketing | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | marketing/internal | OPEN | OPEN | OPEN |
| 86 | `campaign.message_sent` | Studio / Marketing | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/marketing | OPEN | OPEN | OPEN |
| 87 | `utm.captured` | Studio / Marketing | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | analytics/visitor | OPEN | OPEN | OPEN |
| 88 | `webevent.recorded` | Studio / Marketing | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | analytics/visitor | OPEN | OPEN | OPEN |
| 89 | `adlead.ingested` | Studio / Marketing | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/provider | OPEN | OPEN | OPEN |
| 90 | `consent.changed` | Studio / Marketing | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/privacy | OPEN | OPEN | OPEN |
| 91 | `notification.created` | Notifications | OPEN | OPEN | OPEN | OPEN | OPEN | Notification capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 92 | `notification.delivered` | Notifications | OPEN | OPEN | OPEN | OPEN | OPEN | Notification capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | PII/internal | OPEN | OPEN | OPEN |
| 93 | `notification.failed` | Notifications | OPEN | OPEN | OPEN | OPEN | OPEN | Notification capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | internal/error | OPEN | OPEN | OPEN |
| 94 | `document.generated` | Documents | OPEN | OPEN | OPEN | OPEN | OPEN | Document capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | legal/PII/financial | OPEN | OPEN | OPEN |
| 95 | `document.version_uploaded` | Documents | OPEN | OPEN | OPEN | OPEN | OPEN | Document capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | legal/PII/financial | OPEN | OPEN | OPEN |
| 96 | `document.expired` | Documents | OPEN | OPEN | OPEN | OPEN | OPEN | Document capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | legal/PII/financial | OPEN | OPEN | OPEN |
| 97 | `integration.connected` | Integrations | OPEN | OPEN | OPEN | OPEN | OPEN | Integration capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | credential metadata | OPEN | OPEN | OPEN |
| 98 | `integration.disconnected` | Integrations | OPEN | OPEN | OPEN | OPEN | OPEN | Integration capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | credential metadata | OPEN | OPEN | OPEN |
| 99 | `integration.credential_used` | Integrations | OPEN | OPEN | OPEN | OPEN | OPEN | Integration capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | SECRET-adjacent; never secret material | OPEN | OPEN | OPEN |
| 100 | `integration.credential_refreshed` | Integrations | OPEN | OPEN | OPEN | OPEN | OPEN | Integration capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | SECRET-adjacent; never secret material | OPEN | OPEN | OPEN |
| 101 | `webhook.delivered` | Integrations | OPEN | OPEN | OPEN | OPEN | OPEN | Integration capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | provider/internal | OPEN | OPEN | OPEN |
| 102 | `webhook.dead_lettered` | Integrations | OPEN | OPEN | OPEN | OPEN | OPEN | Integration capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | provider/internal | OPEN | OPEN | OPEN |
| 103 | `conversion.uploaded` | Integrations | OPEN | OPEN | OPEN | OPEN | OPEN | Integration capability | OPEN | OPEN | REQUIRED | OPEN | OPEN | REQUIRED | REQUIRED | provider/marketing | OPEN | OPEN | OPEN |

## 4. Important findings

### A. The register is an identity catalog, not a complete event contract
The presence of an event ID is not enough to safely emit it. Producer, aggregate, command, payload, version, and consumer ownership must be closed first.

### B. Outbox is not optional for registered business events
The register explicitly requires events to ride the transactional outbox and be committed with the business change in one transaction. This must become executable infrastructure, not a convention.

### C. Event idempotency has a precise baseline
The register explicitly requires consumers to be idempotent and deduplicated by `(eventId, handler)`. The storage/retention/unique-index implementation remains OPEN.

### D. Event identity must not fork
No new PascalCase or descriptive event vocabulary may be emitted without a one-to-one mapping to the registered dotted ID and version. Adding an unregistered event is a defect.

### E. Security classification cannot be postponed for PII/financial events
CRM, finance, documents, IAM, marketing and integration events may carry sensitive data. Payload minimization and classification must be closed before production emission.

## 5. Required next closure artifacts

1. Canonical command registry.
2. Permission ↔ command matrix.
3. State-edge ↔ command ↔ event matrix.
4. Event schema/version catalog.
5. Producer/consumer ownership map.
6. Idempotency key catalog and retention policy.
7. Outbox/inbox storage and retry contract.
8. Payload classification/egress policy.
9. J1–J12 journey event traces.
10. Executable event registration CI gate.

**Gate:** No domain event implementation is GREEN until all required dimensions for that event are closed and test evidence exists.
