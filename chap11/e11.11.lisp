; Rewritting function FIND-LARGEST using DO*.
(defun find-largest (list-of-numbers)
  (do* ((element list-of-numbers (rest element))
	(largest (first element) (if (null element)
				   largest
				   (max (first element) largest))))
       ((null element) largest)))
