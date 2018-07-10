; Function LENGTH-OF-LISTS-OF-LIST returns the combined length of the sub lists.
(defun length-of-lists-of-list-v1 (l)
  (reduce #'+ (mapcar #'length l)))

(defun length-of-lists-of-list-v2 (l)
  (length (reduce #'append l)))
