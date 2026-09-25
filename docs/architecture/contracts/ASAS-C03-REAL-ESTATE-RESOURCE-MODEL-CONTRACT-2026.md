# ASAS C03 — Real Estate Resource Model Contract — 2026

**Status:** PROPOSED — conference workstream opened, implementation blocked
**Date:** 2026-09-25
**Depends on:** C01/C02 organization, collaboration, attribution, and multi-actor inventory authority decisions

## 1. Objective

Define the canonical business semantics for real-estate resources before target schema design.

The model must support Developer-led, Agency-led, mixed-channel, and future multi-actor operating models without duplicating authoritative inventory.

## 2. Required resource hierarchy to investigate

```text
Portfolio / Collection (optional)
    ↓
Project
    ↓
Building / Block
    ↓
Floor / Level (where applicable)
    ↓
Unit / Property
    ↓
Inventory / Availability state
```

This is a semantic investigation target, not yet an approved database hierarchy.

## 3. Questions C03 must resolve

- What is the canonical identity of a Project?
- Can a Project have multiple participating organizations with different authorities?
- Is Building always required, or can a Project contain Units directly?
- Is Floor a domain entity or derived structural metadata?
- What exactly is an Inventory resource versus a Unit/Property resource?
- Can one Unit have multiple listing representations without duplicate inventory truth?
- How are parking, storage rooms, commercial units, villas, land parcels, and non-apartment assets represented?
- Which attributes are structural facts versus commercial configuration?
- How are prices versioned?
- How are availability states governed?
- Which states are inventory states versus sales workflow states?
- How are ownership/control/authority relationships represented?
- What is immutable after a reservation/sale milestone?
- What constitutes a canonical resource key across imports/integrations?

## 4. Initial architectural principle

Do not encode the business assumption `Developer = owner = seller = reservation authority` into the core model.

Those roles may coincide, but they are distinct dimensions.

## 5. Inventory principle

A Unit/Property must have one authoritative commercial state within its owning/control context. Agencies, internal sales teams, and other authorized channels operate against that same truth through scoped rights.

## 6. Listing principle

A listing is expected to be a representation/distribution context, not a second authoritative Unit. C03 must validate the exact semantics and lifecycle before implementation.

## 7. Price principle

Price must be treated as time/version-sensitive commercial data rather than a mutable scalar when historical transactions depend on the previous value.

## 8. Availability principle

Availability must be governed by a state machine and command preconditions. It must not be inferred solely from a free-form `status` field.

## 9. C03 research method

For each domain question:

`Independent research → industry model comparison → ASAS source review → edge cases → authority decision → contract → test scenarios`

External research informs the model; ASAS founder decisions and canonical contracts remain authoritative for product meaning.

## 10. Exit criteria

C03 is not implementation-ready until:

- resource identity is closed;
- hierarchy semantics are closed;
- ownership/control/authority dimensions are closed;
- inventory state machine is closed;
- price/version semantics are closed;
- listing semantics are closed;
- non-apartment asset strategy is closed;
- cross-organization access scenarios are specified;
- reservation/sale immutability boundaries are specified;
- schema contract and test specification can be derived without inventing product meaning.
