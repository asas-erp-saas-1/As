# ASAS — Sales Representative Lifecycle / HR Engineering Contract

**Status:** FOUNDATION CONTRACT — design only; no implementation authorized by this document.
**Scope:** Sales Representative / Employee lifecycle from workforce demand through offboarding, with IAM, CRM, Sales, Finance, Documents, Audit and Analytics touchpoints.
**Canonical repository:** `asas-erp-saas-1/As`

## 0. Architectural position

The delivered Blueprint contains HR as an enterprise capability, while the current normalized operating protocol defines nine canonical bounded contexts and does **not** currently declare HR as a tenth bounded context. Therefore this document defines the **People / HR capability contract** without silently changing the canonical bounded-context map.

Until founder-approved ownership is recorded, HR data must not be implemented as an accidental cross-context shared table. Employee identity, employment lifecycle, compensation, attendance and recruitment require an explicit ownership decision before schema implementation.

Core/IAM owns the platform identity and access relationship. HR owns the employment relationship when the HR capability is formally assigned an owner. CRM/Sales own sales-domain facts such as leads, opportunities and commercial activity. No domain may use an HR record as a substitute for authorization state.

## 1. Ubiquitous language

| Term | Contract meaning |
|---|---|
| Workforce Demand | Approved business need for a position/capacity. |
| Position | Organizational seat/capacity definition; not a person. |
| Candidate | Person being evaluated for employment/engagement. |
| Applicant | Candidate who has entered a specific recruitment process. |
| Offer | Proposed employment/engagement terms; not a sales offer. |
| Employee | Person with an accepted employment relationship. |
| Sales Representative | Employee/worker assigned to commercial execution; exact employment type is a separate attribute. |
| Assignment | Time-bounded relationship between employee and organizational/team/scope. |
| Manager | Person with managerial responsibility; not automatically a global administrator. |
| Onboarding | Controlled transition from hired to operationally ready. |
| Active | Employee is eligible to perform assigned work under current access/assignment rules. |
| Leave | Approved temporary absence; does not itself terminate employment. |
| Suspension | Access/work eligibility is restricted under an approved policy. |
| Transfer | Assignment changes while employment continues. |
| Promotion | Role/level/responsibility changes under an approved decision. |
| Compensation Plan | Rules governing base pay, incentives and applicable commercial compensation. |
| Commission Plan | Sales-specific earning rules; must not be conflated with payroll. |
| Offboarding | Controlled removal/transition of access, ownership and operational responsibility. |
| Termination | End of employment relationship under the applicable approved process. |
| Access Revocation | IAM action removing effective privileges; separate from HR status. |
| Handover | Controlled transfer of business responsibility and owned work. |

## 2. Lifecycle — canonical business flow

`Workforce Demand → Position Approved → Candidate Sourced → Applicant → Screening → Interview → Assessment → Offer Prepared → Offer Approved → Offer Accepted → Preboarding → Hired → Onboarding → Active → (Leave | Transfer | Promotion | Suspension) → Return/Reactivate → Offboarding → Terminated`

The lifecycle is not a single status enum. It is a set of related aggregates/state machines:

1. **Position lifecycle**
2. **Candidate/application lifecycle**
3. **Employment lifecycle**
4. **Assignment lifecycle**
5. **Access lifecycle**
6. **Compensation/commission-plan lifecycle**
7. **Onboarding/offboarding checklist lifecycle**

This separation prevents a common ERP defect: using one `employee.status` field to represent employment, access, assignment, payroll eligibility and sales capability simultaneously.

## 3. Sales Representative-specific lifecycle

### 3.1 Workforce demand

Inputs:
- business/team need
- target capacity
- territory/project need
- role/level
- employment type
- expected start window
- compensation budget
- required capabilities

Controls:
- approved budget
- approving authority
- no automatic headcount creation from an AI recommendation

Outputs:
- approved position requisition
- recruiting brief
- hiring owner

### 3.2 Candidate and applicant

Candidate record is separate from employee record.

Required concepts:
- identity/contact data
- source
- consent/processing basis where applicable
- CV/documents
- screening result
- interview records
- assessment results
- rejection reason category
- duplicate detection/merge policy

Candidate data is sensitive and must not become visible to ordinary sales users merely because the candidate later becomes an employee.

### 3.3 Offer

An employment offer is a controlled document/business decision.

It requires:
- position reference
- proposed employment type
- compensation components
- effective date
- expiry
- approval chain where required
- document version
- acceptance/rejection evidence

No offer acceptance should directly grant production privileges. It initiates preboarding/hire workflow.

