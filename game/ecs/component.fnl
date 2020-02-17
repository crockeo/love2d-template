;; component.fnl
;;
;; Represents a component in an ECS model. The functionality of a component is
;; analogous to that of a mode. It responds to Love2D callbacks to modify the
;; state of the component.
;;
;; A component may only interact with its own entity, and has no ability to
;; reference any other entity.

(local stdlib-class (require "game.stdlib.class"))

(stdlib-class.make
 {:new
  (fn [this name contents]
    (tset this :name name)
    (each [key value (pairs contents)]
      (tset this key value)))})
