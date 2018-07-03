; The NAND function which I'll use to construct LOGICAL-AND and LOGICAL-OR with.
(defun nand (x y)
  (not (and (x y))))

; The LOGICAL-AND constructed with NAND.
(defun logical-and (x y)
  (nand (nand x y) (nand x y)))

; The LOGICAL-OR constructed with NAND.
(defun logical-or (x y)
  (nand (nand x x) (nand y y)))
