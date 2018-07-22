; Function WAGE returns the wage a worker gets.
(defun wage ()
  (format t "Dollars per hour: ")
  (let ((dph (read)))
    (format t "Hours worked: ")
    (let ((hw (read)))
      (format t "Total wage is: ~S" (* dph hw)))))
