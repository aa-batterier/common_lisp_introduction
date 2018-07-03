; Define function LOGICAL-AND.
; Using the AND version as insperation.
(defun logical-and (x y)
  (and x y t))

; The IF version of LOGICAL-AND.
(defun logical-and-if (x y)
  ;(if x y)) ; cooler version.
  (if x (if y t))

; The COND version of LOGICAL-AND.
(defun logical-and-cond (x y)
  ;(cond (x (cond (y t)))))
  (cond (x t)
	(y t)))
