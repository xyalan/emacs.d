;;company-go
;;(require 'company)
;;(require 'company-go)
;;only have company-mode enabled in go-mode
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(provide 'load-go)
