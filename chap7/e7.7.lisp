; Function FLIP which flips the list.
(defun flip ()
  (mapcar #'(lambda (w) (cond ((equal w 'up) 'down)
			      ((equal w 'down) 'up)))
	  '(up down up up)))
