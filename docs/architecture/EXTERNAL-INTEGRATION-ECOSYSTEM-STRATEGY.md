# ASAS External Integration Ecosystem Strategy

**Status:** OPEN / architecture contract — research-backed, implementation-gated
**Date:** 2026-09-15
**Repository:** `asas-erp-saas-1/As`

## 1. Purpose

ASAS must not become an isolated ERP/CRM that recreates commodity capabilities poorly. The platform should own the canonical real-estate domain while connecting to best-in-class external services for maps, calendars, communication, marketing, identity, documents, payments, analytics, collaboration and automation.

The objective is not "integrate everything". The objective is **best capability per category, replaceable providers, tenant-safe authorization, canonical ASAS data, and excellent UX**.

The existing blueprint already treats integrations as a platform capability and requires the public website, Studio, CRM and ERP to share canonical domain data. It also identifies Google Maps, calendar/communication, notifications, analytics, documents and plugin-style extensibility as strategic experience areas.

## 2. Architectural rule

External platforms are **capability providers, never the source of truth for ASAS business state** unless an explicit contract says otherwise.

Canonical ownership remains inside ASAS for:

- Agency / tenant identity
- Users, roles and authorization
- Projects / buildings / apartments
- Lead and customer records
- Opportunities / offers / reservations
- Contracts and financial obligations
- Payment allocation and accounting truth
- Appointments as ASAS business records
- Audit trail
- Attribution model
- Workflow state

External systems provide capabilities and projections:

`ASAS command → domain transaction → audit/outbox → connector → external API`

External callbacks return through:

`external webhook → signature verification → inbox/idempotency → domain command or projection update`

No connector may directly mutate arbitrary tables.

## 3. Integration tiers

### Tier P0 — first-class strategic integrations

These materially affect the core user experience or revenue flow.

1. Google Maps Platform
2. Google Calendar
3. Microsoft 365 / Outlook Calendar via Microsoft Graph
4. WhatsApp Business Platform / Meta Cloud API
5. Meta Marketing / Lead Ads / Conversions
6. Google Ads / offline & enhanced lead conversions
7. Google Analytics 4
8. Google Business Profile
9. Email provider abstraction
10. eSignature provider abstraction
11. Algerian payment-provider abstraction
12. Google / Microsoft identity

### Tier P1 — high-value professional integrations

13. Google Meet
14. Zoom
15. Google Drive / Microsoft OneDrive / SharePoint
16. YouTube
17. TikTok marketing/event APIs
18. LinkedIn Marketing / Conversions
19. SMS / voice provider abstraction (Twilio or regional provider)
20. Document/PDF generation and OCR provider abstraction
21. Search/index provider abstraction
22. BI/warehouse export
23. Sentry/OpenTelemetry-compatible observability
24. Automation ecosystem: webhooks + generic connector runtime

### Tier P2 — ecosystem / extensibility

25. Slack / Microsoft Teams
26. Notion / knowledge connectors
27. Dropbox / Dropbox Sign
28. Additional eSignature providers by country
29. Additional CRM/ERP import connectors
30. Property portals / listing marketplaces by country
31. Social publishing platforms as API access permits
32. Government / tax / registry connectors where legally available

## 4. Provider recommendations

| Capability | Primary | Secondary/fallback | ASAS role |
|---|---|---|---|
| Maps / geocoding / POIs | Google Maps Platform | Mapbox / HERE investigation | Project/unit location, nearby POIs, directions |
| Calendar | Google Calendar | Microsoft Graph / Outlook | Appointment projection, availability, reminders |
| Video meetings | Google Meet | Zoom | Remote visits, team meetings |
| Messaging | Meta WhatsApp Cloud API | Twilio WhatsApp / regional BSP | Lead conversations, templates, notifications |
| SMS / Voice | Regional provider + Twilio abstraction | Vonage / other regional provider | OTP, reminders, fallback communication |
| Email | Provider abstraction; Google Workspace where mailbox access is required | Microsoft Graph, transactional email provider | Transactional + user-authorized mailbox workflows |
| Ads | Meta Marketing APIs | Google Ads, TikTok, LinkedIn | Campaigns, lead ingestion, offline conversion feedback |
| Analytics | GA4 | warehouse-native analytics | Website/product attribution and behavioral analytics |
| Business presence | Google Business Profile | country-specific directories | Reviews, locations, posts, business presence |
| Identity | Google OIDC | Microsoft Entra / OIDC | SSO / account linking |
| Files | ASAS Storage | Google Drive / OneDrive / SharePoint | Import/export and customer-controlled document access |
| eSignature | Country/legal-provider abstraction | DocuSign / Dropbox Sign / Adobe Sign investigation | Signature workflow; legal validity must be jurisdiction-specific |
| Payments | Algeria-specific provider abstraction | Stripe/PayPal where legally/business-appropriate | Payment initiation/status, never accounting truth |
| OCR / document intelligence | Provider abstraction | Google/Azure/AWS/document AI vendors | Extract, classify, verify — human/legal gates remain ASAS |
| Search | PostgreSQL/search projection first | OpenSearch/Algolia/Meilisearch investigation | Authorized cross-domain search |
| Observability | OpenTelemetry + provider backend | Sentry / managed observability | traces, logs, errors, metrics |
| Automation | ASAS webhook/connector runtime | Zapier/Make/n8n-style interoperability | External orchestration, not domain authority |

