; Correct rewriting of the function MAKE-ODD.
(defun make-odd (x)
  (cond ((not (oddp x)) (+ x 1))
	(t x)))
