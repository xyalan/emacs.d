;;-------------------------------------------------------------------
;;base configuration(include backup,autosave...)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(setq default-directory (concat (getenv "HOME") "/"))
(tool-bar-mode -1)
(global-linum-mode t)

(require-package 'unfill)
(electric-indent-mode 1)

;;automatic delete space when save
(require-package 'whitespace-cleanup-mode)
(global-whitespace-cleanup-mode t)

;;browse kill ring
(require-package 'browse-kill-ring)

;; Don't disable narrowing commands
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;; Show matching parens
(show-paren-mode 1)

;; change meta key from alt to command on Mac
;;------------------The same effect,change meta key on mac---------------------------------
;;(defconst *is-a-mac* (eq system-type 'darwin))
;;(when *is-a-mac*
;;  (setq mac-command-modifier 'meta))
;;-----------------------------------------------------------------------------------------
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;;----------------------------------------------------------------------------
;; Expand region
;;----------------------------------------------------------------------------
(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require-package 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c" "C-x 4" "C-x 5" "C-c ;" "C-c ; f" "C-c ' f" "C-x n"))
(guide-key-mode 1)
(diminish 'guide-key-mode)

(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(require 'load-acejump)


(provide 'load-utils)
