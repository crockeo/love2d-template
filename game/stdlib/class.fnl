;; class.fnl
;;
;; Defines the methodology by which one constructs a class-like object in
;; Fennel. The standard method for Lua requires procedural assignment, but
;; declarative description is more canonical in Fennel.

(fn make [body]
  "Constructs a class with a given body defined as a map. Class methods should
  be defined as a :key, followed by an anonymous function. For example:

  (local
   example-class
   (class.make
    {:new
     (fn [this num]
       (tset this :num num))

     :inc
     (fn [this]
       (tset this :num (+ this.num 1)))}))

  This constructs a class with two methods, new, and inc. To construct an
  instance of that class, use:

  (local example (example-class.new i))

  Then, when you want to call a function on example, you do any of the standard
  Fennel method:

  (example.inc example)
  (example:inc)"
  {:new (fn [...]
          (local instance {})

          (each [key value (pairs body)]
            (tset instance key value))

          (when instance.new
            (instance.new instance (unpack [...])))

          instance)})

{:make make}
