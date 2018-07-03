; Rewrite the function COMPARE with IF, AND and OR.
; The origninal version with COND.
(defun compare-cond (x y)
  (cond ((equal x y) 'numbers-are-the-same)
	((< x y) 'first-is-smaller)
	((> x y) 'first-is-bigger)))

; With IF.
(defun compare-if (x y)
  (if (equal x y) 'numbers-are-the-same
    (if (< x y) 'first-is-smaller 'first-is-bigger)))

; With AND and OR.
(defun compare-andor (x y)
  (or (and (equal x y) 'numbers-are-the-same)
      (and (< x y) 'first-is-smaller)
      (and (> x y) 'first-is-bigger)))
