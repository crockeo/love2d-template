(fn table-to-sequential [collection]
  "Converts an arbitrary collection into a sequential collection."
  (local seq [])
  (each [_ value (pairs collection)]
    (table.insert seq value))
  seq)

(fn table-call-on [raw-collection fn-name raw-optional]
  "Calls a function, described by fn-name, on a collection of tables. The
  function accepts optional arugments in the form of `optional`:

    - optional.require-true, when truthy, the function will stop upon reaching
      a function that exists and returns false.

    - optional.reverse, when truthy, the function will iterate in reverse order

    - optional.is-class, when truthy, the function will evaluate methods as
      `table:method` instead of `table.method`."

  ;; TODO: Figure out how to make this conditional. I.e. if the table is already
  ;;       sequential, then don't do this conversion.
  (local collection (table-to-sequential raw-collection))
  (local optional (if raw-optional
                      raw-optional
                      {}))

  (local params (if optional.params
                    optional.params
                    []))

  (local dir (if optional.reverse
                 -1
                 1))

  (var done false)
  (var i (if optional.reverse
             (length collection)
             1))

  ;; This is implemented as a while-loop, instead of the more fitting recursion,
  ;; because this will be called in core loops and should be performant.
  (while (and (not done)
              (>= i 1)
              (<= i (length collection)))
    (let [callback (. collection i fn-name)]
      (when callback
        (when (not (if optional.is-class
                       (callback (. collection i) (unpack params))
                       (callback (unpack params))))
          (set done true))))

    (set i (+ i dir))))

(fn table-print [t]
  "Prints out a table's key/value pairs. Works both on general and numeric
  tables."
  (each [key value (pairs t)]
    (print key value)))

(fn table-union [...]
  "Returns the union of 1 or more tables. If multiple tables share the same key,
  the value from the late-most table with that key is used."
  (local union {})

  (each [_ t (ipairs [...])]
    (each [key value (pairs t)]
      (tset union key value)))

  union)

{:to-sequential table-to-sequential
 :call-on table-call-on
 :print table-print
 :union table-union}
