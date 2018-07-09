; Function ROUGHLY-EQUAL returns the first number in X that is in the margin of +-10 to K.
(defun roughly-equal (x k)
  (let ((max (+ k 10)) (min (- k 10)))
    (find-if #'(lambda (n) (and (<= n max) (>= n min))) x)))
