# ASAS — MASTER ENTERPRISE ARCHITECTURE V3
## Real Estate Operating System → Platform OS → Multi-Tenant SaaS → Multi-Country Enterprise Platform

**Version:** 3.0  
**Date:** 20 September 2026  
**Status:** Architecture consolidation / implementation master  
**Authority:** Consolidates the supplied ASAS v1.6.1 Blueprint, MASTER-SPEC, AGENTS.md, registers, ADRs, research/audit material, and the 18 September 2026 external foundation audit.  
**Important:** This document is the architectural target. It does not claim that the repository, live database, or production environment already implements V3.

---

# 0. EXECUTIVE DECISION

ASAS V3 is **not** an attempt to reproduce Oracle, Shopify, HubSpot, Zoho, ServiceNow and Palantir feature-for-feature.

It is a **vertical Enterprise Operating System for real estate** with a platform kernel strong enough to evolve into a general business platform.

The canonical architecture is:

```text
                         ASAS EXPERIENCE PLANE
       Web / Admin / Mobile / Customer / Partner / AI / API
                                │
                                ▼
                    APPLICATION + WORKFLOW PLANE
      Commands / Queries / Approvals / Automations / Jobs / Policies
                                │
                                ▼
                     ASAS ONTOLOGY / OBJECT PLANE
       Objects / Links / Actions / State / Logic / Security / Lineage
                                │
                                ▼
                    9 CANONICAL BOUNDED CONTEXTS
 Core | CRM | Sales | Inventory | Finance | Studio | Marketing
                    | Analytics | Documents
                                │
                                ▼
                       PLATFORM KERNEL
 Identity | Tenancy | Authorization | Audit | Events | Search
 Files | Notifications | Scheduling | Integrations | Configuration
                                │
                                ▼
                         DATA PLANE
 PostgreSQL | Object Storage | Read Models | Event/Outbox | Search
 Analytics/Warehouse | Knowledge/Vector | Cache
                                │
                                ▼
                     INFRASTRUCTURE + OPERATIONS
 CI/CD | Observability | Backups | DR | Security | Secrets | Cost
```

The critical V3 change is the introduction of a **Decision-Centric Ontology Layer** above the bounded contexts.

That layer does not replace the domain model. It exposes the domain model consistently to:

- humans,
- workflows,
- analytics,
- integrations,
- AI agents,
- future third-party applications.

This follows the strongest architectural lesson found in current enterprise platforms: enterprise software becomes more powerful when data, logic, actions and security are represented together rather than treating the database as the entire product.

---

# 1. SOURCE SYNTHESIS

## 1.1 Existing ASAS material retained

The following existing decisions remain foundational:

- Modular monolith first; no premature microservices.
- Nine canonical bounded contexts.
- Transactional outbox.
- Idempotent event consumers.
- Tenant isolation + RLS.
- Server-side authorization.
- State machines rather than direct status mutation.
- Integer centimes for DZD money.
- Immutable double-entry ledger once posted.
- Hash-chained audit trail.
- Arabic-first / RTL, French second, English third.
- Mobile field operation.
- WhatsApp-first commercial workflow.
- Contract-first engineering.
- L1–L7 AI engineering loop.
- Evidence before claims.
- Red-team verification.
- Design-token and component contracts.
- CI enforcement.
- Production database is reality; documentation never overrides introspection.
- Extend the brownfield database; never blindly rewrite it.

These are strongly supported by the supplied MASTER-SPEC and AGENTS material.

## 1.2 Existing material that must be corrected or consolidated

The 18 September external audit identifies operational defects around:

1. stale canonical-artifact registration;
2. deprecated `SESSION_STATE.md` references in context-loading documents;
3. unresolved production database/project identity;
4. branch hygiene;
5. public repository visibility;
6. the nine-context vs. fifteen-module architectural conflict;
7. multiple overlapping readiness documents;
8. missing `.gitignore`;
9. missing LICENSE;
10. the v1.6.1 Blueprint source not being stored in the repository.

The external audit also independently verified the core registers:

- 103 domain events;
- 50 permission keys × 8 personas;
- 11 state machines;
- 42 original design primitives.

Therefore V3 treats the specification layer as strong but the **governance/control plane as requiring closure before production schema work**.

---

# 2. THE CANONICAL ARCHITECTURE DECISION

## ADR-V3-001 — Nine Bounded Contexts + Platform Planes

### Problem

Some ASAS artifacts describe nine bounded contexts while another implementation specification is described as having fifteen modules.

### Decision

**Nine bounded contexts remain canonical.**

They are:

1. Core
2. CRM
3. Sales
4. Inventory
5. Finance
6. Website Studio
7. Marketing
8. Analytics
9. Documents

Scheduling, Integrations, Workflow, AI, Search/Media/Notifications and SaaS Control are **platform capabilities / subdomains / planes**, not additional DDD bounded contexts unless a future ADR proves independent ownership and transactional boundaries are required.

### Why

A bounded context is a semantic and ownership boundary, not a feature list.

Calling every platform capability a bounded context would fragment the current modular-monolith architecture and create false boundaries.

### Result

```text
DOMAIN CONTEXTS
Core
CRM
Sales
Inventory
Finance
Studio
Marketing
Analytics
Documents

PLATFORM CAPABILITIES
Identity
Tenancy
Authorization
Audit
Events
Workflow
Scheduling
Search
Media
Notifications
Integrations
Configuration
AI
SaaS Control
Developer Platform
```

This resolves the conceptual nine-vs-fifteen conflict without forcing premature schema fragmentation.

---

# 3. THE ASAS PLATFORM MODEL

V3 uses five architectural planes.

## Plane A — Experience

Where humans and external applications interact.

```text
Public Web
Operations Desktop
Mobile Field OS
Customer Portal
Partner Portal
Executive Command Center
AI Workspace
Public API
Webhooks
```

## Plane B — Decision / Application

Where work is requested and executed.

```text
Commands
Queries
Policies
Approvals
Workflows
Jobs
Rules
Calculations
Simulations
```

## Plane C — Ontology

The common operational representation.

```text
Objects
Properties
Links
Actions
States
Rules
Security
Lineage
```

## Plane D — Domain

The nine bounded contexts.

## Plane E — Platform / Data / Infrastructure

The technical foundation.

