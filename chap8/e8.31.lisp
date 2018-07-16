; Function COMPARE-LENGTHS compare the lengths of two lists.
(defun compare-lengths (l1 l2)
  (cond ((and (null l1) (null l2)) 'same-length)
	((and (not (null l1)) (null l2)) 'first-is-longer)
	((and (null l1) (not (null l2))) 'second-is-longer)
	(t (compare-lengths (rest l1) (rest l2)))))
