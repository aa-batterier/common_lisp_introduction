; Function IT-REVERSE is a iterative version of REVERSE.
(defun it-reverse (the-list)
  (let ((return-list nil))
    (dolist (element the-list return-list)
      (push element return-list))))
