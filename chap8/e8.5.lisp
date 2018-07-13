; Function ADD-UP which adds up all the numbers in the list using recursion.
(defun add-up (l)
  (if (null l)
    0
    (+ (first l) (add-up (rest l)))))
