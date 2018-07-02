; Define function EMPHASIZE3.
(defun emphasize3 (l)
  (cond ((equal (first l) 'good) (cons 'great (rest l)))
	((equal (first l) 'bad) (cons 'awful (rest l)))
	(t (cons 'very l))))
