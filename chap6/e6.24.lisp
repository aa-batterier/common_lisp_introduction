; Function SET-EQUAL checks if two sets are equal.
(defun set-equal (sx sy)
  (and (subsetp sx sy) (subsetp sy sx)))
