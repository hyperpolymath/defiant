;; SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell <jonathan.jewell@gmail.com>
;; AGENTIC.scm - AI agent interaction patterns and configuration

(define agentic-config
  `((version . "1.0.0")
    (schema-version . "2")

    (claude-code
      ((model . "claude-opus-4-5-20251101")
       (tools . ("read" "edit" "bash" "grep" "glob" "write"))
       (permissions . "read-all")
       (mcp-enabled . #t)))

    (patterns
      ((code-review
         ((style . "thorough")
          (focus-areas
            ("authorization-logic-correctness"
             "security-vulnerability-patterns"
             "type-safety"
             "error-handling"
             "test-coverage"))
          (anti-patterns
            ("hardcoded-credentials"
             "missing-authorization-checks"
             "insecure-direct-object-references"
             "privilege-escalation-paths"))))

       (refactoring
         ((style . "conservative")
          (principles
            ("preserve-authorization-semantics"
             "maintain-test-coverage"
             "document-changes"
             "incremental-improvements"))
          (forbidden
            ("breaking-api-changes-without-version-bump"
             "removing-security-checks"
             "bypassing-type-safety"))))

       (testing
         ((style . "comprehensive")
          (approaches
            ("property-based-testing"
             "fuzzing"
             "mutation-testing"
             "authorization-boundary-testing"))
          (coverage-targets
            ((line . 80)
             (branch . 75)
             (authorization-paths . 100)))))

       (documentation
         ((style . "clear-and-complete")
          (requirements
            ("all-public-apis-documented"
             "security-implications-noted"
             "usage-examples-provided"
             "error-conditions-explained"))))))

    (constraints
      ((languages
         ((allowed . ("rust" "rescript" "gleam" "guile-scheme" "bash" "deno-js"))
          (banned . ("typescript" "go" "python" "java" "kotlin" "swift" "makefile"))))
       (security
         ((required
            ("spdx-headers"
             "sha-pinned-dependencies"
             "no-http-urls"
             "no-weak-crypto"
             "no-hardcoded-secrets"))
          (scanning
            ("codeql"
             "trufflehog"
             "dependabot"
             "openssf-scorecard"))))
       (style
         ((formatting . "tool-enforced")
          (linting . "strict")
          (types . "explicit")))))

    (context-files
      ((state . "STATE.scm")
       (meta . "META.scm")
       (ecosystem . "ECOSYSTEM.scm")
       (agentic . "AGENTIC.scm")
       (neurosym . "NEUROSYM.scm")
       (playbook . "PLAYBOOK.scm")
       (claude-instructions . ".claude/CLAUDE.md")))

    (session-protocol
      ((start
         ("Read all checkpoint files"
          "Check STATE.scm for current phase and blockers"
          "Review META.scm for architecture decisions"
          "Note any pending actions"))
       (during
         ("Update STATE.scm as tasks complete"
          "Document decisions in META.scm"
          "Note ecosystem changes in ECOSYSTEM.scm"))
       (end
         ("Ensure STATE.scm reflects current progress"
          "Update session-history with accomplishments"
          "Note any new blockers or issues"))))

    (security-focus
      ((authorization-patterns
         ("always-verify-authorization-checks"
          "test-privilege-escalation-paths"
          "validate-object-reference-controls"
          "check-multi-tenancy-isolation"))
       (code-patterns
         ("pattern-library-contributions-reviewed"
          "detection-logic-tested-bidirectionally"
          "false-positive-rates-monitored"
          "false-negative-cases-documented"))))))