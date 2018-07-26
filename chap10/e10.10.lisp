; Function NTACK adds destructively an element to the back of the list.
(defun ntack (l e)
  (nconc l (list e)))
