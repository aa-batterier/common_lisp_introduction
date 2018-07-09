; Function FIND-NESTED which returns the first element of a list which is not a NIL-list.
(defun find-nested (l)
  (find-if #'(lambda (x) (and (listp x) (not (null x)))) l))
