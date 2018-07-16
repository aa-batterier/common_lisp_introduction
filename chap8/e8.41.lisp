; Function SUM-TREE returns the sum of all the numbers in the tree.
(defun sum-tree (tree)
  (cond ((numberp tree) tree)
	((and (atom tree) (not (numberp tree))) 0)
	(t (+ (sum-tree (car tree))
	      (sum-tree (cdr tree))))))
