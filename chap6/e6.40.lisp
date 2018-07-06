; This function transforms a list into an table.
(defun transform-list-to-table (l table)
  (if l
    (transform-list-to-table
      (rest l)
      (cons l table))
    (reverse table)))
