; Function ROTATE-LEFT rotate the elements of the list to the left.
(defun rotate-left (l)
  (append (rest l) (list (first l))))

; Function ROTATE-RIGHT rotate the elements of the list to the right.
(defun rotate-right (l)
  (cons (car (last l)) (reverse (rest (reverse l)))))
