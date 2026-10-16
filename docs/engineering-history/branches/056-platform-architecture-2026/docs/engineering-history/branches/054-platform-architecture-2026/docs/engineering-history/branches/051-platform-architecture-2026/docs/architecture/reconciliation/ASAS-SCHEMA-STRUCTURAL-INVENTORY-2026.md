# ASAS — Schema Structural Inventory 2026

**Artifact ID:** ASAS-RECON-SCHEMA-INVENTORY-2026-001  
**Status:** VERIFIED SOURCE OBSERVATION / NOT AN EXECUTABLE CONTRACT  
**Version:** 1.0.0  
**Effective date:** 2026-09-24  
**Owner:** Lead Architecture / Database Engineering  
**Branch:** `platform-architecture-2026`  
**Authority:** Provenance evidence only. This artifact does not authorize schema promotion, migration, or production change.

## 1. Purpose

Capture the structural facts of the complete `blueprint/schema/asas-contracts.prisma` source contained in the supplied ASAS v1.6.1 package, so that subsequent architecture decisions are based on the actual source rather than headline counts, diagrams, or task references.

## 2. Provenance

**Source package:** ASAS Complete Package v1.6.1  
**Source path:** `blueprint/schema/asas-contracts.prisma`  
**Extraction date:** 2026-09-24  
**Extraction method:** complete file extraction and static structural parse  
**Source role:** historical/reference package; not current repository implementation authority.

The source package is explicitly treated as provenance/research material. It must not be promoted to executable repository schema merely because it is complete or internally coherent.

## 3. Structural counts — measured from source

| Structure | Measured count |
|---|---:|
| Prisma models | 59 |
| Prisma enums | 17 |
| `@@index` declarations | 56 |
| `@@unique` declarations | 22 |
| `@relation` annotations | 19 |

These measurements supersede neither the repository's historical declarations nor the live database. They are one independently measured evidence set.

## 4. Model inventory

The 59 source models are:

```text
Role
Permission
RolePermission
UserRole
AuditLog
OutboxEvent
ProcessedEvent
WorkflowDefinition
WorkflowRun
ApprovalRule
ApprovalRequest
ApprovalDecision
FloorPlan
Apartment
Hold
ProjectMilestone
Lead
Opportunity
Offer
Reservation
Contract
PaymentPlan
PaymentScheduleItem
Receipt
ReceiptAllocation
LedgerEntry
Account
AccountingPeriod
CommissionPlan
CommissionEntry
CommissionPayout
StudioPage
StudioPageVersion
IntegrationAccount
IntegrationCredential
ProviderEvent
WebhookEndpoint
WebhookSubscription
WebhookDelivery
Campaign
LeadSource
UtmEvent
AdLead
AttributionTouch
CampaignSpend
ConversionTask
WebEvent
ConsentState
MessageTemplate
MessageCampaign
DeliveryEvent
Appointment
AvailabilityRule
AvailabilityOverride
BookingPolicy
ExternalBusyBlock
CalendarConnection
MediaAsset
EntityAttachment
```

## 5. Enum inventory

The 17 source enums are:

```text
AccessScope
CommercialStatus
ConstructionStatus
LeadLifecycle
LeadWorking
OpportunityStage
ReservationStatus
ContractStatus
ScheduleItemStatus
ApprovalStatus
FinancingType
PaymentChannel
TriggerType
StudioPageStatus
OfferStatus
AppointmentStatus
AppointmentType
```

## 6. Critical real-estate finding

The measured 59-model source **does not contain standalone Prisma models named**:

```text
Developer
Project
Building
Floor
```

This is an observed source fact, not a conclusion that these domain concepts are invalid.

The same source does contain:

- `FloorPlan`
- `Apartment`
- `ProjectMilestone`

and several models contain `project_id` and/or `building_id` scalar dimensions.

### 6.1 `FloorPlan`

The source defines `FloorPlan` with:

- `organization_id`
- `project_id`
- `code`
- `typology`
- `surface_m2`
- `exposure`
- localized `name` and `description`
- `base_price`
- optional `amenities`
- timestamps/archive timestamp
- relation to `Apartment`
- unique constraint `(project_id, code)`

### 6.2 `Apartment`

The source defines `Apartment` with:

