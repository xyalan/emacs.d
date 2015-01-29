(require-package 'ace-jump-mode)
(global-set-key (kbd "C-;") 'ace-jump-mode)
(global-set-key (kbd "C-:") 'ace-jump-word-mode)

(require-package 'ace-jump-buffer)
(global-set-key (kbd "C-,") 'ace-jump-buffer)
(global-set-key (kbd "C-.") 'ace-jump-buffer-other-window)

(provide 'load-acejump)
