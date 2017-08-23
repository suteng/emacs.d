  (use-package anaconda-mode
    :defer t
    :init
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode)

    :config
    )

  (use-package company-anaconda
    :defer t
    :init
    (eval-after-load "company"
      '(add-to-list 'company-backends 'company-anaconda))

    :config
    )

  (use-package pip-requirements
    :defer t
    :init
    :config
    )
(provide 'init-python-mode)
