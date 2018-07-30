; Function CHECK-ALL-ODD rewritten using DO.
(defun check-all-odd (the-list)
  (do ((element the-list (rest element)))
      ((null element) t)
    (format t "~&Checking ~S..." (first element))
    (if (evenp (first element)) (return nil))))
