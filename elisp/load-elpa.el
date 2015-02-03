;;---------------------------------------------------------------
;;package configuration
;;---------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives
             '("melpa-milkbox" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("gun" . "http://elpa.gun.org/packages"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;;(when (not package-archive-contents)
;;  (package-refresh-contents))

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(defun maybe-require-package (package &optional min-version no-refresh)
    "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
    (condition-case err
	(require-package package min-version no-refresh)
      (error
       (message "Couldn't install package `%s': %S" package err)
            nil)))

(package-initialize)

(provide 'load-elpa)
