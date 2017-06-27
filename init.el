
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e56f1b1c1daec5dbddc50abd00fcd00f6ce4079f4a7f66052cf16d96412a09a9" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default)))
 '(package-selected-packages
   (quote
    (window-numbering whitespace-cleanup-mode unfill solarized-theme smex smart-mode-line powerline maxframe magit idomenu ido-ubiquitous ibuffer-vc helm guide-key go-mode gitignore-mode gitconfig-mode git-timemachine git-messenger git-blame fullframe flx-ido expand-region exec-path-from-shell ensime diminish browse-kill-ring autopair auctex ace-jump-buffer))))

;;set global path
(setq message-log-max t)
(add-to-list 'load-path "~/.emacs.d/elisp")

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))
(setq *win32* (eq system-type 'windows-nt) )

(require 'cl)
(require 'init-utils)
(require 'init-elpa)
(require 'init-common)
(require 'init-modeline)
(require 'init-ibuffer)
(require 'sql-indent)
(require 'init-git)
(require 'init-go)
(require 'init-ido)
(require 'init-helm)
(require 'init-maxframe)
(require 'init-company)
(require 'init-window-numbering)
(require 'init-environment)
(require 'init-windows)
(require 'init-misc)
(require 'init-ensime)
(require 'init-markdown)
(require 'init-scheme)
;;(modeline-git-branch-enable)
;;------------------------------------------------------------------
;;configuration of color,use solarized
;;------------------------------------------------------------------
;;(require-package 'solarized-theme)
;;(defun solarized-init ()
;;  (load-theme 'solarized-light t)
;;)
;;(add-hook 'after-init-hook 'solarized-init)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized")
(set-frame-parameter nil 'background-mode 'light)
(load-theme 'solarized t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(window-numbering-face ((t (:foreground "DeepPink" :underline "DeepPink" :weight bold))) t))
