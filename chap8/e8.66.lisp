; Function ARITH-EVAL evaluates arithmetic expression (tree).
(defun arith-eval (expression)
  (if (numberp expression) expression
    (funcall (second expression)
	     (arith-eval (first expression))
	     (arith-eval (third expression)))))
