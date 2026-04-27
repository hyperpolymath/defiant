K9!
# SPDX-License-Identifier: PMPL-1.0-or-later
# Repo-local K9 validator required by .machine_readable/MUST.contractile.
# This file remains data-only and can be consumed by K9 tooling.

{
  pedigree = {
    schema_version = "1.0.0",
    component_type = "must-validator",
    security = {
      leash = 'Kennel,
      trust_level = "data-only",
      allow_network = false,
      allow_filesystem_write = false,
      allow_subprocess = false,
    },
    metadata = {
      name = "must-check",
      version = "1.0.0",
      description = "Machine-readable checks for baseline policy and CI contract files.",
    },
  },

  validator = {
    id = "must-check",
    checks = [
      {
        name = "mustfile_present",
        kind = "path-exists",
        path = "contractiles/must/Mustfile",
      },
      {
        name = "policy_present",
        kind = "path-exists",
        path = "policy/policy.ncl",
      },
      {
        name = "workflow_dir_present",
        kind = "path-exists",
        path = ".github/workflows",
      },
    ],
  },

  guidance = [
    "Run nickel typecheck policy/policy.ncl",
    "Run repository CI validation before merge",
  ],
}
