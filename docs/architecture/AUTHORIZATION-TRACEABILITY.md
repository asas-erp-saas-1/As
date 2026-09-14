# ASAS Authorization Traceability Contract

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.
**Date:** 2026-09-14
**Authority:** Appendix A permission register + Phase 1 IAM contract + security baseline.

## 1. Objective

The 50 registered permission keys and eight persona columns are the authorization source of record. This document defines how Claude must connect those permissions to actual mutating commands without inventing permission semantics during implementation.

## 2. Canonical authorization chain

`request identity → tenant guard → authenticated subject → role/grant resolution → scope union → deny override → ABAC predicates → command authorization → audit requirement`

A UI control is only a presentation of this decision. Hiding a button is never authorization.

## 3. Required command record

Every mutating application command must have a durable record:

| Field | Required |
|---|---|
| Command ID | Yes |
| Owning context | Yes |
| Aggregate | Yes |
| Registered permission | Yes |
| Minimum scope | Yes |
| Allowed personas | Derived from register; never invented |
| Explicit deny cases | Yes |
| ABAC predicates | When applicable |
| Tenant boundary | Yes |
| State-machine precondition | If stateful |
| Approval requirement | If applicable |
| Audit requirement | Yes for governed mutation |
| Idempotency | If externally retryable |
| Error code on denial | Yes |
| Test evidence | Before acceptance |

## 4. Scope semantics

The project defines scope levels as:

`NONE → OWN → TEAM → BRANCH → COMPANY → ORG → ALL`

The effective scope must never exceed the grant held by the subject. When multiple grants apply, the authorization service resolves the union according to the contract; explicit deny overrides remain authoritative.

## 5. ABAC

ABAC may refine a granted permission using attributes such as:

- tenant/workspace identity;
- company/branch/team/project relationship;
- ownership;
- financial threshold;
- sensitivity/classification;
- workflow/approval state;
- impersonation context;
- record-specific policy attributes.

ABAC is a restriction/decision layer, not a way to bypass RBAC or tenant isolation.

## 6. Negative authorization matrix

Every protected command requires tests for at least:

1. authenticated user, correct tenant, correct permission, sufficient scope → allowed;
2. correct permission, wrong tenant → denied;
3. correct tenant, wrong role/persona → denied;
4. correct role, insufficient scope → denied;
5. explicit deny override → denied;
6. inactive/locked/expired session → denied;
7. impersonated subject without required privilege → denied;
8. direct API invocation without UI → same authorization result;
9. malformed/missing tenant context → denied safely;
10. concurrent authorization-sensitive mutation → authoritative transaction result wins.

## 7. Critical command families

The following families require explicit mapping before implementation:

- inventory creation/update and commercial/construction transitions;
- hold placement/release/expiry;
- lead creation/assignment/qualification and opportunity progression;
- offer issuance;
- reservation request/approval/confirmation/cancellation/expiry;
- contract creation/activation;
- payment schedule generation;
- receipt recording/allocation;
- ledger posting/period closing;
- commission calculation/approval/payout;
- Studio draft/publish/rollback;
- campaign/ad-lead/attribution mutations;
- provider connection/webhook recovery/calendar synchronization;
- user/role/grant/impersonation administration.

These are examples of command families, not new permission definitions. The exact permission key must come from Appendix A.

## 8. UI explanation requirement

For sensitive actions, the UI should be able to explain the effective authorization result in human terms:

`Allowed/Denied → permission → scope → relevant policy/approval condition`

Do not expose security-sensitive internal policy details that would aid attackers, but do provide enough explanation for legitimate operators to understand why an action is unavailable.

## 9. Database boundary

Application authorization and database RLS are complementary:

`application authorization → domain invariant → transaction constraint → RLS`

RLS is defense in depth and must not be treated as a substitute for the authorization service. Current Supabase guidance likewise treats RLS as database-level granular authorization and recommends explicit policy tests for select/insert/update/delete. citeturn0search0turn0search16

## 10. Acceptance gate

No protected mutation is accepted until its command row resolves to:

`permission → scope/ABAC → personas → negative tests → audit → tenant isolation evidence`

If the exact mapping is absent from the register, Claude must stop and escalate rather than invent a new permission.
