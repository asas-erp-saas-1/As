# ASAS — ARCHITECTURE RESEARCH & SOURCE DISCOVERY PROTOCOL 2026

**Artifact ID:** ASAS-ARCH-RESEARCH-2026-001  
**Status:** CANONICAL OPERATING PROTOCOL  
**Version:** 1.0.0  
**Effective date:** 2026-09-20  
**Branch:** `platform-architecture-2026`  
**Owner:** Lead Architecture / Technical Program Lead  
**Authority:** Operational protocol subordinate to approved architecture, ADRs, founder decisions and verified runtime reality.

## 1. PURPOSE

This protocol prevents architecture decisions from being based on one branch, one document, model memory, or stale implementation assumptions.

Every material architecture task must consider four evidence classes:

1. repository evidence;
2. cross-branch evidence;
3. attached/source-package evidence;
4. current external engineering research.

These sources are learning and verification inputs. They do not automatically become ASAS authority.

## 2. SOURCE HIERARCHY

### ASAS product/engineering authority

`FOUNDER / PRODUCT DECISION > APPROVED ARCHITECTURE > APPROVED ADR > CANONICAL CONTRACT / REGISTER > IMPLEMENTATION`

### Brownfield reality

`LIVE RUNTIME / LIVE DATABASE > REPOSITORY IMPLEMENTATION > APPROVED CONTRACT / REGISTER > APPROVED ARCHITECTURE > HISTORY > INFERENCE`

### External engineering evidence

`OFFICIAL DOCUMENTATION / STANDARD > PRIMARY ENGINEERING SOURCE > AUTHORITATIVE RESEARCH > REPUTABLE SECONDARY SOURCE > COMMUNITY`

External sources can validate patterns and expose gaps, but cannot silently override ASAS authority.

## 3. MANDATORY DISCOVERY SEQUENCE

```text
1. Verify canonical repository identity
2. Verify active branch and commit
3. Read AGENTS.md
4. Read CURRENT-SESSION-STATE.md
5. Load Blueprint / Context Prompt / Roadmap / Source of Truth
6. Inventory repository tree
7. Enumerate all remote branches
8. Identify divergent branches and unique commits
9. Inspect relevant files on divergent branches
10. Compare historical and current artifacts
11. Inspect attached/source-package material
12. Reconcile registers/contracts/ADRs
13. Inspect implementation when provenance requires it
14. Inspect runtime/database only after identity verification and authorization
15. Research current external facts using official sources
16. Record conflicts and provenance
17. Decide only within authority
18. Update canonical artifacts and checkpoint
19. Run repository consistency/CI verification
20. Record evidence and exact next checkpoint
```

## 4. REPOSITORY / BRANCH COMMAND SET

These are reference commands for a local engineering clone. Do not run destructive commands.

```bash
# Identity
pwd
git remote -v
git rev-parse --show-toplevel
git branch --show-current
git rev-parse HEAD
git status --short --branch

# Full tree / important files
find . -maxdepth 4 -type f | sort
git ls-files | sort

# All branches and remote heads
git fetch --all --prune
git branch -a --no-color
git ls-remote --heads origin

# Branch divergence / unique commits
for b in $(git for-each-ref --format='%(refname:short)' refs/remotes/origin/); do
  git log --oneline --decorate --no-merges origin/main.."$b" | head -200
  git log --oneline --decorate --no-merges "$b"..origin/main | head -50
done

# Files changed on a candidate branch
git diff --stat origin/main...origin/<branch>
git diff --name-status origin/main...origin/<branch>

# Provenance of an important artifact
git log --follow -- path/to/artifact
git blame path/to/artifact

# Reference sweep
rg -n "SESSION_STATE\.md|CURRENT-SESSION-STATE\.md|C2-001|C2-002|ADR-0018|ASAS-ARCHITECTURE-V3|ASAS-PLATFORM-ARCHITECTURE-BLUEPRINT" .
```

The branch list is evidence, not an instruction to delete branches. Branch deletion requires provenance review and explicit repository-maintainer authority.

## 5. GITHUB SOURCE DISCOVERY

When the connected GitHub integration is available, inspect:

- repository metadata;
- default branch;
- all branches;
- pull requests;
- commits;
- workflow runs;
- releases/tags;
- relevant files at branch-specific refs;
- branch/ruleset protection when permissions permit.

