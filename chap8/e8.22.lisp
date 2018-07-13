; Function ALL-EQUAL returns T if all elements in the list are equal otherwise NIL.
(defun all-equal (l)
  (cond ((not (second l)) t)
	((not (equal (first l) (second l))) nil)
	(t (all-equal (rest l)))))
