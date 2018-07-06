; Function SWAP-FIRST-LAST swaps the first element in the list with
; the last element in the list.
(defun swap-first-last (l)
  (cons (car (last l)) (reverse (cons (first l) (rest (reverse (rest l)))))))
