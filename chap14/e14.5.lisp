; Macro SET-MUTUAL sets the varible name the value of the other varible.
(defmacro set-mutual (a b)
  `(progn
     (setf ,a ',b)
     (setf ,b ',a)))
