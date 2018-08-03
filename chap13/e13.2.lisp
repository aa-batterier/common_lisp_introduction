; Function SUBPROP from exercise 13.1.
(defun subprop (s e p)
  (delete e (get s p)))

; Function FORGET-MEETING forgets a meeting between two people.
(defun forget-meeting (p1 p2)
  (subprop p1 p2 'has-met)
  (subprop p2 p1 'has-met)
  t)
