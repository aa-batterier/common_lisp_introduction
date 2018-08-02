; Program that creates and handle a discrimination net for automotives diagnosis.

; A)
(defstruct node
  (name nil)
  (question nil)
  (yes-case nil)
  (no-case nil))

; B)
(defvar *node-list* nil)

(defun init ()
  (setf *node-list* nil))

; C)
(defun add-node (name question yes-case no-case)
  (push (make-node :name name
		   :question question
		   :yes-case yes-case
		   :no-case no-case)
	*node-list*)
  name)

; Initial the automotive diafnosis network.
(add-node 'start
	  "Does the engine turn over?"
	  'engine-turns-over
	  'engine-wont-turn-over)

(add-node 'engine-turns-over
	  "Will the engine run for any period of time?"
	  'engine-will-run-briefly
	  'engine-wont-run)

(add-node 'engine-wont-run
	  "Is there gas in the tank?"
	  'gas-in-tank
	  "Fill the tank and try starting the engine again.")

(add-node 'engine-wont-turn-over
	  "Do you hear any sound when you turn the key?"
	  'sound-when-turn-key
	  'no-sound-when-turn-key)

(add-node 'no-sound-when-turn-key
	  "Is the battery voltage low?"
	  "Replace the battery"
	  'battery-voltage-ok)

(add-node 'battery-voltage-ok
	  "Are the battery cables dirty or loose?"
	  "Clean the cables and tighten the connection."
	  'battery-cables-good)

; D)
(defun find-node (name)
  (find-if #'(lambda (struct)
	       (equal name (node-name struct)))
	   *node-list*))

; E)
(defun process-node (name)
  (let ((node (find-node name)))
    (if node
      (if (yes-or-no-p "~&~A" (node-question node))
	(node-yes-case node)
	(node-no-case node))
      (format t "~&Node ~S not yet defined." name))))

; F)
(defun run ()
  (do ((current-node 'start (process-node current-node)))
      ((null current-node) nil)
    (cond ((stringp current-node)
	   (format t "~&~A" current-node)
	   (return nil)))))

; G)
(defun new-node ()
  (format t "~&Add a new node.~%")
  (let ((name nil)
	(question nil)
        (yes-case nil)
        (no-case nil))
    (format t "~&Name: ")
    (setf name (read))
    (format t "~&Question: ")
    (setf question (read))
    (format t "~&Yes case: ")
    (setf yes-case (read))
    (format t "~&No case: ")
    (setf no-case (read))
    (add-node name
	      question
	      yes-case
	      no-case)))

; H)
#|
(new-node)
Add a new node.
Name: engine-will-run-briefly
Question: "Does the engine stall when cold but not when warm?"
Yes case: stalls-only-when-cold
No case: stalls-even-when-warm
ENGINE-WILL-RUN-BRIEFLY
|#
