; WORDS table.
(defvar words '((one un)
		(two deux)
		(three trois)
		(four quatre)
		(five cinq)))

; Function ADD-LANGUAGE which adds a new language to the WORDS table.
(defun add-language (language)
  (mapcar #'cons language words))
