; The books tic-tac-toe code.
(defun make-board ()
  (list 'board 0 0 0 0 0 0 0 0 0))

(defun convert-to-letter (v)
  (cond ((equal v 1) "O")
	((equal v 10) "X")
	(t " ")))

(defun print-row (x y z)
  (format t "~&   ~A | ~A | ~A"
	  (convert-to-letter x)
	  (convert-to-letter y)
	  (convert-to-letter z)))

(defun print-board (board)
  (format t "~%")
  (print-row
    (nth 1 board) (nth 2 board) (nth 3 board))
  (format t "~& -----------")
  (print-row
    (nth 4 board) (nth 5 board) (nth 6 board))
  (format t "~& -----------")
  (print-row
    (nth 7 board) (nth 8 board) (nth 9 board))
  (format t "~%~%"))

(defvar b (make-board))

(defun make-move (player pos board)
  (setf (nth pos board) player)
  board)

(defvar *computer* 10)

(defvar *opponent* 1)

(defvar *triplets*
  '((1 2 3) (4 5 6) (7 8 9)
    (1 4 7) (2 5 8) (3 6 9)
    (1 5 9) (3 5 7)))

(defun sum-triplet (board triplet)
  (+ (nth (first triplet) board)
     (nth (second triplet) board)
     (nth (third triplet) board)))

(defun compute-sums (board)
  (mapcar #'(lambda (triplet)
	      (sum-triplet board triplet))
	  *triplets*))

(defun winner-p (board)
  (let ((sums (compute-sums board)))
    (or (member (* 3 *computer*) sums)
	(member (* 3 *opponent*) sums))))

(defun play-one-game ()
  (if (y-or-n-p "Would you like to go first? ")
    (opponent-move (make-board))
    (computer-move (make-board))))

(defun opponent-move (board)
  (let* ((pos (read-a-legal-move board))
	 (new-board (make-move
		      *opponent*
		      pos
		      board)))
    (print-board new-board)
    (cond ((winner-p new-board)
	   (format t "~&You win!"))
	  ((board-full-p new-board)
	   (format t "~&Tie game."))
	  (t (computer-move new-board)))))

(defun read-a-legal-move (board)
  (format t "~&Your move: ")
  (let ((pos (read)))
    (cond ((not (and (integerp pos)
		     (<= 1 pos 9)))
	   (format t "~&Invalid input.")
	   (read-a-legal-move board))
	  ((not (zerop (nth pos board)))
	   (format t
	     "~&That space is already occupied.")
	   (read-a-legal-move board))
	  (t pos))))

(defun board-full-p (board)
  (not (member 0 board)))

(defun computer-move (board)
  (let* ((best-move (choose-best-move board))
	 (pos (first best-move))
	 (strategy (second best-move))
	 (new-board (make-move
		      *computer* pos board)))
    (format t "~&My move: ~S" pos)
    (format t "~&My strategy: ~A~%" strategy)
    (print-board new-board)
    (cond ((winner-p new-board)
	   (format t "~&I win!"))
	  ((board-full-p new-board)
	   (format t "~&Tie game."))
	  (t (opponent-move new-board)))))

(defun choose-best-move (board)
  (or (block-opponent-win board)
      ; D)
      (block-squeeze-play board)
      (block-two-on-one board)
      ;
      (make-three-in-a-row board)
      ; E)
      (make-squeeze-play board)
      (make-two-on-one board)
      ;
      (random-move-strategy board)))

(defun random-move-strategy (board)
  (list (pick-random-empty-position board)
	"random move"))

(defun pick-random-empty-position (board)
  (let ((pos (+ 1 (random 9))))
    (if (zerop (nth pos board))
      pos
      (pick-random-empty-position board))))

(defun make-three-in-a-row (board)
  (let ((pos (win-or-block board
			   (* 2 *computer*))))
    (and pos (list pos "make three in a row"))))

(defun block-opponent-win (board)
  (let ((pos (win-or-block board
			   (* 2 *opponent*))))
    (and pos (list pos "block opponent"))))

(defun win-or-block (board target-sum)
  (let ((triplet (find-if
		   #'(lambda (trip)
		       (equal (sum-triplet board
					   trip)
			      target-sum))
		   *triplets*)))
    (when triplet
      (find-empty-position board triplet))))

(defun find-empty-position (board squares)
  (find-if #'(lambda (pos)
	       (zerop (nth pos board)))
	   squares))

; Program that blocks squeeze and two-on-one attacks.

(defun remove-unnecessary (important board)
  "Returns a list with only the important positions left (specified in the important list) from the board list."
  (if (null important) nil
    (cons (nth (first important) board) (remove-unnecessary (rest important) board))))

; A)
(defvar *corners* '(1 3 7 9))

(defvar *sides* '(2 4 6 8))

; B)
(defun block-squeeze-play (board)
  (let ((one-nine (remove-unnecessary '(1 5 9) board))
	(three-seven (remove-unnecessary '(3 5 7) board))
	(squeeze '(1 10 1))
	(free-corner (find-if #'(lambda (pos)
				  (zerop (nth pos board)))
			      *sides*)))
    (if (or (equal squeeze one-nine)
	    (equal squeeze three-seven))
      (if free-corner
	(list free-corner "Blocking squeeze play.")))))

; C)
(defun block-two-on-one (board)
  (let ((high-low '(10 1 1))
	(low-high '(1 1 10))
	(one-nine (remove-unnecessary '(1 5 9) board))
	(three-seven (remove-unnecessary '(3 5 7) board))
	(free-corner (find-if #'(lambda (pos)
				  (zerop (nth pos board)))
			      *corners*)))
    (if (or (equal high-low one-nine)
	    (equal high-low three-seven)
	    (equal low-high one-nine)
	    (equal low-high three-seven))
      (if free-corner
	(list free-corner "Blocking two-on-one play.")))))

; E)
(defun make-squeeze-play (board)
  (let* ((one-nine (remove-unnecessary '(1 9) board))
	 (three-seven (remove-unnecessary '(3 7) board))
	 (rv-one-nine (list (cond ((and (zerop (first one-nine)) (equal (second one-nine) 10)) 1)
				  ((and (zerop (second one-nine)) (equal (first one-nine) 10)) 9))
			    "Make squeeze play."))
	 (rv-three-seven (list (cond ((and (zerop (first three-seven)) (equal (second three-seven) 10)) 3)
				     ((and (zerop (second three-seven)) (equal (first three-seven) 10)) 7))
			       "Make squeeze play.")))
    (cond ((first rv-one-nine) rv-one-nine)
	  ((first rv-three-seven) rv-three-seven))))

(defun make-two-on-one (board)
  (let ((rv-pos (and (equal (fifth board) 10) (find-if #'(lambda (pos)
							   (equal (nth pos board) 10))
						       *corners*))))
    (labels ((free-pos (l)
	       (find-if #'(lambda (pos)
			    (zerop (nth pos board))) l)))
      (cond ((or (equal rv-pos 1) (equal rv-pos 9)) (list (free-pos '(3 7)) "Make two-on-one play."))
	    ((or (equal rv-pos 3) (equal rv-pos 7)) (list (free-pos '(1 9)) "Make two-on-one play."))))))
