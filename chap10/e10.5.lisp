; Ugly function with bad lisp programming style.
(defun ugly (x y)
  (when (> x y)
    (setf temp y)
    (setf y x)
    (setf x temp))
  (setf avg (/ (+ x y) 2.0))
  (setf pct (* 100 (/ avg y)))
  (list 'average avg 'is pct 'percent 'of 'max y))

; Beautiful function with good lisp programming style.
(defun beautiful (x y)
  (let* ((max-number (max x y))
	 (min-number (min x y))
	 (avg (/ (+ max-number min-number) 2.0))
	 (pct (* 100 (/ avg max-number))))
    (list 'average avg 'is pct 'percent 'of 'max max-number)))
