; Function IT-UNION is a iterative version of UNION.
(defun it-union (s1 s2)
  (let ((result-list s2))
    (dolist (element s1 result-list)
      (when (not (member element result-list))
	(push element result-list)))))
