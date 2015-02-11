(require-package 'smart-mode-line)
(sml/setup)
(sml/apply-theme 'dark)

(defvar lunaryorn-vc-mode-line
  '(" " (:propertize
         ;; Strip the backend name from the VC status information
         (:eval (let ((backend (symbol-name (vc-backend (buffer-file-name)))))
                  (substring vc-mode (+ (length backend) 2))))
         face font-lock-variable-name-face))
  "Mode line format for VC Mode.")
(put 'lunaryorn-vc-mode-line 'risky-local-variable t)

;; @see http://emacs-fu.blogspot.com/2011/08/customizing-mode-line.html
;; But I need global-mode-string,
;; @see http://www.delorie.com/gnu/docs/elisp-manual-21/elisp_360.html
;; use setq-default to set it for /all/ modes
(setq-default mode-line-format
  (list
    ;; the buffer name; the file name as a tool tip
    '(:eval (propertize "%b " 'face nil
        'help-echo (buffer-file-name)))

    ;; line and column
    "(" ;; '%02' to set to 2 chars at least; prevents flickering
    "%02l" "," "%01c"
      ;; (propertize "%02l" 'face 'font-lock-type-face) ","
      ;; (propertize "%02c" 'face 'font-lock-type-face)
    ") "

     ;; relative position, size of file
    "["
    "%p"
    ;;(propertize "%p" 'face 'font-lock-constant-face) ;; % above top
    "/"
    "%I"
    ;;(propertize "%I" 'face 'font-lock-constant-face) ;; size
    "] "

    ;; the current major mode for the buffer.
    "["

    '(:eval (propertize "%m" 'face nil
              'help-echo buffer-file-coding-system))
    "] "


    "["
    ;; insert vs overwrite mode, input-method in a tooltip
    '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
              'face font-lock-preprocessor-face
              'help-echo (concat "Buffer is in "
                           (if overwrite-mode "overwrite" "insert") " mode")))

    ;; was this buffer modified since the last save?
    '(:eval (when (buffer-modified-p)
              (concat ","  (propertize "Mod"
                             'face 'font-lock-warning-face
                             'help-echo "Buffer has been modified"))))

    ;; is this buffer read-only?
    '(:eval (when buffer-read-only
              (concat ","  (propertize "RO"
                             'face nil
                             'help-echo "Buffer is read-only"))))
    "] "

    ;;global-mode-string, org-timer-set-timer in org-mode need this
    ;;(propertize "%M" 'face nil)
    '(:eval (propertize (format-time-string "%a %b %d %H:%M")
              'help-echo
              (concat (format-time-string "%c; ")
                      (emacs-uptime "Uptime:%hh"))))

    "%n"

    " --"
    ;; i don't want to see minor-modes; but if you want, uncomment this:
    ;; minor-mode-alist  ;; list of minor modes
    "%-" ;; fill with '-'
    ))

(eval-after-load "hideshow"
  '(progn
     (setq hs-isearch-open t)
     (setq-default mode-line-format
                   (append '((:eval (hs-display-headline))) mode-line-format))
     (setq hs-set-up-overlay 'hs-abstract-overlay)
     (make-local-variable 'hs-hide-all)
     (make-variable-buffer-local 'fold-all-fun)
     (make-variable-buffer-local 'fold-fun)

     (defadvice goto-line (after expand-after-goto-line activate compile)
       (save-excursion (hs-show-block)))

     (defadvice find-tag (after expand-after-find-tag activate compile)
       (save-excursion (hs-show-block)))
     ))

(provide 'init-modeline)

