; Function COUNT-DOWN-ZERO counts down from N to 0.
(defun count-down-zero-v1 (n)
  (if (< n 0) nil
    (cons n (count-down-zero-v1 (- n 1)))))

(defun count-down-zero-v2 (n)
  (if (zerop n) '(0)
    (cons n (count-down-zero-v2 (- n 1)))))
