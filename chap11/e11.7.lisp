; Rewritting IT-INTERSECTION so it returns the list in the correct order.
(defun it-intersection (x y)
  (let ((result-set nil))
    (dolist (element x (reverse result-set))
      (when (member element y)
	(push element result-set)))))