### 3.4 Hire

A hire creates the employment relationship only after the required acceptance and validation gates pass.

Hire must establish:
- employee identifier
- effective hire date
- employment type
- organizational assignment
- manager
- work location/territory if applicable
- compensation plan reference
- commission-plan reference if applicable
- required documents status
- onboarding plan

### 3.5 Onboarding

Onboarding is a workflow, not a checkbox.

Minimum workstreams:
- identity/account provisioning request
- role/grant request
- manager assignment
- team/branch assignment
- CRM training
- inventory/product training
- sales-process training
- communication-channel setup
- device/security baseline where applicable
- required legal/HR documents
- acknowledgement of policies
- commission-plan acknowledgement
- first-week/first-month objectives

**Critical invariant:** HR completion and IAM activation are related but distinct. A person may be hired while access remains pending until required controls pass.

### 3.6 Activation as Sales Representative

A representative becomes operational only when all activation gates pass:

`Employment active + assignment active + required onboarding complete + required access approved + mandatory policy acknowledgements complete`

The system must not infer operational eligibility from `employee.status = ACTIVE` alone.

### 3.7 Active operating lifecycle

A Sales Representative may:
- receive assigned leads according to scope
- work leads and activities
- schedule/perform visits according to permissions
- work opportunities
- request offers/discounts according to thresholds
- create reservation requests according to permissions
- view only permitted inventory/customer data
- use approved communication channels
- receive tasks and workflow actions

Sales performance is measured from CRM/Sales facts, not manually entered HR ratings alone.

Relevant operational measures can include:
- response time
- contact rate
- qualification rate
- visit conversion
- offer conversion
- reservation conversion
- cancellation rate
- pipeline aging
- follow-up SLA adherence
- revenue/commission attribution

### 3.8 Leave

Leave changes availability, not employment identity.

Before leave becomes effective:
- future activities are evaluated
- active leads/opportunities are reviewed
- urgent tasks are reassigned or delegated
- appointment ownership is handled
- handover evidence is recorded

During leave:
- access behavior follows policy; do not assume automatic full deactivation unless policy says so
- new lead assignment should respect availability rules

### 3.9 Transfer

Transfer changes organizational or commercial assignment without creating a duplicate employee.

Examples:
- team transfer
- branch transfer
- territory transfer
- project portfolio transfer
- manager change

Transfer must preserve historical attribution. Historical activities, commissions and audit records must not be rewritten to the new assignment.

### 3.10 Promotion

Promotion changes level/responsibility under an approved workflow.

It may change:
- role eligibility
- manager scope
- compensation plan
- approval thresholds
- sales targets

It must **not** silently grant permissions outside the authorization kernel. IAM grants are separately evaluated and audited.

### 3.11 Suspension

Suspension is an exceptional controlled state.

It must define:
- reason category
- effective time
- approving authority
- access treatment
- lead/work handover
- financial/commission treatment
- review/expiry if applicable

Never implement suspension as a generic boolean that bypasses audit.

### 3.12 Offboarding

Offboarding is a coordinated workflow:

`Decision/notice → ownership inventory → handover → access revocation → credential/session revocation → communication-channel treatment → equipment/assets → documents → financial/commission reconciliation → final HR closure → audit`

Critical Sales controls:
- open leads cannot disappear with the employee
- opportunities/reservations cannot become ownerless without explicit policy
- appointments need reassignment/cancellation handling
- pending approvals need reassignment/escalation
- commissions already earned remain historically attributable
- future commission eligibility follows the approved compensation/termination policy

### 3.13 Termination

Termination ends the employment relationship. It does not delete the employee's historical business record.

Historical records must remain auditable subject to approved retention/privacy policy. Personal access must be revoked independently and promptly.

## 4. Ownership and cross-context boundaries

### Core / IAM
Owns:
- user identity
- authentication
- sessions
- roles/grants
- authorization decisions
- access revocation

Does not own:
- employment terms
- payroll
- recruitment evaluation
- sales performance

### CRM / Sales
Own:
- lead/opportunity/activity/appointment facts
- sales attribution
- commercial performance facts
- handover of commercial work

Do not own:
- employee termination decision
- payroll
- HR personal file

### Finance
Owns financial truth for:
- payroll postings when formally integrated
- commission accrual/payment
- financial reconciliation

Finance records are not rewritten because HR status changes.

### Documents
Owns governed document storage/versioning behavior where the canonical document capability applies. HR-sensitive documents require explicit classification and access policy.

### Analytics
Consumes projections/facts; never becomes the source of employee or sales truth.

