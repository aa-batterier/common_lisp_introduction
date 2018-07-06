; Function ADD1 adds one to its input.
(defun add1 (i)
  (+ i 1))

; Function ADD1-TO-ALL adds one to all elements in the list.
(defun add1-to-all (l)
  (mapcar #'add1 l))
