; Struct for STARSHIP.
(defstruct (starship
	     (:print-function print-starship))
  (captain nil)
  (name nil)
  (shields 'down)
  (condition 'green)
  (speed 0))

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

(defvar enterprise (make-starship
		     :captain james
		     :name 'enterprise))

(defun print-starship (x stream depth)
  (format stream "#<STARSHIP ~A>" (starship-name x)))

(defun print-captain (x stream depth)
  (format stream "#<CAPTAIN ~A>" (captain-name x)))
