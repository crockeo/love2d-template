(fn call-on [collection fn-name params require-true reverse]
  "Calls a function, described by fn-name, on a collection of tables. When
  `require-true` is truthy, this function will stop upon reaching a function
  that exists and returns false. When `reverse` is truthy, this function will
  iterate backwards"

  (local dir (if reverse
                 -1
                 1))

  (var done false)
  (var i (if reverse
             (length collection)
             1))

  ;; This is implemented as a while-loop, instead of the more fitting recursion,
  ;; because this will be called in core loops and should be performant.
  (while (and (not done)
              (>= i 1)
              (<= i (length collection)))
    (let [callback (. collection i fn-name)]
      (when (and callback
                 require-true
                 (not (callback (unpack params))))
        (set done true)))

    (set i (+ i dir))))

(fn print [t]
  "Prints out a table's key/value pairs. Works both on general and numeric
  tables."
  (each [key value (pairs t)]
    (print key value)))

(fn union [...]
  "Returns the union of 1 or more tables. If multiple tables share the same key,
  the value from the late-most table with that key is used."
  (local union {})

  (each [_ t (ipairs [...])]
    (each [key value (pairs t)]
      (tset union key value)))

  union)

{:call-on call-on
 :print-table print-table
 :union-tables union-tables}
