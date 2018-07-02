; Define function MAKE-EVEN.
(defun make-even (x)
  (if (oddp x) (+ x 1) x))
