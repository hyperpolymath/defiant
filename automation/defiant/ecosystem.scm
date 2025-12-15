;;; ecosystem.scm - DEFIANT ecosystem architecture and dependencies
;;; Defines relationships between Ada/Rust/Elixir components
;;; Used for: Build orchestration, dependency management, integration testing
;;;
;;; SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
;;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define-module (defiant ecosystem)
  #:use-module (defiant state)
  #:use-module (srfi srfi-1)
  #:export (
    ecosystem-graph
    component-dependencies
    build-order
    integration-points
    deployment-topology
    validate-ecosystem
    get-component
    get-all-components
    get-build-order
  ))

;;; ============================================================================
;;; COMPONENT DEFINITIONS
;;; ============================================================================

(define defiant-component
  '((name "DEFIANT")
    (language "Ada 2022")
    (type "TUI Application")
    (repository "defiant/")
    (entry-point "src/main.adb")
    (build-system "Alire")
    (dependencies
      (external
        ("malef" "^1.0.0" "TUI framework")
        ("gnatcoll" "^24.0.0" "JSON parsing, utilities")
        ("aws" "^24.0.0" "HTTP client for CONDUCTOR"))
      (internal
        ("conductor" "http" "Package routing decisions")))
    (provides
      ("Interactive package browser")
      ("DNF integration")
      ("Transaction management")
      ("Multi-target installation"))
    (artifacts
      ("bin/defiant" "executable")
      ("lib/libdefiant.a" "library")
      ("share/defiant/config.toml" "configuration"))
    (tests
      ("tests/defiant-tests.adb" "unit")
      ("tests/integration/" "integration"))))

(define auditor-component
  '((name "AUDITOR")
    (language "Rust")
    (type "CLI Tool")
    (repository "auditor/")
    (entry-point "src/main.rs")
    (build-system "Cargo")
    (dependencies
      (external
        ("clap" "^4.0" "CLI argument parsing")
        ("serde" "^1.0" "Serialization")
        ("tokio" "^1.0" "Async runtime"))
      (internal
        ("conductor" "http" "Send inventory to CONDUCTOR")))
    (provides
      ("System inventory")
      ("RPM metadata extraction")
      ("Desktop file parsing")
      ("Systemd unit detection"))
    (artifacts
      ("target/release/auditor" "executable")
      ("target/release/libauditor.so" "library"))
    (tests
      ("tests/cli_tests.rs" "CLI")
      ("tests/inventory_tests.rs" "inventory")
      ("tests/health_tests.rs" "health"))))

(define conductor-component
  '((name "CONDUCTOR")
    (language "Elixir")
    (type "Web Service")
    (repository "conductor/")
    (entry-point "lib/conductor.ex")
    (build-system "Mix")
    (dependencies
      (external
        ("phoenix" "^1.7" "Web framework")
        ("poison" "^5.0" "JSON")
        ("httpoison" "^2.0" "HTTP client"))
      (internal))
    (provides
      ("Package routing API")
      ("Decision matrix")
      ("Reversibility proofs")
      ("Multi-target selection"))
    (artifacts
      ("_build/prod/rel/conductor" "release"))
    (tests
      ("test/conductor_test.exs" "core")
      ("test/decision_matrix_test.exs" "routing"))))

;;; ============================================================================
;;; ECOSYSTEM GRAPH
;;; ============================================================================

