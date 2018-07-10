; Function NOT-NONE-ODD returns T if it is not the case that a list contains no odd elements.
(defun not-none-odd (l)
  (find-if #'(lambda (n) (oddp n)) l))
