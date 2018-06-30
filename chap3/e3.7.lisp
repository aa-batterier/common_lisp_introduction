; I'm from Sweden, I don't know how far a mile is or how much a gallon is, so I have replaced it with kilometers and liters.
; Defines the function kilometers-per-liter.
(defun kilometers-per-liter (initial-odometer-reading final-odometer-reading liters-consumed)
  (/ (- final-odometer-reading initial-odometer-reading) liters-consumed))
