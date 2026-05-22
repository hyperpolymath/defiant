<!-- SPDX-License-Identifier: MPL-2.0 -->
<!-- TOPOLOGY.md — Project architecture map and completion dashboard -->
<!-- Last updated: 2026-02-19 -->

# defiant — Project Topology

## System Architecture

```
                        ┌─────────────────────────────────────────┐
                        │              SECURITY TESTER            │
                        │        (Framework CLI / CI Integration) │
                        └───────────────────┬─────────────────────┘
                                            │
                                            ▼
                        ┌─────────────────────────────────────────┐
                        │           DEFIANT FRAMEWORK             │
                        │    (Authz Bypass Detection Engine)      │
                        │  ┌───────────┐  ┌───────────────────┐  │
                        │  │ Pattern   │  │   Test Runner     │  │
                        │  │ Matcher   │  │   (RSR-compliant) │  │
                        │  └─────┬─────┘  └────────┬──────────┘  │
                        └────────│─────────────────│──────────────┘
                                 │                 │
                                 ▼                 ▼
                        ┌─────────────────────────────────────────┐
                        │           TARGET APPLICATION            │
                        │      (System under authorization test)  │
                        └─────────────────────────────────────────┘

                        ┌─────────────────────────────────────────┐
                        │          REPO INFRASTRUCTURE            │
                        │  11 GitHub Workflows  .machine_readable/│
                        │  Multi-Forge Mirrors  contractiles/     │
                        └─────────────────────────────────────────┘
```

## Completion Dashboard

```
COMPONENT                          STATUS              NOTES
─────────────────────────────────  ──────────────────  ─────────────────────────────────
SPECIFICATION & INFRA
  CI/CD Infrastructure              ██████████ 100%    11 workflows active
  Language Policy Enforcement       ██████████ 100%    RSR stack verified
  Security Policy Enforcement       ██████████ 100%    Hardcoded secrets/HTTP blocked
  Multi-Mirror Distribution         ██████████ 100%    GH/GL/BB/CB sync stable

FRAMEWORK CORE
  Authz Bypass Engine               ░░░░░░░░░░   0%    Forthcoming implementation
  Pattern Matching                  ░░░░░░░░░░   0%    Pending specification
  Test Suites                       ░░░░░░░░░░   0%    Planned development

REPO INFRASTRUCTURE
  Justfile                          ██████████ 100%    Standard build tasks
  .machine_readable/                ██████████ 100%    STATE.a2ml tracking
  RSR Gold Scaffolding              ██████████ 100%    Compliance ready

─────────────────────────────────────────────────────────────────────────────
OVERALL:                            ████░░░░░░  ~40%   Infrastructure complete, Core pending
```

## Key Dependencies

```
Framework Spec ───► Infrastructure ───► Core Framework ──► Test Suites
     │                 │                   │                │
     ▼                 ▼                   ▼                ▼
Language Policy ───► CI Workflows ─────► Pattern Engine ──► Validation
```

## Update Protocol

This file is maintained by both humans and AI agents. When updating:

1. **After completing a component**: Change its bar and percentage
2. **After adding a component**: Add a new row in the appropriate section
3. **After architectural changes**: Update the ASCII diagram
4. **Date**: Update the `Last updated` comment at the top of this file

Progress bars use: `█` (filled) and `░` (empty), 10 characters wide.
Percentages: 0%, 10%, 20%, ... 100% (in 10% increments).
