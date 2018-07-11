; Rewriting EVERY using REMOVE-IF.
(defun my-every (f l)
  (null (remove-if f l)))
