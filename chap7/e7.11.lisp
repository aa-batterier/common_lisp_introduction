; Function PICK-ONE-TO-FIVE picks out those numbers in the
; list which are greater then one and less then five.
(defun pick-one-five (l)
  (remove-if #'(lambda (x) (and (> x 1) (< x 5))) l))
