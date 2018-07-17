; Function COUNT-UP without a help function.
(defun count-up (n)
  (if (<= n 0) nil
    (append (count-up (- n 1)) (list n))))