## 5. Google Maps — first-class requirement

Google Maps Platform should be a first-class connector, not a simple iframe.

Required capability surface:

- Interactive project/location maps
- Place IDs
- Address validation / geocoding where appropriate
- Reverse geocoding
- Nearby places / POIs
- Driving / walking / cycling directions where supported
- Distance and travel-time estimates
- Route links from appointment/location records
- Map preview on project and apartment public pages
- Agent mobile experience: open navigation externally
- Location normalization and confidence tracking

Google documents Maps, Routes and Places as separate platform capabilities; Routes can provide distance, estimated travel time, tolls and step-by-step directions. citeturn1search17turn1search15

ASAS must store normalized coordinates/place identifiers and source metadata rather than scraping Google pages.

## 6. Calendar — full two-way synchronization

Google Calendar is the preferred first implementation. Microsoft Graph is the enterprise fallback/parallel connector.

Required capabilities:

- OAuth connection per user/tenant policy
- Calendar discovery
- Free/busy lookup
- Appointment creation
- Appointment update/reschedule
- Cancellation propagation
- Attendee management
- Reminders
- Timezone correctness
- External event ID mapping
- Push/webhook subscription
- Reconciliation after missed webhook
- Disconnect/revoke handling
- Conflict detection
- Multiple calendars per user
- Optional team/shared-calendar support

Google Calendar exposes Events, Freebusy and watch resources; event watch provides change notifications. citeturn3search3turn3search1

Microsoft Graph provides calendar/event resources, free/busy, suggested meeting times and event lifecycle operations. citeturn0search0turn0search15

**Critical rule:** Google/Outlook event state is a projection of the ASAS appointment contract. An external event must never bypass ASAS appointment authorization.

## 7. WhatsApp / communications

WhatsApp is strategically mandatory for the Algeria-first real-estate workflow.

Primary: Meta WhatsApp Business Platform / Cloud API.

Required capability surface:

- inbound messages
- outbound approved templates
- conversation threading
- delivery/read status
- media attachments
- agent assignment
- opt-in / consent
- business-initiated notifications
- lead creation from inbound conversation
- project/unit contextual deep links
- appointment reminders
- reservation/payment reminders where legally and policy permitted
- webhook signature verification
- deduplication and replay protection

Meta's Cloud API is the official WhatsApp Business Platform API and is designed for business messaging at scale. citeturn3search10

Twilio remains a provider option rather than the canonical WhatsApp integration, especially where a unified communications provider is useful. Twilio documents WhatsApp support through its communications APIs. citeturn0search10

## 8. Marketing and attribution

ASAS must connect the full funnel, not merely import leads.

### Meta

- Lead Ads ingestion
- campaign/ad/ad-set identifiers
- click/session attribution
- Conversions API feedback
- lead status feedback
- reservation/sale conversion feedback where policy and consent permit

### Google Ads

- GCLID/GBRAID/WBRAID capture as applicable
- enhanced conversions for leads
- offline conversion uploads
- revenue/value feedback from ASAS

Google explicitly supports offline conversions and enhanced conversions for leads to improve attribution using first-party data. citeturn1search3

### TikTok

- pixel/events
- server-side events where supported
- lead attribution
- webhook lifecycle

TikTok provides webhook/event infrastructure for developer integrations. citeturn2search20

### LinkedIn

- campaign reporting
- lead/conversion integrations where applicable
- Conversions API

LinkedIn's Marketing APIs include campaign management, reporting, lead-related capabilities and a Conversions API for server-side conversion measurement. citeturn1search4turn1search2

## 9. Google Analytics + first-party analytics

GA4 should be connected, but ASAS analytics must remain canonical internally.

ASAS should emit its own event model and optionally project selected events to GA4. Google Measurement Protocol supports server-side/offline event transmission over HTTPS and is suitable for supplementing web/app collection. citeturn0search9turn0search12

Do not make GA4 the source of truth for:

- lead count
- qualification
- opportunity stage
- reservation
- contract
- payment
- revenue

