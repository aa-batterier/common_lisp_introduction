; Function IT-MEMBER is iterative version of MEMBER.
(defun it-member (x l)
  (dolist (e l)
    (if (equal e x)
      (return (cons e (nthcdr e l))))))
