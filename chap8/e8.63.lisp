; Tail recursive version of UNION.
(defun union-tail (s1 s2)
  (if (null s1) s2
    (union-tail (rest s1) (cons (first s1) (remove (first s1) s2)))))

; Tail recursive version of INTERSECTION.
(defun intersection-tail (s1 s2)
  (intersection-tail-help s1 s2 nil))

(defun intersection-tail-help (s1 s2 s3)
  (cond ((null s1) s3)
	((member (first s1) s2) (intersection-tail-help (rest s1) s2 (cons (first s1) s3)))
	(t (intersection-tail-help (rest s1) s2 s3))))

; Tail recursive version of SET-DIFFERENCE.
(defun set-difference-tail (s1 s2)
  (if (null s2) s1
    (set-difference-tail (remove (first s2) s1) (rest s2))))
