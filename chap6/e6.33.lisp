; Function WHAT-WROTE returns the book which the auther wrote.
; Because the table looks like this ((BOOK AUTHER)) we can't use rassoc, we have to use assoc.
; Function REVERSE-TABLE reverse the elements in the table.
(defun reverse-table (table new-table)
  (if table
    (reverse-table (rest table) (append (list (reverse (first table))) new-table))
    new-table))

(defun what-wrote (auther table)
  (second (assoc auther (reverse-table table nil))))
