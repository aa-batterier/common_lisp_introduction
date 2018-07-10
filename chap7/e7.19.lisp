; Function ALL-ODD returns T if all elements in the list are odd else NIL.
(defun all-odd (l)
  (every #'oddp l))
