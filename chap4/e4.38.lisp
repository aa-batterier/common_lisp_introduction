; NOT constructed with NOR.
(defun not2 (x)
  (nor x x))

; LOGICAL-AND constructed with NOR.
(defun logical-and (x y)
  (nor (nor x x) (nor y y)))

; LOGICAL-OR constructed with NOR.
(defun logical-or (x y)
  (nor (nor x y) (nor x y)))

; LOGICAL-NAND constructed with NOR.
(defun logical-nand (x y)
  (nor (nor (nor x x) (nor y y))
       (nor (nor x x) (nor y y))))
