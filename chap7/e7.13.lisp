; Function LIST-LENGTH-TWO picks those lists in a list that has only two elements.
(defun list-length-two (l)
  (remove-if-not #'(lambda (subl) (equal (length subl) 2)) l))
