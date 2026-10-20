# Branch delta audit versus the current canonical root

**Comparison baseline:** default branch `platform-architecture-2026`, tree `41ca2f90e3a616ba721d7af4de1d99767ec41d9b`, from commit `39ead7b4123666b0c20f301b9d4066864d3c88f5`. The audit excludes `docs/engineering-history/**` from both sides so the existing snapshots are not falsely compared against themselves.

## Results

- Snapshot records evaluated: 54, representing 53 live branch refs plus one retained historical checkpoint of the default branch.
- Unique branch-tip trees evaluated: 25. Every recursive source tree used by this audit returned `truncated=false`.
- File-path delta rows across snapshots: 1,982.
- At the same path but with different blob content: 589 rows.
- The branch path is absent from the root, but its exact blob exists at another path in the root: 1,393 rows.
- Within the same-path content differences, only 2 snapshot rows use a blob absent everywhere in the current root. These two records point to **one unique historical file blob**, repeated in two snapshots: the older `.github/workflows/foundation-verify.yml` (8,649 bytes; blob `baaae4cde9dbb357ac968239e921930559e7b51e`) in orders 051 and 052.
- No other branch file blob in this comparison was absent from the current root by exact Git blob identity. This does not establish that the studies are semantically complete; it is a content-addressed file-level test.

## The sole exact historical-content gap

The one blob not present in the current root is the old version of `.github/workflows/foundation-verify.yml` from before the archive exclusion was added. The current version is 8,695 bytes (blob `b0d1c02bd83554e119316c52711a76e281150cdb`) and includes the `':!docs/engineering-history/**'` exclusion. The historical version is preserved without modification in the full branch snapshots and as a clearly labelled standalone reference at [`recovered-content/pre-archive-exclusion-foundation-verify.yml`](recovered-content/pre-archive-exclusion-foundation-verify.yml). It must **not** be copied over the active workflow because it would make the active-state scan inspect the historical archive again. CI and Foundation Verify passed on archive commit [`1aeb0907ae544caafb5160bd90d0e21488024c53`](https://github.com/asas-erp-saas-1/As/actions/runs/38982138908).

## Detailed audit files

The CSV parts contain one row per differing/missing branch file path, with snapshot order, branch-tip SHA, branch blob SHA, canonical blob SHA, sizes, and whether the branch blob is found elsewhere in the current root. The [per-snapshot summary CSV](delta-audit/SUMMARY-2026-10-17.csv) provides counts for every snapshot.

| Part | Snapshot orders | Delta rows | Detailed file |
|---|---|---:|---|
| 1 | 001–033 | 1,642 | [part-01-sept15.csv](delta-audit/part-01-sept15.csv) |
| 2 | 034–038 | 103 | [part-02-sept16-17.csv](delta-audit/part-02-sept16-17.csv) |
| 3 | 039–043 | 122 | [part-03-sept18-20.csv](delta-audit/part-03-sept18-20.csv) |
| 4 | 044–048 | 105 | [part-04-sept29-oct16.csv](delta-audit/part-04-sept29-oct16.csv) |
| 5 | 049–054 | 10 | [part-05-follow-up-census.csv](delta-audit/part-05-follow-up-census.csv) |

## Limits and interpretation

This is a one-way path/blob comparison: it inventories branch files that differ by path or full-file content, not files that were deleted from a branch relative to the current root. It identifies exact whole-file blob presence and is not a line-by-line semantic review of every architectural claim. All full source files remain accessible in the numbered snapshots. The next review should reconcile conflicting requirements, authority, domain invariants, tenancy/security assumptions, workflow transitions, integration contracts, and unresolved gates before promoting decisions into the canonical architecture.

See the [unique-content register](UNIQUE-CONTENT-REGISTER-2026-10-17.md) for the single historical file blob that should remain archived rather than reactivated.
