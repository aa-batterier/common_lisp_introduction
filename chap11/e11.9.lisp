#|
; Function CHECK-ALL-ODD as reference.
(defun check-all-odd (list-of-numbers)
  (dolist (e list-of-numbers t)
    (format t "~&Checking ~S..." e)
    (if (not (oddp e)) (return nil))))
|#

; Function CHECK-ALL-ODD rewritten using DO.
(defun check-all-odd (the-list)
  (do ((element (first the-list) (rest the-list)))
      ((not (oddp element)) nil)
    (format t "~&Checking ~S..." element)))
