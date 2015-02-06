(setq-default initial-scratch-message
	      (concat ";; Happy hacking " (or user-login-name "") "!\n\n"))

;;set global path
(add-to-list 'load-path "~/.emacs.d/elisp")
(setq *macbook-pro-support-enabled* t)
;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *macbook-pro-support-enabled* t)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))
(setq *win32* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *linux-x* (and window-system *linux*) )
(setq *xemacs* (featurep 'xemacs) )
(setq *emacs23* (and (not *xemacs*) (or (>= emacs-major-version 23))) )
(setq *emacs24* (and (not *xemacs*) (or (>= emacs-major-version 24))) )
(setq *no-memory* (cond
		   (*is-a-mac*
		    (< (string-to-number (nth 1 (split-string (shell-command-to-string "sysctl hw.physmem")))) 4000000000))
		   (*linux* nil)
		   (t nil)
		   ))

(require 'load-elpa)
(require 'load-ibuffer)
(require 'sql-indent)
(require 'load-git)
;;Read path from shell(for mac os x)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOROOT")
  (exec-path-from-shell-copy-env "GOPATH"))
(require 'load-go)
(require 'load-utils)
(require 'load-ido)
(require 'init-helm)
(require 'init-maxframe)
(require 'init-company)
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

;;(require 'window-number)
;;(window-number-mode)

;;workgroups mode
(require 'workgroups)
(setq wg-prefix-key (kbd "C-c w"))
(workgroups-mode 1)
