; Function FLATTEN returns a singel level list from a nested list.
(defun flatten (l)
  (let ((flat (if (atom l)
		(list l)
		(append (flatten (car l))
			(flatten (cdr l))))))
    (remove-if #'not flat)))
