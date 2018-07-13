; The Fibonacci algorithm.
(defun fib (n)
  (cond ((zerop n) 1)
	((= n 1) 1)
	(t (+ (fib (- n 1)) (fib (- n 2))))))