- `organization_id`
- `project_id`
- optional `floor_plan_id`
- optional `floor_number`
- `commercial_status`
- `construction_status`
- `list_price`
- `floor_price`
- `effective_price`
- `hold_expires_at`
- `delivery_date_est`
- `marketing_published`
- `show_unit`
- `features`
- `custom_attributes`
- timestamps
- relation to `FloorPlan`
- indexes on organization/project/commercial status and organization/floor plan.

### 6.3 `ProjectMilestone`

The source defines:

- `organization_id`
- `project_id`
- optional `building_id`
- `code`
- `planned_date`
- `certified_date`
- `progress_pct`
- timestamps
- unique constraint `(project_id, building_id, code)`.

This is particularly important: **a `building_id` dimension exists in the source without a corresponding `Building` model in the 59-model source.** The semantic owner of that identifier is therefore unresolved and must not be invented.

### 6.4 Other building/project dimensions

`LedgerEntry` also contains optional `project_id` and `building_id` reporting dimensions. This demonstrates that building identity is referenced outside inventory milestones, increasing the need for an explicit identity/ownership decision before schema promotion.

## 7. State-machine reconciliation finding

The source state-machine register defines construction status as:

`apartment.construction_status`

and describes progression as being driven by `milestone.certified` events per building.

Therefore two different concepts currently coexist:

```text
Construction state owner:
    Apartment

Construction milestone scope:
    Project + optional Building
```

This is not automatically a contradiction, but it is an architectural contract gap because the building identifier has no standalone persisted owner in the measured 59-model schema.

Required decision before promotion:

1. Is `building_id` a foreign key to a future first-class Building entity?
2. Is it an externally defined/reference identity owned by another system or legacy table?
3. Is Building intentionally a structural domain concept without first-class persistence?
4. If Building becomes first-class, which aggregate/entity owns its identity and lifecycle?

No option is selected by this inventory.

## 8. Master-Spec contradiction requiring reconciliation

The v1.6.1 Master Spec contains both of the following claims:

- the target task plan includes `T-2.1 Developer + project + building + floor models`;
- the 59-model schema inventory does not contain standalone Developer, Project, Building, or Floor models.

The Master Spec also states that the ER diagram contains those entities while clarifying that they are not separate models in `asas-contracts.prisma` and may be materialized later against the production baseline.

Therefore the correct classification is:

`CONFLICT / INTENTIONAL-STAGING-CANDIDATE — NOT RESOLVED`

This must not be converted into a migration by inference.

## 9. What this inventory does not prove

This artifact does **not** establish:

- the live database schema;
- the current repository Prisma schema;
- migration history correctness;
- RLS implementation;
- foreign-key existence for scalar identifiers;
- whether Project/Building/Floor exist under alternate names;
- whether those entities exist in the live 15-table baseline;
- whether the source package itself is internally executable against the current database.

## 10. Promotion implications

The following remain blocked:

```text
Building persistence decision
Executable Prisma contract promotion
Building migration
Project/Building/Floor schema creation
Live database mutation
```

The next evidence operation is **brownfield identity + schema capture**, followed by a source-to-runtime reconciliation matrix.

## 11. Evidence status

| Claim | Status |
|---|---|
| Source file exists in v1.6.1 package | VERIFIED |
| 59 models measured | VERIFIED SOURCE OBSERVATION |
| 17 enums measured | VERIFIED SOURCE OBSERVATION |
| 56 indexes measured | VERIFIED SOURCE OBSERVATION |
| 22 uniques measured | VERIFIED SOURCE OBSERVATION |
| 19 relation annotations measured | VERIFIED SOURCE OBSERVATION |
| Building model absent from this source | VERIFIED SOURCE OBSERVATION |
| Building concept valid in product/domain | SUPPORTED BY OTHER SOURCES; NOT PROVEN BY THIS FILE |
| Building persistence absent from live DB | UNVERIFIED |
| Building should become a table | OPEN |
| Current repository executable schema | NOT ESTABLISHED BY THIS ARTIFACT |

## 12. Next dependency

`Q1-SCHEMA-04 — Domain / aggregate / invariant alignment` may use this inventory as evidence, but may not treat it as an executable schema contract.

`Q1-BUILDING-PERSISTENCE` remains blocked until runtime/repository evidence resolves the ownership of `building_id` and the staged Project/Building/Floor model decision.
