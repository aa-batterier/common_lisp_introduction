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
  "Replace sub2 with sub1 in the list."
  (cond ((null the-list) nil)
	((equal sub2 (first the-list)) (cons sub1 (replace-sublist sub1 sub2 (rest the-list))))
	(t (cons (first the-list) (replace-sublist sub1 sub2 (rest the-list))))))

; The iterative version of COUNT-BASES.
(defun count-bases (strand)
  (labels ((update-result (element result)
	     (let* ((update-from (assoc element result))
		    (update-to (list (first update-from) (1+ (second update-from)))))
	       (replace-sublist update-to update-from result))))
;	       (replace result (list update-to)))))
    (do* ((the-strand strand (rest the-strand))
	  (element (first the-strand) (first the-strand))
	  (result '((a 0) (t 0) (g 0) (c 0))))
         ((null the-strand) result)
      (cond ((consp element)
	     (dolist (inner-element element)
	       (setf result (update-result inner-element result))))
	    ((atom element) (setf result (update-result element result)))))))

; E)
; The iterative version of PREFIXP.
(defun prefixp (strand1 strand2)
  (do ((prefix strand1 (rest prefix))
       (post strand2 (rest post)))
      ((null prefix) t)
    (if (not (equal (first prefix) (first post))) (return nil))))

; The recursive version of PREFIXP.
(defun prefixp-v2 (prefix post)
  (cond ((null prefix) t)
	((not (equal (first prefix) (first post))) nil)
	(t (prefixp-v2 (rest prefix) (rest post)))))

; F)
; The iterative version of APPEARSP.
(defun appearsp (sub-list the-list)
  (let ((the-length (length the-list))
	(sub-length (length sub-list)))
    (dotimes (i the-length)
      (cond ((> (+ i sub-length) the-length)  (return nil))
	    ((equal sub-list (subseq the-list i (+ i sub-length))) (return t))))))

; The recursive version of APPEARSP.
(defun appearsp-v2 (sub-list the-list)
  (let ((sub-length (length sub-list))
	(the-length (length the-list)))
    (cond ((or (null the-list) (> sub-length the-length)) nil)
	  ((equal sub-list (subseq the-list 0 sub-length)) t)
	  (t (appearsp-v2 sub-list (rest the-list))))))

; G)
; The interative version of COVERP.
(defun coverp (sub-list l2)
  (do ((sub-length (length sub-list))
       (the-length (length l2) (length the-list))
       (the-list l2))
      ((or (null sub-list)
	   (> sub-length the-length)
	   (not (equal sub-list (subseq the-list 0 sub-length)))) nil)
    (if (equal sub-length the-length)
      (return t)
      (setf the-list (subseq the-list sub-length the-length)))))

; The recursive version of COVERP.
(defun coverp-v2 (sub-list the-list)
  (let ((sub-length (length sub-list))
	(the-length (length the-list)))
    (cond ((or (null sub-list)
	       (> sub-length the-length)
	       (not (equal sub-list (subseq the-list 0 sub-length)))) nil)
	  ((equal sub-length the-length) t)
	  (t (coverp-v2 sub-list (subseq the-list sub-length the-length))))))

; H)
; The iterative version of PREFIX.
(defun prefix (leftmost strand)
  (do* ((iterate 0 (1+ iterate))
        (result (list (nth iterate strand)) (cons (nth iterate strand) result)))
       ((equal iterate (1- leftmost)) (reverse result))))

; The applicative version of PREFIX.
(defun prefix-v2 (leftmost strand)
  (reverse (nthcdr (1- leftmost) (reverse strand))))

; The recursive verison of PREFIX.
(defun prefix-v3 (leftmost strand)
  (labels ((help (iterate)
	     (if (equal iterate leftmost) nil
	       (cons (nth iterate strand) (help (1+ iterate))))))
    (help 0)))

; I)
; Function PARTITION-ALL partitions the list into sublists.
(defun partition-all (sub-length the-list)
  (cond ((or (null the-list)
	     (not (plusp sub-length))
	     (not (integerp sub-length)))
	 nil)
	((> sub-length (length the-list)) (list the-list))
	(t (cons (subseq the-list 0 sub-length) (partition-all sub-length (nthcdr sub-length the-list))))))

(defun kernel (strand)
  (do* ((iterator 1 (1+ iterator))
	(sub-list (partition-all iterator strand)
		  (partition-all iterator strand)))
       ((> iterator (length strand)) strand)
    (when (every #'(lambda (sub) (equal sub (first sub-list))) sub-list)
      (return (first sub-list)))))

; J)
(defun draw-dna (strand)
  (let* ((strand-length (length strand))
	 (lines (make-list strand-length :initial-element '-))
	 (exclamations (make-list strand-length :initial-element '!))
	 (dots (make-list strand-length :initial-element ".")))
    (labels ((print-list (the-list)
	       (format t "~&")
	       (dolist (element the-list)
		 (format t "~A " element))
	       (format t "~%")))
      (print-list lines)
      (print-list exclamations)
      (print-list strand)
      (print-list dots)
      (print-list dots)
      (print-list (complement-strand strand))
      (print-list exclamations)
      (print-list lines))))
