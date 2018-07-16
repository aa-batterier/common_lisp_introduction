; Modified version of MY-NTH which stops when the it reach a nil list.
(defun my-nth (n x)
  (cond ((null x) nil)
	((zerop n) (first x))
	(t (my-nth (- n 1) (rest x)))))
