; Define function ORDERED.
(defun ordered (x y)
  (if (> x y) (list y x) (list x y)))
