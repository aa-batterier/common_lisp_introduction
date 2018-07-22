; Program which producing a graph.

; A)
(defun space-over (n)
  (cond ((zerop n) t)
	((not (plusp n)) (format t "~&Error!~%"))
	(t (format t " ")
	   (space-over (1- n)))))

; TEST function for SPACE-OVER.
(defun test (n)
  (format t "~%>>>")
  (space-over n)
  (format t "<<<"))

; B)
(defun plot-one-point (plotting-string y-val)
  (space-over y-val)
  (format t "~A~%" plotting-string))

; C)
(defun plot-points (plotting-string y-vals)
  (if (null y-vals) t
    (progn
      (plot-one-point plotting-string (first y-vals))
      (plot-points plotting-string (rest y-vals)))))

; D)
(defun generate (m n)
  (if (> m n) nil
    (cons m (generate (1+ m) n))))

; E)
(defun make-graph ()
  "Send in a list with the four inputs"
  (format t "(Function Start End Plotting-string): ")
  (let* ((input (read))
	 (func (first input))
	 (start (second input))
	 (end (third input))
	 (plotting-string (fourth input)))
    (plot-points plotting-string (mapcar func (generate start end)))))

; F)
(defun square (n)
  (* n n))
