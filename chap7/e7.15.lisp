; Program that manipulates cards.

; A)
(defun rank (card)
  (first card))

(defun suit (card)
  (second card))

; B)
(defvar my-hand '((3 hearts)
		  (5 clubs)
		  (2 diamonds)
		  (4 diamonds)
		  (ace spades)))

; C)
(defvar colors '((clubs black)
		 (diamonds red)
		 (hearts red)
		 (spades black)))

(defun color-of (card)
  (second (assoc (suit card) colors)))

; D)
(defun first-red (hand)
  (find-if #'(lambda (card) (equal 'red (color-of card))) hand))

; E)
(defun black-cards (hand)
  (remove-if-not #'(lambda (card) (equal 'black (color-of card))) hand))

; F)
(defun what-ranks (asked-suit hand)
  (mapcar #'first (remove-if-not
		    #'(lambda (card) (equal asked-suit (suit card))) hand)))

; G)
(defvar all-ranks '(2 3 4 5 6 7 8 9 10 jack queen king ace))

(defun higher-rank-p (card1 card2)
  (member (rank card1) (member (rank card2) all-ranks)))

; H)
(defun high-card (hand)
  (reduce #'(lambda (card1 card2) (if (higher-rank-p card1 card2) card1 card2)) hand))
