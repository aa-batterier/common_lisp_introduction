; Function FIND-FIRST-ODD which finds the first odd number in the list.
(defun find-first-odd (l)
  (cond ((null l) nil)
	((oddp (first l)) (first l))
	(t (find-first-odd (rest l)))))
