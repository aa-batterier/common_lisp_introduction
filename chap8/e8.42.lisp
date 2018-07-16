; Function MY-SUBST is a recursive version of SUBST.
(defun my-subst (too from tree)
  (cond ((null tree) nil)
	((atom tree) (if (equal from tree) too tree))
	(t (cons (my-subst too from (car tree))
		 (my-subst too from (cdr tree))))))
