; Help function for HUGE.
(defun huge (n)
  (power n n))

; Function HUGE raises the number sent in to it's own power.
(defun power (n e)
  (cond ((zerop e) 1)
	((zerop (mod e 2))
	 (let ((r (power n (floor e 2))))
	   (* r r)))
	(t (* n (power n (- e 1))))))
