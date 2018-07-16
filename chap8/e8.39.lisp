; Function COUNT-ATOMS returns the number of atoms in the tree, including NIL.
(defun count-atoms (tree)
  (cond ((atom tree) 1)
	(t (+ (count-atoms (car tree))
	      (count-atoms (cdr tree))))))
