; Function PROPER-SUBSETP checks if the first argument is a proper 
; subset to the second argument.
(defun proper-subset (s1 s2)
  (and (subsetp s1 s2) (not (subsetp s2 s1))))
