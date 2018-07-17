; Function LARGEST-EVEN returns the largets even number from a list.
(defun largest-even (l)
  (cond ((not l) 0)
	((and (numberp l) (if (evenp l) l 0)))
	(t (max (largest-even (car l))
		(largest-even (cdr l))))))
