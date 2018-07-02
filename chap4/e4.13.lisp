; Define function HOWCOMPUTE.
(defun howcompute (x y z)
  (cond ((equal (+ x y) z) 'sum-of)
	((equal (- x y) z) 'difference-of)
	((equal (* x y) z) 'product-of)
	((equal (/ x y) z) 'quota-of)
	(t '(beats me))))
