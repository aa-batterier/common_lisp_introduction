; Function IT-NTH is a iterative version of NTH.
(defun it-nth (wanted-element the-list)
  (let ((iterator 0))
    (dolist (element the-list)
      (if (equal iterator wanted-element)
        (return element)
	(setf iterator (1+ iterator))))))
