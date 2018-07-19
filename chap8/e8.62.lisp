; Function FACT with tail recursion.
(defun fact (n)
  (fact-help n 1))

(defun fact-help (n result)
  (if (zerop n) result
    (fact-help (- n 1) (* n result))))
