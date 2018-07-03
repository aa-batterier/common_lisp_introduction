; Rewriting of the function POOR-STYLE shown below with LET.
(defun poor-style (p)
  (setf p (+ p 5))
  (list 'result 'is p))

; With LET: GOOD-STYLE.
(defun good-style (p)
  (let ((q (+ p 5)))
    (list 'result 'is q)))