---

# 4. ASAS ONTOLOGY — THE V3 CENTER OF GRAVITY

The current ASAS model is strong as a relational/domain architecture. V3 adds a semantic operational layer.

The ontology is **not a second database**.

It is a governed representation over authoritative domain records.

## 4.1 Object types

Core examples:

```text
Organization
Company
Branch
Team
User
Project
Building
Floor
Unit
Listing
Person
Lead
Customer
Opportunity
Visit
Appointment
Offer
Hold
Reservation
Contract
PaymentPlan
Installment
Receipt
LedgerEntry
Commission
Campaign
Ad
Conversation
Activity
Document
MediaAsset
Workflow
Task
Approval
Integration
Notification
```

## 4.2 Links

Examples:

```text
Project → contains → Building
Building → contains → Floor
Floor → contains → Unit

Lead → assigned_to → User
Lead → interested_in → Unit
Lead → generated_by → Campaign
Lead → has_activity → Activity
Lead → scheduled_for → Appointment

Customer → has_contract → Contract
Contract → concerns → Unit
Contract → has_payment_plan → PaymentPlan
PaymentPlan → has_installment → Installment
Installment → produces → Receipt

Campaign → generates → Lead
Campaign → spends → AdvertisingSpend
Campaign → produces → Conversion
```

## 4.3 Actions

Actions are the controlled verbs of the platform.

Examples:

```text
assign_lead
qualify_lead
schedule_visit
complete_visit
submit_offer
approve_discount
place_hold
create_reservation
release_reservation
prepare_contract
record_payment
issue_receipt
post_ledger_entry
assign_unit
publish_project
publish_unit
send_message
create_task
approve_workflow
run_report
run_simulation
```

## 4.4 Security

Security is attached to:

- object,
- property,
- relationship,
- action,
- workflow,
- integration,
- AI tool,
- document,
- tenant,
- purpose.

This is more powerful than role-only authorization.

---

# 5. MASTER DATA ARCHITECTURE

V3 explicitly separates data classes.

## 5.1 Master data

Slow-changing entities that define the enterprise.

```text
Organization
Company
Branch
Team
User
Project
Building
Unit
Person
Customer
Vendor
Developer
ChartOfAccounts
```

## 5.2 Reference data

Controlled catalogs.

```text
Countries
Wilayas
Communes
PropertyTypes
UnitTypes
LeadSources
PipelineStages
PaymentMethods
Currencies
Languages
DocumentTypes
ActivityTypes
LossReasons
Amenities
ConstructionStatuses
```

## 5.3 Transactional data

Business facts.

```text
Lead
Visit
Offer
Reservation
Contract
Payment
Receipt
Commission
CampaignTouch
Appointment
WorkflowRun
```

## 5.4 Event data

Immutable business facts.

```text
lead.created
lead.assigned
visit.completed
reservation.created
reservation.expired
payment.recorded
contract.signed
unit.sold
...
```

## 5.5 Analytical data

Derived models.

```text
Sales Funnel
Cohorts
Campaign Performance
Inventory Velocity
Collections
Cashflow
Agent Performance
Forecasts
```

## 5.6 Document data

```text
Contracts
Reservations
Invoices
Receipts
Brochures
Plans
Floorplans
Identity Documents
Compliance Documents
```

## 5.7 Audit data

Immutable security/business evidence.

## 5.8 Knowledge data

Unstructured information usable by humans and AI.

```text
Policies
SOPs
Product Knowledge
Project Documents
FAQs
Legal Guidance
Training Material
Meeting Notes
```

---

# 6. DATA LINEAGE — NEW V3 REQUIREMENT

Every important derived value should answer:

> Where did this number come from?

Example:

```text
ROAS
 ↓
Campaign Conversion
 ↓
Reservation
 ↓
Lead
 ↓
Attribution Touch
 ↓
Ad Click ID
 ↓
Ad Platform
```

Similarly:

```text
Outstanding Balance
 ↓
Payment Schedule
 ↓
Contract
 ↓
Reservation
 ↓
Unit
```

Every analytics metric should have:

```text
Metric ID
Definition
Owner
Source tables/events
Transformation
Refresh frequency
Filters
Version
Effective date
```

No "dashboard magic numbers."

---

# 7. CONFIGURATION / METADATA PLANE

This is a major V3 addition.

Enterprise platforms become adaptable because administrators can configure behavior without changing source code.

ASAS should eventually support:

```text
Custom fields
Custom labels
Custom pipeline stages
Custom approval thresholds
Custom workflows
Custom notifications
Custom forms
Custom document templates
Custom report definitions
Custom dashboards
Custom roles
Custom permissions
Custom views
Custom automations
```

But:

**configuration must never override security or core invariants.**

Hierarchy:

```text
Code invariant
   ↓
Domain rule
   ↓
Policy
   ↓
Tenant configuration
   ↓
User preference
```

Lower layers cannot weaken higher layers.

---

# 8. WORKFLOW ENGINE V3

The workflow engine becomes a first-class platform capability.

## Trigger types

```text
Object Created
Object Updated
State Changed
Event Received
Schedule
Webhook
Threshold
Approval Result
External Event
```

## Conditions

```text
AND
OR
NOT
comparison
existence
time window
role
tenant
property
numeric threshold
```

## Actions

```text
Create Task
Send Notification
Send WhatsApp
Send Email
Create Approval
Update via Domain Action
Generate Document
Call Integration
Publish Content
Start Workflow
Wait
Retry
Escalate
```

## Workflow safety

Every workflow has:

```text
version
status
owner
permissions
timeout
retry policy
idempotency key
max executions
failure policy
compensation policy
audit
```

---

# 9. APPROVAL ENGINE

Approval must be separated from ordinary workflow.

Examples:

```text
Discount > 5%
Refund > threshold
Price override
Reservation extension
Contract amendment
Ledger correction
Data export
Bulk deletion/anonymization
AI action with financial impact
```

Approval object:

```text
ApprovalRequest
ApprovalStep
Approver
Decision
DecisionReason
Evidence
Timestamp
```

No approval may be silently bypassed by an AI agent.

---

# 10. EVENT ARCHITECTURE V3

Current ASAS has a strong event catalog. V3 adds governance around it.

Every event must contain:

