; Function COUNT-THE which returns the numbers of times the word 'the' appears in a sentence(list).
(defun count-the (l)
  (length
    (remove-if-not #'(lambda (s) (equal s 'the)) l)))