Required questions:

```text
Which branches contain unique architecture work?
Which commits introduced canonical artifacts?
Which branches contain conflicting contracts?
Which changes reached main?
Which changes remain isolated?
Which branch is the active architecture line?
Which evidence is historical only?
```

Do not treat branch existence as approval.

## 6. ATTACHED SOURCE-PACKAGE DISCOVERY

For supplied archives/manifests:

```text
inventory → reading order → extract relevant source → provenance → compare → classify
```

Preserve the distinction between:

`SOURCE SPECIFICATION ≠ CURRENT REPOSITORY IMPLEMENTATION`

The supplied v1.6.1 package is source evidence unless an approved repository artifact explicitly promotes a fact.

## 7. EXTERNAL INTERNET RESEARCH

For unfamiliar or time-sensitive technical facts:

```text
Question
↓
Official documentation / standard
↓
Current version/date
↓
Primary engineering source
↓
Independent corroboration when risk warrants
↓
ASAS impact assessment
↓
Decision / ADR / research note
↓
Review date
```

Prioritize current official documentation for platform/runtime/security standards and use standards bodies for normative requirements.

For architecture research, compare patterns from mature systems but do not copy product internals without evidence.

## 8. CURRENT EXTERNAL RESEARCH NOTES — 2026-09-20

GitHub's current ruleset documentation supports requiring pull requests, required status checks, blocking force pushes, code scanning/quality requirements and path restrictions. Rulesets can layer with branch protection and the most restrictive applicable rule applies. citeturn0search0turn0search8

GitHub documents that required status checks must pass on the relevant commit before merge, and branch protection can require reviews, status checks, conversation resolution, signed commits, linear history and deployment success. citeturn0search1turn0search9

The engineering consequence for ASAS is that repository governance should be treated as an enforceable control, not merely a statement in documentation. However, whether ASAS `main` is actually protected remains a repository fact that must be verified in GitHub; documentation is not evidence of active enforcement.

## 9. CONFLICT HANDLING

When sources disagree:

```text
identify source
→ classify authority
→ establish provenance
→ preserve both claims
→ mark CONFLICT
→ determine decision authority
→ resolve through ADR/founder decision where required
→ update canonical source
→ update dependent references
→ verify
```

Never erase historical evidence solely to make the repository appear consistent.

## 10. RESEARCH RECORD FORMAT

Every material research finding should record:

```text
Research ID
Question
Date
ASAS task/context
Primary source
Source date/version
Secondary corroboration
Finding
ASAS impact
Conflict
Decision
ADR / artifact updated
Review date
Evidence
```

## 11. STOP CONDITIONS

Stop and mark `BLOCKED`, `CONFLICT`, or `FOUNDER DECISION REQUIRED` when:

- repository identity is uncertain;
- live database identity is uncertain;
- two equal-authority sources conflict;
- destructive migration is proposed;
- legal interpretation is required;
- financial semantics are materially ambiguous;
- tenant/security authority is unclear;
- a branch contains unreviewed authoritative-looking changes;
- evidence is insufficient to claim verification.

## 12. CURRENT ASAS DISCOVERY STATE

As of 2026-09-20, the active architecture branch is `platform-architecture-2026`. The repository currently exposes a large set of historical/foundation branches, including repeated `foundation-command-contract-*` and `foundation-platform-identity-gate-*` lines, plus `x`/`x2`. Their existence does not establish authority. They require branch-level provenance classification before any pruning decision.

The branch is currently 70 commits behind `main` according to the GitHub comparison endpoint, while the comparison shows no commits ahead of `main` from the active architecture branch. This must be interpreted carefully: the active architecture line contains its own ancestry from the September reconciliation work, while `main` has progressed independently. The branch must not be force-reset or fast-forwarded blindly; divergence requires reconciliation planning.

## 13. NEXT DISCOVERY CHECKPOINT

Before the next schema-related decision:

1. classify unique work across divergent branches;
2. complete canonical-reference sweep;
3. verify repository protection/rulesets if integration permissions allow;
4. reconcile stale artifact/readiness documents;
5. close Offer state/permission/event contract;
6. close Building ownership/invariants;
7. close Payment/Receipt/Ledger semantics;
8. prepare Scheduling ADR packet;
9. only then reassess schema readiness.
