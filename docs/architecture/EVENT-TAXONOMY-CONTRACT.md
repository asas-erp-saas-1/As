# ASAS Event Taxonomy and Identity Contract

**Status:** DESIGN / HANDOFF ONLY — no implementation authorized.
**Date:** 2026-09-14
**Authority:** Blueprint Appendix C / `registers/events.json`.

## 1. Observed source fact

The delivered register contains 103 registered events and defines an event naming/envelope contract. The engineering protocol also states that events use the `resource.action_past_tense` convention. fileciteturn99file8L2-L2

The repository Domain Contracts Map currently uses PascalCase labels for readability. Those labels must not become a second event identity system.

## 2. Canonical rule

The **registered dotted event identifier is the canonical wire/event identity**.

Examples of the canonical form include:

- `apartment.published`
- `reservation.created`
- `receipt.allocated`
- `page.published`

PascalCase names such as `ReservationCreated` may be used as in-code symbolic names only when they map one-to-one to the registered identity.

## 3. Event envelope

Every emitted event must resolve to one registered identity and one schema version.

Minimum conceptual envelope:

```text
id
name
version
occurred_at
actor
tenant/workspace
aggregate_type
aggregate_id
correlation_id
causation_id
payload
metadata
```

The exact field names/types remain those of the authoritative event register and Chapter 39 contract.

## 4. Event classes

Before implementation, every registered event must be classified as exactly one primary class:

1. **Domain event** — immutable business fact produced by an owning context.
2. **Integration event** — provider/system boundary fact intended for an external adapter or integration consumer.
3. **Platform event** — infrastructure/governance fact such as session or delivery state.
4. **Notification event** — delivery-oriented fact; not a substitute for the business event.
5. **Projection/telemetry event** — derived operational signal; never canonical business truth.
6. **Deprecated/legacy** — retained only for compatibility/reconciliation and not emitted by new code.

A single event may have multiple consumers, but it has one canonical identity and class.

## 5. Domain-event rule

Domain events describe something that **has happened**, not something a UI wants to do.

Commands express intent:

`ReserveApartment`

Events express fact:

`reservation.created`

Never name a domain event as a future instruction such as `reserve.apartment`.

## 6. Versioning

Event versions are schema contracts, not cosmetic numbers.

- Additive payload changes require compatibility analysis before the version is changed.
- Breaking semantic/payload changes require a new version and explicit migration/consumer strategy.
- Consumers must tolerate duplicate delivery.
- Consumers must reject or quarantine unknown/incompatible versions safely.
- Historical events must remain interpretable for audit/replay purposes.

## 7. Producer/consumer ownership

The producer is the context that owns the aggregate/fact.

Consumers may:

- create projections;
- trigger notifications;
- invoke approved application services;
- update integration delivery state;
- feed analytics/AI read models.

Consumers must not mutate another context's aggregate directly through its persistence model.

## 8. Audit/outbox relationship

For a governed state mutation:

`domain mutation + audit record + outbox event → same transaction`

The outbox record is the durable dispatch boundary. External delivery happens after commit.

## 9. Required normalization artifact

Before new event emission is implemented, create a machine-readable mapping with at least:

`registered_id | version | class | producer_context | aggregate | trigger/command | consumers | payload_contract | idempotency_key | audit_required | PII classification | retention | retry/dead-letter behavior | deprecated_aliases`

This matrix is the authoritative bridge between Appendix C, domain code, integration adapters, analytics and AI consumers.

## 10. Stop conditions

Claude must stop if implementation appears to require:

- an unregistered event;
- a second identity for an existing event;
- a new event version without compatibility analysis;
- a consumer that directly mutates another context's aggregate;
- a provider callback being treated as canonical business truth.
