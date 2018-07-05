; Function MAKE-PALINDROME makes a palindrome from the input list.
(defun make-palindrome (l)
  (append l (reverse l)))
