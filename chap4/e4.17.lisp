; Define function ADULT-OR-CHILD.
(defun adult-or-child (sex grown)
  (or (and
	(or (equal 'boy sex) (equal 'girl sex))
	(equal 'child grown))
      (and
	(or (equal 'man sex) (equal 'woman sex))
	(equal 'adult grown))))
