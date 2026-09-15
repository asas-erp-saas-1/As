# ASAS — Permission Closure Matrix

**Status:** OPEN — 50 registered permission keys reconciled against the v1.6.1 role matrix; command/object/property/ABAC/test semantics remain to be closed.
**Authority:** `02-HANDOFF/registers/permissions.csv` / Blueprint Appendix A.

## 1. Source roles

The machine-readable register currently names eight role columns:
`field.agent`, `sales.agent`, `sales.manager`, `marketing`, `accountant`, `director`, `ceo`, `admin`.

These are **role/grant identities in the register**, not the full 22-persona operating model. Persona-to-role/grant mapping must be explicit and must not be inferred from UI labels.

## 2. Authorization chain

`identity → tenant → role/grant → scope union → deny override → ABAC → command authorization → audit`

A permission key is not a complete authorization rule. Every mutation must additionally resolve the target object, property restrictions, tenant/workspace scope, ABAC conditions, approval requirements, audit requirements and negative tests.

## 3. Complete 50-key register matrix

| # | Permission | Field Agent | Sales Agent | Sales Manager | Marketing | Accountant | Director | CEO | Admin | Command mapping | Object/property | ABAC/threshold | Approval | Audit | Public/private | Negative tests | Status |
|---:|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | `lead.read` | OWN | OWN | TEAM | ORG | — | ORG | ORG | ORG | OPEN | lead | scope | OPEN | OPEN | private | required | OPEN |
| 2 | `lead.create` | YES | YES | YES | YES | — | YES | YES | — | OPEN | lead | OPEN | OPEN | OPEN | private/public-ingest boundary | required | OPEN |
| 3 | `lead.update` | OWN | OWN | TEAM | OWN | — | ORG | ORG | — | OPEN | lead | scope | OPEN | OPEN | private | required | OPEN |
| 4 | `lead.delete` | — | — | — | — | — | — | — | — | NONE / retention or anonymization policy OPEN | lead | — | — | OPEN | private | deny test | OPEN |
| 5 | `lead.transfer` | — | — | TEAM | — | — | ORG | ORG | — | OPEN | lead ownership | scope | OPEN | OPEN | private | cross-scope deny | OPEN |
| 6 | `lead.export` | — | — | TEAM | ORG | — | ORG | ORG | — | OPEN | lead/export | PII/export policy OPEN | OPEN | OPEN | private | PII exfiltration tests | OPEN |
| 7 | `lead.pii.read` | OWN | OWN | TEAM | OWN | — | ORG | ORG | ORG | OPEN | lead PII properties | scope + classification | OPEN | OPEN | private | cross-tenant/property deny | OPEN |
| 8 | `activity.read` | OWN | OWN | TEAM | OWN (marketing only) | — | ORG | ORG | ORG | OPEN | activity | scope | OPEN | OPEN | private | cross-scope deny | OPEN |
| 9 | `appointment.create` | YES | YES | YES | — | — | YES | YES | — | OPEN | appointment | scope/ownership | OPEN | OPEN | private | tenant/ownership deny | OPEN |
| 10 | `apartment.read` | OWN (assigned) | OWN (assigned) | BRANCH | ORG (public) | — | ORG | ORG | ORG | OPEN | apartment | scope + public projection | OPEN | OPEN | public/private split | unauthorized inventory tests | OPEN |
| 11 | `apartment.create` | — | — | BRANCH | — | — | ORG | ORG | — | OPEN | apartment | scope | OPEN | OPEN | private | scope deny | OPEN |
| 12 | `apartment.update` | — | — | BRANCH | — | — | ORG | ORG | — | OPEN | apartment | property-specific | OPEN | OPEN | private | protected-field deny | OPEN |
| 13 | `apartment.hold.create` | YES | YES | YES | — | — | YES | YES | — | OPEN | apartment/hold | concurrency + scope | OPEN | OPEN | private | double-hold race | OPEN |
| 14 | `apartment.price.override` | — | — | 2–5% (approve) | — | — | >5% (approve) | ANY (audited) | — | OPEN | apartment price | threshold | REQUIRED | REQUIRED | private | threshold escalation/deny | OPEN |
| 15 | `apartment.marketing.publish` | — | — | — | ORG | — | ORG | ORG | — | OPEN | apartment/public projection | publication policy | OPEN | OPEN | public projection only | private-field exposure | OPEN |
| 16 | `opportunity.read` | OWN | OWN | TEAM | — | — | ORG | ORG | ORG | OPEN | opportunity | scope | OPEN | OPEN | private | cross-scope deny | OPEN |
| 17 | `offer.create` | OWN | OWN | TEAM | — | — | ORG | ORG | — | OPEN | offer | scope | OPEN | OPEN | private | protected-field tests | OPEN |
| 18 | `offer.discount.request` | YES | YES | YES | — | — | YES | YES | — | OPEN | offer discount | threshold OPEN | REQUIRED | REQUIRED | private | unauthorized discount | OPEN |
| 19 | `reservation.create` | YES | YES | YES | — | — | YES | YES | — | OPEN | reservation/unit | scope + race | REQUIRED where policy says | REQUIRED | private | double-winner race | OPEN |
| 20 | `reservation.cancel` | — | REQUEST | YES | — | — | YES | YES | — | OPEN | reservation | actor/reason | OPEN | REQUIRED | private | unauthorized cancellation | OPEN |
| 21 | `contract.read` | OWN | OWN | TEAM | — | ORG | ORG | ORG | ORG | OPEN | contract | scope + classification | OPEN | REQUIRED | private | cross-tenant/legal-data deny | OPEN |
| 22 | `contract.generate` | — | YES | YES | — | — | YES | YES | — | OPEN | contract | legal preconditions | OPEN | REQUIRED | private | incomplete-contract deny | OPEN |
| 23 | `approval.decide` | — | — (self-serve <2%) | YES (2–5% + tier 1) | — | refunds ≤500k | YES | YES | — | OPEN | approval request | value/role | REQUIRED by policy | REQUIRED | private | threshold escalation/SoD | OPEN |
| 24 | `paymentplan.read` | OWN (client view) | OWN | TEAM | — | ORG | ORG | ORG | ORG | OPEN | payment plan | scope/classification | OPEN | REQUIRED | private/public client projection | unauthorized finance read | OPEN |
| 25 | `paymentplan.manage` | — | — | — | — | ORG | ORG | ORG | — | OPEN | payment plan | finance scope | OPEN | REQUIRED | private | closed-period mutation deny | OPEN |
| 26 | `receipt.record` | — | YES (deposit at reservation) | YES | — | YES | YES | YES | — | OPEN | receipt | amount/source | OPEN | REQUIRED | private/financial | duplicate receipt/replay | OPEN |
| 27 | `refund.request` | — | YES | YES | — | YES | YES | YES | — | OPEN | refund | scope/amount | OPEN | REQUIRED | private/financial | unauthorized refund | OPEN |
| 28 | `refund.approve` | — | — | — | — | ≤500k | >500k (with accountant) | YES | — | OPEN | refund | amount + SoD | REQUIRED | REQUIRED | private/financial | self-approval/threshold tests | OPEN |
| 29 | `ledger.read` | — | — | — | — | ORG | ORG | ORG | — | OPEN | ledger | finance scope | OPEN | REQUIRED | private/financial | cross-tenant ledger deny | OPEN |
| 30 | `period.close` | — | — | — | — | YES (propose) | YES | YES | — | OPEN | accounting period | SoD/close policy | REQUIRED | REQUIRED | private/financial | reopen/mutation tests | OPEN |
| 31 | `commission.read` | OWN | OWN | TEAM | — | ORG | ORG | ORG | — | OPEN | commission | employment/assignment scope | OPEN | REQUIRED | private/financial/HR | cross-employee deny | OPEN |
| 32 | `commission.payout.approve` | — | — | — | — | YES (propose) | YES | YES | — | OPEN | commission payout | SoD/value | REQUIRED | REQUIRED | private/financial/HR | self-approval/period tests | OPEN |
| 33 | `campaign.manage` | — | — | — | ORG | — | ORG | ORG | — | OPEN | campaign | marketing scope | OPEN | REQUIRED | private | cross-tenant campaign deny | OPEN |
| 34 | `campaign.audience.sync` | — | — | — | ORG | — | — | — | — | OPEN | audience | consent/PII | OPEN | REQUIRED | private/provider | consent leakage tests | OPEN |
| 35 | `message.send.approve` | — | — | YES (team sends) | ORG | — | ORG | ORG | — | OPEN | message | campaign/recipient policy | REQUIRED where applicable | REQUIRED | private/external | unauthorized bulk-send | OPEN |
| 36 | `integration.manage` | — | — | — | — | — | — | — | YES | OPEN | integration | admin-only + step-up | REQUIRED | REQUIRED | private/credential metadata | credential isolation | OPEN |
| 37 | `webhook.manage` | — | — | — | — | — | — | — | YES | OPEN | webhook | admin-only | REQUIRED | REQUIRED | private/provider | signature/replay tests | OPEN |
| 38 | `calendar.connect` | YES (self) | YES (self) | YES (self) | YES (self) | YES (self) | YES (self) | YES (self) | YES (self) | OPEN | calendar connection | self ownership | OPEN | REQUIRED | private credential metadata | connect-other-user deny | OPEN |
| 39 | `studio.draft` | — | — | — | ORG | — | ORG | ORG | — | OPEN | Studio draft | workspace | OPEN | REQUIRED | private | unauthorized workspace draft | OPEN |
| 40 | `studio.publish` | — | — | — | ORG | — | ORG | ORG | — | OPEN | Studio page version | publication approval policy | REQUIRED where applicable | REQUIRED | public after publish | private-to-public leakage | OPEN |
| 41 | `media.manage` | OWN (visit photos) | OWN | TEAM | ORG | — | ORG | ORG | ORG | OPEN | media asset | ownership/classification | OPEN | REQUIRED | public/private by attachment | signed URL/tenant tests | OPEN |
| 42 | `report.operational` | OWN | OWN | TEAM | ORG | ORG | ORG | ORG | ORG | OPEN | operational projections | scope | OPEN | REQUIRED | private | cross-scope report deny | OPEN |
| 43 | `report.finance` | — | — | — | — | ORG | ORG | ORG | ORG | OPEN | finance report | financial scope | OPEN | REQUIRED | private | unauthorized finance report | OPEN |
| 44 | `report.executive` | — | — | — | — | — | ORG | ORG | ORG | OPEN | executive report | org scope | OPEN | REQUIRED | private | lower-role deny | OPEN |
| 45 | `user.invite` | — | — | — | — | — | REQUEST | REQUEST | YES | OPEN | user | organization scope | step-up/approval policy | REQUIRED | private/PII | privilege escalation tests | OPEN |
| 46 | `role.assign` | — | — | — | — | — | REQUEST | REQUEST | YES | OPEN | role/grant | SoD/privilege | step-up/approval policy | REQUIRED | private/security | grant-escalation tests | OPEN |
| 47 | `workflow.manage` | — | — | TEAM scope | ORG (marketing flows) | — | ORG | ORG | YES | OPEN | workflow definition | scope + allowed command set | OPEN | REQUIRED | private | unauthorized workflow command | OPEN |
| 48 | `settings.platform` | — | — | — | — | — | — | — | YES | OPEN | platform settings | admin + step-up | REQUIRED | REQUIRED | private | admin-boundary tests | OPEN |
| 49 | `audit.read` | — | — | — | — | — | ORG | ORG | ORG | OPEN | audit evidence | org scope + PII redaction | OPEN | REQUIRED | private | tamper/tenant tests | OPEN |
| 50 | `copilot.use` | — | YES (agent briefs) | YES | YES | YES | YES | YES | — | OPEN | AI session/tool surface | human-equivalent scope | underlying command approval required | REQUIRED | private; explicit egress policy | AI privilege-escalation tests | OPEN |

