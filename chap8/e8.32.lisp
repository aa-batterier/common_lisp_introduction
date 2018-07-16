; Function SUM-NUMERIC-ELEMENTS sums up all the numeric elements in the list.
(defun sum-numeric-elements (l)
  (let ((n (first l)))
    (cond ((not n) 0)
	  ((numberp n)
	   (+ n (sum-numeric-elements (rest l))))
	  (t (sum-numeric-elements (rest l))))))
