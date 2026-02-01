;; SPDX-License-Identifier: PMPL-1.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell <jonathan.jewell@gmail.com>
;; PLAYBOOK.scm - Operational runbook for Defiant

(define playbook
  `((version . "1.0.0")
    (schema-version . "2")

    (procedures
      ((development
         ((setup
            (("step" . "Clone repository")
             ("command" . "git clone https://github.com/hyperpolymath/defiant")
             ("verify" . "cd defiant && ls"))
            (("step" . "Install Rust toolchain")
             ("command" . "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh")
             ("verify" . "rustc --version"))
            (("step" . "Install Deno")
             ("command" . "curl -fsSL https://deno.land/install.sh | sh")
             ("verify" . "deno --version"))
            (("step" . "Install just")
             ("command" . "cargo install just")
             ("verify" . "just --version")))
          (build
            (("step" . "Build all components")
             ("command" . "just build")
             ("expected" . "Build completes without errors")))
          (test
            (("step" . "Run test suite")
             ("command" . "just test")
             ("expected" . "All tests pass")))
          (format
            (("step" . "Format code")
             ("command" . "just fmt")
             ("expected" . "Code formatted consistently")))
          (lint
            (("step" . "Run linters")
             ("command" . "just lint")
             ("expected" . "No lint errors")))))

       (deploy
         ((pre-release
            (("step" . "Run full CI")
             ("command" . "gh workflow run quality.yml")
             ("verify" . "gh run list --workflow=quality.yml"))
            (("step" . "Update changelog")
             ("file" . "CHANGELOG.md")
             ("action" . "Add release notes"))
            (("step" . "Bump version")
             ("files" . ("Cargo.toml" "README.adoc"))
             ("action" . "Update version strings")))
          (release
            (("step" . "Create git tag")
             ("command" . "git tag -s vX.Y.Z -m 'Release vX.Y.Z'")
             ("verify" . "git tag -v vX.Y.Z"))
            (("step" . "Push tag")
             ("command" . "git push origin vX.Y.Z")
             ("verify" . "gh release view vX.Y.Z"))
            (("step" . "Publish to crates.io")
             ("command" . "cargo publish --package defiant-core")
             ("verify" . "cargo search defiant-core")))))

       (rollback
         ((revert-release
            (("step" . "Delete release")
             ("command" . "gh release delete vX.Y.Z")
             ("verify" . "Release removed from GitHub"))
            (("step" . "Remove tag")
             ("command" . "git tag -d vX.Y.Z && git push origin :refs/tags/vX.Y.Z")
             ("verify" . "Tag removed from remote"))
            (("step" . "Yank from crates.io")
             ("command" . "cargo yank --version X.Y.Z defiant-core")
             ("note" . "Only for critical security issues")))))

       (debug
         ((test-failures
            (("step" . "Run failing test in isolation")
             ("command" . "cargo test TESTNAME -- --nocapture")
             ("output" . "Detailed test output"))
            (("step" . "Enable debug logging")
             ("command" . "RUST_LOG=debug cargo test TESTNAME")
             ("output" . "Trace-level diagnostics")))
          (security-scan-issues
            (("step" . "Review CodeQL alerts")
             ("location" . "GitHub Security tab > Code scanning alerts")
             ("action" . "Triage and fix or dismiss with reason"))
            (("step" . "Review Dependabot alerts")
             ("location" . "GitHub Security tab > Dependabot alerts")
             ("action" . "Update dependencies or document exception")))
          (ci-failures
            (("step" . "Check workflow run logs")
             ("command" . "gh run view --log-failed")
             ("action" . "Identify failing step and fix")))))))

    (alerts
      ((security-advisory
         ((trigger . "New CVE affecting dependencies")
          (response . "Review Dependabot alert, update or patch")
          (escalation . "Critical: fix within 24 hours")
          (notification . "GitHub Security alerts")))
       (build-failure
         ((trigger . "CI workflow fails on main")
          (response . "Review logs, fix immediately")
          (escalation . "Block merges until fixed")
          (notification . "GitHub Actions email")))
       (scorecard-regression
         ((trigger . "OpenSSF Scorecard score drops")
          (response . "Review scorecard output, remediate")
          (escalation . "Document if intentional, fix otherwise")
          (notification . "Weekly scorecard action")))))

    (contacts
      ((maintainer
         ((name . "Jonathan D.A. Jewell")
          (email . "jonathan.jewell@gmail.com")
          (github . "@hyperpolymath")
          (role . "Project lead")))
       (security
         ((email . "security@hyperpolymath.dev")
          (pgp . "See SECURITY.md")
          (response-time . "48 hours for critical issues")))))

    (runbook-maintenance
      ((review-frequency . "quarterly")
       (last-reviewed . "2026-01-04")
       (next-review . "2026-04-04")
       (owner . "maintainer")))))