```text
event_id
event_type
event_version
source
aggregate_type
aggregate_id
tenant_id
actor_id
correlation_id
causation_id
occurred_at
schema_version
data_classification
payload
```

## Required properties

- immutable;
- versioned;
- idempotent;
- traceable;
- replayable where safe;
- observable;
- permission-aware.

## Event lifecycle

```text
Domain command
 ↓
Transaction
 ↓
Domain mutation
 ↓
Audit
 ↓
Outbox event
 ↓
Commit
 ↓
Dispatcher
 ↓
Consumer
 ↓
Idempotency check
 ↓
Handler
 ↓
Evidence
```

## New V3 capability: reconciliation

Events can be missed or duplicated.

Therefore:

```text
Source of truth
       ↓
Expected projection
       ↓
Actual projection
       ↓
Reconciliation job
       ↓
Difference report
```

Never assume event delivery means system consistency forever.

---

# 11. INTEGRATION PLATFORM V3

The existing blueprint already has an Integration & Extensibility Platform. V3 formalizes it as a platform boundary.

## Connector model

```text
Provider
IntegrationAccount
Credential
Connection
WebhookEndpoint
WebhookDelivery
ProviderEvent
SyncCursor
HealthStatus
```

## Integration patterns

```text
REST
GraphQL
Webhooks
OAuth
SFTP
Email
Calendar
Files
Business Events
Scheduled Import
```

## Required connector properties

```text
authentication
rate limits
retry
backoff
idempotency
pagination
cursor
webhook verification
dead-letter
reconciliation
health checks
credential rotation
data residency
```

---

# 12. API PLATFORM V3

The public API is not merely `/api/v1`.

It becomes a governed developer platform.

## API layers

```text
Internal application API
Authenticated public API
Partner API
Webhook API
AI Tool API
Admin API
```

## Required capabilities

```text
API versioning
OAuth 2.x / OIDC where appropriate
API keys
scopes
rate limits
quotas
idempotency
pagination
filtering
sorting
webhooks
OpenAPI
developer documentation
usage metering
deprecation policy
```

## Rule

No external consumer receives direct database access.

---

# 13. EXTENSIBILITY PLATFORM

Future ASAS must be able to support:

```text
Apps
Extensions
Embeds
Webhooks
Custom Actions
Custom Fields
Custom Objects
Custom Workflows
Custom Reports
```

But third-party code should not run inside the trusted core initially.

Use:

```text
Extension API
+
Sandboxed execution
+
Permission scopes
+
Tenant isolation
```

---

# 14. SEARCH PLATFORM

Search becomes shared infrastructure.

## Search domains

```text
Projects
Units
Listings
Leads
Customers
Documents
Activities
Contracts
Payments
Tasks
Knowledge
```

## Search requirements

- tenant-aware;
- permission-aware;
- typo tolerant;
- Arabic/French/English;
- phone normalization;
- reference-number exact match;
- semantic search for knowledge;
- filters;
- facets;
- ranking;
- audit of sensitive searches where required.

---

# 15. DOCUMENT PLATFORM

Documents are not merely file uploads.

V3 defines:

```text
Document
DocumentVersion
DocumentTemplate
DocumentType
DocumentRelationship
DocumentAccessPolicy
DocumentSignature
DocumentRetentionPolicy
```

Capabilities:

```text
generation
versioning
preview
OCR
metadata extraction
access control
retention
legal hold
redaction
watermark
signature integration
```

Electronic-signature behavior remains a legal-validation item for Algerian real-estate contracts; the supplied BRD explicitly flags it as unresolved.

---

# 16. COMMUNICATION PLATFORM

Communication becomes an object, not an ad-hoc side effect.

```text
Conversation
Participant
Message
Template
Channel
Delivery
ReadReceipt
Consent
Suppression
```

Channels:

```text
WhatsApp
Email
SMS
Push
In-app
Phone activity
```

The communication engine must support:

```text
consent
opt-out
template approval
localization
delivery status
retry
rate limits
quiet hours
audit
```

---

# 17. CUSTOMER 360

Customer data should become a unified operational profile:

```text
Person
 ├── Leads
 ├── Opportunities
 ├── Visits
 ├── Offers
 ├── Reservations
 ├── Contracts
 ├── Payments
 ├── Messages
 ├── Documents
 ├── Tasks
 └── Service history
```

A customer can have multiple transactions without creating multiple disconnected identities.

---

# 18. REAL ESTATE CORE — V3

The real-estate model remains the strategic moat.

## Hierarchy

```text
Organization
 ↓
Project
 ↓
Building
 ↓
Floor
 ↓
Unit
```

For brokerage:

```text
Owner
 ↓
Mandate
 ↓
Listing
 ↓
Property
```

Both feed the commercial model.

## Unit lifecycle

Separate:

### Commercial state

```text
AVAILABLE
HELD
RESERVED
CONTRACTED
SOLD
OFF_MARKET
```

### Construction state

```text
NOT_STARTED
FOUNDATION
STRUCTURE
MASONRY
MEP
FINISHING
READY
DELIVERED
```

These must never be collapsed into one status.

---

# 19. RESERVATION SAFETY

Reservation is a critical consistency boundary.

The system must guarantee:

```text
one active winner per unit
```

under concurrency.

Required protections:

```text
database uniqueness
transaction isolation
conditional write
expiration handling
idempotency
race tests
audit
outbox event
```

Application checks alone are insufficient.

---

# 20. FINANCE ARCHITECTURE V3

Finance is a separate integrity domain.

## Money

```text
AmountCentimes
Currency
```

No floating point for monetary values.

## Ledger

```text
Account
AccountingPeriod
Journal
JournalEntry
JournalLine
```

Invariant:

```text
SUM(debits) = SUM(credits)
```

Posted entries are immutable.

Corrections are new entries.

## Finance hierarchy

```text
Commercial transaction
 ↓
Payment obligation
 ↓
Payment
 ↓
Receipt
 ↓
Subledger
 ↓
General ledger
 ↓
Reporting
```

---

# 21. COLLECTIONS ENGINE

Collections should become its own operational capability within Finance.

```text
Due
 ↓
Reminder
 ↓
Promise
 ↓
Overdue
 ↓
Escalation
 ↓
Payment
 ↓
Reconciliation
```

AI may recommend actions, but deterministic rules control:

