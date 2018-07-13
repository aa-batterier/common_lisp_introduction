; Function ADD-NUMS adds all the numbers from n to 0.
(defun add-nums (n)
  (if (zerop n)
    n
    (+ n (add-nums (- n 1)))))
