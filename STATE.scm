;; SPDX-License-Identifier: PMPL-1.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell <jonathan.jewell@gmail.com>
;; STATE.scm - Current project state and progress tracking

(define project-state
  `((metadata
      ((version . "1.0.0")
       (schema-version . "2")
       (created . "2025-12-29T03:25:07+00:00")
       (updated . "2026-01-04T00:00:00+00:00")
       (project . "Defiant")
       (repo . "hyperpolymath/defiant")
       (tagline . "Authorization Bypass Detection Testing Framework")))

    (project-context
      ((name . "defiant")
       (tagline . "Authorization bypass detection testing framework for security professionals")
       (tech-stack . ("rust" "rescript" "deno" "gleam" "guile-scheme"))
       (domain . "security-testing")))

    (current-position
      ((phase . "infrastructure")
       (overall-completion . 15)
       (components
         ((ci-cd-infrastructure
            ((status . "complete")
             (completion . 100)
             (workflows . 11)))
          (language-policy
            ((status . "complete")
             (completion . 100)
             (enforcement . "github-actions")))
          (security-scanning
            ((status . "complete")
             (completion . 100)
             (tools . ("codeql" "trufflehog" "openssf-scorecard"))))
          (multi-mirror-sync
            ((status . "complete")
             (completion . 100)
             (targets . ("github" "gitlab" "bitbucket" "codeberg"))))
          (project-metadata
            ((status . "in-progress")
             (completion . 60)
             (pending . ("citation.cff" "codemeta.json" ".well-known/*"))))
          (core-framework
            ((status . "pending")
             (completion . 0)
             (description . "Authorization bypass detection engine")))
          (pattern-library
            ((status . "pending")
             (completion . 0)
             (description . "Known authorization bypass patterns")))
          (cli-tool
            ((status . "pending")
             (completion . 0)
             (description . "Command-line interface")))
          (test-suites
            ((status . "pending")
             (completion . 0)
             (description . "Framework validation and examples")))
          (documentation
            ((status . "pending")
             (completion . 0)
             (description . "User guides and API reference")))))
       (working-features
         ("repository-structure"
          "ci-cd-pipelines"
          "language-policy-enforcement"
          "security-scanning"
          "multi-mirror-distribution"))))

    (route-to-mvp
      ((milestones
         ((v0.1
            ((name . "Infrastructure")
             (status . "complete")
             (items
               ("Repository structure"
                "CI/CD pipelines"
                "Language policy enforcement"
                "Security scanning setup"
                "Multi-mirror sync"))))
          (v0.2
            ((name . "Metadata and Standards")
             (status . "in-progress")
             (items
               ("SCM files population"
                "CITATION.cff"
                "codemeta.json"
                ".well-known/security.txt"
                ".well-known/ai.txt"
                "CONTRIBUTING.adoc completion"))))
          (v0.3
            ((name . "Build System")
             (status . "pending")
             (items
               ("guix.scm implementation"
                "flake.nix creation"
                "Containerfile"
                "justfile implementations"))))
          (v0.5
            ((name . "Core Framework MVP")
             (status . "pending")
             (items
               ("Authorization model abstraction"
                "Bypass pattern detection engine"
                "defiant-core crate"
                "defiant-cli basic functionality"
                "JSON/SARIF report output"))))
          (v0.7
            ((name . "Pattern Library")
             (status . "pending")
             (items
               ("OWASP A01:2021 patterns"
                "IDOR detection"
                "JWT manipulation patterns"
                "Path traversal patterns"
                "RBAC bypass patterns"))))
          (v1.0
            ((name . "Production Ready")
             (status . "pending")
             (items
               ("Complete pattern library"
                "Language bindings (ReScript, WASM, Gleam)"
                "Full documentation"
                "CI/CD integration guides"))))))))

    (blockers-and-issues
      ((critical . ())
       (high
         (((id . "CORE-001")
           (description . "Core Rust implementation not started")
           (impact . "No functional testing capability yet")
           (resolution . "Begin defiant-core crate development"))))
       (medium . ())
       (low . ())))

    (critical-next-actions
      ((immediate
         ("Populate all SCM files with comprehensive metadata"
          "Create CITATION.cff"
          "Create codemeta.json"))
       (this-week
         ("Complete .well-known directory structure"
          "Finalize CONTRIBUTING.adoc"
          "Implement justfile commands"))
       (this-month
         ("Begin defiant-core Rust crate"
          "Design authorization model abstraction"
          "Define test case specification format"))))

    (session-history
      ((snapshots
         (((date . "2025-12-29")
           (accomplishments
             ("Initial repository scaffolding"
              "CI/CD infrastructure setup"
              "RSR compliance configuration")))
          ((date . "2026-01-04")
           (accomplishments
             ("SCM files population"
              "Project metadata documentation")))))))))

;; Helper functions for querying state
(define (get-completion-percentage state)
  (assoc-ref (assoc-ref state 'current-position) 'overall-completion))

(define (get-blockers state priority)
  (assoc-ref (assoc-ref state 'blockers-and-issues) priority))

(define (get-milestone state version)
  (assoc-ref (assoc-ref (assoc-ref state 'route-to-mvp) 'milestones) version))

(define (get-current-phase state)
  (assoc-ref (assoc-ref state 'current-position) 'phase))