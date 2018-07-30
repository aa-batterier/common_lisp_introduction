; Program that handles DNA and RNA strands.

; A)
(defun complement-base (base)
  (case base
    ('a 't)
    ('t 'a)
    ('g 'c)
    ('c 'g)))

; B)
(defun complement-strand (strand)
  (let ((result-strand nil))
    (dolist (base strand (reverse result-strand))
      (setf result-strand (cons (complement-base base) result-strand)))))

; C)
(defun make-double (strand)
  (let ((result nil))
    (do ((x strand (rest x))
	 (y (complement-strand strand) (rest y)))
        ((or (null x) (null y)) (reverse result))
      (setf result (cons (list (first x) (first y)) result)))))

; D)
(defun count-bases
