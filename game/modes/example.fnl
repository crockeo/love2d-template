(local ecs (require "game.ecs"))
(local ecs-component (require "game.ecs.component"))
(local ecs-entity (require "game.ecs.entity"))
(local ecs-system (require "game.ecs.system"))

(var ecs-instance nil)

(fn get-axis [neg-key pos-key]
  (match [(love.keyboard.isDown neg-key) (love.keyboard.isDown pos-key)]
    [false false] 0
    [true false] -1
    [false true] 1
    [true true] 0))

(local
 position-component
 (ecs-component.new :position
                    {:x 300
                     :y 300

                     :get-x (fn [this] this.x)
                     :get-y (fn [this] this.y)

                     :update
                     (fn [this params]
                       (tset this
                             :x
                             (+ this.x
                                (* 100
                                   params.dt
                                   (get-axis "a" "d"))))

                       (tset this
                             :y
                             (+ this.y
                                (* 100
                                   params.dt
                                   (get-axis "w" "s")))))}))

(local
 render-component
 (ecs-component.new :render
                    {:draw
                     (fn [this params]
                       (let [position (params.parent:get-component :position)]
                         (love.graphics.circle "fill"
                                               (position:get-x)
                                               (position:get-y)
                                               16)))}))

(fn example-load []
  (set ecs-instance (ecs.new))

  (let [player (ecs-instance:add-entity)]
    (player:add-component position-component)
    (player:add-component render-component)))

(fn example-draw [params]
  (ecs-instance:call-on-entities :draw params)
  (love.graphics.printf "Hello world" 0 300 800 "center"))

(fn example-update [params]
  (ecs-instance:call-on-entities :update params))

{:load example-load
 :draw example-draw
 :update example-update}
