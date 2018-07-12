; Function ANYODDP as referense.
(defun anyoddp-referense (x)
  (cond ((null x) nil)
	((oddp (first x)) t)
	(t (anyoddp (rest x)))))

; ANYODDP written using IF instead of COND.
(defun anyoddp (x)
  (if (null x)
    nil
    (if (oddp (first x))
      t
      (anyoddp (rest x)))))