(define ecosystem-graph
  `((components
      (defiant ,defiant-component)
      (auditor ,auditor-component)
      (conductor ,conductor-component))

    (dependencies
      ;; DEFIANT depends on CONDUCTOR
      ((from defiant)
       (to conductor)
       (type http-api)
       (endpoint "/api/v1/route")
       (direction request-response)
       (data-flow "Package metadata -> Routing decision"))

      ;; AUDITOR depends on CONDUCTOR
      ((from auditor)
       (to conductor)
       (type http-api)
       (endpoint "/api/v1/inventory")
       (direction request-response)
       (data-flow "System inventory -> Analysis")))

    (integration-points
      ((name "defiant-conductor")
       (status "In Progress")
       (protocol "HTTP/JSON")
       (authentication "API Key (X-API-Key header)")
       (payload-format "JSON")
       (request-schema
         ((package
             (name string)
             (version string)
             (metadata object)
             (capabilities object)
             (constraints object)
             (dependencies array))))
       (response-schema
         ((decision
             (target enum)
             (confidence float)
             (rationale string)
             (reversibility object))
           (change_id string))))

      ((name "auditor-conductor")
       (status "Reference Implementation")
       (protocol "HTTP/JSON")
       (authentication "API Key")
       (payload-format "JSON")
       (request-schema
         ((inventory
             (rpm_ostree object)
             (flatpak object)
             (containers object)
             (toolbox object)
             (stats object))))
       (response-schema
         ((status string)
           (recommendations array)))))))

;;; ============================================================================
;;; BUILD ORDER
;;; ============================================================================

(define (build-order)
  "Calculate correct build order based on dependencies"
  '((phase 1
      (components (conductor))
      (rationale "No dependencies, provides API for others"))
    (phase 2
      (components (defiant auditor))
      (rationale "Both depend on CONDUCTOR, can build in parallel"))
    (phase 3
      (components ())
      (rationale "Integration testing"))))

;;; ============================================================================
;;; DEPLOYMENT TOPOLOGY
;;; ============================================================================

(define deployment-topology
  '((environment development
      (conductor
        (host "localhost")
        (port 3000)
        (protocol "http"))
      (defiant
        (location "local")
        (config "/home/user/.config/defiant/config.toml"))
      (auditor
        (location "local")
        (config "/home/user/.config/auditor/config.toml")))

    (environment docker-compose
      (conductor
        (container "conductor")
        (image "ghcr.io/user/conductor:latest")
        (port 3000)
        (network "defiant-net"))
      (defiant
        (container "defiant")
        (image "ghcr.io/user/defiant:latest")
        (network "defiant-net")
        (environment
          ("CONDUCTOR_URL" "http://conductor:3000")))
      (auditor
        (container "auditor")
        (image "ghcr.io/user/auditor:latest")
        (network "defiant-net")
        (environment
          ("CONDUCTOR_URL" "http://conductor:3000"))))

    (environment production
      (conductor
        (host "conductor.example.com")
        (port 443)
        (protocol "https")
        (replicas 3)
        (load-balancer "nginx"))
      (defiant
        (deployment "client-side")
        (config "/etc/defiant/config.toml"))
      (auditor
        (deployment "systemd-service")
        (config "/etc/auditor/config.toml")))))

;;; ============================================================================
;;; VALIDATION
;;; ============================================================================

(define (validate-ecosystem)
  "Validate ecosystem structure and dependencies"
  (let ((components (assoc-ref ecosystem-graph 'components))
        (dependencies (assoc-ref ecosystem-graph 'dependencies))
        (integrations (assoc-ref ecosystem-graph 'integration-points)))
    (and
      ;; All components defined
      (assoc-ref components 'defiant)
      (assoc-ref components 'auditor)
      (assoc-ref components 'conductor)
      ;; Dependencies make sense
      (= (length dependencies) 2)
      ;; Integration points defined
      (= (length integrations) 2))))

;;; ============================================================================
;;; COMPONENT QUERIES
;;; ============================================================================

(define (component-dependencies component-name)
  "Get all dependencies for a component"
  (let ((component (assoc-ref
                     (assoc-ref ecosystem-graph 'components)
                     component-name)))
    (if component
        (assoc-ref component 'dependencies)
        #f)))

(define (integration-points component-name)
  "Get integration points for a component"
  (filter
    (lambda (point)
      (let ((from-name (assoc-ref point 'from))
            (to-name (assoc-ref point 'to)))
        (or (equal? from-name component-name)
            (equal? to-name component-name))))
    (assoc-ref ecosystem-graph 'integration-points)))

;;; ============================================================================
;;; EXPORTS
;;; ============================================================================

(define (get-component name)
  "Get component definition by name"
  (assoc-ref (assoc-ref ecosystem-graph 'components) name))

(define (get-all-components)
  "Get all component definitions"
  (assoc-ref ecosystem-graph 'components))

(define (get-build-order)
  "Get the build order for all components"
  (build-order))

;;; End of ecosystem.scm
