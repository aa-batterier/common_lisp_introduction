; Function ALLODDP returns T if all numbers in the list are odd otherwise NIL.
(defun alloddp (l)
  (cond ((null l) t)
	((evenp (first l)) nil)
	(t (alloddp (rest l)))))
