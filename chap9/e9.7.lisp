; The COOKIE-MONSTER function.
(defun cookie-monster ()
  (format t "Give me cookie!!!~%Cookie? ")
  (let ((cookie (read)))
    (if (equal cookie 'cookie)
      (format t "Thank you!...Munch munch munch...BURP~%")
      (progn
	(format t "No want ~S...~%" cookie)
	(cookie-monster)))))
