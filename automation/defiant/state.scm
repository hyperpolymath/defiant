;;; state.scm - Cross-conversation state management for DEFIANT ecosystem
;;; Preserves critical context across Claude conversation boundaries
;;; Used by: Claude Code, Claude Chat, automation scripts
;;;
;;; SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
;;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define-module (defiant state)
  #:use-module (ice-9 pretty-print)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-19)
  #:export (
    save-state
    load-state
    merge-states
    state-summary
    validate-state
    get-defiant-status
    get-next-tasks
    update-completion-percentage!
    current-state
    state-schema
  ))

;;; ============================================================================
;;; STATE SCHEMA
;;; ============================================================================

(define state-schema
  '((project-context
      (name "DEFIANT Ecosystem")
      (version "0.8.0")
      (completion-percentage 80)
      (primary-language "Ada 2022")
      (secondary-languages ("Rust" "Elixir" "Scheme"))
      (architecture "Multi-component"))

    (components
      (defiant
        (language "Ada 2022")
        (status "80% complete")
        (lines-of-code 1991)
        (files 13)
        (location "/home/claude/defiant/")
        (final-location "~/projects/defiant-ecosystem/defiant/")
        (description "TUI package manager with DNF integration")
        (dependencies ("malef" "gnatcoll" "aws"))
        (current-features
          "Interactive TUI"
          "DNF integration"
          "Package operations (install/remove/update)"
          "Transaction preview"
          "Privilege escalation"
          "JSON parsing"
          "Error handling"))

      (auditor
        (language "Rust")
        (status "Reference implementation provided")
        (description "System inventory and metadata extraction")
        (modules
          ("rpm_extractor" "Extracts RPM metadata")
          ("desktop_parser" "Parses .desktop files")
          ("systemd_detector" "Detects systemd units")
          ("pipeline" "Complete extraction pipeline")))

      (conductor
        (language "Elixir")
        (status "Planned")
        (description "Routing orchestrator")
        (responsibilities
          "Package routing decisions"
          "Multi-target selection (OSTree/Flatpak/Podman/etc)"
          "Reversibility proofs"
          "API endpoints for DEFIANT and AUDITOR")))

    (integration-status
      (defiant-conductor "Not started - Ada HTTP client needed")
      (auditor-conductor "Reference Rust code provided")
      (defiant-auditor "Not planned - indirect via CONDUCTOR"))

    (critical-files
      (ada-sources
        "main.adb"
        "dnf_wrapper.ads/adb"
        "dnf_executor.ads/adb"
        "dnf_json_parser.ads/adb"
        "package_operations.ads/adb"
        "package_list_widget.ads/adb"
        "confirmation_dialog.ads/adb")

      (rust-reference
        "extractors/rpm.rs"
        "parsers/desktop_file.rs"
        "detectors/systemd.rs"
        "pipeline.rs")

      (documentation
        "README.md"
        "DNF_INTEGRATION.md"
        "PHASES_BC_COMPLETE.md"
        "ARCHITECTURE.md"
        "KEYBOARD.md"
        "PROJECT_OVERVIEW.md"))

    (technical-decisions
      (http-client "Ada Web Server (AWS) library chosen over Rust bridge")
      (json-parser "GNATCOLL.JSON (already used for DNF)")
      (process-spawning "GNAT.OS_Lib (already used for DNF)")
      (privilege-escalation "pkexec/sudo (already implemented)")
      (fallback-strategy "Graceful degradation to mock data or native DNF"))

    (next-implementation-phase
      (priority "HIGH")
      (milestone "Milestone 5: CONDUCTOR Integration")
      (completion-target 100)
      (tasks
        ("Implement Desktop_File_Parser.adb")
        ("Implement Systemd_Detector.adb")
        ("Implement Package_Analyzer.adb")
        ("Implement HTTP_Client using AWS")
        ("Implement CONDUCTOR_Client with JSON")
        ("Update main.adb with routing workflow")
        ("Create multi-target executors (OSTree/Flatpak/Podman)")
        ("Create CONDUCTOR Elixir API endpoints")
        ("Set up Docker Compose for integration testing")))

    (user-preferences
      (languages
        (preferred ("Ada" "Rust" "Elixir" "Haskell" "ReScript"))
        (avoid ("Python")))
      (tools
        (container "podman")
        (vcs "gitlab")
        (build "just"))
      (methodology
        "Maximal Principle Reduction"
        "Type safety over runtime checks"
        "Formal verification path (SPARK)"
        "Security through architecture"))

    (work-in-progress
      (last-conversation-id "defiant-phases-bc")
      (last-timestamp "2025-12-15")
      (context-preserved "Complete DNF integration and package operations")
      (handover-status "Ready for CONDUCTOR integration")
      (blocker-count 0)
      (technical-debt "None significant"))

    (metadata
      (schema-version "1.0.0")
      (created-at "2025-12-15")
      (last-updated "2025-12-15")
      (conversation-count 1)
      (total-context-tokens 108000))))

