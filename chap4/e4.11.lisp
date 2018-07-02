; Define function FIRSTZERO.
(defun firstzero (l)
  (cond ((equal (first l) 0) 'first)
	((equal (second l) 0) 'second)
	((equal (third l) 0) 'third)
	(t 'none)))
