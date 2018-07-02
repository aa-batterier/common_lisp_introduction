; Define function PLAY which starts a game of rock, scissors, paper.
(defun play (p1 p2)
  (cond
    ; Player one wins.
    ((or
       (and (equal 'rock p1) (equal 'scissors p2))
       (and (equal 'scissors p1) (equal 'paper p2))
       (and (equal 'paper p1) (equal 'rock p2)))
     'first-wins)
    ; Player two wins.
    ((or
       (and (equal 'rock p2) (equal 'scissors p1))
       (and (equal 'scissors p2) (equal 'paper p1))
       (and (equal 'paper p2) (equal 'rock p1)))
     'second-wins)
    ; Tie.
    ((or
       (and (equal 'rock p1) (equal 'rock p2))
       (and (equal 'scissors p1) (equal 'sicssors p2))
       (and (equal 'paper p1) (equal 'paper p2)))
     'tie)
    (t 'wrong-input)))
