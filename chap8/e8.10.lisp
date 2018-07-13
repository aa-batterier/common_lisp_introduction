; Help functions.
(defun add1 (x)
  (+ x 1))

(defun sub1 (x)
  (- x 1))

; REC-PLUS is a recursive version of +.
(defun rec-plus (x y)
  (if (zerop y)
    x
    (rec-plus (add1 x) (sub1 y))))
