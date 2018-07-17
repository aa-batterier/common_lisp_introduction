; Function BURY buries the first argument into the amount of the second argument.
(defun bury (item amount)
  (if (<= amount 0) item
    (list (bury item (- amount 1)))))