- legal eligibility;
- payment posting;
- ledger mutation;
- receipt creation;
- approval requirements.

---

# 22. COMMISSION ENGINE

Commission needs:

```text
CommissionPlan
CommissionRule
CommissionParticipant
CommissionAccrual
CommissionPayout
Adjustment
Approval
```

Rules may depend on:

```text
project
unit
agent
team
campaign
source
deal value
collection status
contract state
```

Never calculate final payable commissions only in the frontend.

---

# 23. CONSTRUCTION-LITE → FUTURE CONSTRUCTION OS

Current ASAS deliberately keeps construction tracking limited.

V3 creates an evolution path:

```text
Construction Milestones
        ↓
Progress
        ↓
Documents
        ↓
Payment Eligibility
        ↓
Delivery Forecast
```

Future:

```text
Sites
Packages
Subcontractors
Work Orders
Inspections
Materials
Progress Photos
Defects
Handover
Warranty
```

Do not implement the full construction platform until real operating requirements justify it.

---

# 24. MARKETING + GROWTH DATA PLANE

The existing blueprint already contains strong advertising architecture.

V3 formalizes:

```text
Campaign
Ad
Creative
Audience
Source
UTMEvent
ClickID
AdLead
AttributionTouch
Spend
Conversion
```

Closed loop:

```text
Ad
 ↓
Click
 ↓
Lead
 ↓
Qualification
 ↓
Visit
 ↓
Offer
 ↓
Reservation
 ↓
Sale
 ↓
Revenue
 ↓
ROAS/CAC
 ↓
Campaign optimization
```

Attribution must remain versioned and explainable.

---

# 25. ANALYTICS ARCHITECTURE

Three layers:

## Operational analytics

Fast read models.

## Historical analytics

Warehouse/event-based.

## Predictive intelligence

Models:

```text
lead conversion
inventory velocity
collection risk
campaign performance
sales forecast
cashflow forecast
```

Every prediction must include:

```text
model
version
timestamp
input snapshot
confidence
explanation/feature summary where applicable
```

---

# 26. AI OPERATING SYSTEM V3

AI becomes a platform capability, not a chatbot.

## AI architecture

```text
                    AI CONTROL PLANE
                           │
        ┌──────────────────┼──────────────────┐
        ↓                  ↓                  ↓
   MODEL GATEWAY       AGENT RUNTIME       EVALS
        │                  │                  │
        ↓                  ↓                  ↓
   Model Router        Tool Gateway       Test Sets
        │                  │                  │
        └──────────────────┼──────────────────┘
                           ↓
                     ASAS ONTOLOGY
                           ↓
                     DOMAIN ACTIONS
                           ↓
                     AUTHORIZATION
                           ↓
                     HUMAN APPROVAL
                           ↓
                       EXECUTION
```

---

# 27. AI AGENT TYPES

## Executive Agent

Answers:

```text
What happened?
Why?
What needs attention?
What changed?
What is at risk?
```

## Sales Agent

```text
lead qualification
next action
follow-up
matching
pipeline summaries
```

## CRM Agent

```text
dedupe
assignment analysis
SLA monitoring
data quality
```

## Marketing Agent

```text
campaign analysis
creative analysis
attribution
budget recommendations
```

## Finance Agent

```text
collections analysis
cashflow explanation
reconciliation assistance
```

## Inventory Agent

```text
availability analysis
pricing insights
inventory aging
```

## Construction Agent

Future.

## Knowledge Agent

```text
search policies
project documents
SOPs
legal/internal guidance
```

---

# 28. AI TOOL SECURITY

The LLM never gets database credentials.

Tool flow:

```text
LLM requests tool
 ↓
Tool Gateway
 ↓
Caller identity
 ↓
Tenant
 ↓
Permission
 ↓
Policy
 ↓
Input validation
 ↓
Dry-run if required
 ↓
Approval if required
 ↓
Domain action
 ↓
Transaction
 ↓
Audit
 ↓
Result
```

AI inherits the caller's authority.

It cannot escalate privileges.

---

# 29. AI ACTION CLASSES

### Read

Low risk.

### Recommend

No mutation.

### Draft

Creates a proposed artifact.

### Execute reversible

Requires normal authorization.

### Execute sensitive

Requires additional policy.

### Execute financial/destructive

Requires explicit approval.

```text
AI must never bypass approval because the prompt says:
"do it immediately."
```

---

# 30. AI MEMORY

Memory must be scoped.

```text
Global ASAS knowledge
Organization knowledge
Team knowledge
User memory
Conversation memory
Task memory
```

Sensitive information must never leak between tenants.

Memory requires:

```text
source
timestamp
owner
retention
permission
confidence
```

---

# 31. AI EVALUATION SYSTEM

Every production agent gets an evaluation suite.

```text
Golden cases
Adversarial cases
Permission cases
Ambiguous cases
Hallucination cases
Regression cases
Tool-selection cases
Cost/latency cases
```

Metrics:

```text
groundedness
tool accuracy
policy compliance
action correctness
refusal correctness
latency
cost
regression rate
```

No agent reaches production merely because its responses "look good."

---

# 32. SIMULATION / DRY-RUN MODE

New V3 capability.

Before a risky action:

```text
AI proposes
 ↓
Simulation
 ↓
Expected changes
 ↓
Risk analysis
 ↓
Approval
 ↓
Execution
```

Example:

> "Extend all reservations expiring today."

The system should show:

```text
14 reservations affected
3 conflict with another pending lead
2 require director approval
9 are eligible
```

Only then execute.

---

# 33. AI MODEL GATEWAY

Do not couple ASAS to one LLM provider.

```text
ASAS AI Gateway
 ├── Model routing
 ├── provider credentials
 ├── fallback
 ├── rate limits
 ├── token budgets
 ├── cost accounting
 ├── policy
 ├── logging
 └── eval hooks
```

This prevents vendor lock-in.

---

# 34. SECURITY V3

Security model:

```text
Identity
 ↓
Tenant
 ↓
Role
 ↓
Scope
 ↓
Attribute
 ↓
Purpose
 ↓
Resource
 ↓
Action
 ↓
Policy
 ↓
Audit
```

Capabilities:

