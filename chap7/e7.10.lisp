; Program to transpose a song.

; A)
(defvar note-table '((c 1)
		     (c-sharp 2)
		     (d 3)
		     (d-sharp 4)
		     (e 5)
		     (f 6)
		     (f-sharp 7)
		     (g 8)
		     (g-sharp 9)
		     (a 10)
		     (a-sharp 11)
		     (b 12)))

; B)
(defun numbers (l)
  (mapcar #'(lambda (x) (second (assoc x note-table))) l))

; C)
(defun search-table (x table)
  (find-if #'(lambda (y) (equal x (second y))) table))

(defun notes (l)
  (mapcar #'(lambda (x) (first (search-table x note-table))) l))

; E)
(defun raise (n l)
  (mapcar #'(lambda (x) (+ x n)) l))

; F)
(defun normalize (l)
  (mapcar #'(lambda (x)
	      (cond ((> x 12) (- x 12))
		    ((< x 1) (+ x 12))
		    (t x))) l))

; G)
(defun transpose (n s)
  (let ((song-numbers (numbers s)))
    (notes (normalize (raise n song-numbers)))))
