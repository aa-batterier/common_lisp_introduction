; Function MAKE-LOAF creates a loaf.
(defun make-loaf (size)
  (if (<= size 0) nil
    (cons 'x (make-loaf (- size 1)))))
