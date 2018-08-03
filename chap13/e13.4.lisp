; Function HASPROP returns T or NIL if a symbol has a particular property.
(defun hasprop (s p)
  (if (member p (symbol-plist s)) t))
