; Function DRAWLINE draws a line of * of the length defined in the parameter to the function.
(defun drawline (n)
  (format t "*")
  (if (equal n 1) t
    (drawline (1- n))))
