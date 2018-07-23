; Function FORGET removes a person from the list *FRIENDS*, defined in e10.3.lisp.
(defun forget (person)
  (if (member person *friends*)
    (remove person *friends*)
    (format t "The person ~S is not in the list." person)))
