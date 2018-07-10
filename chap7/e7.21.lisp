; Function NOT-ALL-ODD returns true if not every element in the list are odd.
(defun not-all-odd (l)
  (find-if #'(lambda (n) (not (oddp n))) l))
