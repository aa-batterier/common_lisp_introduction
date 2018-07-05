; Checks if the articles "a", "an" or "the" exists in the list.
; CONTAINS-ARTICLE-P using INTERSECTION.
(defun contains-article-p-intersection (l)
  (intersection '(a an the) l))

; CONTAINS-ARTICLE-P using MEMBER and OR.
(defun contains-article-p-memberor (l)
  (or (member 'a l)
      (member 'an l)
      (member 'the l)))

; CONTAINS-ARTICLE-P using MEMBER and AND.
(defun contains-article-p-memberand (l)
  (not (and (not (member 'a l))
	    (not (member 'b l))
	    (not (member 'c l)))))
