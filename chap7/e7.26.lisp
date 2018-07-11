; Rewriting FIND-IF using REMOVE-IS-NOT.
(defun my-find-if (f l)
  (first (remove-if-not f l)))
