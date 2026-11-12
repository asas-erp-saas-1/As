# Unique historical content register — corrected from machine-readable evidence (2026-11-12)

## Scope and controlling counts

This register is a path/blob inventory of historical branch snapshot content compared with the active canonical non-archive root at baseline commit 39ead7b4123666b0c20f301b9d4066864d3c88f5. Both archival namespaces are excluded from the active-root comparison. The baseline contains 417 tracked non-archive files.

The controlling machine-readable source is [the unique historical blob manifest](recovered-content/UNIQUE-HISTORICAL-BLOB-MANIFEST-2026-10-17.csv). It contains **237 data rows and 237 distinct Git blob SHAs**. The corresponding recovered-content/by-blob/ directory contains exactly **237 blob directories**. These exact-object counts supersede earlier prose in this file that inconsistently cited 222, 226, or 237.

| Measure | Corrected value | Meaning |
|---|---:|---|
| Branch-file difference records | **1,997** | Occurrences across the audited snapshot records; repeated branch/tree content is intentionally counted again |
| Distinct original source paths | **180** | Different source paths represented by the delta rows |
| Different historical content at an existing active-root path | **602** | Historical full-file blob differs from the active blob at that same path |
| Path absent from active root and exact blob absent from active root | **1,395** | Historical path/content not represented in the active non-archive root |
| Distinct historical blob versions absent from active root | **237** | Exact SHA-deduplicated content versions, each represented once under by-blob/ |

The 237 unique blobs consist of 220 Markdown files, 6 JSON files, 8 YAML files (.yml), 2 shell scripts, and 1 patch file. These counts sum to 237.

## Preservation method

- Full tracked-tree snapshots preserve original relative file paths, file modes, and exact Git blob SHAs.
- Recovered unique content is exposed at recovered-content/by-blob/<blob-sha>/<original-path>, using the original Git blob objects rather than regenerated or normalized text.
- The manifest records each unique SHA, byte count, representative path, source branch/head, snapshot order, occurrence rows, all original paths/branches, delta class, and preservation path.
- Orders 057–060 are reconstructable delta overlays; their declared base and shared dependencies must be respected when rebuilding a full branch tree. Orders 061–062 are full-tree commit references through Git submodule gitlinks pinned to the exact source commit; clone with `--recurse-submodules` to materialize the entire tracked tree. Their source root tree SHA is `6750ad77c18f8db696fb56374dd6885666b19b99`; no delta reconstruction is required.
- The 15 additional source blob versions found in the order-058 latest-head reconciliation are all represented in the 237-row manifest and by-blob/ tree. Older prose saying “all four” referred only to a subset of explicitly enumerated examples and is not the total.

## Important historical workflow reservation

The older .github/workflows/foundation-verify.yml blob baaae4cde9dbb357ac968239e921930559e7b51e remains archived as historical evidence. It predates the active-state scan exclusion for docs/engineering-history/** and must not replace the active workflow.

## Interpretation and architecture authority

This register is evidence of historical content, not an approval list. A historical file can be useful, superseded, incomplete, contradictory, or unsafe to promote. Do not copy these contents into active architecture paths without source-authority review, contradiction analysis, explicit disposition, and required decision authority.

The 2026-10-20 delta audit's figures remain scoped to its documented census and baseline. The 2026-11-12 archive refresh adds the latest live branch refs and exact commit-pinned full-tree provenance; it does not silently extend the semantic comparison baseline or claim that every historical document has been adjudicated.

## Prior prose correction

This file previously mixed incompatible values: 222 unique blobs, 226 representative versions, 1,986 difference records, and an incomplete “four blob” follow-up. Those were inconsistent with the final machine-readable manifest and corrected delta totals. The table above is the controlling correction: **1,997 records, 180 source paths, and 237 unique historical blob SHAs**. Consult the CSV manifest and delta-audit parts for row-level evidence.
