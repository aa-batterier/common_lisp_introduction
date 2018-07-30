; Function FIB calculates fibonacci numbers iterative.
(defun fib (n)
  (do* ((fib1 0 (- fib2 fib1))
	(fib2 1 (+ fib1 fib2))
	(i n (1- i)))
       ((zerop i) fib1)))
