; This is REC-MEMBER, it's a recursive version of MEMBER.
(defun rec-member (i s)
  (cond ((null s) nil)
	((equal i (first s)) s)
	(t (rec-member i (rest s)))))
