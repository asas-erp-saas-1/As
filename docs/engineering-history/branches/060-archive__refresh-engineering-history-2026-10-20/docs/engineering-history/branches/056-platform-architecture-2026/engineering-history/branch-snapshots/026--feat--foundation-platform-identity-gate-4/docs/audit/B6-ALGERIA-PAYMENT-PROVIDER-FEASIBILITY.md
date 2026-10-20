# ASAS — B.6 Algeria Payment Provider Feasibility

**Status:** EVIDENCE-BASED / OPEN FOR COMMERCIAL & LEGAL ONBOARDING
**Date:** 2026-09-15
**Scope:** Reservation deposits and future customer payment collection
**Branch:** `feat/foundation-command-registry`

## 1. Decision boundary

B.6 requires a payment-provider capability, but the provider is not the accounting or reservation authority.

Canonical rule remains:

`provider transaction → verified durable input → ASAS command → finance + reservation truth`

No provider callback may directly activate a reservation, reserve an apartment, or post arbitrary ledger entries.

## 2. SATIM / CIB Webmarchand — verified

SATIM's official Webmarchand integration documentation states that online merchants can submit an integration request through CIBWEB, provide the required commercial registration information, undergo technical integration tests, and receive authorization for production after successful SATIM certification.

SATIM also states that online payment is available to entrepreneurs subject to authorization from GIE Monétique and that the process involves an acquiring bank, the merchant agreement, and technical certification.

**Architecture implication:** direct CIB/SATIM should remain a first-class capability target, but ASAS cannot treat "CIB support exists" as proof that a SaaS tenant can immediately self-onboard. Merchant/acquirer/certification prerequisites are an onboarding dependency.

## 3. Algérie Poste / EDAHABIA — verified capability, API access still OPEN

Algérie Poste's official EDAHABIA material confirms that EDAHABIA supports payments on participating web-merchant platforms and that web-merchant transactions provide customer confirmation through the merchant site and SMS notification.

The official sources reviewed do not establish a general public developer API contract suitable for ASAS multi-tenant SaaS onboarding.

**Decision:** treat EDAHABIA as a required payment method/capability, but do not invent a direct Algérie Poste API integration. The exact merchant/API onboarding route remains OPEN.

## 4. Chargily Pay — verified API candidate

Chargily's current developer documentation advertises an API for online payments in Algeria and explicitly lists CIB and EDAHABIA as supported payment methods. It also advertises sandbox/test integration and production activation after account verification.

Chargily's business documentation also advertises payment links and API access.

**Decision:** Chargily is a strong P0/Pilot candidate for ASAS because it can expose CIB + EDAHABIA through one integration surface. It is NOT yet declared the canonical or exclusive ASAS payment provider.

Before production adoption, ASAS must verify by signed commercial/provider onboarding:

- merchant-of-record / settlement model;
- supported legal entity types;
- production API/webhook contract;
- signature/authentication mechanism;
- webhook replay semantics;
- idempotency guarantees;
- refund and partial-refund behavior;
- settlement timing;
- reconciliation/export capabilities;
- fees and fee reporting;
- transaction limits;
- chargeback/dispute behavior;
- supported use of reservation deposits and real-estate transactions;
- multi-tenant/platform use restrictions;
- data processing and retention terms;
- SLA/support for high-value transactions.

## 5. B6 provider abstraction

The first production implementation must expose a capability-neutral interface conceptually equivalent to:

`PaymentProvider`

Capabilities:

- create payment request / intent;
- hosted checkout or redirect;
- query payment status;
- verify callback/webhook;
- refund;
- query refund status;
- reconcile transaction;
- retrieve provider receipt/reference;
- health/status.

Provider-specific adapters may implement these capabilities, but core reservation/finance commands must depend on the abstraction rather than Chargily/SATIM-specific fields.

## 6. External payment identity

Provider identifiers remain external identities:

`ExternalPayment(provider, connection, provider_transaction_id, asas_reference)`

They must not replace:

- reservation ID;
- payment/receipt ID;
- ledger journal ID;
- apartment ID;
- tenant ID.

## 7. Recommended rollout

### Phase P0-A — ASAS contract

Close provider-neutral payment commands, idempotency, reconciliation, webhook/inbox, and finance posting semantics first.

### Phase P0-B — Algeria pilot

Validate one real merchant integration against a selected provider, with a controlled non-production/test environment and explicit commercial/legal approval.

### Phase P0-C — direct rail / fallback

Evaluate direct SATIM/acquirer integration and additional local rails after the first connector proves the abstraction and reconciliation model.

### Phase P1 — international expansion

Add country-specific adapters under the same provider-neutral contract. Do not make Stripe/PayPal assumptions part of the Algeria domain model.

## 8. Evidence classification

| Claim | Evidence | Status |
|---|---|---|
| SATIM supports Webmarchand integration/certification | SATIM official documentation | VERIFIED |
| CIB online payment requires authorization/certification path | SATIM official documentation | VERIFIED |
| EDAHABIA works with web merchants | Algérie Poste official documentation | VERIFIED |
| Public general-purpose Algérie Poste developer API for ASAS | Official sources reviewed did not establish one | OPEN |
| Chargily supports CIB + EDAHABIA API | Chargily current developer documentation | VERIFIED |
| Chargily is legally/contractually suitable for ASAS real-estate deposits | Requires provider/commercial/legal confirmation | OPEN |
| Multi-tenant platform/marketplace use is permitted | Requires provider contract confirmation | OPEN |
| Exact webhook signature/replay contract | Provider technical contract must be verified | OPEN |

## 9. B6 implementation gate update

Payment feasibility is no longer an undifferentiated research item.

**Evidence closed:**
- local CIB/Webmarchand route exists;
- EDAHABIA web-merchant capability exists;
- a current API-capable local candidate (Chargily) exists.

**Still blocked:**
- production provider selection;
- signed commercial/onboarding terms;
- exact webhook/security contract;
- real-estate deposit suitability;
- multi-tenant SaaS/platform permissions;
- reconciliation and settlement semantics.

Therefore B.6 remains **OPEN / implementation-gated**. No schema or application payment implementation is authorized by this artifact alone.

## Sources

- SATIM — Webmarchand integration: https://satim.dz/index.php/fr/e-paiement/integration-webmarchand
- SATIM — Online payment: https://www.satim.dz/index.php/fr/services-cib/paiement-en-ligne
- Algérie Poste — EDAHABIA: https://www.poste.dz/services/particular/edahabia
- Algérie Poste — FAQ/payment information: https://www.poste.dz/faqM
- Chargily Pay — developer payment API: https://chargily.com/dz/developer/pay?lang=fr
