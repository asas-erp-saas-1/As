# C03 — Documents / Media ↔ Real Estate / Studio Reconciliation

**Date:** 2026-10-02  
**Status:** RECONCILIATION — OPEN / NO IMPLEMENTATION AUTHORIZATION  
**Depends on:** `22-STUDIO-PUBLICATION-UNIT-INVENTORY-RECONCILIATION-2026-10-02.md`  
**Scope:** Establish evidence ownership and lifecycle separation for media and documents attached to Project, Building, Floor, Unit and publication surfaces.

## 1. Evidence classification

- **SOURCE-LOCKED:** supported by current ASAS architecture/product/schema contract evidence.
- **ENGINEERING-DERIVATION:** consistency consequence of those facts.
- **OPEN:** contract not sufficiently defined.
- **NOT AUTHORIZED:** must not be implemented from structural convenience.

## 2. Source model

The target transactional contract includes `MediaAsset` and `EntityAttachment` as distinct models in the consolidated schema contract. The broader architecture also places Documents and Website Studio in separate bounded contexts.

This establishes that attachment/media capability is a first-class platform concern, not an implicit blob field on Unit or Project.

It does not by itself define the exact ownership, retention or lifecycle rules for every asset type.

## 3. Evidence classes

ASAS must distinguish at least three conceptual categories:

```text
A. Domain evidence
   legal / commercial / compliance records

B. Operational evidence
   construction photos, visit evidence, inspection material

C. Presentation media
   renders, galleries, floor-plan images, marketing assets
```

These categories can reference the same real-estate entities but must not automatically share lifecycle or permission semantics.

## 4. Domain evidence versus presentation media

A presentation asset can normally be replaced because a new render supersedes an old render.

A legal or commercial document may have evidentiary value and therefore must not be treated as ordinary Studio content.

Therefore:

```text
Studio editorial mutation
        ≠
legal/commercial document mutation
```

The exact document classes and retention periods remain OPEN.

## 5. Attachment ownership

A Project/Building/Floor/Unit may be the **subject** of an attachment without owning the attachment's full lifecycle.

This distinction matters for:

- Unit structural changes;
- Unit archival;
- publication rollback;
- replacement of media derivatives;
- legal document retention;
- audit history.

An attachment reference must not be interpreted as permission to delete the underlying evidence.

## 6. Structural mutation red-team

### Case A — Unit detached from Floor

Existing attachments must not be deleted automatically.

### Case B — Building archived

Construction evidence, legal records and historical media may have different retention requirements. No cascade is authorized.

### Case C — Public Unit page unpublished

Unpublishing a page must not delete source media or legal evidence.

### Case D — Publication rollback

Rollback may change which media/version is presented but must not destroy the historical asset without a governed retention operation.

### Case E — Asset replaced

Replacement should preserve enough provenance to determine what was previously used where required by audit or publication history.

## 7. Media derivatives

Presentation media may have derived forms:

```text
source asset
  ↓
normalized/original storage
  ↓
derivatives
  ├── thumbnail
  ├── responsive image
  └── optimized web format
```

A derivative is not an independent domain asset merely because it is stored separately.

Deletion of a derivative must not be interpreted as deletion of the source evidence.

The exact storage and derivative lifecycle is outside this reconciliation.

## 8. Document security boundary

Legal/commercial evidence can contain sensitive buyer, promoter or contractual information.

Therefore ordinary public publication permissions must not imply document access.

The future contract must distinguish:

```text
public-read media
internal operational media
restricted commercial documents
restricted legal/financial evidence
```

Authorization must be evaluated at the domain/application boundary, not inferred from a public Unit page.

## 9. Tenant isolation

Any attachment/document associated with Project, Building, Floor or Unit must respect the owning organization/tenant boundary.

A cross-tenant attachment reference must not be created merely because the target entity UUID is technically known.

If cross-tenant sharing is ever required, it must be an explicit governed capability rather than an accidental foreign-key/reference behavior.

## 10. Auditability

For evidence-bearing documents, the platform should be able to answer:

- who uploaded it;
- when it was uploaded;
- which domain object it concerned;
- whether it was published;
- whether it was replaced or superseded;
- who performed the replacement/removal;
- which workflow depended on it, where required.

These are evidence requirements, not permission to invent a final audit schema here.

## 11. Studio boundary

Studio may manage presentation-oriented content and publication versions.

Studio must not silently mutate:

- inventory availability;
- reservation state;
- contractual state;
- posted finance state;
- legal evidence lifecycle.

A Studio action that needs such a change must invoke the corresponding governed application/domain capability.

## 12. Cross-domain event implications

A future attachment/media event may be consumed by:

- Studio publication;
- Analytics;
- construction tracking;
- CRM/Sales timelines;
- document compliance workflows.

Consumers must treat such events as notifications of a state change, not permission to mutate the source domain arbitrarily.

Canonical event names are not invented here.

## 13. Aggregate-boundary impact

Documents and media are further evidence that the structural hierarchy should not absorb every related record into one aggregate.

A Unit can have many presentation and evidence relationships whose lifecycles differ from Unit commercial state.

The aggregate decision must therefore follow transactional invariants, not attachment cardinality.

## 14. LOCKED / OPEN / NOT AUTHORIZED

### LOCKED

- Media/document capability is first-class platform architecture.
- Presentation media and evidence-bearing documents require different lifecycle considerations.
- Public publication permission does not imply legal/commercial document access.
- Structural archive/detach must not imply destructive attachment deletion.
- Tenant boundaries apply to attachments/evidence.
- Studio does not own inventory, reservations, contracts or posted finance state.

### OPEN

- Exact document taxonomy.
- Retention policy by document class.
- Legal/commercial document lifecycle.
- Attachment ownership model.
- Media version/provenance policy.
- Storage and derivative lifecycle.
- Cross-context document access matrix.
- Exact document/media event contracts.

### NOT AUTHORIZED

- Cascade-delete media/documents from structural archive.
- Treat public Studio access as legal-document authorization.
- Store sensitive evidence as ordinary public media.
- Use media existence as proof of commercial readiness.
- Make attachments part of a Project aggregate without invariant evidence.

## 15. Next closure gate

C03 now requires a **cross-domain red-team** covering:

```text
identity
→ tenancy
→ lifecycle
→ inventory
→ construction
→ publication
→ documents/media
→ concurrency
→ authorization
→ auditability
→ historical-data safety
```

Only after that attack pass can the final aggregate-boundary position be prepared for independent closure review.

**C03 remains OPEN. No schema, ORM, migration, API or production implementation is authorized by this artifact.**
