; Help function for function MY-REVERSE.
(defun my-reverse (l)
  (real-my-reverse l (length l)))

; Function MY-REVERSE is a recursive version of REVERSE.
(defun real-my-reverse (l n)
  (if (< n 0)
    nil
    (cons (first l) (real-my-reverse (rest l) (- n 1)))))