## 5. Authorization model

Representative authorization must be derived from:

`identity → tenant/workspace → employment/assignment eligibility → role/grants → scope → deny overrides → ABAC → command authorization`

Examples of ABAC inputs:
- employee assignment
- team/branch
- project portfolio
- territory
- record owner
- financial threshold
- customer sensitivity
- employment/access state

Do not encode authorization as `employee.role` stored in a mutable profile field.

## 6. Data classification

Potential HR data includes personal, employment, compensation, identity and document information. Classification must be explicit before implementation.

At minimum evaluate:
- PUBLIC
- INTERNAL
- CONFIDENTIAL
- RESTRICTED
- FINANCIAL_SENSITIVE
- LEGAL_SENSITIVE

Candidate CVs, compensation, disciplinary/suspension information and identity documents should be treated as restricted until an approved classification says otherwise.

## 7. Event integration

The current canonical event register contains Core events such as `user.created`, `user.suspended`, `role.granted`, `role.revoked`, `session.started`, `session.revoked`, and CRM/Sales events for commercial activity. These are not automatically HR events.

The Blueprint material also names HR concepts such as `Employee Hired`, `Employee Promoted`, `Payroll Generated`, and `Leave Approved`. These should be reconciled into the canonical event taxonomy before implementation. Do **not** invent new registered dotted event IDs merely to implement this lifecycle.

Required future event-contract fields remain:
- canonical registered ID
- version
- producer context
- aggregate
- triggering command
- consumers
- transaction boundary
- outbox requirement
- idempotency key
- tenant context
- security classification
- audit relation

## 8. Required state-machine contracts before implementation

The following machines must be explicitly normalized before schema/code work:

1. Position requisition
2. Candidate/application
3. Employment
4. Assignment
5. Onboarding
6. Leave
7. Access provisioning/revocation relationship
8. Compensation plan
9. Commission plan assignment
10. Offboarding

This document intentionally does not invent exact states/edges for these machines because the current authoritative v1.6.1 register does not define them.

## 9. Engineering invariants

1. One person must not accidentally become two employees because of duplicate onboarding.
2. Employee identity and user identity are related but not interchangeable.
3. Employment termination cannot be the only mechanism for access revocation.
4. Access revocation must be effective independently of UI state.
5. Sales attribution history is immutable/auditable.
6. Reassignment preserves historical ownership/attribution.
7. Leave does not delete or mutate historical sales records.
8. Promotion does not automatically bypass the authorization kernel.
9. Offboarding cannot orphan active commercial work.
10. HR-sensitive data is not exposed through CRM endpoints by convenience joins.
11. Payroll/commission data uses the finance money contract; no floating-point monetary truth.
12. Every sensitive lifecycle mutation is auditable.
13. Workflow retries are idempotent.
14. Notifications cannot be treated as proof that a business transition succeeded.
15. AI may recommend HR actions but cannot autonomously terminate employment, change compensation, or grant privileged access.

## 10. Acceptance scenarios

Minimum future tests:

- duplicate candidate → deterministic duplicate handling
- accepted offer → no automatic privileged access
- hired representative → onboarding gates enforced
- active representative → own/team scope enforced
- representative attempts cross-team lead access → denied
- leave → future assignment behavior follows policy
- transfer → history remains attributed to original assignment
- promotion → permissions require authorization workflow
- suspension → access treatment is deterministic and audited
- offboarding → sessions revoked and commercial ownership handed over
- terminated representative attempts API access → denied
- terminated representative's historical sales remain reportable
- retrying offboarding workflow → no duplicate destructive effects
- HR user cannot read financial/customer data outside granted scope
- sales manager cannot read HR-sensitive compensation records merely because they manage the representative

## 11. Implementation dependency order

`HR capability ownership decision → vocabulary → state machines → data ownership → commands → authorization mapping → event reconciliation → workflow contracts → schema → services → UI → integrations → analytics`

Do not reverse this order by starting with `employees` CRUD.

## 12. Founder decisions still required

1. Canonical bounded-context ownership for HR/People.
2. Employment types supported in v1.
3. Algeria-specific payroll/legal requirements to be formally supported.
4. Whether recruitment is internal-only or also exposed as a product capability.
5. Commission-plan ownership between Sales and Finance.
6. Exact leave/attendance policy.
7. Termination/offboarding authority and required approvals.
8. Retention/anonymization policy for former employees and candidates.

Until these are decided, Claude may build the **contract tooling, tests, documentation and non-domain scaffolding** but must not silently invent HR policy.
