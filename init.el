(add-to-list 'load-path "~/.emacs.d/elisp")

;;---------------------------------------------------------------
;;package configuration
;;---------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("gun" . "http://elpa.gun.org/packages"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;;read path from shell(for mac os x)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOROOT")
  (exec-path-from-shell-copy-env "GOPATH"))

;;startup in maximized mode
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

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
(load-theme 'solarized t)
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (setq frame-parameter frame
                                 'background-mode
                                 (if (display-graphic-p frame) 'dark 'light))
            (enable-theme 'solarized)))

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
(custom-set-variables
 '(markdown-command "/usr/local/bin/pandoc"))

;;company-go
;;(require 'company)
;;(require 'company-go)
;;only have company-mode enabled in go-mode
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
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



