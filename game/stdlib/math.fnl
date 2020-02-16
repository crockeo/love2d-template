(fn round [num]
  "Rounds a number to the closest whole number using standard rounding. If a
  number = 0.5, then it is rounded up."
  (if (>= (- num (math.floor num)) 0.5)
      (math.ceil num)
      (math.floor num)))

(fn sign [num]
  "Returns the sign of a number. If a number is exactly equal to 0, then it
  returns 0."
  (if (< num 0)
      -1
      (if (= num 0)
          0
          1)))

{:round round
 :sign sign}
