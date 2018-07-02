; C)
(defun myfun (x y)
  (list (list x) y))

; D)
(defun firstp (s l)
  (equal s (first l)))

; E)
(defun mid-add1 (l)
  (list (first l) (+ 1 (second l)) (third l)))

; F)
(defun f-to-c (f)
  (/ (* (- f 32) 5 ) 9.0))
