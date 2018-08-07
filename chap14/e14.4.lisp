; Macro SIMPLE-ROTATEF switch the values of the input varibles.
(defmacro simple-rotatef (a b)
  `(let ((temp ,a))
     (setq ,a ,b)
     (setq ,b temp)))
