; Function FIRST-NON-INTEGER using DO* as reference.
(defun first-non-integer (x)
  "Return the first non-integer element of X."
  (do* ((z x (rest z))
	(z1 (first z) (first z)))
       ((null z) 'none)
    (unless (integerp z1)
      (return z1))))

; Function FIRST-NON-INTEGER using DOLIST instead of DO*.
(defun first-non-integer-dolist (x)
  "Return the first non-integer element of X."
  (dolist (e x 'none)
    (unless (integerp e)
      (return e))))
