; Rewriting the function GTEST with IF and COND.
; The original version of GTEST with OR.
(defun gtest-or (x y)
  (or (> x y)
      (zerop x)
      (zerop y)))

; With IF.
(defun gtest-if (x y)
  (if (> x y) t
    (if (zerop x) t (zerop y))))

; With COND.
(defun gtest-cond (x y)
  (cond ((> x y))
	((zerop x))
	((zerop y))))
