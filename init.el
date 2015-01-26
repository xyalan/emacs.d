(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'load-elpa)
(require-package 'magit)
(require-package 'git-blame)
(require-package 'git-commit-mode)
(require-package 'git-rebase-mode)
(require-package 'gitignore-mode)
(require-package 'gitconfig-mode)
(require-package 'git-messenger) ;; Though see also vc-annotate's "n" & "p" bindings
(require-package 'git-timemachine)
(require 'load-ibuffer)
(require 'sql-indent)

;;read path from shell(for mac os x)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOROOT")
  (exec-path-from-shell-copy-env "GOPATH"))
(require 'load-go)

;;startup in maximized mode
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(markdown-command "/usr/local/bin/pandoc"))

;;-------------------------------------------------------------------
;;base configuration(include backup,autosave...)
(setq backup-inhibited t) 
(setq auto-save-default nil) 
(setq inhibit-startup-message t) 
(setq default-directory (concat (getenv "HOME") "/")) 
(tool-bar-mode -1) 
(global-linum-mode t)
;;tabbar mode
(require 'tabbar)
(tabbar-mode 1)


;;------------------------------------------------------------------
;;configuration of color,use solarized
;;------------------------------------------------------------------
;;(defun solarized-init ()
;;  (load-theme 'solarized-dark)
;;)
;;(add-hook 'after-init-hook 'solarized-init)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized")
;;(set-frame-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)

;;If necessary, add JDK_HOME or JAVA_HOME to the environment
;;(setenv "JDK_HOME" "/path/to/jdk")
;;If necessary, make sure "sbt" and "scala" are in the PATH environment
;;(setenv "PATH" (concat "/usr/local/sbt/bin:" (getenv "PATH")))
;;(setenv "PATH" (concat "/path/to/scala/bin:" (getenv "PATH")))
;;You can also customize `ensime-inf-get-project-root' and `ensime-inf-get-repl-cmd-line'
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;-------------------------------------markdown-----------------------------------
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;autocomplete style
(setq company-tooltip-limit 20)
(setq company-idle-delay .3)
(setq company-echo-delay 0)
(setq company-begin-commands '(self-insert-command))

;;(require 'window-number)
;;(window-number-mode)

;; change meta key from alt to command on Mac
;;------------------The same effect,change meta key on mac---------------------------------
;;(defconst *is-a-mac* (eq system-type 'darwin))
;;(when *is-a-mac*
;;  (setq mac-command-modifier 'meta))
;;-----------------------------------------------------------------------------------------
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;;jump between windows
(require 'window-number)
(window-number-mode)
(window-number-meta-mode) ;;use meta key

;;workgroups mode
(require 'workgroups)
(setq wg-prefix-key (kbd "C-c w"))
(workgroups-mode 1)
