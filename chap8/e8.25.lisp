; Function COUNT-DOWN counts down from N.
(defun count-down (n)
  (if (zerop n) nil
    (cons n (count-down (- n 1)))))

; Function FACT using COUNT-DOWN.
(defun fact (n)
  (reduce #'* (count-down n)))
