; The DOTIMES expression as reference.
(defun dotimes-expression ()
  (dotimes (i 5 i)
    (format t "~&I = ~S" i)))

; The DOTIMES expression rewritten with DO instead.
(defun do-expression ()
  (do ((i 0 (1+ i)))
      ((equal i 5) i)
    (format t "~&I = ~S" i)))