## 4. Critical authorization conclusions

### 4.1 RBAC is insufficient
Scope values such as `OWN`, `TEAM`, `BRANCH`, `ORG` are necessary but not sufficient. Thresholds, object ownership, property-level restrictions, SoD and approval state require ABAC/policy evaluation.

### 4.2 Permission does not equal command authority
The canonical authorization chain must end at a command. UI buttons must not map directly to raw table writes. A permission can authorize entry to a capability while a command still rejects a missing invariant, approval or scope.

### 4.3 AI is explicitly non-transitive
`copilot.use` never becomes `ALL`, and never bypasses the permission/ABAC/approval chain of the underlying command.

### 4.4 Public access is projection-specific
`apartment.read` for Marketing is marked `ORG (public)` in the source matrix, but the public website must expose only an explicit public projection, never the internal apartment aggregate.

### 4.5 Sensitive domains require independent boundaries
PII, financial data, HR/commission data, credentials, audit evidence and legal documents need independent classification and negative tests even when the user already has broad operational access.

## 5. Closure blockers

The following cannot be safely invented by Claude:

- exact ABAC predicates;
- exact threshold values beyond those explicitly registered;
- approval/SoD policy where the register says REQUEST/YES but does not specify the approving authority;
- property-level protected fields;
- PII classification and retention periods;
- public projection schema;
- canonical command names;
- exact audit action taxonomy;
- step-up session TTL policy;
- HR access boundaries for employment/compensation data.

**Gate:** every permission is GREEN only when `permission → command → resource → property → scope → ABAC → approval → audit → exposure → negative test` is executable and evidenced.
