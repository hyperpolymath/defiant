;; SPDX-License-Identifier: AGPL-3.0-or-later
;; ECOSYSTEM.scm - Project ecosystem positioning

(ecosystem
  ((version . "1.0.0")
   (name . "Defiant")
   (type . "component")
   (purpose . "Part of hyperpolymath ecosystem")
   (position-in-ecosystem . "supporting")
   (related-projects
     ((rhodium-standard . "sibling-standard")
      (gitvisor . "infrastructure")))
   (what-this-is . ("A hyperpolymath project"))
   (what-this-is-not . ("A standalone solution"))))
