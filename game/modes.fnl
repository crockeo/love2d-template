(local lume (require "lib.lume"))

(local modes {:example (require "game.modes.example")})
(var mode-stack [])

(fn get-mode-stack []
  mode-stack)

(fn push-mode [name ...]
  "Adds a mode onto the stack. Calls the initialization function with any
  parameters beyond that of the mode's name."
  (let [mode (. modes name)]
    (when mode.init
      (mode.init (unpack [...])))
    (table.insert mode-stack mode)))

(fn set-mode [name ...]
  "Sets the current mode to that described by the provided name. Passes along
  all of the additional parameters to the mode as its initialization arguments."
  (set mode-stack [])
  (push-mode name (unpack [...])))

(fn pop-mode []
  "Removes the top-most mode from the stack."
  (table.remove mode-stack))

{:get-mode-stack get-mode-stack

 :push-mode push-mode
 :set-mode set-mode
 :pop-mode pop-mode}
