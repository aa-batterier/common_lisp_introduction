; Function EVERY-OTHER returns every other element in the list.
(defun every-other (l)
  (if (null l) nil
    (cons (first l) (every-other (cddr l)))))
