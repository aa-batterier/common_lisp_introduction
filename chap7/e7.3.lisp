; Function ZERO-LIST-P checks each element in the list if it is zero.
(defun zero-list-p (l)
  (mapcar #'zerop l))
