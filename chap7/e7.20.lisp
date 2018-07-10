; Function NONE-ODD returns T if every element in the list are not odd.
(defun none-odd (l)
  (not (every #'oddp l)))
