; Struct for STARSHIP.
(defstruct (starship
	     (:print-function print-starship))
  (captain nil)
  (name nil)
  (shields 'down)
  (condition 'green)
  (speed 0))

(defvar enterprise (make-starship :name "Enterptise"))

; Struct for CAPTAIN.
(defstruct (captain
	     (:print-function print-captain))
  name
  age
  ship)

(defvar james (make-captain
		:name "James T. Kirk"
		:age 35
		:ship enterprise))

(setf (starship-captain enterprise) james)

(defun print-starship (x stream depth)
  (format stream "#<STARSHIP ~A>" (starship-name x)))

(defun print-captain (x stream depth)
  (format stream "#<CAPTAIN ~A>" (captain-name x)))
