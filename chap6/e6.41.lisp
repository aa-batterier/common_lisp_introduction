; Program who controls a robot named Robbie around a house.

; The table ROOMS describe the layout of the house.
(defvar rooms '((living-room
		(north front-stairs)
		(south dining-room)
		(east kitchen))
	      (upstairs-bedroom
		(west library)
		(south front-stairs))
	      (dining-room
		(north living-room)
		(east pantry)
		(west downstairs-bedroom))
	      (kitchen
		(west living-room)
		(south pantry))
	      (pantry
		(north kitchen)
		(west dining-room))
	      (downstairs-bedroom
		(north back-stairs)
		(east dining-room))
	      (back-stairs
		(south downstairs-bedroom)
		(north library))
	      (front-stairs
		(north upstairs-bedroom)
		(south living-room))
	      (library
		(east upstairs-bedroom)
		(south back-stairs))))

; The start location of Robbie.
(defvar loc 'pantry)

; A)
(defun choices (r)
  (rest (assoc r rooms)))

; B)
(defun look (d r)
  (second (assoc d (choices r))))

; C)
(defun set-robbie-location (place)
  "Moves Robbie to PLACE by setting the variable LOC."
  (setf loc place))

; D)
(defun how-many-choices ()
  (length (choices loc)))

; E)
(defun upstairsp (r)
  (or (equal r 'upstairs-bedroom) (equal r 'library)))

(defun onstairsp (r)
  (or (equal r 'front-stairs) (equal r 'back-stairs)))

; F)
(defun where ()
  (cond ((upstairsp loc) (list 'robbie 'is 'upstairs 'in 'the loc))
	((onstairsp loc) (list 'robbie 'is 'on 'the loc))
	(t (list 'robbie 'is 'downstairs 'in 'the loc))))

; G)
(defun move (d)
  (let ((new-d (look d loc)))
    (if new-d
      (and (set-robbie-location new-d) (where))
      '(ouch! robbie hit a wall))))
