(require-package 'autopair)
(autopair-global-mode)

(show-paren-mode t)

;;(defun xscheme ()
;;      "Loads xscheme and runs a scheme process in the current buffer."
;;      (interactive)
;;      (load-library "xscheme")
;;      (xscheme-start "scheme -emacs"
;;                     (buffer-name)
;;                     (buffer-name)))

(setq scheme-program-name "/Applications/mit-scheme.app/Contents/Resources/mit-scheme")

(provide 'init-scheme)
