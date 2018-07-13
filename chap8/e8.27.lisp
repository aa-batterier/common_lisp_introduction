; Function SQUARE-LIST returns the square of every number in the list.
(defun square-list (l)
  (let ((n (first l)))
    (if (null l) nil
      (cons (* n n) (square-list (rest l))))))
