; Rewritting function LAUNCH using DOTIMES.
(defun launch (n)
  (dotimes (i n (format t "Blast off!"))
    (format t "~S..." (- n i))))
