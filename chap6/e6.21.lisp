; My version of SUBSETP.
(defun my-subsetp (sx sy)
  (not (set-difference sx sy)))
