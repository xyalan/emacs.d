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

;; speedbar
(require-package 'sr-speedbar)
;; 显示所有问文件
(setq speedbar-show-unknown-files t)
(setq sr-speedbar-right-side nil)
(setq speedbar-use-images nil)
(setq sr-speedbar-skip-other-window-p t)
(setq sr-speedbar-auto-refresh t)
(setq sr-speedbar-max-width 10)
(setq sr-speedbar-width 10)
(sr-speedbar-open)

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
;;(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(require 'init-acejump)


(provide 'init-common)
