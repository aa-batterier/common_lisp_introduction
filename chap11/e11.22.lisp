; Program that handles DNA and RNA strands.

; A)
(defun complement-base (base)
  (case base
    ('a 't)
    ('t 'a)
    ('g 'c)
    ('c 'g)))

; B)
; The iterative version of COMPLEMENT-STRAND.
(defun complement-strand (strand)
  (let ((result-strand nil))
    (dolist (base strand (reverse result-strand))
      (setf result-strand (cons (complement-base base) result-strand)))))

; The applicative version of COMPLEMENT-STRAND.
(defun complement-strand-v2 (strand)
  (mapcar #'(lambda (base)
	      (complement-base base))
	  strand))

; The recusive version of COMPLEMENT-STRAND.
(defun complement-strand-v3 (strand)
  (if (not (null strand))
    (cons (complement-base (first strand))
	  (complement-strand-v3 (rest strand)))))

; C)
; The iterative version of MAKE-DOUBLE.
(defun make-double (strand)
  (let ((result nil))
    (do ((x strand (rest x))
	 (y (complement-strand strand) (rest y)))
        ((or (null x) (null y)) (reverse result))
      (setf result (cons (list (first x) (first y)) result)))))

; The applicative version of MAKE-DOUBLE.
(defun make-double-v2 (strand)
  (mapcar #'(lambda (base)
	      (list base (complement-base base)))
	  strand))

; The recursive version of MAKE-DOUBLE.
(defun make-double-v3 (strand)
  (let ((base (first strand)))
    (if (not (null strand))
      (cons (list base (complement-base base))
	    (make-double-v3 (rest strand))))))

; D)
; Function REPLACE-SUBLIST replaces a sublist.
(defun replace-sublist (sub1 sub2 the-list)

; The iterative version of COUNT-BASES.
(defun count-bases (strand)
  (labels ((update-result (element result)
	     (let* ((update-from (assoc element result))
		    (update-to (list (first update-from) (1+ (second update-from)))))
	       (setf result (substitute update-to update-from result)))))
    (do* ((the-strand strand (rest the-strand))
	  (element (first the-strand) (first the-strand))
	  (result '((a 0) (t 0) (g 0) (c 0))))
         ((null the-strand) result)
      (cond ((consp element)
	     (dolist (inner-element element)
	       (update-result inner-element result)))
	    ((atom element) (update-result element result))))))
