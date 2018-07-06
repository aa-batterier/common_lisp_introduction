; Function GREATER-THEN-FIVE-P returns T if the value is greater then five otherwise NIL.
(defun greater-then-five-p (i)
  (> i 5))

; Function GREATER-FIVE-LIST-P checks the hole list.
(defun greater-five-list-p (l)
  (mapcar #'greater-then-five-p l))
