; Function MY-REMOVE is a recursive version of REMOVE.
(defun my-remove (x l)
  (let ((n (first l)))
    (cond ((not n) nil)
	  ((equal x n) (my-remove x (rest l)))
	  (t (cons n (my-remove x (rest l)))))))
