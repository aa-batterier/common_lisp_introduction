; Define function PLAY which starts a game of rock, scissors, paper.
(defun play (p1 p2)
  (cond ((equal p1 p2) 'tie)
	((and (equal 'rock p1) (equal 'scissors p2))
