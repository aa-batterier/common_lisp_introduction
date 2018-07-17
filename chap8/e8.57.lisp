; Help function for LEFT-HALF
(defun left-half (l)
  (real-left-half l (/ (length l) 2)))

; Function LEFT-HALF returns the left half of the list.
(defun real-left-half (l n)
  (if (<= n 0) nil
    (cons (first l) (real-left-half (rest l) (- n 1)))))
