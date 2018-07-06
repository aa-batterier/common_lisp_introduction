; Program which simulate the creature Nerdus Americanis (Computerus Hackerus).

; A)
(defvar nerd-states '((sleeping eating)
		    (eating waiting-for-a-computer)
		    (waiting-for-a-computer programming)
		    (programming debugging)
		    (debugging sleeping)))

; B)
(defun nerdus (state)
  (second (assoc state nerd-states)))

; D)
(defun sleepless-nerd (state)
  (if (equal state 'debugging)
    'eating
    (nerdus state)))

; E)
(defun nerd-on-caffeine (state)
  (nerdus (nerdus state)))
