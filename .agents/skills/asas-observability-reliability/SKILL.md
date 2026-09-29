---
name: asas-observability-reliability
description: Engineer ASAS observability, SLOs, performance evidence, backup/restore readiness, recovery and operational verification.
---

# Reliability and Observability

## Define measurable behavior

For applicable services measure:
`SLI / SLO / error budget / latency / error rate / availability / queue lag / event lag / DB saturation / API saturation / reservation latency / financial posting latency`.

## Recovery

`backup → restore → integrity verification → RPO → RTO → evidence`.

A backup configuration without a successful restore rehearsal is not recovery readiness.

## Failure engineering

Test timeout, retry, duplicate delivery, partial failure, worker crash, transaction rollback, stale reads, concurrency races and dependency outage where relevant.

## Operational boundaries

Keep local development and architecture verification independent of cloud infrastructure until remote identity and authorization are established. Do not infer production readiness from local success.

## Closure

Operational gates require executable evidence, not documentation-only claims.