- RBAC;
- ABAC;
- RLS;
- field/column restrictions where required;
- object/action authorization;
- secrets management;
- encryption;
- key rotation;
- session security;
- MFA;
- rate limiting;
- abuse detection;
- security events;
- incident response.

---

# 35. TENANCY V3

Every SaaS record that is tenant-owned carries a tenant boundary.

Canonical hierarchy:

```text
Platform
 ↓
Organization
 ↓
Company
 ↓
Branch
 ↓
Team
 ↓
User
```

Tenant boundary must exist in:

```text
database
cache
search
storage
events
jobs
analytics
AI memory
logs
integrations
```

A tenant identifier in the application is not sufficient if another subsystem can leak data.

---

# 36. TENANT LIFECYCLE

New:

```text
Provision
 ↓
Configure
 ↓
Seed
 ↓
Invite
 ↓
Activate
```

Operational:

```text
Active
Suspended
Read-only
```

End:

```text
Export
 ↓
Retention
 ↓
Anonymization
 ↓
Deprovision
```

No arbitrary deletion.

---

# 37. SAAS CONTROL PLANE

Phase 11 should become:

```text
Tenant Registry
Subscription
Plan
Entitlement
Usage
Meter
Quota
Billing
Invoice
Feature Flag
Provisioning
Environment
Support Access
```

Example:

```text
Plan = Professional

CRM leads = 50,000
Users = 50
Storage = 500 GB
AI credits = 100,000
WhatsApp integrations = 2
```

Entitlements must be enforced server-side.

---

# 38. BILLING + USAGE METERING

Future SaaS needs:

```text
subscription
invoice
payment
usage event
meter
quota
credit
overage
```

Usage examples:

```text
active users
API calls
storage
AI tokens
workflow runs
messages
documents
```

This is necessary for sustainable SaaS economics.

---

# 39. ENVIRONMENT MODEL

At minimum:

```text
Local
Development
Preview
Staging
Production
```

Future:

```text
Tenant Sandbox
Customer UAT
Regional Production
Disaster Recovery
```

Production data must never be casually copied into lower environments.

---

# 40. RELEASE ARCHITECTURE

```text
PR
 ↓
Static checks
 ↓
Unit
 ↓
Integration
 ↓
Security
 ↓
Architecture gates
 ↓
E2E
 ↓
Build
 ↓
Preview
 ↓
Approval
 ↓
Migration
 ↓
Deploy
 ↓
Smoke
 ↓
Observability
```

Migration and deployment must be backward-compatible.

---

# 41. ARCHITECTURE ENFORCEMENT

CI must enforce:

```text
Domain boundaries
Import direction
No cross-context DB access
No raw status mutation
No unauthorized route
No missing tenant filter
No missing Zod validation
No floating-point money
No direct AI DB access
No unregistered events
No unregistered permissions
No unregistered state machine
No design-token drift
```

This turns architecture from documentation into executable policy.

---

# 42. CONTRACT REGISTRY

V3 introduces a unified registry model.

```text
contracts/
 ├── domain
 ├── api
 ├── events
 ├── permissions
 ├── states
 ├── workflows
 ├── ai-tools
 ├── metrics
 └── integrations
```

Every contract gets:

```text
id
version
owner
status
source
effective_date
deprecated_date
tests
```

---

# 43. TRACEABILITY GRAPH

Every major requirement maps to:

```text
Requirement
 ↓
Architecture decision
 ↓
Domain rule
 ↓
Contract
 ↓
Implementation
 ↓
Test
 ↓
Evidence
 ↓
Production metric
```

Example:

```text
REQ-RESERVATION-001
 ↓
ADR-RES-001
 ↓
INV-RES-ONE-WINNER
 ↓
Reservation API Contract
 ↓
DB Constraint
 ↓
Race Test
 ↓
E2E Test
 ↓
Production Probe
```

This is the foundation for AI-generated engineering with controlled uncertainty.

---

# 44. TESTING PYRAMID V3

```text
             Production probes
                  ▲
             Chaos / recovery
                  ▲
              E2E journeys
                  ▲
          Security / tenant gates
                  ▲
        Integration / contract tests
                  ▲
              Unit tests
                  ▲
          Static architecture checks
```

Critical business invariants receive race/concurrency tests.

---

# 45. GOLDEN JOURNEYS

At minimum:

```text
Lead → Contact → Visit → Offer → Reservation
Reservation → Contract → Payment → Sale
Campaign → Lead → Attribution → Reservation
Unit → Hold → Reservation → Expiration → Available
Customer → Document → Approval → Contract
Appointment → Calendar → Reminder → Completion
AI → Tool → Approval → Domain Action
Tenant A → query → cannot see Tenant B
```

---

# 46. OBSERVABILITY V3

Three layers.

## Technical

```text
latency
errors
CPU
memory
DB
connections
cache
queue
```

## Business

```text
unassigned leads
stalled leads
reservation conflicts
overdue payments
failed integrations
publishing failures
```

## AI

```text
tokens
cost
latency
tool calls
failure
hallucination/eval score
policy violations
```

Every important operation should carry:

```text
trace_id
request_id
correlation_id
tenant_id
actor_id
```

---

# 47. SLO MODEL

Do not use one global "99.99%" slogan.

Define SLOs per capability.

Example categories:

```text
Authentication
Public site
Lead capture
Inventory availability
Reservation
Payment recording
Publishing
Messaging
AI
Analytics
```

Critical transaction paths get stricter correctness requirements than non-critical analytics.

---

# 48. DISASTER RECOVERY

Required:

```text
RPO
RTO
backup
restore
restore verification
regional recovery
dependency inventory
runbook
incident owner
communication plan
```

A backup that has never been restored is not proven recovery.

---

# 49. DATA GOVERNANCE

V3 adds:

```text
Data owner
Data steward
Classification
Purpose
Retention
Lineage
Quality score
Access policy
Deletion/anonymization policy
Export policy
```

Classification:

```text
PUBLIC
INTERNAL
CONFIDENTIAL
RESTRICTED
HIGHLY_RESTRICTED
```

This classification propagates into:

```text
AI
logs
exports
analytics
documents
integrations
```

---

# 50. DATA QUALITY ENGINE

Data quality becomes measurable.

Dimensions:

```text
completeness
uniqueness
validity
consistency
timeliness
referential integrity
```

Examples:

