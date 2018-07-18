; Another fractorial function, whihc is faulty.
; To get a correct answer you can only input zero.
; The result of a positive number input will bee infinite recursion.
; A negative number input will at some point reach a state where it must divide by zero which is impossible.
(defun factorial (n)
  (if (zerop n) 1
    (/ (factorial (+ n 1)) (+ n 1))))
