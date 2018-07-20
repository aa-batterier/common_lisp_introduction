; Function TREE-FIND-IF returns the first non-NIL atom of the tree which satisfies the predicate.
(defun tree-find-if (fun tree)
  (cond ((null tree) nil)
	((and (atom tree) (funcall fun tree)) tree)
	((atom tree) nil)
	(t (or (tree-find-if fun (car tree))
	       (tree-find-if fun (cdr tree))))))
