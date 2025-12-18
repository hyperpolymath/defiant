;;; STATE.scm - Project Checkpoint
;;; DEFIANT Ecosystem
;;; Format: Guile Scheme S-expressions
;;; Purpose: Preserve AI conversation context across sessions
;;; Reference: https://github.com/hyperpolymath/state.scm

;; SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

;;;============================================================================
;;; METADATA
;;;============================================================================

(define metadata
  '((version . "0.8.1")
    (schema-version . "1.0")
    (created . "2025-12-15")
    (updated . "2025-12-17")
    (project . "DEFIANT Ecosystem")
    (repo . "github.com/hyperpolymath/defiant")))

;;;============================================================================
;;; PROJECT CONTEXT
;;;============================================================================

(define project-context
  '((name . "DEFIANT Ecosystem")
    (tagline . "Intelligent package routing for immutable systems")
    (version . "0.8.0")
    (license . "MIT OR AGPL-3.0-or-later")
    (rsr-compliance . "gold-target")

    (tech-stack
     ((primary . "Ada 2022")
      (secondary . ("Rust" "Elixir" "Scheme"))
      (ci-cd . "GitHub Actions + GitLab CI")
      (security . "CodeQL + OSSF Scorecard")))))

;;;============================================================================
;;; COMPONENT STATUS
;;;============================================================================

(define component-status
  '((defiant
     ((language . "Ada 2022")
      (status . "80% complete")
      (lines-of-code . 1991)
      (files . 13)
      (description . "TUI package manager with DNF integration")
      (current-features
       ("Interactive TUI"
        "DNF integration"
        "Package operations (install/remove/update)"
        "Transaction preview"
        "Privilege escalation"
        "JSON parsing"
        "Error handling"))))

    (auditor
     ((language . "Rust")
      (status . "Reference implementation provided")
      (description . "System inventory and metadata extraction")
      (modules
       (("rpm_extractor" . "Extracts RPM metadata")
        ("desktop_parser" . "Parses .desktop files")
        ("systemd_detector" . "Detects systemd units")
        ("pipeline" . "Complete extraction pipeline")))))

    (conductor
     ((language . "Elixir")
      (status . "Planned")
      (description . "Routing orchestrator")
      (responsibilities
       ("Package routing decisions"
        "Multi-target selection (OSTree/Flatpak/Podman/etc)"
        "Reversibility proofs"
        "API endpoints for DEFIANT and AUDITOR"))))))

;;;============================================================================
;;; CURRENT POSITION
;;;============================================================================

(define current-position
  '((phase . "Phase B+C Complete - DNF Integration + Operations")
    (overall-completion . 80)

    (components
     ((defiant
       ((status . "functional")
        (completion . 80)
        (notes . "Full TUI with DNF integration working")))

      (auditor
       ((status . "reference")
        (completion . 20)
        (notes . "Reference Rust implementations provided")))

      (conductor
       ((status . "planned")
        (completion . 0)
        (notes . "Not yet started")))))

    (working-features
     ("Interactive TUI with Malef"
      "DNF package listing and search"
      "Package install/remove/update operations"
      "Transaction preview with dependencies"
      "Privilege escalation (pkexec/sudo)"
      "JSON parsing for DNF output"
      "Error handling and user feedback"))))

;;;============================================================================
;;; ROUTE TO MVP
;;;============================================================================

(define route-to-mvp
  '((target-version . "1.0.0")
    (definition . "Full DEFIANT->CONDUCTOR integration with multi-target execution")

    (milestones
     ((milestone-1
       ((name . "TUI Foundation")
        (status . complete)
        (date . "2025-12-15")))

      (milestone-2
       ((name . "Package Display")
        (status . complete)
        (date . "2025-12-15")))

      (milestone-3
       ((name . "Interactive List")
        (status . complete)
        (date . "2025-12-15")))

      (milestone-4
       ((name . "DNF Operations")
        (status . complete)
        (date . "2025-12-15")))

      (milestone-5
       ((name . "CONDUCTOR Integration")
        (status . in-progress)
        (priority . HIGH)
        (target . "2026-01")
        (tasks
         ("Implement Desktop_File_Parser.adb"
          "Implement Systemd_Detector.adb"
          "Implement Package_Analyzer.adb"
          "Implement HTTP_Client using AWS"
          "Implement CONDUCTOR_Client with JSON"
          "Update main.adb with routing workflow"
          "Create multi-target executors"
          "Create CONDUCTOR Elixir API endpoints"
          "Set up Docker Compose integration"))))

      (milestone-6
       ((name . "Multi-Target Execution")
        (status . planned)
        (target . "2026-02")))

      (milestone-7
       ((name . "Production Release")
        (status . planned)
        (target . "2026-03")))))))

