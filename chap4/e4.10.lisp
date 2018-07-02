; Function CONSTRAIN using COND.
(defun constrain-cond (x max min)
  (cond ((> x max) max)
	((< x min) min)
	(t x)))

; Function CONSTRAIN using IF.
(defun constrain-if (x max min)
  (if (< x max)
    (if (< x min)
      min
      x)
    max))