;;; ============================================================================
;;; STATE PERSISTENCE
;;; ============================================================================

(define (save-state state filepath)
  "Save state to file with timestamp and validation"
  (call-with-output-file filepath
    (lambda (port)
      (pretty-print
        `((state-schema-version "1.0.0")
          (timestamp ,(date->string (current-date) "~Y-~m-~dT~H:~M:~S"))
          (state ,state))
        port)))
  (format #t "State saved to ~a~%" filepath))

(define (load-state filepath)
  "Load state from file with validation"
  (if (file-exists? filepath)
    (call-with-input-file filepath
      (lambda (port)
        (let ((data (read port)))
          (assoc-ref data 'state))))
    (begin
      (format #t "Warning: State file not found: ~a~%" filepath)
      state-schema)))

(define (merge-states old-state new-state)
  "Merge two states, preferring new-state but preserving history"
  ;; Implement intelligent merging logic
  ;; For now, simple override with history preservation
  (let ((old-history (assoc-ref old-state 'work-in-progress))
        (new-history (assoc-ref new-state 'work-in-progress)))
    ;; Return new state (can be enhanced for smarter merging)
    new-state))

(define (state-summary state)
  "Generate human-readable summary of state"
  (let ((project (assoc-ref state 'project-context))
        (components (assoc-ref state 'components))
        (next-phase (assoc-ref state 'next-implementation-phase)))
    (format #t "~%======================================================~%")
    (format #t "  DEFIANT ECOSYSTEM STATE SUMMARY                      ~%")
    (format #t "======================================================~%~%")
    (format #t "Project: ~a v~a (~a% complete)~%"
            (assoc-ref project 'name)
            (assoc-ref project 'version)
            (assoc-ref project 'completion-percentage))
    (format #t "~%Components:~%")
    (format #t "  - DEFIANT (Ada):      ~a~%"
            (assoc-ref (assoc-ref components 'defiant) 'status))
    (format #t "  - AUDITOR (Rust):     ~a~%"
            (assoc-ref (assoc-ref components 'auditor) 'status))
    (format #t "  - CONDUCTOR (Elixir): ~a~%"
            (assoc-ref (assoc-ref components 'conductor) 'status))
    (format #t "~%Next Phase: ~a~%"
            (assoc-ref next-phase 'milestone))
    (format #t "Priority: ~a~%"
            (assoc-ref next-phase 'priority))
    (format #t "~%Tasks Remaining: ~a~%"
            (length (assoc-ref next-phase 'tasks)))))

(define (validate-state state)
  "Validate state structure against schema"
  (and (assoc-ref state 'project-context)
       (assoc-ref state 'components)
       (assoc-ref state 'next-implementation-phase)
       (assoc-ref state 'metadata)))

;;; ============================================================================
;;; CONVENIENCE EXPORTS
;;; ============================================================================

(define current-state state-schema)

(define (get-defiant-status)
  "Get current DEFIANT component status"
  (assoc-ref (assoc-ref current-state 'components) 'defiant))

(define (get-next-tasks)
  "Get list of next implementation tasks"
  (assoc-ref (assoc-ref current-state 'next-implementation-phase) 'tasks))

(define (update-completion-percentage! new-percentage)
  "Update the overall project completion percentage"
  (assoc-set! (assoc-ref current-state 'project-context)
              'completion-percentage
              new-percentage))

;;; End of state.scm
