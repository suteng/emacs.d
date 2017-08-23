
(use-package yasnippet
  :ensure t
  :defer t
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (add-hook 'prog-mode-hook #'yas-minor-mode)
)

(provide 'init-snippet)
