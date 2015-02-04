(require-package 'helm)
(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)

(provide 'init-helm)
