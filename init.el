;;if you're new to the MELPA package manager, include this in your `~/.emacs` file to add it
(add-to-list 'load-path "~/.emacs.d/elisp")
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

;;disable backup
(setq backup-inhibited t)
;;disable auto save
(setq auto-save-default nil)

;;default directory
(setq default-directory (concat (getenv "HOME") "/"))

;;disable welcome buffer
(setq inhibit-startup-message t)

;;hide toolbar
(tool-bar-mode -1)

;;line-numbers
(global-linum-mode t)

;;resize key bind
(defun win-resize-top-or-bot ()
  "Figure out if the current window is on top, bottom or in the
middle"
  (let* ((win-edges (window-edges))
	 (this-window-y-min (nth 1 win-edges))
	 (this-window-y-max (nth 3 win-edges))
	 (fr-height (frame-height)))
    (cond
     ((eq 0 this-window-y-min) "top")
     ((eq (- fr-height 1) this-window-y-max) "bot")
     (t "mid"))))

(defun win-resize-left-or-right ()
  "Figure out if the current window is to the left, right or in the
middle"
  (let* ((win-edges (window-edges))
	 (this-window-x-min (nth 0 win-edges))
	 (this-window-x-max (nth 2 win-edges))
	 (fr-width (frame-width)))
    (cond
     ((eq 0 this-window-x-min) "left")
     ((eq (+ fr-width 4) this-window-x-max) "right")
     (t "mid"))))

(defun win-resize-enlarge-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window -1))
   (t (message "nil"))))

(defun win-resize-minimize-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window 1))
   (t (message "nil"))))

(defun win-resize-enlarge-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally -1))))

(defun win-resize-minimize-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally 1))))

(global-set-key [C-M-down] 'win-resize-minimize-vert)
(global-set-key [C-M-up] 'win-resize-enlarge-vert)
(global-set-key [C-M-left] 'win-resize-minimize-horiz)
(global-set-key [C-M-right] 'win-resize-enlarge-horiz)
(global-set-key [C-M-up] 'win-resize-enlarge-horiz)
(global-set-key [C-M-down] 'win-resize-minimize-horiz)
(global-set-key [C-M-left] 'win-resize-enlarge-vert)
(global-set-key [C-M-right] 'win-resize-minimize-vert)

;(defun solarized-init ()
;  (load-theme 'solarized-dark)
;)
;(add-hook 'after-init-hook 'solarized-init)


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

;;tabbar mode
(require 'tabbar)
(tabbar-mode 1)

;;markdown
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

(setq company-tooltip-limit 20)
(setq company-idle-delay .3)
(setq company-echo-delay 0)
(setq company-begin-commands '(self-insert-command))
