; Tail recursive version of UNION.
(defun union-tail (s1 s2)
  (if (null s1) s2
    (union-tail (rest s1) (cons (first s1) (remove (first s1) s2)))))

; Tail recursive version of INTERSECTION.
(defun intersection-tail (s1 s2)
  (intersection-tail-help s1 s2 '()))

(defun intersection-tail-help (s1 s2 s3)
  (let ((new (if (member (first s1) s2) (list (first s1)))))
    (if (null s1) s3
      (intersection-tail-help (rest s1) s2 (apply new s3)))))
