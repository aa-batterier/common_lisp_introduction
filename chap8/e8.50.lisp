; Function SUBLIST returns all the sub lists of a list.
(defun sublist (l)
  (if l
    (cons l (sublist (rest l)))))
