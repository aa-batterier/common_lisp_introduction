; Function SELL rewritten with INCF instead of SETF.
(defun sell (n)
  "Ye Olde Lemonade Stand: Sales by the Glass."
  (incf *total-glasses* n)
  (format t "~&That makes ~S glasses so far today." *total-glasses*))
