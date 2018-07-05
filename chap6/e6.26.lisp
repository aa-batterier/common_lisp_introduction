; A program which returns the common featurs of two description.

; A)
(defun right-side (l)
  (rest (member '-vs- l)))

; B)
(defun left-side (l)
  (reverse (rest (member '-vs- (reverse l)))))

; C)
(defun count-common (l)
  (length (intersection (left-side l) (right-side l))))

; D)
(defun compare (l)
  (list (count-common l) 'common 'features))
