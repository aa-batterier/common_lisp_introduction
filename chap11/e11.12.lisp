; Function POWER-OF-2 using DOTIMES as reference.
(defun power-of-2 (n)
  (let ((result 1))
    (dotimes (i n result)
      (incf result result))))

; Rewritting function POWER-OF-2 using DO instead of DOTIMES.
(defun power-of-2-do (n)
  (do ((i 0 (1+ i))
       (result 1 (+ result result)))
      ((equal i n) result)))
