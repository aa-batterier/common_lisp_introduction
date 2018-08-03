; Function SUBPROP deletes an element from a set stored under a property name.
(defun subprop (s e p)
  (delete e (get s p)))
