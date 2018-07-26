; Function IT-ASSOC is iterative version of ASSOC.
(defun it-assoc (key table)
  (dolist (sub-list table)
    (if (equal (first sub-list) key)
      (return sub-list))))
