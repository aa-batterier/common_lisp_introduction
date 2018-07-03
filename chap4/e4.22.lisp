; Define function BOLINGP with COND.
(defun bolingp-cond (temp scale)
  (cond ((and (equal scale 'celsius) (> temp 100)))
	((and (equal scale 'fahrenheit) (> temp 212)))))

; Define function BOLINGP with IF.
(defun bolingp-if (temp scale)
  (if (and (equal scale 'celsius) (> temp 100)) t
    (and (equal scale 'fahrenheit) (> temp 212))))

; Define function BOLINGP with AND and OR.
(defun bolingp-andor (temp scale)
  (or (and (equal scale 'celsius) (> temp 100))
      (and (equal scale 'fahrenheit) (> temp 212))))
