;; ecs.fnl
;;
;; The top-level ECS model. Contains entites, components, and systems, and
;; manages them. Presents itself analogously to a mode, and so it responds to
;; certain callbacks, just like a mode would.

(local entity (require "game.ecs.entity"))
(local stdlib-class (require "game.stdlib.class"))
(local stdlib-table (require "game.stdlib.table"))

(stdlib-class.make
 {:entities {}
  :systems {}

  :add-entity
  (fn [this]
    "Constructs and adds a new entity to the ECS. REturns the UUID of the entity
     so that it may be used later."
    (let [e (entity.new)]
      (tset this.entities e.uuid e)
      e))

  :remove-entitiy
  (fn [this uuid]
    "Removes an entity from the ECS. If no entity exists with the provided UUID
    then it is a no-op."
    (tset this.entities uuid nil))

  :get-entity
  (fn [this uuid]
    "Retrieves an entity from the ECS. If no entity exists with the provided
    UUID, then get-entity returns nil"
    (. this.entities uuid))

  :get-entities
  (fn [this]
    "Retrieves the entire list of entities from the ECS. Used when calling
    systems to provide them the total list of applicable entities."
    this.entities)

  :call-on-entities
  (fn [this callback params]
    (stdlib-table.call-on this.entities
                          callback
                          params))})
