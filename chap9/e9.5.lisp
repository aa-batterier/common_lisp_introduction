; Function PRINT-BOARD prints a tic tac toe board.
(defun print-board (input)
  (let ((board (sublis '((x . "x") (nil . " ") (o . "o")) input)))
    (format t "~& ~A | ~A | ~A~%-----------~% ~A | ~A | ~A~%-----------~% ~A | ~A | ~A~%" (first board) (second board) (third board) (fourth board) (fifth board) (sixth board) (seventh board) (eighth board) (ninth board))))
