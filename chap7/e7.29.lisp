; Program who search a database of blocks.

; The DATABASE.
(defvar database '((b1 shape brick)
		   (b1 color green)
		   (b1 size small)
		   (b1 supported-by b2)
		   (b1 supported-by b3)
		   (b2 shape brick)
		   (b2 color red)
		   (b2 size small)
		   (b2 supports b1)
		   (b2 left-of b3)
		   (b3 shape brick)
		   (b3 color red)
		   (b3 size small)
		   (b3 supports b1)
		   (b3 right-of b2)
		   (b4 shape pyramid)
		   (b4 color blue)
		   (b4 size large)
		   (b4 supported-by b5)
		   (b5 shape cube)
		   (b5 color green)
		   (b5 size large)
		   (b5 supports b4)
		   (b6 shape brick)
		   (b6 color purple)
		   (b6 size large)))

; A)
(defun match-element (e1 e2)
  (or (equal e1 e2) (equal e2 '?)))

; B)
(defun match-triple (a p)
  (every #'match-element a p))

; C)
(defun fetch (p)
  (remove-if-not #'(lambda (a)
		     (match-triple a p)) database))

; E)
(defun color-? (b)
  (list b 'color '?))

(defun color-?-cool (input)
  (let ((b (fetch (list input 'color '?))))
    (list (caar b) (cadar b) '?)))

; F)
(defun supporters (b)
  (let ((support (fetch (list b 'supported-by '?))))
    (reduce #'append (mapcar #'last support))))

; G)
(defun supp-cube (input)
  (let* ((support (mapcar #'first (fetch (list '? 'supports input))))
	 (shapes (mapcar #'third (reduce #'append (mapcar #'(lambda (b)
							      (fetch (list b 'shape '?))) support)))))
    (member 'cube shapes)))

; H)
(defun description (b)
  (reduce #'append (mapcar #'rest (fetch (list b '? '?)))))

(defun desc1 (b)
  (fetch (list b '? '?)))

; I)
(defun desc2 (b)
  (mapcar #'rest (desc1 b)))

; J)
(defun description-with-help-functions (b)
  (reduce #'append (desc2 b)))

; L)
(defun add-description (des)
  "The input should be '(name-of-block type description)"
  (let ((new-database (cons des database)))
    (setf database new-database)))
