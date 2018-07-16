; Function MY-MEMBER is a recursive version of MEMBER.
(defun my-member (x s)
  (cond ((null s) nil)
	((equal x (first s)) s)
	(t (my-member x (rest s)))))
