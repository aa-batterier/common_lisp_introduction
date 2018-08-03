; Program that draws a histogram.

; A)
(defvar *hist-array* nil)

(defvar *total-points* 0)

; B)
(defun new-histogram (amount)
  (setf *hist-array* (make-array amount :initial-element 0)))

; C)
(defun record-value (n)
  (if (and (>= n 0) (< n (length *hist-array*)))
    (progn
      (incf (aref *hist-array* n))
      (incf *total-points*))
    (format t "~&Value ~S is out of range.~%" n)))

; D)
(defun print-hist-line (n)
  (if (and (>= n 0) (< n (length *hist-array*)))
    (let ((amount (aref *hist-array* n)))
      (format t "~&~4S [~4S] " n amount)
      (dotimes (i amount)
	(format t "*"))
      (format t "~%"))
    (format t "~&Value ~S is out of range.~%" n)))

; E)
(defun print-histogram ()
  (dotimes (i (length *hist-array*))
    (print-hist-line i))
  (format t "~&~S total.~%" *total-points*))

; Example code to run the program:
#|
(new-histogram 11)

(dotimes (i 200) (record-value (random 11)))

(print-histogram)
; example output:
0    [18  ] ******************
1    [17  ] *****************
2    [18  ] ******************
3    [19  ] *******************
4    [20  ] ********************
5    [14  ] **************
6    [21  ] *********************
7    [19  ] *******************
8    [20  ] ********************
9    [17  ] *****************
10   [17  ] *****************
200 total.
NIL
|#