```text
duplicate phone numbers
units without project
leads without owner
reservations without customer
payments without receipt
documents without owner
events without tenant
```

A data-quality dashboard should exist before AI depends heavily on the data.

---

# 51. LOCALIZATION / MULTI-COUNTRY

Architecture separates:

```text
Core model
+
Country pack
```

Country pack contains:

```text
currency
tax
legal rules
document rules
address model
phone format
locale
calendar
business holidays
payment methods
contract rules
consent rules
property regulations
```

Algeria is Country Pack DZ.

Future:

```text
AE
SA
QA
MA
TN
...
```

Never encode Algeria-specific rules as global constants.

---

# 52. TIME / CURRENCY / NUMBER MODEL

All timestamps:

```text
UTC internally
localized at presentation
```

Money:

```text
integer minor units
currency code
exchange-rate source
effective timestamp
```

No implicit currency.

---

# 53. PUBLIC EXPERIENCE

The public side remains premium real estate, not a generic SaaS dashboard.

Core funnel:

```text
Discovery
 ↓
Project
 ↓
Unit
 ↓
Trust
 ↓
WhatsApp / Call / Form
 ↓
Lead
 ↓
CRM
```

Public data is a **published projection**, not direct operational data exposure.

---

# 54. STUDIO PUBLISHING

```text
Draft
 ↓
Validate
 ↓
Review
 ↓
Publish
 ↓
Projection
 ↓
Cache invalidation
 ↓
Public site
```

Rollback:

```text
Current Version
 ↓
Previous Version
```

Every publish is versioned and auditable.

---

# 55. FRONTEND V3

The existing v1.6 frontend contract remains:

```text
Server first
Islands only when needed
Database is state machine
Logical RTL properties
Design tokens
WCAG 2.2 AA
```

But V3 adds:

```text
feature flags
experiment flags
permission-aware rendering
offline action queues
optimistic UI only where safe
command palette
universal search
keyboard navigation
deep-linking
saved views
bulk actions
```

---

# 56. MOBILE FIELD OS

The field agent needs:

```text
Lead
Call
WhatsApp
Visit
Appointment
Property
Navigation
Notes
Photos
Documents
Tasks
Offline capture
```

Offline policy:

```text
read cached
capture locally
queue action
show pending state
sync
resolve conflict
audit result
```

Never pretend a financial or reservation action is successful while offline unless the domain explicitly supports safe reservation semantics.

---

# 57. COMMAND CENTER

The Executive Command Center should answer:

```text
What changed?
What matters?
What is blocked?
What is at risk?
What requires my decision?
What happened to cash?
What happened to sales?
What happened to inventory?
What happened to marketing?
What is the next action?
```

Not 50 decorative charts.

---

# 58. CONTROL CENTER

Administrator experience:

```text
People
Roles
Permissions
Organizations
Branches
Catalogs
Workflows
Integrations
API
Notifications
Templates
Documents
Data
Security
Audit
Billing
AI
System Health
```

---

# 59. DEVELOPER EXPERIENCE

Future ASAS developers should have:

```text
CLI
SDK
API docs
Webhooks
Sandbox
Test tenant
Event catalog
Object catalog
Action catalog
Permission catalog
Schema registry
Versioning
Changelog
Examples
```

This is the Shopify/Salesforce/Zoho-style extensibility layer adapted to real estate.

---

# 60. PLATFORM MARKETPLACE — FUTURE

Not MVP.

Potential:

```text
WhatsApp providers
Accounting connectors
Payment providers
Notary workflows
Property portals
Maps
AI agents
Reporting packs
Country packs
Construction integrations
```

Every extension gets:

```text
permissions
version
publisher
health
billing
security review
tenant installation
```

---

# 61. WHAT V3 EXPLICITLY REJECTS

### Reject: premature microservices

Use modular monolith until evidence requires extraction.

### Reject: generic ERP clone

ASAS must remain real-estate-first.

### Reject: AI-first database mutation

AI proposes/tools; domain services execute.

### Reject: direct DB writes from UI

All mutations through application/domain contracts.

### Reject: role-only security

Use scope + policy + tenant + action.

### Reject: dashboard-only analytics

Analytics must connect to operational action.

### Reject: event bus without reconciliation

Events require recovery/replay/reconciliation.

### Reject: configurable everything

Core invariants remain immutable.

### Reject: one global schema for every country

Use country packs.

### Reject: "100% bug-free"

Use verified change gates and measurable reliability instead.

---

# 62. THE NEW ASAS "OPERATING SYSTEM" MODEL

The platform can be understood as:

```text
                     ┌─────────────────┐
                     │     PEOPLE      │
                     └────────┬────────┘
                              │
                     ┌────────▼────────┐
                     │   EXPERIENCES   │
                     └────────┬────────┘
                              │
                     ┌────────▼────────┐
                     │ DECISION PLANE  │
                     └────────┬────────┘
                              │
                ┌─────────────▼─────────────┐
                │        ONTOLOGY           │
                │ DATA + LOGIC + ACTION     │
                │       + SECURITY          │
                └─────────────┬─────────────┘
                              │
          ┌───────────────────┼───────────────────┐
          │                   │                   │
       DOMAIN              WORKFLOW             AI
          │                   │                   │
          └───────────────────┼───────────────────┘
                              │
                     ┌────────▼────────┐
                     │ PLATFORM KERNEL │
                     └────────┬────────┘
                              │
                     ┌────────▼────────┐
                     │   DATA PLANE    │
                     └────────┬────────┘
                              │
                     ┌────────▼────────┐
                     │ INFRASTRUCTURE  │
                     └─────────────────┘
```

---

# 63. AI DEVELOPER OPERATING SYSTEM V3

The existing L1–L7 loop is retained.

V3 adds:

## L0 — Reality Lock

Before planning:

```text
repo identity
environment
database identity
branch
commit
package manager
lockfile
current gates
```

If identity is uncertain:

```text
STOP
```

This directly addresses the September 18 near-miss around the wrong Supabase project.

## L1 — Locate

Task + scope.

## L2 — Load

Contracts + relevant chapters.

## L3 — Plan

Files + implementation plan.

## L4 — Verify

Reality + external facts + APIs.

## L5 — Implement

Contract first.

## L6 — Prove

Tests + gates.

