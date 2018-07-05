; Function MY-BUTLAST returns the list with the last element removed.
(defun my-butlast (l)
  (reverse (rest (reverse l))))
