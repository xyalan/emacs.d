;;set global path
(add-to-list 'load-path "~/.emacs.d/elisp")

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))

(require 'load-elpa)
(require 'load-ibuffer)
(require 'sql-indent)
(require 'load-git)
(require 'load-go)
(require 'load-utils)
(require 'load-ido)
(require 'init-helm)
(require 'init-maxframe)
(require 'init-company)
(require 'init-window-numbering)
(require 'init-environment)
;;------------------------------------------------------------------
;;configuration of color,use solarized
;;------------------------------------------------------------------
;;(require-package 'solarized-theme)
;;(defun solarized-init ()
;;  (load-theme 'solarized-light t)
;;)
;;(add-hook 'after-init-hook 'solarized-init)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized")
(set-frame-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;-------------------------------------markdown-----------------------------------
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;workgroups mode
(require 'workgroups)
(setq wg-prefix-key (kbd "C-c w"))
(workgroups-mode 1)
