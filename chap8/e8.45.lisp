; Function PAREN-DEPTH returns the max depth of nested paranthese in a list.
(defun paren-depth (l)
  (cond ((not l) 1)
	((atom l) 0)
	(t (+ (paren-depth (car l)) (paren-depth (cdr l))))))
