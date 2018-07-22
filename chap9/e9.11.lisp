; Function DOT-PRIN1 prints a list to a file in dot notation.
(defun dot-prin1 (l)
  (let ((file "dot-notation-list.txt"))
    (write-to-file "(" file)
    (cond ((null l) (write-to-file ")" file))
	  ((atom l) (write-to-file l file))
	  ((atom (cdr l)) (write-to-file " . " file))
	  (t (progn
	       (dot-prin1 (car l))
	       (dot-prin1 (cdr l)))))))

(defun write-to-file (str file)
  (with-open-file (stream file :direction :output
			       :if-exists :append
			       :if-does-not-exist :create)
    (format stream " ~A " str)))
