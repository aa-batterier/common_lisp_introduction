; Function NINETY-NINE-BOTTLES sings the song "Ninety-nine Bottles of Beer on the Wall".
(defun ninety-nine-bottles (bottles)
  (if (zerop bottles)
    (format t "~&No more bottles of beer on the wall,~%Time to plunder and ravage the seas!")
    (progn
      (format t "~&~S bottles of beer on the wall,~%~S bottles of beer!~%Take one down,~%Pass it around,~%" bottles)
      (ninety-nine-bottles (1- bottles)))))
