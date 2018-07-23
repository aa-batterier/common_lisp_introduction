; Function HYBRID-PRIN1 prints in hybrid dot notation.
(defun hybrid-prin1 (l)
  (cond ((atom l) (formatt "~S" l))
	(t (hybrid-print-car (car l))
	   (hybrid-print-cdr (cdr l)))))

(defun hybrid-print-car (l)
  (format t "(")
  (hybrid-prin1 l))

(defun hybrid-print-cdr (l)
  (cond ((null l) (format t ")"))
	((atom l) (format t " . ~S)" l))
	( t (format t " ")
	    (hybrid-prin1 (car l))
	    (hybrid-print-cdr (cdr l)))))
