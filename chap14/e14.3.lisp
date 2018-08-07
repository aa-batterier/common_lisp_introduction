; Macro SET-NIL	sets the input varible to NIL.
(defmacro set-nil (var)
  (list 'setq var nil))
