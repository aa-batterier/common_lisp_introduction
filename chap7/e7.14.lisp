; INTERSECTION with REMOVE-IF-NOT.
(defun my-intersection (s1 s2)
  (remove-if-not #'(lambda (x) (member x s2)) s1))

; UNION with REMOVE-IF.
(defun my-union (s1 s2)
  (append
    (remove-if #'(lambda (x) (member x s2)) s1) s2))
