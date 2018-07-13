; Function LAST-ELEMENT is a function which returns the last element of a list using recursion.
(defun last-element (l)
  (if (atom (cdr l)) ; (atom nil) => T.
    (car l)
    (last-element (cdr l))))
