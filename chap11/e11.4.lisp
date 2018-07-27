; Function IT-LENGTH is a iterative version of LENGTH.
(defun it-length (the-list)
  (let ((the-length 0))
    (dolist (e the-list the-length)
      (setf the-length (1+ the-length)))))
