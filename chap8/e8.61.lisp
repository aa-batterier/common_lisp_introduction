; Function COUNT-UP without tail recursion as reference.
(defun count-up (n)
  (if (<= n 0) nil
    (append (count-up (- n 1)) (list n))))

; Function COUNT-UP with tail recursion.
(defun count-up-tail (n)
  (count-up-tail-help n nil))

(defun count-up-tail-help (n l)
  (if (<= n 0) l
    (count-up-tail-help (- n 1) (cons n l))))
