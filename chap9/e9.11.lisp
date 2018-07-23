; Function DOT-PRIN1 prints a list to a file in dot notation.
(defun dot-prin1 (l)
  (if (atom l)
    (format t "~S" l)
    (progn
      (format t "(")
      (dot-prin1 (car l))
      (format t " . ")
      (dot-prin1 (cdr l))
      (format t ")"))))
