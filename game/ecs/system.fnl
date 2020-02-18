;; system.fnl
;;
;; Represents a system in an ECS model. A system is constituted by two parts,
;; the first, the selector, filters the set of entities down into those that are
;; applicable to the system. The second, the executor, performs some action on
;; those entities.

(local lume (require "lib.lume"))

(local stdlib-class (require "game.stdlib.class"))

(stdlib-class.make
 {:new
  (fn [this selector executor]
    (tset this :selector selector)
    (tset this :executor executor))

  (fn execute [this ecs]
    "Executes the executor on the subset of entities that abide by the selector."
    (this.executor (lume.filter ecs.entities
                                this.selector)))})