## L6.5 — Converge

Spec vs implementation.

## L7 — Report

Evidence + gaps + lessons.

---

# 64. AGENT SPECIALIZATION V3

```text
Orchestrator
 ├── Product Architect
 ├── Domain Architect
 ├── Data Architect
 ├── Security Architect
 ├── UX Architect
 ├── Backend Agent
 ├── Frontend Agent
 ├── Integration Agent
 ├── AI Agent
 ├── QA Agent
 ├── Performance Agent
 ├── Red Team Agent
 └── Independent Reviewer
```

No agent may silently override another agent's contract.

---

# 65. AGENT AUTHORITY MODEL

### Tier A

Reversible low-risk work.

### Tier B

Changes requiring micro-ADR.

### Tier C

Founder decision.

### Tier D

Human-only / prohibited autonomous execution.

Tier D examples:

```text
production destructive migration
financial correction
security bypass
credential rotation with outage risk
tenant deletion
legal interpretation
contract-signature decision
mass customer communication
```

---

# 66. RESEARCH PROTOCOL

Every unfamiliar external fact:

```text
Question
 ↓
Primary source
 ↓
Current version/date
 ↓
Alternative evidence
 ↓
Decision
 ↓
ADR/research note
 ↓
Expiration/review date
```

Priority:

```text
official documentation
standards
law/regulator
vendor docs
peer-reviewed/authoritative research
reputable secondary analysis
community sources
```

AI memory is never the authority for current versions or legal requirements.

---

# 67. GOVERNANCE SOURCE OF TRUTH

The V3 authority chain is:

```text
Founder/Product Constitution
        ↓
Architecture
        ↓
Contracts
        ↓
Registers
        ↓
Repository
        ↓
Runtime
        ↓
Evidence
```

The database remains the authority for existing brownfield reality.

**Never reverse the chain to make documentation match code.**

---

# 68. CANONICAL ARTIFACT MODEL

One concept → one canonical owner.

Examples:

```text
Architecture → MASTER-SPEC / V3
Tasks → task register
Events → events.json
Permissions → permissions.csv
States → state-machines.json
UI tokens → design-tokens.json
Components → component-inventory.md
Schema → asas-contracts.prisma + live DB for brownfield reality
Readiness → one canonical readiness document
Session state → CURRENT-SESSION-STATE.md
```

Duplicate documents become pointers or are retired.

---

# 69. FOUNDATION CLOSURE BEFORE IMPLEMENTATION

V3 declares the following gates mandatory:

## GATE-00 — Platform identity

Verified:

```text
GitHub repo
Supabase project
Vercel project
production branch
development project
environment mapping
```

with a technical guard, not only documentation.

## GATE-01 — Canonical artifacts

No stale register.

## GATE-02 — Architecture conflict

Nine contexts vs modules formally resolved.

## GATE-03 — Database reality

Live introspection verified.

## GATE-04 — Security baseline

Tenant/RLS/auth verified.

## GATE-05 — CI

Architecture gates operational.

## GATE-06 — Repository hygiene

Branches, protection, ignore rules, source-of-truth documents.

## GATE-07 — Implementation authorization

Only after 00–06 pass.

---

# 70. V3 DELIVERY PHASES

The existing 14-phase delivery plan is reorganized into six strategic horizons.

## Horizon 0 — Foundation

```text
Platform identity
Canonical artifacts
Database reality
CI
Security baseline
Migration baseline
```

## Horizon 1 — Commercial Core

```text
Inventory
CRM
Sales
Reservations
Contracts
Finance
```

## Horizon 2 — Operating Platform

```text
Studio
Marketing
Scheduling
Documents
Notifications
Search
Automation
```

## Horizon 3 — Intelligence

```text
Analytics
AI Copilot
AI tools
Evals
Decision support
```

## Horizon 4 — Platformization

```text
Multi-tenancy
API
Integrations
Developer platform
Billing
Entitlements
Usage
```

## Horizon 5 — Geographic / Enterprise Expansion

```text
Country packs
Multi-region
Advanced construction
Investment
Property management
Holding
Marketplace
```

---

# 71. MVP DEFINITION — V3

MVP must prove the business loop, not the architecture diagram.

Required:

```text
Project
Building
Unit
Lead
Assignment
Activity
Visit
Offer
Reservation
Contract preparation
Payment plan
Payment
Receipt
Audit
Basic reporting
```

Golden journey:

```text
Lead
→ qualified
→ matched
→ visit
→ offer
→ reservation
→ contract
→ payment
→ closed
```

The MVP should not attempt:

```text
full construction OS
full accounting suite
marketplace
multi-country
autonomous AI
complex SaaS billing
```

---

# 72. V1 — REAL ESTATE OPERATING SYSTEM

Add:

```text
Studio
Marketing
Scheduling
Mobile
Documents
Automation
Analytics
```

This is the first true ASAS platform.

---

# 73. V2 — INTELLIGENT REAL ESTATE OS

Add:

```text
AI Copilot
AI Sales
AI CRM
AI Marketing
AI Finance
Forecasting
Risk
Collections
Knowledge
```

All governed by the AI control plane.

---

# 74. V3 — MULTI-TENANT PLATFORM

Add:

```text
Tenant control plane
Plans
Entitlements
Usage
Billing
Public API
Developer portal
Webhooks
Connectors
Sandbox
Marketplace foundations
```

---

# 75. V4 — REAL ESTATE INDUSTRIAL OS

Future domains:

```text
Land
Feasibility
Development
Construction
Sales
Finance
Collections
Handover
SAV
Property Management
Brokerage
Investment
Asset Management
```

---

# 76. HOLDING OS

Only after the real-estate operating system is mature:

```text
Holding
 ↓
Companies
 ↓
Business Units
 ↓
Projects
 ↓
Assets
 ↓
Capital
 ↓
People
 ↓
Customers
 ↓
Financial Consolidation
```

Do not build this before operational demand exists.

---

# 77. WHAT WAS MISSING FROM THE PREVIOUS ASAS VISION

V3 explicitly closes these gaps:

