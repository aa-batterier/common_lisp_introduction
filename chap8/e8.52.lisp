; Function MY-UNION is a recursive version of UNION.
(defun my-union (s1 s2)
  (cond ((null s1) s2)
	((member (first s1) s2) (my-union (rest s1) s2))
	(t (cons (first s1) (my-union (rest s1) s2)))))
