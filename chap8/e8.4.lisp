; Function LAUGH returns the number of HAs specified.
(defun laugh (n)
  (cond ((equal 0 n) nil)
	(t (cons 'ha (laugh (- n 1))))))
