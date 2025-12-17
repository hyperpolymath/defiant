;; SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

;;; META.scm - Architecture Decisions and Development Practices
;;; DEFIANT Ecosystem
;;; Reference: https://github.com/hyperpolymath/META.scm

(define-module (defiant meta)
  #:export (architecture-decisions
            development-practices
            design-rationale
            project-metadata))

;;;============================================================================
;;; PROJECT METADATA
;;;============================================================================

(define project-metadata
  '((project
     (name . "DEFIANT Ecosystem")
     (tagline . "Intelligent package routing for immutable systems")
     (description . "Multi-component system for managing packages across OSTree, Flatpak, Podman, and traditional package managers with intelligent routing")
     (license . "MIT OR AGPL-3.0-or-later")
     (repository . "https://github.com/hyperpolymath/defiant")
     (version . "0.8.0")
     (stability . "alpha"))

    (authors
     ((name . "Jonathan D.A. Jewell")
      (role . "Lead Developer")
      (affiliation . "The Open University")
      (expertise . ("Formal Verification" "Programming Languages" "Type Systems"))))

    (technologies
     (languages
      ("Ada 2022" . "DEFIANT TUI and core logic")
      ("Rust" . "AUDITOR system inventory")
      ("Elixir" . "CONDUCTOR routing engine")
      ("Scheme" . "Build orchestration and meta-programming"))
     (frameworks
      ("Malef" . "Ada TUI framework")
      ("Phoenix" . "Elixir web framework")
      ("Clap" . "Rust CLI argument parsing"))
     (tools
      ("Alire" . "Ada package manager")
      ("Cargo" . "Rust package manager")
      ("Mix" . "Elixir build tool")
      ("Just" . "Task runner")
      ("Podman" . "Container runtime")
      ("GitHub Actions" . "Continuous integration")))

    (metrics
     (total-lines-of-code . 1991)
     (components . 3)
     (languages . 4)
     (files-count . 13)
     (completion-percentage . 80))))

;;;============================================================================
;;; Architecture Decision Records (ADR)
;;; Following MADR format in structured S-expression form
;;;============================================================================

(define architecture-decisions
  '((adr-001
     (title . "Multi-Language Architecture")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Package management requires TUI, system analysis, and routing - each with different requirements")
     (decision . "Use Ada for TUI (type safety, Malef framework), Rust for inventory (performance, system access), Elixir for routing (concurrency, web APIs)")
     (consequences . ("Strong type safety in critical paths"
                      "Each language in its sweet spot"
                      "Clear component boundaries"
                      "Requires HTTP integration between components")))

    (adr-002
     (title . "HTTP/JSON Communication")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Components written in different languages need to communicate")
     (decision . "Use HTTP REST with JSON payloads for inter-component communication via CONDUCTOR")
     (consequences . ("Language-agnostic integration"
                      "Easy debugging and testing"
                      "Can run components on different hosts"
                      "Slight overhead vs. native FFI")))

    (adr-003
     (title . "Ada Web Server for HTTP Client")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "DEFIANT (Ada) needs to call CONDUCTOR (Elixir) API")
     (decision . "Use Ada Web Server (AWS) library for HTTP client functionality")
     (consequences . ("Native Ada solution"
                      "No Rust FFI bridge needed"
                      "Consistent with Ada ecosystem"
                      "Well-maintained library")))

    (adr-004
     (title . "Graceful Degradation Strategy")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "CONDUCTOR may be unavailable or not yet implemented")
     (decision . "Implement graceful degradation to direct DNF operations when CONDUCTOR is unreachable")
     (consequences . ("DEFIANT works standalone"
                      "Progressive enhancement when CONDUCTOR available"
                      "Requires fallback code paths"
                      "User feedback on degraded mode")))

    (adr-005
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Part of hyperpolymath ecosystem requiring consistent practices")
     (decision . "Follow Rhodium Standard Repository guidelines for all components")
     (consequences . ("SHA-pinned GitHub Actions"
                      "SPDX license headers on all files"
                      "Multi-platform CI/CD"
                      "OpenSSF Scorecard compliance")))))

;;;============================================================================
;;; Development Practices
;;; Codified standards for this repository
;;;============================================================================

