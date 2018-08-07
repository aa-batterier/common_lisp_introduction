; Program that solves a cryptogram.

; The cryptogram.
(defvar *crypto-text* '("zj ze kljjls jf slapzi ezvlij pib kl jufwxuj p hffv jupi jf" "enlpo pib slafml pvv bfwkj"))

; A)
(defvar *encipher-table* (make-hash-table))

(defvar *decipher-table* (make-hash-table))

; B)
(defun make-substitution (c1 c2)
  (setf (gethash c1 *encipher-table*) c2)
  (setf (gethash c2 *decipher-table*) c1))

; C)
(defun undo-substitution (c)
  (setf (gethash (gethash c *decipher-table*) *encipher-table*) nil)
  (setf (gethash c *decipher-table*) nil))

; D)
(defun clear ()
  (clrhash *encipher-table*)
  (clrhash *decipher-table*))

; E)
(defun decipher-string (str)
  (do* ((str-length (length str))
	(str-space (make-string str-length :initial-element #\Space))
	(iterate 0 (1+ iterate)))
       ((>= iterate str-length) str-space)
    (let ((decipher (gethash (aref str iterate) *decipher-table*)))
      (when decipher
	(setf (aref str-space iterate) decipher)))))

; F)
(defun show-line (line)
  (format t "~&~A~%~A~%" line (decipher-string line)))

; G)
(defun show-text (cryptogram)
  (format t "~&--------------------~%")
  (dolist (element cryptogram)
    (show-line element))
  (format t "~&--------------------~%"))

; H)
(defun get-first-char (x)
  (char-downcase
    (char (format nil "~A" x) 0)))

; I)
(defun read-letter ()
  (let ((input (read)))
    (if (or (equal input 'end) (equal input 'undo))
      input
      (get-first-char input))))

; J)
(defun sub-letter (c)
  (let ((ifexist (gethash c *decipher-table*))
	(input nil))
    (if ifexist
      (format t "~&'~A' has already been deciphers as '~A'!~%" c ifexist)
      (progn
	(format t "~&What does '~A' decipher to? " c)
	(setf input (read-letter))
	(if (gethash input *encipher-table*)
      	  (format t "~&But '~A' already deciphers to '~A'!~%" c input)
	  (make-substitution input c))))))

; K)
(defun undo-letter ()
  (format t "~&Undo which letter? ")
  (let ((input (read-letter)))
    (if (gethash input *decipher-table*)
      (undo-substitution input)
      (format t "~&Can't undo '~A' becuase it has not been assigned yet!~%" input))))

; L)
(defun solve ()
  (show-text *crypto-text*)
  (format t "Substitute which letter? ")
  (do ((input (read-letter) (read-letter)))
      ((equal input 'end) t)
    (cond ((equal input 'undo) (undo-letter))
	  ((characterp input)
	   (sub-letter input))
	  (t (format t "~&Wrong input! Try again.~%")))
    (show-text *crypto-text*)
    (format t "Substitute which letter? ")))

; M)
#|
Solution to the cryptogram:
It is better to remain silent and be thought a fool than to speak and remove all doubt.
|#
