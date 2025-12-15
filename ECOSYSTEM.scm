;; SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; ECOSYSTEM.scm - Project Ecosystem Relationships
;;; DEFIANT Ecosystem
;;; Reference: https://github.com/hyperpolymath/ECOSYSTEM.scm

(ecosystem
  (version "1.0.0")
  (name "DEFIANT Ecosystem")
  (type "multi-component-system")
  (purpose "Intelligent package routing for immutable systems")

  (position-in-ecosystem
    "DEFIANT is a multi-component system for managing packages across
     OSTree, Flatpak, Podman, and traditional package managers. It
     provides intelligent routing through the CONDUCTOR orchestrator,
     system inventory via AUDITOR, and a TUI interface in DEFIANT.

     Part of the hyperpolymath ecosystem, following RSR (Rhodium
     Standard Repositories) guidelines for consistency, security,
     and maintainability.")

  ;;; ========================================================================
  ;;; COMPONENT ARCHITECTURE
  ;;; ========================================================================

  (components
    (component
      (name "DEFIANT")
      (language "Ada 2022")
      (type "TUI Application")
      (status "80% complete")
      (description "Terminal UI package manager with DNF integration")
      (dependencies
        ("malef" "TUI framework")
        ("gnatcoll" "JSON parsing and utilities")
        ("aws" "HTTP client for CONDUCTOR"))
      (provides
        "Interactive package browser"
        "DNF integration"
        "Transaction management"
        "Multi-target installation"))

    (component
      (name "AUDITOR")
      (language "Rust")
      (type "CLI Tool")
      (status "Reference implementation")
      (description "System inventory and metadata extraction")
      (dependencies
        ("clap" "CLI argument parsing")
        ("serde" "Serialization")
        ("tokio" "Async runtime"))
      (provides
        "System inventory"
        "RPM metadata extraction"
        "Desktop file parsing"
        "Systemd unit detection"))

    (component
      (name "CONDUCTOR")
      (language "Elixir")
      (type "Web Service")
      (status "Planned")
      (description "Routing orchestrator for package decisions")
      (dependencies
        ("phoenix" "Web framework")
        ("poison" "JSON")
        ("httpoison" "HTTP client"))
      (provides
        "Package routing API"
        "Decision matrix"
        "Reversibility proofs"
        "Multi-target selection")))

  ;;; ========================================================================
  ;;; COMMUNICATION FLOW
  ;;; ========================================================================

  (communication-flow
    "
    USER INTERACTION (DEFIANT Ada TUI)
              |
              | 1. User marks packages
              v
    DEFIANT: Package Analysis
    - Extract RPM metadata (dnf-interface)
    - Parse desktop files (analysis/desktop_file_parser)
    - Detect systemd units (analysis/systemd_detector)
    - Build Package_Capabilities record
              |
              | 2. HTTP POST to CONDUCTOR /api/v1/route
              v
    CONDUCTOR: Routing Decision (Elixir)
    - Analyze package characteristics
    - Apply decision matrix
    - Determine optimal target
    - Calculate reversibility proof
              |
              | 3. HTTP Response
              v
    DEFIANT: Transaction Preview & Confirm
    - Show target (OSTree/Flatpak/Podman/etc)
    - Display rationale
    - Show confidence score
    - User confirms
              |
              | 4. Execute installation
              v
    DEFIANT: Execute to Routed Target
    - OSTree    -> rpm-ostree install
    - Flatpak   -> flatpak install
    - Podman    -> podman run
    - Distrobox -> distrobox create + enter + install
    - Toolbox   -> toolbox create + run
    ")

  ;;; ========================================================================
  ;;; INTEGRATION POINTS
  ;;; ========================================================================

  (integration-points
    (integration
      (name "defiant-conductor")
      (status "In Progress")
      (protocol "HTTP/JSON")
      (authentication "API Key (X-API-Key header)")
      (endpoint "/api/v1/route")
      (direction "request-response")
      (data-flow "Package metadata -> Routing decision"))

    (integration
      (name "auditor-conductor")
      (status "Reference Implementation")
      (protocol "HTTP/JSON")
      (authentication "API Key")
      (endpoint "/api/v1/inventory")
      (direction "request-response")
      (data-flow "System inventory -> Analysis")))

  ;;; ========================================================================
  ;;; BUILD ORDER
  ;;; ========================================================================

  (build-order
    (phase 1
      (components "conductor")
      (rationale "No dependencies, provides API for others"))
    (phase 2
      (components "defiant" "auditor")
      (rationale "Both depend on CONDUCTOR, can build in parallel"))
    (phase 3
      (type "integration-testing")
      (rationale "End-to-end testing")))

  ;;; ========================================================================
  ;;; RELATED PROJECTS
  ;;; ========================================================================

  (related-projects
    (project
      (name "hyperpolymath-ecosystem")
      (url "https://github.com/hyperpolymath")
      (relationship "ecosystem")
      (description "Part of the hyperpolymath project ecosystem"))

    (project
      (name "rhodium-standard-repositories")
      (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
      (relationship "standard")
      (description "RSR compliance guidelines this project follows"))

    (project
      (name "META.scm")
      (url "https://github.com/hyperpolymath/META.scm")
      (relationship "sibling-standard")
      (description "Machine-readable Engineering and Technical Architecture format"))

    (project
      (name "state.scm")
      (url "https://github.com/hyperpolymath/state.scm")
      (relationship "sibling-standard")
      (description "Stateful Context Tracking Engine for AI Conversation Continuity")))

  ;;; ========================================================================
  ;;; DEPLOYMENT TOPOLOGY
  ;;; ========================================================================

  (deployment
    (environment "development"
      (conductor (host "localhost") (port 3000) (protocol "http"))
      (defiant (location "local"))
      (auditor (location "local")))

    (environment "docker-compose"
      (conductor (container "conductor") (port 3000) (network "defiant-net"))
      (defiant (container "defiant") (network "defiant-net"))
      (auditor (container "auditor") (network "defiant-net")))

    (environment "production"
      (conductor (host "conductor.example.com") (port 443) (protocol "https"))
      (defiant (deployment "client-side"))
      (auditor (deployment "systemd-service"))))

  (what-this-is
    "A multi-component package management system for immutable operating
     systems like Fedora Silverblue, Fedora Kinoite, and Universal Blue.

     Design principles:
     - RSR Gold compliance target
     - Type safety through Ada and Rust
     - Intelligent routing via CONDUCTOR
     - Graceful degradation without orchestrator
     - Security through architecture")

  (what-this-is-not
    "- NOT a replacement for package managers (it wraps them)
     - NOT limited to a single package format
     - NOT designed for mutable systems only
     - NOT a single-language monolith"))

;;; End of ECOSYSTEM.scm
