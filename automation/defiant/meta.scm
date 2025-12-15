;;; meta.scm - Project metadata and introspection
;;; Provides queryable interface to project status, metrics, and planning
;;; Used for: Status reports, CI integration, documentation generation
;;;
;;; SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
;;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define-module (defiant meta)
  #:use-module (defiant state)
  #:use-module (defiant ecosystem)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-19)
  #:export (
    project-metadata
    calculate-metrics
    generate-status-report
    next-milestones
    technical-debt-assessment
    milestone-5-plan
    export-for-ci
  ))

;;; ============================================================================
;;; PROJECT METADATA
;;; ============================================================================

(define project-metadata
  '((project
      (name "DEFIANT Ecosystem")
      (tagline "Intelligent package routing for immutable systems")
      (description "Multi-component system for managing packages across OSTree, Flatpak, Podman, and traditional package managers with intelligent routing")
      (license "MIT OR AGPL-3.0-or-later")
      (repository "https://github.com/hyperpolymath/defiant")
      (homepage "https://defiant.dev")
      (version "0.8.0")
      (stability "alpha"))

    (authors
      ((name "Jonathan D.A. Jewell")
       (role "Lead Developer")
       (affiliation "The Open University")
       (expertise ("Formal Verification" "Programming Languages" "Type Systems"))))

    (timeline
      (inception "2025-12-15")
      (current-phase "Phase B+C Complete (80%)")
      (target-completion "2026-Q1")
      (milestones
        ((id 1) (name "TUI Foundation") (status complete) (date "2025-12-15"))
        ((id 2) (name "Package Display") (status complete) (date "2025-12-15"))
        ((id 3) (name "Interactive List") (status complete) (date "2025-12-15"))
        ((id 4) (name "DNF Operations") (status complete) (date "2025-12-15"))
        ((id 5) (name "CONDUCTOR Integration") (status in-progress) (target "2026-01"))
        ((id 6) (name "Multi-Target Execution") (status planned) (target "2026-02"))
        ((id 7) (name "Production Release") (status planned) (target "2026-03"))))

    (technologies
      (languages
        ("Ada 2022" "DEFIANT TUI and core logic")
        ("Rust" "AUDITOR system inventory")
        ("Elixir" "CONDUCTOR routing engine")
        ("Scheme" "Build orchestration and meta-programming"))
      (frameworks
        ("Malef" "Ada TUI framework")
        ("Phoenix" "Elixir web framework")
        ("Clap" "Rust CLI argument parsing"))
      (tools
        ("Alire" "Ada package manager")
        ("Cargo" "Rust package manager")
        ("Mix" "Elixir build tool")
        ("Just" "Task runner")
        ("Podman" "Container runtime")
        ("GitHub Actions" "Continuous integration")))

    (metrics
      (total-lines-of-code 1991)
      (components 3)
      (languages 4)
      (files-count 13)
      (documentation-pages 8)
      (test-coverage 0)
      (completion-percentage 80))))

;;; ============================================================================
;;; METRICS CALCULATION
;;; ============================================================================

