; Function COUNT-ODD returns the number of odd numbers in the list.
; Conditional augmentation version of COUNT-ODD.
(defun count-odd-v1 (l)
  (let ((n (first l)))
    (cond ((not n) 0)
	  ((oddp n) (+ 1 (count-odd-v1 (rest l))))
	  (t (count-odd-v1 (rest l))))))

; Regular augmenting recursion version of COUNT-ODD.
(defun count-odd-v2 (l)
  (if (null l) 0 
    (+ (if (oddp (first l)) 1 0)
       (count-odd-v2 (rest l)))))