1. Decision-centric ontology.
2. Canonical object/action model.
3. Master-data governance.
4. Reference-data governance.
5. Data lineage.
6. Data-quality engine.
7. Metadata/configuration plane.
8. Workflow runtime governance.
9. Approval engine separation.
10. Event reconciliation.
11. API management as a product.
12. Developer platform.
13. Extension permissions.
14. Tenant lifecycle.
15. SaaS entitlement engine.
16. Usage metering.
17. Subscription/billing architecture.
18. AI model gateway.
19. AI memory governance.
20. AI simulation/dry-run.
21. AI evaluation registry.
22. Data classification propagation.
23. Customer 360.
24. Communication object model.
25. Document governance.
26. Country-pack architecture.
27. SLOs per capability.
28. Disaster-recovery verification.
29. Contract traceability graph.
30. Architecture-as-code gates.
31. Environment/sandbox model.
32. Reconciliation architecture.
33. Search as a platform capability.
34. Configuration safety hierarchy.
35. Platform control plane.

These are the major additions required to move from a very strong real-estate ERP/CRM blueprint to a **real platform architecture**.

---

# 78. WHAT WE SHOULD NOT ADD YET

To avoid architecture inflation:

```text
Kubernetes
Kafka
service mesh
global multi-region
full data lake
full MDM product
full BPM suite
full construction ERP
full HR suite
full procurement suite
full investment bank
autonomous financial agents
third-party marketplace
```

The architecture should permit them.

The product should not prematurely implement them.

---

# 79. THE FINAL ARCHITECTURAL TEST

Before adding any capability, ask:

### Does it improve:

```text
revenue
conversion
operational control
data integrity
customer experience
security
automation
AI readiness
extensibility
scalability
```

If no:

Do not build it.

If yes:

Ask whether it belongs in:

```text
domain
platform
experience
integration
analytics
AI
```

Then assign a canonical owner.

---

# 80. THE FINAL ASAS ARCHITECTURE

```text
                           ASAS
                            │
             ┌──────────────┴──────────────┐
             │                             │
       EXPERIENCE                       API / APPS
             │                             │
             └──────────────┬──────────────┘
                            │
                   DECISION PLATFORM
                            │
       ┌────────────────────┼────────────────────┐
       │                    │                    │
     HUMAN                WORKFLOW               AI
       │                    │                    │
       └────────────────────┼────────────────────┘
                            │
                       ONTOLOGY
               DATA + LOGIC + ACTION
                       + SECURITY
                            │
       ┌────────────────────┼────────────────────┐
       │                    │                    │
    DOMAIN              PLATFORM              DATA
       │                    │                    │
       │          Identity / Tenant             │
       │          Auth / Audit                  │
       │          Events / Search               │
       │          Files / Messaging             │
       │          Scheduling / Integrations     │
       │          Configuration                │
       │                    │                    │
       └────────────────────┼────────────────────┘
                            │
                       POSTGRESQL
                            │
          ┌─────────────────┼─────────────────┐
          │                 │                 │
       EVENTS            STORAGE          ANALYTICS
          │                                   │
          └─────────────────┬─────────────────┘
                            │
                     OBSERVABILITY
                            │
                     GOVERNANCE / CI
                            │
                     INFRASTRUCTURE
```

---

# 81. FINAL ENGINEERING PRINCIPLE

The objective is not:

> "AI writes perfect code."

The objective is:

> **The architecture makes incorrect code difficult to write, easy to detect, impossible to release without evidence, and recoverable when something still goes wrong.**

That is the standard V3 is designed around.

---

# 82. IMMEDIATE IMPLEMENTATION ORDER

Do **not** start by adding more features.

Execute in this order:

```text
1. Close GATE-00 platform identity
2. Correct canonical artifact register
3. Fix deprecated session-state references
4. Choose one canonical readiness document
5. Resolve nine-context / fifteen-module conflict
6. Lock V3 architecture
7. Lock contract registry
8. Lock ontology object/action registry
9. Verify live DB reality
10. Generate schema reconciliation report
11. Establish architecture-as-code CI gates
12. Establish tenant/RLS gate
13. Establish event/state/permission register gates
14. Establish data-quality baseline
15. Only then continue implementation phases
```

---

# 83. V3 DEFINITION OF "PRODUCTION READY"

ASAS is production-ready only when:

```text
Architecture = verified
Contracts = verified
Database = verified
Tenant isolation = verified
Authorization = verified
State machines = verified
Money invariants = verified
Reservation race = verified
Events = verified
Reconciliation = verified
Backup restore = verified
Security = verified
Accessibility = verified
Performance = measured
AI evals = passed
Observability = active
Incident runbooks = tested
Deployment = reproducible
Evidence = archived
```

No "looks good".

No "probably works".

No "build passed so we're done".

---

# 84. ARCHITECTURE STATUS

### Strong and retained

- Domain model
- Event architecture
- State machines
- Permissions
- Design system
- Brownfield migration discipline
- Modular monolith
- Finance integrity
- Reservation protocol
- AI developer loop
- Integration architecture
- Scheduling
- Marketing attribution
- Frontend standards

### V3 added

- Ontology
- Object/action model
- Platform control plane
- Metadata/configuration
- Data governance
- Data lineage
- Data quality
- API platform
- Developer platform
- SaaS control plane
- Entitlements
- Usage metering
- AI control plane
- AI memory
- AI eval registry
- Simulation/dry-run
- Reconciliation
- Customer 360
- Communication platform
- Country packs
- SLO/DR model
- Architecture-as-code contract registry

### Blockers before implementation authorization

The external audit's critical foundation issues remain operational blockers until actually closed in the repository/environment:

- platform identity;
- canonical artifact correctness;
- context-loading drift;
- architectural conflict;
- repository hygiene;
- repository visibility decision;
- readiness-document consolidation.

---

# 85. FINAL POSITION

ASAS V3 is therefore defined as:

**A vertical real-estate Enterprise Operating System whose core is a governed decision-centric ontology, backed by a modular domain architecture, a secure platform kernel, deterministic workflows, event-driven integration, an AI control plane, and an evidence-based AI engineering operating system.**

The platform is deliberately designed to evolve:

```text
ASAS Agency OS
      ↓
ASAS Real Estate OS
      ↓
ASAS Multi-Tenant SaaS
      ↓
ASAS Real Estate Platform
      ↓
ASAS Multi-Country Platform
      ↓
ASAS Holding OS
```

without requiring a rewrite at every stage.

That is the architectural objective.