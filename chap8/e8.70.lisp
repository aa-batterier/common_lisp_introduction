; Function FACTOR-TREE returns a tree of factors and thier primes.
(defun factor-tree (start)
  (labels ((primep (n p)
	     (cond ((> p (sqrt n)) t)
		   ((zerop (rem n p)) nil)
		   (t (primep n (1+ p)))))
	   (factors-help (n p)
	     (cond ((primep n 2) n)
		   ((zerop (rem n p))
		    (list n p (factors-help (/ n p) p)))
		   (t (factors-help n (1+ p))))))
    (factors-help start 2)))
