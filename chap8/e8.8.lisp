; REC-ASSOC is a recursive version of ASSOC.
(defun rec-assoc (key table)
  (cond ((null table) nil)
	((equal key (caar table)) (car table))
	(t (rec-assoc key (rest table)))))