Those remain ASAS domain facts.

## 10. Google Business Profile

For agencies/developers with verified business locations, integrate Google Business Profile where access/approval is available.

Potential capabilities:

- location management
- reviews
- posts
- media
- Q&A
- performance insights
- verification-related workflows

Google documents APIs for locations, reviews, posts, media, questions/answers and performance-related functionality; access requires appropriate project approval and OAuth. citeturn3search2turn3search5

## 11. Google Workspace

Google should be treated as a platform family, not isolated integrations:

- Identity / OIDC
- Calendar
- Gmail
- Drive
- Meet
- Business Profile
- Maps
- Analytics
- Ads
- YouTube

Google OIDC provides OAuth-based identity and API authorization. citeturn2search1
Gmail supports programmatic sending and mailbox operations subject to OAuth scopes. citeturn2search5turn2search10
Drive supports files, permissions, changes, shared drives and event subscriptions. citeturn2search12
Meet supports meeting-space management, participants, recordings, transcripts and event subscriptions. citeturn2search2
YouTube provides API access to videos, playlists, channels and related resources. citeturn2search0

## 12. Microsoft ecosystem

Support Microsoft 365 because enterprise customers will not all use Google Workspace.

Minimum:

- Microsoft identity / Entra ID
- Microsoft Graph Calendar
- Outlook mail where authorized
- OneDrive / SharePoint document access
- Teams/meeting integration where required

The architecture must expose capability-neutral interfaces so Google-specific objects do not leak into the domain model.

## 13. Documents and signatures

ASAS should own the document lifecycle and legal/business state. Providers perform signature or storage capabilities.

Signature abstraction must support:

- template
- signer
- signing order
- authentication method
- status callbacks
- signed artifact
- evidence/audit package
- expiry
- cancellation
- jurisdiction/provider
- provider document ID

Dropbox Sign currently exposes signature requests, embedded signing, identity verification, SMS delivery and OAuth-based authorization. citeturn1search1turn1search12

DocuSign and Adobe Acrobat Sign should remain candidates for enterprise/legal-market coverage, but their exact availability, pricing and jurisdictional suitability must be verified before committing to a primary provider.

**Legal gate:** electronic-signature integration does not itself establish Algerian legal validity. The contract/legal bounded context must define what constitutes a legally effective signature and which provider/evidence is acceptable.

## 14. Payments — Algeria first

Do not blindly make Stripe the payment architecture for Algeria.

Create a payment-provider capability interface supporting:

- payment intent/request
- redirect/hosted checkout
- payment status
- callback/webhook
- refund request/status
- reconciliation reference
- currency
- fees
- payer identity
- idempotency
- provider transaction ID

For Algeria, research and validate local acquiring/payment rails and merchant APIs before implementation, including SATIM/CIB and Algérie Poste/Edahabia pathways where commercially/API-accessible. Provider availability and legal/merchant onboarding must be verified before selecting the primary rail.

Stripe Connect is architecturally useful for future multi-party SaaS/platform flows because it supports connected accounts, onboarding, charges, balances and payouts, but its suitability for Algeria must be verified rather than assumed. citeturn1search0

Payment provider state is never the accounting ledger. ASAS records the financial truth and reconciles provider transactions into it.

## 15. Search, files, OCR and AI

The connector layer should support:

- Google Drive / OneDrive / SharePoint imports
- document parsing/OCR
- classification
- secure media processing
- embeddings/vector indexing
- authorized semantic search
- public/private projection separation

AI providers are replaceable inference services. AI must operate through the same authorization, tenant, audit, idempotency and command contracts as human users.

## 16. Integration kernel contract

Every connector must implement a common conceptual contract:

`Connector`

- provider
- capability
- version
- tenant scope
- connection owner
- OAuth scopes / credentials reference
- status
- health
- rate limit state
- webhook endpoint
- webhook verification
- idempotency strategy
- external object mapping
- sync cursor
- last successful sync
- reconciliation strategy
- disconnect behavior
- data classification
- retention policy
- audit policy

Every connector operation must carry:

`tenant_id + actor_id + correlation_id + causation_id + idempotency_key + provider_request_id`

## 17. Provider abstraction rule

Never model the core domain as:

`google_calendar_event_id`

Prefer:

`external_connection(provider=GOOGLE_CALENDAR)`
`external_object(provider_object_type=CALENDAR_EVENT, provider_object_id=...)`

This allows the same Appointment to synchronize with Google Calendar, Outlook or a future provider without changing the domain model.

## 18. Webhook reliability

Every external webhook must pass:

