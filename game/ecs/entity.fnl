;; entity.fnl
;;
;; Represents an entity in an ECS model. Constitutes a unique ID, in the form of
;; a UUID4, and a collection of components.

(local lume (require "lib.lume"))

(local callbacks (require "game.callbacks"))
(local stdlib-class (require "game.stdlib.class"))
(local stdlib-table (require "game.stdlib.table"))



;; ;; Defining the top-level entity template.
;; (local entity-template
;;        {:components {}
;;         :uuid (lume.uuid)

;;         :add-component add-component
;;         :get-component get-component})

;; ;; Constructing each of the delegate functions.
;; (fn make-callback-delegate [callback]
;;   (fn [this params]
;;     (stdlib-table.call-on this.components
;;                           callback
;;                           (stdlib-table.union params
;;                                               {:parent this}))))

;; (each [_ callback (ipairs callbacks)]
;;   (tset entity-template
;;         callback
;;         (make-callback-delegate callback)))

;; (stdlib-class.make entity-template)

(stdlib-class.make
 {:components {}
  :uuid nil

  :new
  (fn [this]
    (tset this :uuid (lume.uuid)))

  :add-component
  (fn [this component]
    "Adds a component to the entity."
    (tset this.components
          component.name component))

  :get-component
  (fn [this component-name]
    "Retrieves a component from the entity. If no component by the provided name
    exists, get-component returns nil instead."
    (. this.components component-name))

  :draw
  (fn [this params]
    (stdlib-table.call-on this.components
                          :draw
                          {:params [(stdlib-table.union params
                                                        {:parent this})]
                           :is-class true}))

  :update
  (fn [this params]
    (stdlib-table.call-on this.components
                          :update
                          {:params [(stdlib-table.union params
                                                        {:parent this})]
                           :is-class true}))})
