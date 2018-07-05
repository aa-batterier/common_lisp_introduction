; Function ADD-VOWELS adds the vowels to the set.
(defun add-vowels (s)
  (let ((vowels '(a e i o u)))
    (union vowels s)))
