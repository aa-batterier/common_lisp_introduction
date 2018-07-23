; Rewritting MEET to handle number of people met more the once.
(defvar *friends* nil)
(defvar *number* 0)

(defun meet (name)
  (cond ((equal name (first *friends*)) (incf *number*) 'we-just-met)
	((member name *friends*) (incf *number*) 'we-know-each-other)
	(t (push name *friends*) 'pleased-to-meet-you)))
