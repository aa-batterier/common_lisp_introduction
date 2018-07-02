; Define MY-ABS using COND instead of IF.
(defun my-abs (x)
  (cond ((> 0 x) (- x))
	(t x)))
