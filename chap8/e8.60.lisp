; Program that handles a family tree.

; The database FAMILY (name father mother).
(defvar family '((colin nil nil)
		 (deirdre nil nil)
		 (arthur nil nil)
		 (kate nil nil)
		 (frank nil nil)
		 (linda nil nil)
		 (suzanne colin deirdre)
		 (bruce arthur kate)
		 (charles arthur kate)
		 (david arthur kate)
		 (ellen arthur kate)
		 (george frank linda)
		 (hillary frank linda)
		 (andre nil nil)
		 (tamara bruce suzanne)
		 (vincent bruce suzanne)
		 (wanda nil nil)
		 (ivan george ellen)
		 (julie george ellen)
		 (marie george ellen)
		 (nigel andre hillary)
		 (frederick nil tamara)
		 (zelda vincent wanda)
		 (joshua ivan wanda)
		 (quentin nil nil)
		 (robert quentin julie)
		 (olivia nigel marie)
		 (peter nigel marie)
		 (erica nil nil)
		 (yvette robert zelda)
		 (diana peter erica)))

; A)
(defun parents (name)
  (rest (assoc name family)))

(defun father (name)
  (first (parents name)))

(defun mother (name)
  (second (parents name)))

(defun children (name)
  (if name (remove-if #'not (mapcar #'(lambda (child)
			       (let ((far (second child))
				     (mor (third child)))
				 (if (or (equal name far)
					 (equal name mor))
				   (first child)
				   nil))) family))))

(defun children-recursive (name)
  (real-children-recursive name family))

(defun real-children-recursive (name familj)
  (let ((far (cadar familj))
	(mor (caddar familj))
	(child (caar familj)))
    (cond ((null familj) nil)
	  ((or (equal name far) (equal name mor))
	   (cons child (real-children-recursive name (cdr familj))))
	  (t (real-children-recursive name (cdr familj))))))

; B)
(defun siblings (name)
  (let ((far (father name))
	(mor (mother name)))
    (remove name (union (children far) (children mor)))))

; C)
(defun mapunion (f l)
  (reduce #'union (mapcar f l))) 

; D)
(defun grandparents (name)
  (mapunion #'parents (parents name)))

; E)
(defun cousins (name)
  (mapunion #'children (mapunion #'siblings (parents name))))

; F)
(defun descended-from (person ancestor)
  (cond ((not person) nil)
	((equal person ancestor) t)
	((atom person) (descended-from (parents person) ancestor))
	(t (or (descended-from (car person) ancestor)
	       (descended-from (cdr person) ancestor)))))

(defun descended-from-v2 (person ancestor)
  (cond ((null person) nil)
	((equal person ancestor) t)
	(t (or (descended-from-v2 (father person) ancestor)
	       (descended-from-v2 (mother person) ancestor)))))

; G)
(defun ancestors (name)
  (rest (real-ancestors name)))

(defun real-ancestors (name)
  (cond ((not name) nil)
	((atom name) (cons name (real-ancestors (parents name))))
	(t (union (real-ancestors (car name))
		   (real-ancestors (cdr name))))))

; H)
(defun generation-gap (person ancestor)
  (real-generation-gap person ancestor 0))

(defun real-generation-gap (tree ancestor deep)
  (cond ((null tree) nil)
	((equal tree ancestor) deep)
	(t (or (real-generation-gap (father tree) ancestor (+ deep 1))
	       (real-generation-gap (mother tree) ancestor (+ deep 1))))))