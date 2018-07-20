; Function FACTORED fatores a positive number into it's prime numbers.
(defun factored (n)
  (labels ((not-prime (p)
	     (cond ((> p (sqrt n)) nil)
		   ((zerop (mod n p)) p)
		   (t (not-prime (1+ p)))))
	   (prime-split ()
	     (let ((p (not-prime 2)))
	       (if p
		 (list p (floor n p))
		 (list n)))))
    (let ((prime (prime-split)))
      (cond ((equal 1 (length prime)) prime)
	    (t (cons (car prime) (factored (cadr prime))))))))

#|
(defun not-prime (n p)
  (cond ((> p (sqrt n)) nil)
	((zerop (mod n p)) p)
	(t (not-prime n (1+ p)))))

(defun prime-split (n)
  (let ((p (not-prime n 2)))
    (if p
      (list p (floor n p))
      (list n))))

(defun factored (n)
  (let ((p (prime-split n)))
    (cond ((equal 1 (length p)) p)
	  (t (cons (car p) (factored (cadr p)))))))
|#
