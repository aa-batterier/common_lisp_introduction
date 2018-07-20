; Function LEGALP returns T if the input is legal artithmetuc expression otherwise NIL is returned.
(defun legalp (e)
  (let ((o '(+ - * /)))
    (cond ((numberp e) t)
	  ((and (listp e) (find-if #'(lambda (x) (equal x (second e))) o)) t)
	  ((atom e) nil)
	  (t (and (legalp (car e))
		  (legalp (cdr e)))))))
