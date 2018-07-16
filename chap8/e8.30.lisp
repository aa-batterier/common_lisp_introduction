; Function MY-ASSOC is a recursive version of ASSOC.
(defun my-assoc (key table)
  (cond ((null table) nil)
	((equal key (caar table)) (car table))
	(t (my-assoc key (cdr table)))))
