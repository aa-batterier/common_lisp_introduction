; Function PAIRINGS pairs the elements of two lists.
(defun pairings (l1 l2)
  (if (or (null l1) (null l2)) nil
    (cons (list (first l1) (first l2)) (pairings (rest l1) (rest l2)))))
