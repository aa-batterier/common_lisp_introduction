; Functions which returns the last element and not a list woth the last element in.
; LAST-ELEMENT using LAST.
(defun last-element-last (l)
  (car (last l)))

; LAST-ELEMENT using REVERSE.
(defun last-element-reverse (l)
  (car (reverse l)))

; LAST-ELEMENT using NTH and LENGTH.
(defun last-element-nthlength (l)
  (nth (- (length l) 1) l))
