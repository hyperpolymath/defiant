#!/bin/bash
# quick-start.sh - Initialize DEFIANT development session
#
# SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
# SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "======================================================"
echo "  DEFIANT Ecosystem - Development Session Init       "
echo "======================================================"
echo

# Check for Guile
if command -v guile &> /dev/null; then
    echo "Loading project state..."
    guile -L "$SCRIPT_DIR" -c '
      (use-modules (defiant state))
      (use-modules (defiant meta))
      (state-summary current-state)
    ' 2>/dev/null || echo "Note: Guile modules not fully loaded (dependencies may be missing)"
else
    echo "Note: Guile not available, displaying static state info"
fi

echo
echo "Project: DEFIANT Ecosystem v0.8.0"
echo "Status:  Alpha (80% complete)"
echo "Phase:   Phase B+C Complete - DNF Integration + Operations"
echo
echo "COMPONENT STATUS:"
echo "  [x] DEFIANT (Ada):      80% - Functional TUI with DNF integration"
echo "  [~] AUDITOR (Rust):     20% - Reference implementations provided"
echo "  [ ] CONDUCTOR (Elixir):  0% - Not started"
echo
echo "NEXT MILESTONE:"
echo "  Milestone 5: CONDUCTOR Integration"
echo "  Priority:    HIGH"
echo
echo "NEXT TASKS:"
echo "  1. Implement Desktop_File_Parser.adb"
echo "  2. Implement Systemd_Detector.adb"
echo "  3. Implement Package_Analyzer.adb"
echo "  4. Implement HTTP_Client using AWS"
echo "  5. Implement CONDUCTOR_Client with JSON"
echo "  6. Update main.adb with routing workflow"
echo "  7. Create multi-target executors"
echo "  8. Create CONDUCTOR Elixir API endpoints"
echo "  9. Set up Docker Compose integration"
echo
echo "PROJECT STRUCTURE:"
echo "  $PROJECT_ROOT/"
echo "  ├── automation/           # State management (Scheme)"
echo "  │   ├── defiant/"
echo "  │   │   ├── state.scm     # Cross-conversation state"
echo "  │   │   ├── ecosystem.scm # Component architecture"
echo "  │   │   └── meta.scm      # Project metadata"
echo "  │   └── quick-start.sh    # This script"
echo "  ├── STATE.scm             # Project checkpoint"
echo "  ├── ECOSYSTEM.scm         # Ecosystem relationships"
echo "  └── META.scm              # Architecture decisions"
echo
echo "QUICK COMMANDS:"
echo "  cd $PROJECT_ROOT"
echo "  just --list              # See available tasks"
echo "  guile -L automation -c '(use-modules (defiant state)) (state-summary current-state)'"
echo
echo "Ready to start! Current completion: 80%"
echo "Target: CONDUCTOR Integration (Milestone 5)"
