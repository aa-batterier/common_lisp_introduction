; Tail recursive version of COUNT-SLICES using labels.
(defun count-slices-labels (loaf)
  (labels ((count-slice (n l)
	     (if (null l) n
	       (count-slice (1+ n) (rest l)))))
    (count-slice 0 loaf)))

; Tail recursive version of REVERSE using labels.
(defun reverse-labels (l)
  (labels ((rv (from too)
	     (if (null from) too
	       (rv (rest from) (cons (first from) too)))))
    (rv l nil)))
