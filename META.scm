;; SPDX-License-Identifier: PMPL-1.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell <jonathan.jewell@gmail.com>
;; META.scm - Architecture decisions and development practices
;; Media Type: application/meta+scheme

(define project-meta
  `((version . "1.0.0")
    (schema-version . "2")

    (architecture-decisions
      ((adr-001
         ((title . "Rust for Core Engine")
          (status . "accepted")
          (date . "2025-12-29")
          (context . "Need high-performance, memory-safe core for bypass detection")
          (decision . "Use Rust for defiant-core, defiant-patterns, defiant-cli, defiant-report crates")
          (consequences
            ("Memory safety without garbage collection overhead"
             "Excellent WASM compilation support"
             "Strong type system prevents authorization logic errors"
             "Steep learning curve for contributors"))))

       (adr-002
         ((title . "ReScript for Web Interface")
          (status . "accepted")
          (date . "2025-12-29")
          (context . "TypeScript banned by RSR; need type-safe frontend development")
          (decision . "Use ReScript (compiles to JS) for web UI components")
          (consequences
            ("Type-safe alternative to TypeScript"
             "Smaller community than TypeScript"
             "Fast compilation to readable JS"
             "Smaller bundle sizes"))))

       (adr-003
         ((title . "SARIF Output Format")
          (status . "accepted")
          (date . "2025-12-29")
          (context . "Need machine-readable output for IDE and CI integration")
          (decision . "Support SARIF (Static Analysis Results Interchange Format) as primary output")
          (consequences
            ("Direct GitHub Code Scanning integration"
             "IDE support via SARIF viewers"
             "Industry standard for security tools"
             "Additional JSON/HTML formats for flexibility"))))

       (adr-004
         ((title . "Pattern-Based Detection")
          (status . "accepted")
          (date . "2025-12-29")
          (context . "Authorization bypasses follow known patterns")
          (decision . "Implement pattern library with pluggable detection strategies")
          (consequences
            ("Community-contributed patterns"
             "Easy to extend for new vulnerability classes"
             "May miss novel bypass techniques"
             "Requires pattern maintenance"))))

       (adr-005
         ((title . "Multi-Mirror Distribution")
          (status . "accepted")
          (date . "2025-12-29")
          (context . "Reduce platform lock-in and increase accessibility")
          (decision . "Sync to GitHub, GitLab, Bitbucket, Codeberg automatically")
          (consequences
            ("Platform independence"
             "Wider contributor accessibility"
             "Increased maintenance complexity"
             "Mirror sync delays possible"))))

       (adr-006
         ((title . "Dual Licensing with Philosophical Overlay")
          (status . "accepted")
          (date . "2025-12-29")
          (context . "Balance open source with ethical use concerns")
          (decision . "MIT OR AGPL-3.0-or-later with Palimpsest philosophy overlay")
          (consequences
            ("Maximum compatibility via MIT"
             "Copyleft protection via AGPL"
             "Philosophical framework for ethical use"
             "Some legal complexity"))))))

    (development-practices
      ((code-style
         ((primary . "rescript-fmt")
          (rust . "rustfmt")
          (shell . "shellcheck")
          (config . "editorconfig-enforced")))
       (security
         ((framework . "openssf-scorecard")
          (scanning . ("codeql" "trufflehog" "dependabot"))
          (supply-chain . "sha-pinned-actions")
          (secrets . "no-hardcoded-secrets")))
       (testing
         ((approach . "property-based")
          (coverage . "comprehensive")
          (security-testing . "eat-own-dogfood")
          (fuzzing . "cargo-fuzz-when-applicable")))
       (versioning
         ((scheme . "semver")
          (changelog . "keep-a-changelog")
          (release . "github-releases")))
       (documentation
         ((format . "asciidoc")
          (api . "rustdoc")
          (style . "clear-and-concise")))
       (branching
         ((strategy . "trunk-based")
          (main-branch . "main")
          (feature-branches . "short-lived")
          (protection . "branch-rules-enabled")))))

    (design-rationale
      ((why-authorization-focus
         "Authorization bypass is #1 on OWASP Top 10 (A01:2021) and remains
          the most critical and prevalent web application vulnerability class.
          Existing tools focus on authentication or general vulnerabilities;
          specialized authorization testing is underserved.")
       (why-pattern-library
         "Authorization bypasses follow recognizable patterns: IDOR, privilege
          escalation, JWT manipulation, path traversal in authz context. A
          curated pattern library enables both detection and education.")
       (why-rust-not-go
         "RSR mandate plus: Rust type system can encode authorization
          invariants at compile time. Memory safety is critical for security
          tooling. WASM support enables browser-based testing.")
       (why-not-existing-tools
         "OWASP ZAP, Burp Suite focus on general web security. Defiant targets
          specifically authorization logic, with patterns tailored to access
          control vulnerabilities. Complements rather than replaces.")
       (why-multi-output
         "Different consumers need different formats: SARIF for CI/IDE
          integration, JSON for programmatic access, HTML for human review.
          Supporting all increases adoption and utility.")))

    (quality-gates
      ((pre-commit
         ("format-check"
          "lint"
          "type-check"
          "no-banned-languages"))
       (ci
         ("build"
          "test"
          "security-scan"
          "scorecard-check"
          "license-check"))
       (release
         ("all-ci-pass"
          "documentation-updated"
          "changelog-entry"
          "version-bump"))))))