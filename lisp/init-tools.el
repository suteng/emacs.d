
(use-package highlight-symbol
  :init
  :config
  (global-set-key [(control f3)] 'highlight-symbol)
  (global-set-key [f3] 'highlight-symbol-next)
  (global-set-key [(shift f3)] 'highlight-symbol-prev)
  (global-set-key [(meta f3)] 'highlight-symbol-query-replace)
  )

(use-package project
  :defer t
  :after evil
  :bind ("C-c p f" . project-find-file)
  :config
  (evil-leader/set-key
    "f" 'project-find-file
    )
  )

(provide 'init-tools)
