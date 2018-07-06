; Function WHO-WROTE returns the auther of the book.
(defun who-wrote (book table)
  (second (assoc book table)))
