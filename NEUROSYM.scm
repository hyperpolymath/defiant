;; SPDX-License-Identifier: PMPL-1.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell <jonathan.jewell@gmail.com>
;; NEUROSYM.scm - Neurosymbolic integration configuration

(define neurosym-config
  `((version . "1.0.0")
    (schema-version . "2")

    (symbolic-layer
      ((type . "scheme")
       (dialect . "guile")
       (reasoning
         ((mode . "deductive")
          (domain . "authorization-policies")
          (rules . "pattern-matching")))
       (verification
         ((approach . "formal")
          (scope . "authorization-invariants")
          (tools . ("property-based-testing" "model-checking-planned"))))
       (representations
         ((authorization-models
            ("rbac" "abac" "pbac" "rebac"))
          (policy-languages
            ("opa-rego" "casbin" "cedar" "custom"))
          (pattern-specifications
            ("bypass-signatures" "invariant-violations" "privilege-boundaries"))))))

    (neural-layer
      ((embeddings
         ((enabled . #f)
          (planned . #t)
          (use-case . "pattern-similarity-search")
          (target . "authorization-code-patterns")))
       (fine-tuning
         ((enabled . #f)
          (planned . #t)
          (use-case . "bypass-pattern-classification")
          (approach . "security-focused-llm")))
       (generation
         ((enabled . #f)
          (planned . #t)
          (use-case . "test-case-generation")
          (constraints . "security-bounded")))))

    (integration
      ((current . ())
       (planned
         ((pattern-matching
            ((description . "Neural-enhanced pattern similarity")
             (symbolic-role . "exact-pattern-rules")
             (neural-role . "fuzzy-similarity-scoring")
             (integration-point . "pattern-library-queries")))
          (test-generation
            ((description . "AI-assisted authorization test synthesis")
             (symbolic-role . "constraint-enforcement")
             (neural-role . "test-case-suggestion")
             (integration-point . "test-suite-generation")))
          (code-analysis
            ((description . "Hybrid static analysis")
             (symbolic-role . "control-flow-authorization-tracking")
             (neural-role . "vulnerability-likelihood-scoring")
             (integration-point . "detection-engine")))))))

    (knowledge-representation
      ((authorization-ontology
         ((concepts
            ("principal" "resource" "action" "context" "policy" "decision"))
          (relationships
            ("grants" "denies" "delegates" "escalates" "isolates"))
          (invariants
            ("no-unauthorized-access"
             "least-privilege"
             "separation-of-duties"
             "complete-mediation"))))
       (bypass-taxonomy
         ((categories
            ("idor" "privilege-escalation" "path-traversal" "jwt-manipulation"
             "role-confusion" "context-bypass" "policy-injection"))
          (severity-levels
            ("critical" "high" "medium" "low" "informational"))
          (exploitability
            ("trivial" "moderate" "complex" "theoretical"))))))

    (ethical-constraints
      ((dual-use-awareness
         "Defiant patterns can identify vulnerabilities for both
          defenders and attackers. Patterns are published for defensive
          purposes with responsible disclosure in mind.")
       (responsible-disclosure
         "New bypass patterns discovered should follow coordinated
          disclosure practices before public pattern library inclusion.")
       (defensive-focus
         "Tool design prioritizes detection and prevention over
          exploitation capability.")))))