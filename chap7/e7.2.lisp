; Table DAILY-PLANET which contains the emplies on Daily Planet.
(defvar daily-planet '((olsen jimmy 123-76-4535 cub-reporter)
		       (kent clark 089-52-6787 reporter)
		       (lane lois 951-26-1438 reporter)
		       (white perry 355-16-7439 editor)))

; Function SOCIAL-NUMBERS extracts the social security numbers from the table.
(defun social-numbers ()
  (mapcar #'caddr daily-planet))
