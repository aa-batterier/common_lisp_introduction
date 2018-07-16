; Function MY-SET-DIFFERENCE is a recursive version of SET-DIFFERENCE.
(defun my-set-difference (s1 s2)
  (let ((x1 (first s1)))
    (cond ((not x1) nil)
	  ((not (member x1 s2))
	   (cons x1 (my-set-difference (rest s1) s2)))
	  (t (my-set-difference (rest s1) s2)))))
