# ASAS C03–C06 External Research Record — 2026-09-27

## Purpose

Current primary/authoritative external facts used during the deep review of C03 Real Estate, C04 CRM, C05 Sales and C06 Finance.

## 1. Algeria data protection

**Primary source:** Journal Officiel de la République Algérienne, Loi n° 25-11 du 24 juillet 2025, modifying/completing Loi n° 18-07.

**Finding:** Law 25-11 is a current amendment to the Algerian personal-data protection framework. It adds/updates concepts including profiling and pseudonymisation and therefore the ASAS privacy model must not rely on an unmodified 18-07 snapshot.

**Application:** C04 consent/purpose and C15 privacy/security must remain country-pack governed. No generic CRM rule should encode a definitive Algerian legal conclusion without the current legal source.

**Source:** https://www.joradp.dz/FTP/jo-francais/2025/F2025048.pdf
**Verified:** 2026-09-27

## 2. Algeria real-estate reservation / sale-on-plan

**Primary source:** Journal Officiel implementing Law 11-04, including the prescribed model framework for reservation and sale-on-plan contracts and payment limits.

**Finding:** Algerian developer/off-plan execution has specific legal contract and payment rules. The domain model must therefore separate generic Sales semantics from the legally executable country-pack sequence.

**Application:** C05 defines Reservation/Contract boundaries but intentionally does not encode the final Algerian legal sequence as a universal Sales invariant. C15/country-pack/legal authority must supply the executable rules.

**Source:** https://www.joradp.dz/FTP/JO-FRANCAIS/2013/F2013066.pdf
**Verified:** 2026-09-27

## 3. Multi-tenant security

**Primary source:** OWASP Multi-Tenant Application Security Cheat Sheet.

**Findings:**
- tenant context must be derived from a server-verified identity/membership, not trusted from a client-supplied tenant ID;
- isolation must be considered across database, cache, storage, asynchronous work and other shared infrastructure;
- ordinary tenant-scoped request paths must not use superuser/BYPASSRLS roles when RLS is the isolation boundary;
- transaction-local tenant context is preferred for pooled PostgreSQL connections;
- negative-path cross-tenant tests must use the same role/connection path as the deployed application;
- tenant-aware idempotency, queues, cache keys and storage boundaries are required where effects vary by tenant.

**Application:** C04 identity/authorization, C05 Sales jobs/reservation expiration and C06 Finance asynchronous reconciliation all inherit the tenant isolation contract.

**Source:** https://cheatsheetseries.owasp.org/cheatsheets/Multi_Tenant_Security_Cheat_Sheet.html
**Verified:** 2026-09-27

## 4. Authorization regression testing

**Primary source:** OWASP Authorization Regression Testing Cheat Sheet.

**Finding:** Authorization should be represented as a machine-readable Actor/Resource/Action matrix and continuously regression-tested for horizontal, vertical and tenant-isolation failures.

**Application:** The ASAS permission register must eventually be connected to executable negative-path tests rather than treated as documentation only.

**Source:** https://cheatsheetseries.owasp.org/cheatsheets/Authorization_Regression_Testing_Cheat_Sheet.html
**Verified:** 2026-09-27

## 5. ASAS internal authority

The ASAS V3 architecture requires research-first verification, one canonical owner per concept, live database authority for brownfield reality, foundation gates before implementation, and a traceability chain from requirement through decision, contract, implementation, test, evidence and production metric.

**Application:** This research record supports decisions but does not replace the ASAS ADRs, contracts, registers or runtime evidence.
