; The iterative version of CHECK-ALL-ODD as refernse.
(defun check-all-odd (list-of-numbers)
  (dolist (e list-of-numbers t)
    (format t "~&Checking ~S..." e)
    (if (not (oddp e)) (return nil))))

; Rewritting CHECK-ALL-ODD recursively.
(defun check-all-odd-recursive (list-of-numbers)
  (cond ((null list-of-numbers) t)
	((evenp (first list-of-numbers)) (format t "~&Checking ~S..." (first list-of-numbers)))
	(t (format t "~&Checking ~S..." (first list-of-numbers))
	   (check-all-odd-recursive (rest list-of-numbers)))))
