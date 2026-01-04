;; SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell <jonathan.jewell@gmail.com>
;; ECOSYSTEM.scm - Project ecosystem positioning and relationships
;; Media Type: application/vnd.ecosystem+scm

(ecosystem
  ((version . "1.0.0")
   (schema-version . "2")
   (name . "Defiant")
   (type . "security-framework")
   (purpose . "Authorization bypass detection testing framework for security professionals and developers")

   (position-in-ecosystem
     ((role . "specialized-security-tool")
      (category . "access-control-testing")
      (layer . "application-security")
      (scope . "authorization-layer")))

   (related-projects
     ;; Hyperpolymath ecosystem
     ((rhodium-standard-repositories
        ((relationship . "sibling-standard")
         (description . "RSR compliance and language policy foundation")
         (integration . "enforces-standards")))
      (gitvisor
        ((relationship . "infrastructure")
         (description . "Repository management and automation")
         (integration . "state-file-sync")))
      (januskey
        ((relationship . "potential-integration")
         (description . "Authentication standard - Defiant tests what Januskey secures")
         (integration . "complementary")))
      (supernorma
        ((relationship . "sibling-standard")
         (description . "Normative documentation framework")
         (integration . "documentation-standards")))
      (palimpsest-licence
        ((relationship . "philosophical-foundation")
         (description . "License philosophy overlay")
         (integration . "license-structure")))

      ;; External security ecosystem
      (owasp-zap
        ((relationship . "complementary-tool")
         (description . "General web security scanner")
         (integration . "plugin-planned")))
      (burp-suite
        ((relationship . "complementary-tool")
         (description . "Professional security testing platform")
         (integration . "extension-planned")))
      (semgrep
        ((relationship . "inspiration")
         (description . "Pattern-based static analysis")
         (integration . "pattern-format-influence")))
      (opa-gatekeeper
        ((relationship . "related-domain")
         (description . "Policy enforcement for authorization")
         (integration . "policy-testing-target")))
      (casbin
        ((relationship . "related-domain")
         (description . "Authorization library")
         (integration . "model-testing-target")))))

   (what-this-is
     ("Authorization bypass detection testing framework"
      "Pattern library for access control vulnerabilities"
      "OWASP A01:2021 (Broken Access Control) focused tooling"
      "CI/CD integration for authorization security gates"
      "SARIF-compatible security scanner output"
      "Educational resource for authorization security"
      "Rust-based security tool with WASM support"
      "RSR-compliant open source project"))

   (what-this-is-not
     ("General web vulnerability scanner (use OWASP ZAP)"
      "Authentication system (see Januskey)"
      "Web application firewall"
      "Runtime authorization enforcement"
      "Penetration testing framework"
      "Bug bounty hunting platform"
      "Compliance audit tool"
      "AI-powered vulnerability discovery"))

   (target-users
     ((security-professionals
        ((description . "Penetration testers and security auditors")
         (use-case . "Systematic authorization testing")))
      (developers
        ((description . "Application developers building access control")
         (use-case . "Pre-deployment authorization validation")))
      (devsecops
        ((description . "Security-focused operations teams")
         (use-case . "CI/CD security gate integration")))
      (security-researchers
        ((description . "Authorization vulnerability researchers")
         (use-case . "Pattern development and analysis")))))

   (integration-points
     ((input-formats
        ("openapi-spec"
         "graphql-schema"
         "authorization-policy-files"
         "test-case-definitions"))
      (output-formats
        ("sarif"
         "json"
         "html"
         "junit-xml"))
      (ci-cd-systems
        ("github-actions"
         "gitlab-ci"
         "jenkins"
         "generic-webhook"))
      (security-tools
        ("owasp-zap-plugin"
         "burp-extension"
         "ide-extensions"))))))