;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — defiant

(ecosystem
  (version "1.0.0")
  (name "defiant")
  (type "project")
  (purpose "Jonathan D.A. Jewell <jonathan.jewell@gmail.com>")

  (position-in-ecosystem
    "Part of hyperpolymath ecosystem. Follows RSR guidelines.")

  (related-projects
    (project (name "rhodium-standard-repositories")
             (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
             (relationship "standard")))

  (what-this-is "Jonathan D.A. Jewell <jonathan.jewell@gmail.com>")
  (what-this-is-not "- NOT exempt from RSR compliance"))