(define development-practices
  '((code-style
     (languages . ("Ada" "Rust" "Elixir" "Scheme"))
     (ada-formatter . "gnatpp")
     (rust-formatter . "rustfmt")
     (elixir-formatter . "mix format")
     (line-length . 100)
     (indent . "spaces")
     (indent-size . 3))  ; Ada standard

    (security
     (sast . "CodeQL + Semgrep")
     (dependency-scanning . "Dependabot + OSSF Scorecard")
     (credentials . "Environment variables only, never committed")
     (input-validation . "Type system + schema validation at boundaries")
     (license-compliance . "MIT OR AGPL-3.0-or-later"))

    (testing
     (ada-framework . "AUnit")
     (rust-framework . "cargo test")
     (elixir-framework . "ExUnit")
     (coverage-minimum . 70)
     (unit-tests . "Required for business logic")
     (integration-tests . "Required for API boundaries")
     (property-testing . "Where applicable"))

    (versioning
     (scheme . "Semantic Versioning 2.0.0")
     (changelog . "Keep a Changelog format")
     (release-process . "GitHub releases with auto-generated notes"))

    (documentation
     (format . "AsciiDoc preferred, Markdown accepted")
     (api-docs . "Language-native doc comments")
     (adr-location . "META.scm")
     (state-location . "STATE.scm")
     (ecosystem-location . "ECOSYSTEM.scm"))

    (branching
     (strategy . "GitHub Flow")
     (main-branch . "main")
     (pr-required . #t))))

;;;============================================================================
;;; Design Rationale
;;; Explains the "why" behind technical choices
;;;============================================================================

(define design-rationale
  '((why-ada
     "Ada 2022 provides strong type safety, compile-time checks, and
      no undefined behavior. Combined with Malef TUI framework, it
      creates a robust, verifiable user interface. Ada's GNAT toolchain
      is mature and well-supported on Linux. Future path to SPARK for
      formal verification of critical operations.")

    (why-rust
     "Rust offers memory safety without garbage collection, ideal for
      system-level operations like RPM metadata extraction and systemd
      detection. Its async ecosystem (tokio) handles concurrent I/O
      efficiently for inventory operations.")

    (why-elixir
     "Elixir's OTP model provides fault-tolerant, concurrent processing
      for the routing orchestrator. Phoenix gives a production-ready
      web framework. Pattern matching and immutability simplify
      decision matrix implementation.")

    (why-scheme
     "Scheme (Guile) serves as the meta-language for build orchestration,
      state management, and configuration. Its homoiconic nature makes
      STATE.scm, META.scm, and ECOSYSTEM.scm both human-readable and
      machine-parseable. Integrates with Guix for reproducible builds.")

    (why-multi-target
     "Immutable systems like Silverblue require routing packages to
      appropriate targets: OSTree for system, Flatpak for GUI apps,
      Podman/Distrobox for development tools. Intelligent routing
      reduces user cognitive load and prevents system pollution.")

    (why-rsr
     "Following Rhodium Standard Repositories ensures consistency,
      security, and maintainability across the hyperpolymath ecosystem.
      RSR provides: SHA-pinned actions, SPDX headers, OpenSSF Scorecard
      compliance, and multi-platform CI/CD.")))

;;; End of META.scm
;; ============================================================================
;; CROSS-PLATFORM STATUS (Added 2025-12-17)
;; ============================================================================
;; This repo exists on multiple platforms. GitHub is the primary/source of truth.

(cross-platform-status
  (generated "2025-12-17")
  (primary-platform "github")
  (gitlab-mirror
    (path "hyperpolymath/ou/applications/defiant")
    (url "https://gitlab.com/hyperpolymath/ou/applications/defiant")
    (last-gitlab-activity "2025-11-13")
    (sync-status "gh-primary")
    (notes "GitHub newer by 1 month. Safe to sync GH→GL."))
  
  (reconciliation-instructions
    ";; To fetch and compare GitLab content:"
    ";; git remote add gitlab https://gitlab.com/hyperpolymath/ou/applications/defiant.git"
    ";; git fetch gitlab"
    ";; git log gitlab/main --oneline"
    ";; git diff main gitlab/main"
    ";;"
    ";; To merge if GitLab has unique content:"
    ";; git merge gitlab/main --allow-unrelated-histories"
    ";;"
    ";; After reconciliation, GitHub mirrors to GitLab automatically.")
  
  (action-required "gh-primary"))

