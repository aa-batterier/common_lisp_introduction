; Function TREE-DEPTH returns the maximum depth of the tree.
(defun tree-depth (tree)
  (if (atom tree) 0
    (+ 1 (max (tree-depth (car tree)) (tree-depth (cdr tree))))))
