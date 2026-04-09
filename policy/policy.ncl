# SPDX-License-Identifier: PMPL-1.0-or-later
# Baseline policy contract consumed by contractiles/must/Mustfile.
{
  policy = {
    version = "1.0.0",
    enforcement = {
      require_spdx_headers = true,
      require_ci_security_checks = true,
      block_committed_secrets = true,
      require_pinned_actions = true,
    },
    triage = {
      auto_fix_min_confidence = 0.95,
      review_min_confidence = 0.85,
    },
  },
}