;;;============================================================================
;;; TECHNICAL DECISIONS
;;;============================================================================

(define technical-decisions
  '((http-client . "Ada Web Server (AWS) library chosen over Rust bridge")
    (json-parser . "GNATCOLL.JSON (already used for DNF)")
    (process-spawning . "GNAT.OS_Lib (already used for DNF)")
    (privilege-escalation . "pkexec/sudo (already implemented)")
    (fallback-strategy . "Graceful degradation to mock data or native DNF")))

;;;============================================================================
;;; BLOCKERS & ISSUES
;;;============================================================================

(define blockers-and-issues
  '((critical
     ())

    (high-priority
     ())

    (medium-priority
     ((conductor-integration
       ((description . "CONDUCTOR not yet implemented")
        (impact . "Cannot test full routing workflow")
        (needed . "Elixir API development")))))

    (low-priority
     ((backspace-search
       ((description . "Backspace in search mode not implemented")
        (impact . "User convenience")
        (effort . "1 hour")))
      (progress-bar
       ((description . "Transaction progress bar missing")
        (impact . "User feedback")
        (effort . "2 hours")))))))

;;;============================================================================
;;; USER PREFERENCES
;;;============================================================================

(define user-preferences
  '((languages
     ((preferred . ("Ada" "Rust" "Elixir" "Haskell" "ReScript"))
      (avoid . ("Python"))))
    (tools
     ((container . "podman")
      (vcs . "gitlab")
      (build . "just")))
    (methodology
     ("Maximal Principle Reduction"
      "Type safety over runtime checks"
      "Formal verification path (SPARK)"
      "Security through architecture"))))

;;;============================================================================
;;; SESSION HISTORY
;;;============================================================================

(define session-history
  '((snapshots
     ((date . "2025-12-17")
      (session . "scm-security-audit")
      (accomplishments
       ("Fixed security.txt expiry date placeholder"
        "SHA-pinned all GitHub Actions (8 workflows)"
        "Added SPDX headers to all workflows"
        "Added permissions declarations to all workflows"
        "Updated STATE.scm metadata"))
      (notes . "Security audit and RSR compliance improvements"))
     ((date . "2025-12-15")
      (session . "state-management-implementation")
      (accomplishments
       ("Added automation/defiant/state.scm module"
        "Added automation/defiant/ecosystem.scm module"
        "Added automation/defiant/meta.scm module"
        "Created quick-start.sh development script"
        "Updated STATE.scm with DEFIANT ecosystem context"))
      (notes . "Cross-conversation state management system implemented")))))

;;;============================================================================
;;; HELPER FUNCTIONS (for Guile evaluation)
;;;============================================================================

(define (get-completion-percentage component)
  "Get completion percentage for a component"
  (let ((comp (assoc component (cdr (assoc 'components current-position)))))
    (if comp
        (cdr (assoc 'completion (cdr comp)))
        #f)))

(define (get-blockers priority)
  "Get blockers by priority level"
  (cdr (assoc priority blockers-and-issues)))

(define (get-milestone id)
  "Get milestone details by id"
  (assoc id (cdr (assoc 'milestones route-to-mvp))))

;;;============================================================================
;;; EXPORT SUMMARY
;;;============================================================================

(define state-summary
  '((project . "DEFIANT Ecosystem")
    (version . "0.8.1")
    (overall-completion . 80)
    (next-milestone . "Milestone 5: CONDUCTOR Integration")
    (critical-blockers . 0)
    (high-priority-issues . 0)
    (updated . "2025-12-17")))

;;; End of STATE.scm
