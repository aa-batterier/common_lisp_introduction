; Function CHOP shortens down any non-NIL list to just the first element.
; CHOP is destructive.
(defun chop (l)
  (if (consp l)
    (setf (cdr l) nil))
  l)
