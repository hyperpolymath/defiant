;; SPDX-License-Identifier: AGPL-3.0-or-later
;; META.scm - Project metadata and architectural decisions

(define project-meta
  `((version . "1.0.0")
    (architecture-decisions . ())
    (development-practices
      ((code-style . "rescript")
       (security . "openssf-scorecard")
       (testing . "property-based")
       (versioning . "semver")
       (documentation . "asciidoc")
       (branching . "trunk-based")))
    (design-rationale . ())))
