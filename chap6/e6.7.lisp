; NEXT-TO-LAST function which returns the element next to last.
; NEXT-TO-LAST using REVERSE.
(defun next-to-last-reverse (l)
  (cadr (reverse l)))

; NEXT-TO-LAST using NTH.
(defun next-to-last-nth (l)
  (if (< (length l) 2)
    nil
    (nth (- (length l) 2) l)))
