(setenv "LANG" "en_US.UTF-8")
(use-package auctex
  :ensure t
  :defer t
  :config
  (use-package company-auctex
    :ensure t
    :init
    :config 
    (company-auctex-init)
    )
  (use-package latex-preview-pane
    :ensure t
    :defer t
    :config
    )
  )

(provide 'init-latex)
