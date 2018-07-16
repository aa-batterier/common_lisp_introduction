; Function MY-INTERSECTION is a recursive version of INTERSECTION.
(defun my-intersection (s1 s2)
  (let ((x1 (first s1)))
    (cond ((not x1) nil)
	  ((member x1 s2) (cons x1 (my-intersection (rest s1) s2)))
	  (t (my-intersection (rest s1) s2)))))