(define (calculate-metrics)
  "Calculate current project metrics"
  (let ((defiant-status (get-defiant-status)))
    `((code-metrics
        (ada-lines ,(assoc-ref defiant-status 'lines-of-code))
        (ada-files ,(assoc-ref defiant-status 'files))
        (rust-lines 0)
        (elixir-lines 0)
        (total-lines ,(assoc-ref defiant-status 'lines-of-code)))

      (completion-metrics
        (defiant-complete 80)
        (auditor-complete 20)
        (conductor-complete 0)
        (overall-complete 35))

      (feature-metrics
        (implemented-features
          "Interactive TUI"
          "DNF integration"
          "Package operations"
          "Transaction preview"
          "JSON parsing"
          "Privilege escalation")
        (pending-features
          "CONDUCTOR HTTP client"
          "Package metadata extraction"
          "Multi-target execution"
          "Desktop file parsing"
          "Systemd detection"))

      (quality-metrics
        (compiler-warnings 0)
        (static-analysis "Pending")
        (formal-verification "Planned (SPARK)")
        (test-coverage "Not measured")
        (documentation-coverage 95)))))

;;; ============================================================================
;;; STATUS REPORTING
;;; ============================================================================

(define (generate-status-report format)
  "Generate status report in specified format (text, json, markdown)"
  (case format
    ((text) (status-report-text))
    ((markdown) (status-report-markdown))
    ((json) (status-report-json))
    (else (error "Unknown format:" format))))

(define (status-report-text)
  "Generate plain text status report"
  (string-append
    "======================================================\n"
    "  DEFIANT ECOSYSTEM STATUS REPORT                    \n"
    "======================================================\n"
    "\n"
    "Project: DEFIANT Ecosystem v0.8.0\n"
    "Status:  Alpha (80% complete)\n"
    "Phase:   Phase B+C Complete - DNF Integration + Operations\n"
    "\n"
    "COMPONENT STATUS:\n"
    "  [x] DEFIANT (Ada):      80% - Functional TUI with DNF integration\n"
    "  [~] AUDITOR (Rust):     20% - Reference implementations provided\n"
    "  [ ] CONDUCTOR (Elixir):  0% - Not started\n"
    "\n"
    "CODE METRICS:\n"
    "  - Total Lines:  1,991 (Ada)\n"
    "  - Total Files:  13 (Ada)\n"
    "  - Components:   3 (1 working, 2 planned)\n"
    "  - Languages:    4 (Ada, Rust, Elixir, Scheme)\n"
    "\n"
    "NEXT MILESTONE:\n"
    "  Milestone 5: CONDUCTOR Integration\n"
    "  Priority:    HIGH\n"
    "  Target:      2026-01\n"
    "  Tasks:       9 remaining\n"
    "\n"
    "BLOCKERS:\n"
    "  None\n"
    "\n"
    "TECHNICAL DEBT:\n"
    "  None significant\n"
    "\n"))

(define (status-report-markdown)
  "Generate markdown status report"
  (string-append
    "# DEFIANT Ecosystem Status Report\n\n"
    "## Overview\n\n"
    "- **Project**: DEFIANT Ecosystem v0.8.0\n"
    "- **Status**: Alpha (80% complete)\n"
    "- **Phase**: Phase B+C Complete - DNF Integration + Operations\n\n"
    "## Component Status\n\n"
    "| Component | Language | Status | Completion |\n"
    "|-----------|----------|--------|------------|\n"
    "| DEFIANT | Ada 2022 | Functional | 80% |\n"
    "| AUDITOR | Rust | Reference | 20% |\n"
    "| CONDUCTOR | Elixir | Planned | 0% |\n\n"
    "## Next Milestone\n\n"
    "**Milestone 5: CONDUCTOR Integration**\n\n"
    "- Priority: HIGH\n"
    "- Target: 2026-01\n"
    "- Tasks remaining: 9\n"))

(define (status-report-json)
  "Generate JSON status report"
  `((project . "DEFIANT Ecosystem")
    (version . "0.8.0")
    (status . "alpha")
    (completion . 80)
    (components
      ((name . "DEFIANT") (language . "Ada") (completion . 80))
      ((name . "AUDITOR") (language . "Rust") (completion . 20))
      ((name . "CONDUCTOR") (language . "Elixir") (completion . 0)))
    (next-milestone . "CONDUCTOR Integration")
    (blockers . 0)))

;;; ============================================================================
;;; MILESTONE PLANNING
;;; ============================================================================

(define (next-milestones count)
  "Get next N milestones"
  (let ((all-milestones (assoc-ref (assoc-ref project-metadata 'timeline) 'milestones)))
    (take
      (filter
        (lambda (m)
          (not (eq? (assoc-ref m 'status) 'complete)))
        all-milestones)
      (min count (length all-milestones)))))

(define milestone-5-plan
  '((milestone 5)
    (name "CONDUCTOR Integration")
    (status in-progress)
    (priority HIGH)
    (dependencies (4))
    (tasks
      ((task 1)
       (name "Implement Desktop_File_Parser.adb")
       (effort "2 days")
       (status not-started))
      ((task 2)
       (name "Implement Systemd_Detector.adb")
       (effort "2 days")
       (status not-started))
      ((task 3)
       (name "Implement Package_Analyzer.adb")
       (effort "2 days")
       (status not-started))
      ((task 4)
       (name "Implement HTTP_Client using AWS")
       (effort "3 days")
       (status not-started))
      ((task 5)
       (name "Implement CONDUCTOR_Client with JSON")
       (effort "3 days")
       (status not-started))
      ((task 6)
       (name "Update main.adb with routing workflow")
       (effort "2 days")
       (status not-started))
      ((task 7)
       (name "Create multi-target executors")
       (effort "5 days")
       (status not-started))
      ((task 8)
       (name "Create CONDUCTOR Elixir API endpoints")
       (effort "3 days")
       (status not-started))
      ((task 9)
       (name "Set up Docker Compose integration")
       (effort "2 days")
       (status not-started)))))

;;; ============================================================================
;;; TECHNICAL DEBT ASSESSMENT
;;; ============================================================================

(define (technical-debt-assessment)
  "Assess current technical debt"
  '((current-debt
      (severity low)
      (items
        ((item "Backspace in search mode not implemented")
         (severity minor)
         (effort "1 hour")
         (impact "User convenience"))
        ((item "Transaction progress bar missing")
         (severity minor)
         (effort "2 hours")
         (impact "User feedback"))
        ((item "Dependency parsing simplified")
         (severity minor)
         (effort "3 hours")
         (impact "Preview accuracy"))))

    (avoided-debt
      (items
        "No Python code (preference maintained)"
        "No runtime checks (compile-time safety)"
        "No null pointers (Ada design)"
        "No buffer overflows (Ada design)"
        "No memory leaks (Ada memory management)"))

    (future-considerations
      ((item "SPARK verification")
       (timeline "Post-MVP")
       (benefit "Mathematical proof of correctness"))
      ((item "Multi-backend support")
       (timeline "Post-1.0")
       (benefit "APT, Pacman, Zypper support"))
      ((item "Parallel downloads")
       (timeline "Performance optimization phase")
       (benefit "Faster installations")))))

;;; ============================================================================
;;; EXPORTS FOR CI/CD
;;; ============================================================================

(define (export-for-ci format output-file)
  "Export status report for CI/CD consumption"
  (call-with-output-file output-file
    (lambda (port)
      (case format
        ((json)
         (write (status-report-json) port))
        ((text)
         (display (status-report-text) port))
        (else
         (error "Unsupported format for CI export"))))))

;;; End of meta.scm
