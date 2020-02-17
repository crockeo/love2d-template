;; system.fnl
;;
;; Represents a system in an ECS model. A system is constituted by two parts,
;; the first, the selector, filters the set of entities down into those that are
;; applicable to the system. The second, the executor, performs some action on
;; those entities.

(fn system-make [])

{:make system-make}
