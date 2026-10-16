# ASAS Real Estate OS — AI Copilot Governance

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.

## 1. Objective

AI is an intelligence layer over the governed Real Estate OS. It may accelerate search, analysis, drafting, explanation and workflow assistance, but it must never create a parallel authorization, data-access or mutation system.

## 2. Non-negotiable boundary

`AI request → authenticated user/tenant → authorization → scoped retrieval/tools → governed application command → audit/outbox → response`

AI must not query arbitrary tenant tables, bypass RLS, call privileged database functions merely to escape authorization, or mutate financial/inventory state directly.

## 3. Capability classes

### Read / explain
Search and summarize records the user is already authorized to see.

### Recommend
Suggest next actions, prioritization, follow-up wording, inventory matching or anomaly investigation. Recommendations are not business mutations.

### Draft
Prepare offers, messages, reports, page copy or workflow drafts. User review/approval applies according to the artifact's risk.

### Act
Actions such as assigning leads, scheduling, publishing, reservation initiation or other mutations must call the same application command/service used by the normal UI and must satisfy its permission, scope, invariant, idempotency and audit rules.

### High-risk act
Financial posting, contract changes, reservation confirmation, permission changes, publication and other irreversible/high-impact actions require explicit product-defined approval gates. AI cannot self-approve.

## 4. Context isolation

Every retrieval/tool call is tenant-scoped. The model receives the minimum context needed for the task. Cross-tenant aggregation requires an explicit authorized organizational scope.

## 5. Prompt/content trust

External content, CRM notes, webhooks, uploaded documents and public submissions are untrusted data. They must not be treated as instructions to the AI tool layer.

## 6. Tool registry

Every AI tool must declare:

- name and purpose;
- read/write classification;
- required permission;
- tenant/scope behavior;
- input schema;
- output schema;
- side effects;
- idempotency requirements;
- audit requirements;
- approval requirements;
- failure/retry semantics.

## 7. Explainability and traceability

For consequential actions, the system must be able to answer: who initiated it, what AI/tool capability was used, what authorization applied, what command executed, what records changed, and what approval was obtained.

The model's natural-language explanation is not itself the audit record.

## 8. AI UX contract

AI should appear as contextual assistance inside the workflow, not as an opaque replacement for enterprise controls. Users must be able to inspect proposed actions, affected records and blocking reasons before high-impact execution.

## 9. Failure behavior

If retrieval is incomplete, authorization is ambiguous, a tool fails, or source data conflicts, AI must state the limitation rather than inventing a business fact. It must never fabricate availability, payment status, permissions or contractual facts.

## 10. Evaluation

AI features require evaluation sets covering:

- tenant-boundary attacks;
- permission escalation attempts;
- prompt injection through CRM/public content;
- incorrect business-state inference;
- duplicate action attempts;
- stale data;
- tool failure;
- high-risk action refusal/approval;
- Arabic/French/English behavior where supported.

## 11. Definition of done

An AI feature is production-eligible only when its tool/data boundary, authorization, auditability, failure behavior, evaluation set and human-approval policy are explicit and tested.
