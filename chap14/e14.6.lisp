; Macro VARIABLE-CHAIN accepts any number of inputs and sets the next value to the preceding varible.
(defmacro variable-chain (&rest variables)
  `(progn
     ,@(mapcar #'(lambda (var val)
		   `(setf ,var ',val))
	       variables
	       (rest variables))))
