# ASAS Engineering Gap-Completion Protocol — 2026

**Status:** PROPOSED / ENGINEERING GOVERNANCE
**Purpose:** Define how ASAS closes legitimate engineering gaps when authoritative project sources are incomplete, contradictory, or silent.

## 1. Core rule

A missing source is not permission to guess, and it is not a reason to stop unnecessarily.

When an implementation-critical fact or contract is absent, the agent must:

```text
Repository evidence
→ history / branches
→ runtime evidence where authorized
→ primary external research
→ independent engineering analysis
→ alternatives / failure modes
→ derived decision
→ provenance
→ contract / ADR / register / test
→ implementation
→ verification
→ evidence
```

## 2. Evidence classes

| Class | Meaning |
|---|---|
| SOURCE-VERIFIED | Directly supported by an authoritative ASAS source. |
| RUNTIME-VERIFIED | Confirmed against the applicable runtime/database. |
| TEST-VERIFIED | Confirmed by reproducible verification with evidence. |
| EXTERNALLY-VERIFIED | Confirmed by a current authoritative external source. |
| ENGINEERING-DERIVATION | Reasoned engineering conclusion based on verified evidence. |
| PROPOSED | Candidate decision requiring approval where applicable. |
| UNVERIFIED | Evidence is insufficient. |
| CONFLICT | Authoritative sources disagree. |
| BLOCKED | Safe progress requires unresolved evidence or authority. |
| FOUNDER-DECISION-REQUIRED | Outside autonomous decision authority. |

## 3. Research rules

For load-bearing external facts, use primary sources first: official documentation, standards, regulators/law where applicable, and vendor technical documentation. Secondary sources may supplement but do not silently replace primary authority.

Record material research with question, facts, source, date, confidence, applicability, and unresolved uncertainty.

## 4. Engineering completion

If evidence supports a safe professional solution, create the missing artifact rather than leaving an avoidable gap. The artifact must identify whether it is a contract, ADR, register, test, CI rule, research note, or architectural proposal.

If evidence does not support a safe decision, preserve uncertainty explicitly. Do not manufacture runtime facts, approvals, identifiers, APIs, database state, or verification results.

## 5. Authority protection

Research and engineering reasoning are inputs. They do not override founder decisions, approved ASAS contracts, brownfield runtime reality, legal authority, or production safety controls.

## 6. Canonical-artifact protection

Before creating a new canonical artifact, search for an existing owner. Prefer extending/reconciling an existing canonical owner. New artifacts require a clear purpose, owner, status, provenance, and lifecycle.

## 7. Required closure evidence

A finding is CLOSED only when root cause, corrective action, references, verification, evidence, and canonical state all converge. Otherwise it remains OPEN, PARTIAL, BLOCKED, or UNVERIFIED.
