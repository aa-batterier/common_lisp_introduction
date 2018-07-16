; Function COUNT-CONS returns the number of cons cells in the tree.
(defun count-cons (tree)
  (cond ((null tree) 0)
	((listp tree) (+ 1
			 (count-cons (car tree))
			 (count-cons (cdr tree))))
	(t 0)))
