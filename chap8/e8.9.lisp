; REC-NTH is a recursive version of NTH.
(defun rec-nth (i l)
  (cond ((null l) nil)
	((zerop i) (first l))
	(t (rec-nth (- i 1) (rest l)))))
