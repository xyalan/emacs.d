;;----------------------------------------------------------------------------
;; Some basic preferences
;;----------------------------------------------------------------------------
(setq-default
 buffers-menu-max-size 30
 case-fold-search t
 compilation-scroll-output t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 grep-highlight-matches t
 grep-scroll-output t
 indent-tabs-mode nil
 line-spacing 0.2
 mouse-yank-at-point t
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 ;; no annoying beep on errors
 visible-bell t)

(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)


;; But don't show trailing whitespace in SQLi, inf-ruby etc.
(add-hook 'comint-mode-hook
          (lambda () (setq show-trailing-whitespace nil)))

(transient-mark-mode t)

(define-key global-map (kbd "RET") 'newline-and-indent)

;;----------------------------------------------------------------------------
;; Don't disable narrowing commands
;;----------------------------------------------------------------------------
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

(setq-default tab-width 4)
(column-number-mode 1)
(setq next-line-add-newlines nil)

;;Ctrl-X, u/l to upper/lowercase regions without confirm
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; display time
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

;; {{ save history
(setq history-length 8000)
(setq savehist-additional-variables '(search-ring regexp-search-ring kill-ring))
(savehist-mode 1)
;; }}

(setq system-time-locale "C")

(provide 'init-misc)
