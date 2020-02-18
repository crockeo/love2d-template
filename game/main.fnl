(local modes (require "game.modes"))
(local stdlib-table (require "game.stdlib.table"))

(modes.push-mode :example)

(fn call-on-modes [fn-name params reverse]
  "Calls some function, as described by the function name, on the collection of
  modes."
  (stdlib-table.call-on (modes.get-mode-stack)
                        fn-name
                        {:params [params]
                         :require-true true
                         :reverse reverse}))

;; Each of the functions in this section correspond to a callback provided by
;; Love2D. They are all passed to the active mode(s) via call-on-modes above.
;;
;; Each of their arguments is packaged inside of a single map, params, so that
;; as a mode's arguments change, one doesn't need to go through and update each
;; mode's argument list.
;;
;; Exceptions:
;;   - love.errorhandler
;;   - love.run
;;   - love.textedit
;;   - love.textinput
(fn love.directorydropped [path]
  (call-on-modes :directorydropped
                 {:path path}))

(fn love.displayrotated [index orientation]
  (call-on-modes :displayrotated
                 {:index index
                  :orientation orientation}))

(fn love.draw []
  ;; We reverse the order of drawing, because we want modes on top to render
  ;; after, and therefore over, modes on the bottom.
  (call-on-modes :draw
                 {}
                 true))

(fn love.filedropped [file]
  (call-on-modes :filedropped
                 {:file file}))

(fn love.focus [focus]
  (call-on-modes :focus
                 {:focus focus}))

(fn love.gamepadaxis [joystick axis value]
  (call-on-modes :gamepadaxis
                 {:joystick joystick
                  :axis axis
                  :value value}))

(fn love.gamepadpressed [joystick button]
  (call-on-modes :gamepadpressed
                 {:joystick joystick
                  :button button}))

(fn love.gamepadreleased [joystick button]
  (call-on-modes :gamepadreleased
                 {:joystick joystick
                  :button button}))

(fn love.joystickadded [joystick]
  (call-on-modes :joystickadded
                 {:joystick joystick}))

(fn love.joystickaxis [joystick axis value]
  (call-on-modes :joystickaxis
                 {:joystick joystick
                  :axis axis
                  :value value}))

(fn love.joystickhat [joystick hat direction]
  (call-on-modes :joystickhat
                 {:joystick joystick
                  :hat hat
                  :direction direction}))

(fn love.joystickpressed [joystick button]
  (call-on-modes :joystickpressed
                 {:joystick joystick
                  :button button}))

(fn love.joystickreleased [joystick button]
  (call-on-modes :joystickreleased
                 {:joystick joystick
                  :button button}))

(fn love.joystickremoved [joystick]
  (call-on-modes :joystickremoved
                 {:joystick joystick}))

(fn love.keypressed [key scancode isrepeat]
  (call-on-modes :keypressed
                 {:key key
                  :scancode scancode
                  :isrepeat isrepeat}))

(fn love.keyreleased [key scancode]
  (call-on-modes :keyreleased
                 {:key key
                  :scancode scancode}))

(fn love.lowmemory []
  (call-on-modes :lowmemory
                 {}))

(fn love.mousefocus [focus]
  (call-on-modes :mousefocus
                 {:focus focus}))

(fn love.mousemoved [x y dx dy istouch]
  (call-on-modes :mousemoved
                 {:x x
                  :y y
                  :dx dx
                  :dy dy
                  :istouch istouch}))

(fn love.mousepressed [x y button istouch presses]
  (call-on-modes :mousepressed
                 {:x x
                  :y y
                  :istouch istouch
                  :presses presses}))

(fn love.mousereleased [x y istouch presses]
  (call-on-modes :mousereleased
                 {:x x
                  :y y
                  :istouch istouch
                  :presses presses}))

(fn love.quit []
  (call-on-modes :quit
                 {}))

(fn love.resize [width height]
  (call-on-modes :resize
                 {:width width
                  :height height}))

(fn love.threaderror [thread errorstr]
  (call-on-modes :threaderror
                 {:thread thread
                  :errorstr errorstr}))

(fn love.touchmoved [id x y dx dy pressure]
  (call-on-modes :touchmoved
                 {:id id
                  :x x
                  :y y
                  :dx dx
                  :dy dy
                  :pressure pressure}))

(fn love.touchpressed [id x y dx dy pressure]
  (call-on-modes :touchpressed
                 {:id id
                  :x x
                  :y y
                  :dx dx
                  :dy dy
                  :pressure pressure}))

(fn love.touchreleased [id x y dx dy pressure]
  (call-on-modes :touchreleased
                 {:id id
                  :x x
                  :y y
                  :dx dx
                  :dy dy
                  :pressure pressure}))

(fn love.update [dt]
  (call-on-modes :update
                 {:dt dt}))

(fn love.visible [visible]
  (call-on-modes :visible
                 {:visible visible}))

(fn love.wheelmoved [x y]
  (call-on-modes :wheelmoved
                 {:x x
                  :y y}))
