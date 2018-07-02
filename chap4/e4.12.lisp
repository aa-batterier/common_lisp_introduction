; Define function CYCLE using COND.
(defun cycle-cond (x)
  (cond ((< x 99) (+ x 1))
	(t 1)))

; Define function CYCLE using IF.
(defun cycle-if (x)
  (if (< x 99) (+ x 1) 1))
