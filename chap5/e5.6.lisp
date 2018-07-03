; A)
(defun throw-die ()
  "Generates a number between 1 and 6."
  (+ (RANDOM 6) 1))

; B)
(defun throw-dice ()
  "Returns two dice in a list."
  (list (throw-die) (throw-die)))

; C)
(defun snake-eyes-p (l)
  "Test if the throw is snake eyes."
  (equal l '(1 1)))

(defun boxcars-p (l)
  "Test if the throw is boxcars."
  (equal l '(6 6)))

; D)
(defun instant-win-p (l)
  "Test if the throw is an instant win."
  (let ((result (apply #'+ l)))
    (or (equal result 7) (equal result 11))))

(defun instant-loss-p (l)
  "Test if the throw is an instant loss."
  (let ((result (apply #'+ l)))
    (or (equal result 2) (equal result 3) (equal result 12))))

; C)
(defun say-throw (l)
  "Returns either the sum of the two dice, SNAKE-EYES or BOXCARS."
  (cond ((snake-eyes-p l) 'snake-eyes)
	((boxcars-p l) 'boxcars)
	(t (apply #'+ l))))

; F)
; I'm not happy with this implementation of concat because you need to send in
; the reverse list of the two lists which will be concatenated, but it works
; if you use reverse on the lists before sending them in to the function.
(defun concat (l1 l2 l3)
  "Concatenate two lists into the third, the list will need to send in in reverse order."
  (if l2
    (concat l1 (rest l2) (cons (first l2) l3))
    (if l1
      (concat (rest l1) nil (cons (first l1) l3))
      l3)))

(defun craps ()
  "Throws the dice and returns the result."
  (let* ((dice-value (throw-dice))
	 (result (cond ((instant-loss-p dice-value) (list (say-throw dice-value) '-- 'you 'lose))
		       ((instant-win-p dice-value) (list (say-throw dice-value) '-- 'you 'win))
		       (t (list 'your 'point 'is (apply #'+ dice-value))))))
    (concat (reverse (list 'throw (first dice-value) 'and (second dice-value) '--)) (reverse result) nil)))

; G)
(defun try-for-point (old-dice)
  "Second chances for a throw."
  (let* ((new-dice (throw-dice))
	 (result (cond ((equal (apply #'+ new-dice) old-dice) (list (say-throw new-dice) '-- 'you 'win))
		       ((equal (apply #'+ new-dice) 7) (list (say-throw new-dice) '-- 'you 'lose))
		       (t (list (apply #'+ new-dice) '-- 'throw 'again)))))
    (concat (reverse (list 'throw (first new-dice) 'and (second new-dice) '--)) (reverse result) nil)))
