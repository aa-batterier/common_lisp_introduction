; Function MY-GET is my own version of GET.
(defun my-get (s p)
  (second (member p (symbol-plist s))))
