;; entity.fnl
;;
;; Represents an entity in an ECS model. Constitutes a unique ID, in the form of
;; a UUID4, and a collection of components.

(local lume (require "lib.lume"))

(local callbacks (require "game.callbacks"))
(local stdlib-class (require "game.stdlib.class"))
(local stdlib-table (require "game.stdlib.table"))

;; Constructing the static entity template, to which we'll generate and add
;; delegate functions.
(local entity-template
       {:new
        (fn [this]
          (tset this :components {})
          (tset this :uuid (lume.uuid)))

        :add-component
        (fn [this component]
          "Adds a component to the entity."
          (tset this.components
                component.name component))

        :get-component
        (fn [this component-name]
          "Retrieves a component from the entity. If no component by the
          provided name exists, get-component returns nil instead."
          (. this.components component-name))})

;; Generating and adding delegate functions.
(fn construct-delegate [callback]
  "Constructs a delegate function for a Love2D callback that calls the same
  callback on each of this entity's components."
  (fn [this params]
    (stdlib-table.call-on this.components
                          callback
                          {:params [(stdlib-table.union params
                                                        {:parent this})]
                           :is-class true})))

(each [_ callback (ipairs callbacks)]
  (tset entity-template
        callback
        (construct-delegate callback)))

(stdlib-class.make entity-template)