1. provider authenticity/signature verification
2. endpoint/routing validation
3. payload schema validation
4. tenant/provider connection resolution
5. inbox deduplication
6. event timestamp/replay policy
7. command/projection classification
8. transaction boundary
9. audit/outbox if domain state changes
10. retry/DLQ handling
11. reconciliation capability

A webhook must never directly execute privileged arbitrary commands.

## 19. Integration security

Secrets are never stored in normal domain tables as plaintext.

OAuth tokens and provider credentials require:

- encryption at rest
- minimum scopes
- tenant isolation
- connection ownership
- revocation handling
- rotation/refresh
- audit on credential use
- no token exposure to frontend logs
- provider-specific data retention
- deletion/export handling

The existing event register already contains `integration.connected`, `integration.disconnected`, `integration.credential_used`, `integration.credential_refreshed`, `webhook.delivered`, `webhook.dead_lettered`, and `conversion.uploaded`; these remain the canonical integration event vocabulary unless a formal change is approved.

## 20. UX principle — "ASAS, not a pile of plugins"

Users should experience:

- **Connect Google Calendar**
- **Connect Microsoft 365**
- **Connect WhatsApp**
- **Connect Meta Ads**
- **Connect Google Ads**
- **Connect Google Business Profile**
- **Connect Google Drive**

not a collection of provider-specific technical screens.

The UI must show:

- connected/disconnected
- account identity
- permissions granted
- last sync
- sync health
- webhook health
- errors requiring action
- data scope
- disconnect/revoke
- test connection
- reauthorize

## 21. Integration marketplace direction

ASAS should eventually expose a controlled integration marketplace similar in concept to mature SaaS ecosystems.

Categories:

- Communication
- Calendar
- Maps
- Marketing
- Advertising
- Payments
- Documents
- Storage
- Analytics
- Collaboration
- Property portals
- Automation
- AI

Third-party integrations must run through a permissioned connector SDK and cannot gain arbitrary database access.

## 22. Research status

### VERIFIED by current official documentation research

- Google Maps Platform: Maps / Routes / Places capabilities. citeturn1search17turn1search15
- Google Calendar: Events / Freebusy / watch. citeturn3search3turn3search1
- Microsoft Graph Calendar: events, calendars, free/busy and meeting-time capabilities. citeturn0search0turn0search15
- WhatsApp Cloud API: official business messaging platform. citeturn3search10
- Google Ads offline/enhanced lead conversions. citeturn1search3
- GA4 Measurement Protocol. citeturn0search9turn0search12
- Google Business Profile APIs. citeturn3search2turn3search5
- Google Workspace identity, Gmail, Drive and Meet APIs. citeturn2search1turn2search5turn2search12turn2search2
- YouTube Data API. citeturn2search0
- LinkedIn Marketing/Conversions APIs. citeturn1search4turn1search2
- TikTok webhook/event capabilities. citeturn2search20
- Zoom APIs/OAuth. citeturn3search0turn3search7
- Dropbox Sign API/OAuth. citeturn1search1turn1search12
- Stripe Connect platform capabilities. citeturn1search0

### OPEN / requires country or commercial validation

- Algeria payment rails/API onboarding and production merchant availability.
- Algerian legal validity and evidentiary requirements for electronic signatures.
- Property portal APIs and licensing in Algeria/MENA.
- WhatsApp Business account onboarding, template/category rules and commercial pricing at deployment time.
- Exact provider selection for transactional email, SMS, OCR, search and observability.
- Data residency, cross-border transfer and retention requirements by customer market.

## 23. Build-order impact

This research changes the architecture contract but does **not** authorize application implementation yet.

Before code, the foundation must additionally close:

1. Integration capability registry.
2. Provider-neutral external object model.
3. OAuth/credential security contract.
4. Webhook/inbox/replay contract per provider class.
5. Sync/reconciliation contract.
6. Calendar two-way conflict semantics.
7. Maps source/accuracy contract.
8. Messaging consent and template policy.
9. Marketing attribution identity contract.
10. Payment-provider reconciliation contract.
11. eSignature legal evidence contract.
12. Integration permission/ABAC matrix.
13. Connector SDK boundary.
14. Integration health/SLO contract.
15. Integration marketplace trust model.

Only after those contracts are closed should individual connectors be implemented.

## 24. Decision

**Architecture decision:** ASAS will be an **integration-first real-estate operating platform with provider-neutral connector contracts**.

**Primary strategic families:** Google Workspace/Maps, Microsoft 365, Meta/WhatsApp, Google Ads/Analytics/Business Profile, TikTok, LinkedIn, video meeting providers, payment rails, eSignature, storage and automation.

**Non-negotiable:** no external provider becomes an uncontrolled alternate database or bypass around ASAS authorization/domain state.
