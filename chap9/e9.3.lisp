; Function DRAWBOX draws a box out of *.
(defun drawbox (width height)
  (labels ((drawline (line)
	     (format t "*")
	     (if (equal line 1) t
	       (drawline (1- line)))))
    (drawline width)
    (format t "~%")
    (if (equal height 1) t
      (drawbox width (1- height)))))
